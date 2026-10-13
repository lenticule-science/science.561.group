import test from 'node:test';
import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {mkdtempSync,writeFileSync,rmSync} from 'node:fs';
import {join} from 'node:path';
import {tmpdir} from 'node:os';
import {measureProductionFile} from '../apps/measure-production-duration.mjs';
import {measureStudioProductionDuration,measureStudioCapacityPlan} from '../src/production-duration-metrology.mjs';
const source='ni:///sha-256;'+'A'.repeat(43);
const asOf='2026-10-13T17:00:00Z';
const time=(minutes)=>new Date(Date.parse('2026-10-13T10:00:00Z')+minutes*60000).toISOString();
function attempt({worklotId,attemptId,kind='reference-conditioned-video',
 providerId='provider:observed-video-crew',start=0,minutes=40,
 outcome='accepted',sourceRef=source}={}){
 return {worklotId,attemptId,kind,providerId,sourceRef,outcome,
  observedAt:time(start+minutes),
  outputRef:'provider:actual-output-'+attemptId,
  ...(outcome==='pending'?{}:{independentReviewRef:'editor:actual-'+outcome+'-'+attemptId}),
  sessions:[{startedAt:time(start),endedAt:time(start+minutes)}]};
}
const sample=()=>{
 return [
  attempt({worklotId:'w1',attemptId:'shot-one-accepted',minutes:40}),
  attempt({worklotId:'w2',attemptId:'shot-two-rejected',outcome:'rejected',start:0,minutes:20}),
  attempt({worklotId:'w2',attemptId:'shot-two-rework',outcome:'accepted',start:25,minutes:60}),
  attempt({worklotId:'w3',attemptId:'shot-three-accepted',minutes:100}),
  attempt({worklotId:'w4',attemptId:'shot-four-accepted',minutes:120})
 ];
};
const measure=(attempts=sample(),overrides={})=>measureStudioProductionDuration({
 attempts,asOf,minAcceptedSamples:3,maxAgeDays:14,...overrides
});
test('actual received production captures failed retry effort in final accepted job and conditions on independently accepted output',()=>{
 const result=measure();
 assert.equal(result.type,'StudioProductionMetrologyProjection');
 assert.equal(result.sampleCount,5);
 assert.equal(result.distinctWorklots,4);
 assert.equal(result.providerOperationEvidence.length,1);
 const row=result.providerOperationEvidence[0];
 assert.equal(row.status,'CONDITIONAL_EMPIRICAL_DURATION_READY_FOR_SCHEDULING');
 assert.equal(row.acceptedWorklots,4);
 assert.equal(row.rejectedAttempts,1);
 assert.equal(row.rejectedWithoutAcceptance,0);
 assert.equal(row.unresolvedWorklots,0);
 assert.equal(row.observedAttempts,5);
 assert.equal(row.conditionalOnAcceptedP50Minutes,80);
 assert.equal(row.conditionalOnAcceptedP75Minutes,100);
 assert.equal(row.conditionalOnAcceptedP90Minutes,120);
 assert.equal(row.planningMinutesP75,100);
 assert.equal(row.acceptedWorklotMedianAbsoluteDeviationMinutes,20);
 assert.equal(row.observedActiveMinutes,340);
 assert.equal(row.observedAcceptanceFraction,1);
 assert.equal(row.providerId,'provider:observed-video-crew');
 assert.equal(row.operationKind,'reference-conditioned-video');
 assert.ok(row.id.startsWith('ni:///sha-256;'));
 assert.equal(measure().providerOperationEvidence[0].id,row.id,
  'same original reviewed attempts have the same scientific NI identity');
 assert.match(row.limitation,/not iid-model success probabilities/u);
});
test('a failed unaccepted production and a pending provider operation remain visible, not mistaken for free labor or accepted sample',()=>{
 const result=measure([
  ...sample(),
  attempt({worklotId:'w5',attemptId:'fifth-film-declined',
   outcome:'rejected',minutes:33}),
  attempt({worklotId:'w6',attemptId:'sixth-film-awaiting-editor',
   outcome:'pending',minutes:22})
 ]);
 const row=result.providerOperationEvidence[0];
 assert.equal(row.acceptedWorklots,4);
 assert.equal(row.rejectedWithoutAcceptance,1);
 assert.equal(row.unresolvedWorklots,1);
 assert.equal(row.observedActiveMinutes,395);
 assert.equal(row.status,'CENSORED_UNREVIEWED_WORK_REQUIRES_RECEIVING');
 assert.equal(row.planningMinutesP75,null);
 assert.equal(row.conditionalOnAcceptedP75Minutes,100,
  'descriptive accepted-only estimate is retained separately from blocked planning use');
 assert.equal(row.observedAcceptanceFraction,Math.round((4/6)*10000)/10000);
});
test('report separates suppliers and film functions rather than pooling incompatible work types',()=>{
 const other=[...sample(),
  attempt({worklotId:'edit-1',attemptId:'editor-work',
   kind:'nonlinear-editing',providerId:'provider:actual-film-editor',
   minutes:55})];
 const result=measure(other);
 assert.equal(result.providerOperationEvidence.length,2);
 const editing=result.providerOperationEvidence.find(x=>x.operationKind==='nonlinear-editing');
 assert.ok(editing);
 assert.equal(editing.acceptedWorklots,1);
 assert.equal(editing.status,'INSUFFICIENT_ACCEPTED_SOURCE_EVIDENCE');
 assert.equal(editing.planningMinutesP75,null);
 assert.equal(editing.conditionalOnAcceptedP75Minutes,55);
});
test('provider-duration planning evidence expires and inadequate independent sample count holds future scheduling',()=>{
 assert.equal(measure(sample(),{minAcceptedSamples:5}).providerOperationEvidence[0].planningMinutesP75,null);
 const stale=measure(sample(),{asOf:'2026-11-13T17:00:00Z',maxAgeDays:7});
 assert.equal(stale.providerOperationEvidence[0].status,'STALE_DURATION_OBSERVATIONS');
 assert.equal(stale.providerOperationEvidence[0].planningMinutesP75,null);
 assert.throws(()=>measure(sample(),{minAcceptedSamples:1}),/minimum real accepted sample size/u);
 assert.throws(()=>measure(sample(),{maxAgeDays:0}),/evidence freshness days/u);
});

test('one recent film cannot make historical stale provider performance samples look current',()=>{
 const old=['old1','old2','old3'].map((id,i)=>{
  const row=attempt({worklotId:id,attemptId:'old-'+i,minutes:45});
  row.sessions=[{startedAt:'2026-09-01T10:00:00Z',
   endedAt:'2026-09-01T10:45:00Z'}];
  row.observedAt='2026-09-01T11:00:00Z';
  return row;
 });
 const recent=['new1','new2'].map((id,i)=>attempt({
  worklotId:id,attemptId:'new-'+i,minutes:50
 }));
 const result=measure([...old,...recent],{maxAgeDays:14});
 const row=result.providerOperationEvidence[0];
 assert.equal(row.acceptedWorklots,5);
 assert.equal(row.expiredHistoricalWorklots,3);
 assert.equal(row.freshAcceptedWorklots,2);
 assert.equal(row.status,'INSUFFICIENT_ACCEPTED_SOURCE_EVIDENCE');
 assert.equal(row.planningMinutesP75,null);
 assert.equal(row.conditionalOnAcceptedP75Minutes,50,
  'only two truly fresh same-provider cases contribute to descriptive lead time');
});
test('duplicate, future-dated, revised source and unknowable work durations fail closed',()=>{
 const rows=sample();
 assert.throws(()=>measure([...rows,rows[0]]),/cannot be counted twice/u);
 const wrong=[...rows,attempt({worklotId:'w2',attemptId:'new-party',
  providerId:'provider:other-video-crew',start:130,minutes:5})];
 assert.throws(()=>measure(wrong),/cannot change source, operation or performing provider/u);
 assert.throws(()=>measure([...rows,attempt({worklotId:'w7',attemptId:'future-observation',
  start:1000,minutes:50})]),/future attempt observations/u);
 const overlap=attempt({worklotId:'w9',attemptId:'overlapping-original-work',
  minutes:50});
 overlap.sessions=[
  {startedAt:time(0),endedAt:time(30)},
  {startedAt:time(20),endedAt:time(50)}
 ];
 assert.throws(()=>measure([overlap]),/overlapping actor\/compute work sessions/u);
 const badOutcome=attempt({worklotId:'w9',attemptId:'incorrect-verdict',
  outcome:'accepted'});
 badOutcome.independentReviewRef='';
 assert.throws(()=>measure([badOutcome]),/independent acceptance or rejection evidence/u);
 const postApproval=[...rows,attempt({worklotId:'w1',attemptId:'unreviewed-after-accepted',
  start:150,minutes:5,outcome:'pending'})];
 assert.throws(()=>measure(postApproval),/may not silently follow accepted work/u);
});
test('real multiple-shift labor is counted once; total observed effort and work time are not calendar elapsed hours',()=>{
 const first=attempt({worklotId:'large-job',attemptId:'multi-shift',
  kind:'cinematic-editing',start:0,minutes:240});
 first.sessions=[{startedAt:time(0),endedAt:time(45)},
  {startedAt:time(120),endedAt:time(240)}];
 const evidence=measure([first],{minAcceptedSamples:2});
 assert.equal(evidence.providerOperationEvidence[0].observedActiveMinutes,165);
 assert.equal(evidence.providerOperationEvidence[0].conditionalOnAcceptedP75Minutes,165);
 assert.equal(evidence.providerOperationEvidence[0].planningMinutesP75,null);
});

test('the same science instrument assays finite shared media capacity for independent customer works without claiming GPU execution',async()=>{
 const sourceA='ni:///sha-256;'+'X'.repeat(43),sourceB='ni:///sha-256;'+'Y'.repeat(43);
 const first='2026-10-13T12:00:00Z',
  after=(minutes)=>new Date(Date.parse(first)+minutes*60000).toISOString();
 const book=(id,commissionId,lane,start,minutes)=>({
  worklotId:id,origin:{commissionId},
  state:'CONDITIONAL_BOOKING_NOT_EXECUTION',
  resourcePoolId:'actual-media-crew',resourceLane:lane,estimatedEffortMinutes:minutes,
  startAt:after(start),finishAt:after(start+minutes),
  segments:[{startAt:after(start),endAt:after(start+minutes)}]
 });
 const sourceSchedule={
  type:'FiniteCapacityMediaProductionPortfolioSchedule',
  id:'ni:///sha-256;'+'Z'.repeat(43),asOf:first,
  sourceCommission:null,sourceCommissions:[sourceA,sourceB],
  workOrders:[
   book('fiction-original-treatment',sourceA,0,0,45),
   book('licensed-cinematic-edit',sourceB,1,15,60),
   {worklotId:'native-source-held',origin:{commissionId:sourceA},
    state:'HELD_SOURCE_CAPACITY_OR_QUALIFICATION',segments:[]},
   {worklotId:'licensed-output-received',origin:{commissionId:sourceB},
    state:'ACCEPTED_RECEIPT_CLAIM',segments:[]}
  ]
 };
 const resourceCalendars=[{
  poolId:'actual-media-crew',concurrency:2,observedAt:after(-120),
  expiresAt:after(360),windows:[{startAt:first,endAt:after(180)}]
 }];
 const measure=(schedule=sourceSchedule,resource=resourceCalendars)=>
  measureStudioCapacityPlan({schedule,resourceCalendars:resource,asOf:first});
 const result=measure();
 assert.equal(result.type,'StudioCapacityPlanningMetrology');
 assert.equal(result.totalObservedAvailableLaneMinutes,360);
 assert.equal(result.totalConditionallyBookedLaneMinutes,105);
 assert.equal(result.conditionalOccupancyFraction,Math.round((105/360)*10000)/10000);
 assert.equal(result.pools[0].conditionallyUnallocatedLaneMinutes,255);
 assert.deepEqual(result.byOriginalCustomer.map(x=>x.conditionallyBookedLaneMinutes),[45,60]);
 assert.equal(measure().id,result.id,'original source and calendar projections are immutable observations');
 assert.match(result.limitation,/NOT actual hardware utilization/u);
 const conflict={...sourceSchedule,workOrders:[
  sourceSchedule.workOrders[0],
  book('cross-customer-lane-collision',sourceB,0,15,60)
 ]};
 assert.throws(()=>measure(conflict),/double-book one physical resource lane/u);
 const unavailable={...sourceSchedule,workOrders:[
  sourceSchedule.workOrders[0],book('outside-window',sourceB,1,181,60)
 ]};
 assert.throws(()=>measure(unavailable),/outside observed availability/u);
 const falselyBooked={...sourceSchedule,workOrders:[
  {...sourceSchedule.workOrders[0],
   state:'HELD_SOURCE_CAPACITY_OR_QUALIFICATION'},
  sourceSchedule.workOrders[1]
 ]};
 assert.throws(()=>measure(falselyBooked),/cannot consume conditional compute/u);
 const stale=resourceCalendars.map(pool=>({...pool,expiresAt:after(-1)}));
 assert.throws(()=>measure(sourceSchedule,stale),/stale or future resource capacity/u);
 const root=mkdtempSync(join(tmpdir(),'microdrama-scientific-capacity-'));
 try{
  const schedulePath=join(root,'source-schedule.json'),
   calendarPath=join(root,'source-resource-claim.json');
  writeFileSync(schedulePath,JSON.stringify({schedule:sourceSchedule}));
  writeFileSync(calendarPath,JSON.stringify({resourceCalendars}));
  const command=['capacity',schedulePath,calendarPath,first];
  const received=await measureProductionFile(command);
  assert.deepEqual(received,result);
  const fromCli=JSON.parse(execFileSync(process.execPath,[
   new URL('../apps/measure-production-duration.mjs',import.meta.url).pathname,...command
  ],{encoding:'utf8',timeout:15000}));
  assert.deepEqual(fromCli,result);
 }finally{rmSync(root,{recursive:true,force:true});}
});

test('scientific office CLI reads real-shaped external work events and returns source-bound metrology ready for separate operations',async()=>{
 const root=mkdtempSync(join(tmpdir(),'lenticule-original-film-observations-'));
 try{
  const file=join(root,'source-attempt-events.json');
  writeFileSync(file,JSON.stringify({attempts:sample()}));
  const argv=[file,asOf,'3','14'];
  const outcome=await measureProductionFile(argv);
  assert.equal(outcome.providerOperationEvidence[0].planningMinutesP75,100);
  const actual=JSON.parse(execFileSync(process.execPath,[
   new URL('../apps/measure-production-duration.mjs',import.meta.url).pathname,...argv
  ],{encoding:'utf8',timeout:15000}));
  assert.deepEqual(actual,outcome);
  await assert.rejects(()=>measureProductionFile([]),/Usage:/u);
 }finally{rmSync(root,{recursive:true,force:true})}
});
