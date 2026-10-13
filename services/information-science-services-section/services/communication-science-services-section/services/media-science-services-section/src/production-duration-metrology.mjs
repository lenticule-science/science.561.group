/**
 * Empirical production lead-time metrology from ACTUAL independently
 * reviewed work attempts, not provider marketing, generated tests or quotes.
 *
 * Scientific unit: one original worklot / provider / capability. Every
 * unsuccessful attempt is included in spent effort, and pending/censored
 * outcomes remain visible. Completed source works give end-to-end active
 * production minutes (including their rejected/repeated attempts).
 *
 * Outputs may inform Coesite's finite-capacity media scheduler ONLY after
 * independently authorized source, staffing and availability receiving.
 *
 * P75 is an empirical conditional quantile, not a promise or predictive
 * distribution. Do not treat rejected, pending and successful trials as iid.
 */
import {createHash} from 'node:crypto';

const insist=(truth,message)=>{if(!truth)throw new TypeError(message)};
const row=x=>x!==null&&typeof x==='object'&&!Array.isArray(x);
const text=(v,label,max=500)=>{
 insist(typeof v==='string'&&v.trim()&&v.length<=max,label+' must be bounded text');
 return v.trim();
};
const ni='ni:///sha-256;';
const SOURCE=/^(?:ni:\/\/\/sha-256;[A-Za-z0-9_-]{43}|sha256:[a-f0-9]{64}|git:[a-f0-9]{40})$/u;
const millis=(v,label)=>{
 const s=text(v,label,50),t=Date.parse(s);
 insist(Number.isFinite(t)&&s.includes('T')&&/(?:Z|[+-]\d\d:\d\d)$/u.test(s),
  label+' must have an exact offset-aware time');
 return t;
};
const stable=x=>{
 if(Array.isArray(x))return '['+x.map(stable).join(',')+']';
 if(row(x))return '{'+Object.keys(x).sort().filter(k=>x[k]!==undefined)
  .map(k=>JSON.stringify(k)+':'+stable(x[k])).join(',')+'}';
 return JSON.stringify(x);
};
const digest=x=>ni+createHash('sha256').update(stable(x)).digest('base64url');
const quantile=(values,p)=>{
 if(!values.length)return null;
 const sorted=[...values].sort((a,b)=>a-b);
 return sorted[Math.min(sorted.length-1,Math.max(0,Math.ceil(p*sorted.length)-1))];
};
const median=values=>{
 if(!values.length)return null;
 const v=[...values].sort((a,b)=>a-b),mid=Math.floor(v.length/2);
 return v.length%2?v[mid]:(v[mid-1]+v[mid])/2;
};
const round=n=>Math.round(n*10000)/10000;
/**
 * Convert a REAL work attempt and accepted/rejected editorial verdict to
 * independently auditable active effort, with no double-counted shift spans.
 */
function admitAttempt(attempt,asOf){
 insist(row(attempt),'an observed production attempt must be a record');
 const worklotId=text(attempt.worklotId,'original production worklot');
 const attemptId=text(attempt.attemptId,'actual provider attempt identity');
 const sourceRef=text(attempt.sourceRef,'source story/work reference',200);
 insist(SOURCE.test(sourceRef),'source identity must be immutable NI/SHA/commit');
 const kind=text(attempt.kind,'original production operation');
 const providerId=text(attempt.providerId,'actual performing producer');
 const outcome=attempt.outcome;
 insist(['accepted','rejected','pending'].includes(outcome),
  'attempt must retain independent accepted/rejected/pending outcome');
 const observedAt=millis(attempt.observedAt,'original observation date');
 insist(observedAt<=asOf,'future attempt observations are not admissible');
 const outputRef=text(attempt.outputRef,'actual provider/output event evidence');
 const independentReviewRef=outcome==='pending'?null:
  text(attempt.independentReviewRef,'actual independent acceptance or rejection evidence');
 insist(Array.isArray(attempt.sessions)&&attempt.sessions.length>=1&&
  attempt.sessions.length<=64,'attempt requires actual bounded work session spans');
 const spans=attempt.sessions.map(s=>{
  insist(row(s),'each observed session requires exact time boundaries');
  const start=millis(s.startedAt,'work session start');
  const end=millis(s.endedAt,'work session end');
  insist(end>start&&end<=observedAt&&end-start<=72*3600000,
   'actual work session must be positive, observed, and under 72 hours');
  return Object.freeze({start,end});
 }).sort((a,b)=>a.start-b.start);
 for(let i=1;i<spans.length;i++)
  insist(spans[i].start>=spans[i-1].end,
   'overlapping actor/compute work sessions cannot count effort twice');
 const activeMs=spans.reduce((sum,s)=>sum+s.end-s.start,0);
 insist(activeMs>0&&Number.isSafeInteger(activeMs)&&activeMs<=100000*60000,
  'provider active work interval exceeds measurable scope');
 const start=spans[0].start,end=spans[spans.length-1].end;
 return Object.freeze({
  worklotId,attemptId,sourceRef,kind,providerId,
  outcome,observedAt,independentReviewRef,outputRef,
  start,end,activeMs,
  // Retain original sessions for proof semantics and exact NI identification.
  sessions:Object.freeze(spans)
 });
}
const summarizeCase=events=>{
 const ordered=[...events].sort((a,b)=>a.start-b.start||a.attemptId.localeCompare(b.attemptId));
 for(let i=1;i<ordered.length;i++)
  insist(ordered[i].start>=ordered[i-1].start,'work attempts are unsorted');
 const outcomeSet=new Set(ordered.filter(x=>x.outcome==='accepted').map(x=>x.attemptId));
 insist(outcomeSet.size<=1,'one worklot cannot be accepted from two different attempts');
 if(outcomeSet.size){
  const accepted=ordered.findIndex(x=>x.outcome==='accepted');
  insist(accepted===ordered.length-1,'new attempts may not silently follow accepted work');
 }
 const pending=ordered.findIndex(x=>x.outcome==='pending');
 insist(pending<0||pending===ordered.length-1,
  'an unevaluated attempt must be the last actual work attempt');
 const effort=ordered.reduce((sum,x)=>sum+x.activeMs,0);
 const result=ordered.at(-1);
 return Object.freeze({
  worklotId:result.worklotId,sourceRef:result.sourceRef,
  kind:result.kind,providerId:result.providerId,
  attempts:ordered.length,
  rejectedAttempts:ordered.filter(x=>x.outcome==='rejected').length,
  totalActiveMs:effort,
  status:result.outcome==='accepted'?'accepted':
   result.outcome==='pending'?'pending':'rejected-without-accepted-output',
  lastObservedAt:Math.max(...ordered.map(x=>x.observedAt))
 });
};
/**
 * Estimate labor/compute effort by *actual* producing capability, withholding
 * conditional future scheduling estimates when sample/recency/censoring is
 * insufficient. Comparisons must keep provider + job kind separate.
 */
export function measureStudioProductionDuration({
 attempts,asOf,minAcceptedSamples,maxAgeDays
}={}){
 insist(Array.isArray(attempts)&&attempts.length<=100000,
  'production metrology expects actual bounded source attempt observations');
 const now=millis(asOf,'measurement as-of');
 insist(Number.isSafeInteger(minAcceptedSamples)&&minAcceptedSamples>=2&&
  minAcceptedSamples<=100,'minimum real accepted sample size must be explicit');
 insist(Number.isSafeInteger(maxAgeDays)&&maxAgeDays>=1&&maxAgeDays<=365,
  'maximum evidence freshness days must be explicit');
 const seen=new Set(),cases=new Map(),groups=new Map();
 for(const source of attempts){
  const event=admitAttempt(source,now);
  insist(!seen.has(event.attemptId),'source provider attempt cannot be counted twice');
  seen.add(event.attemptId);
  const key=event.worklotId;
  if(!cases.has(key))cases.set(key,[]);
  const previous=cases.get(key)[0];
  if(previous)insist(previous.sourceRef===event.sourceRef&&
   previous.kind===event.kind&&previous.providerId===event.providerId,
   'one worklot cannot change source, operation or performing provider');
  cases.get(key).push(event);
 }
 const closed=[...cases.values()].map(summarizeCase);
 for(const sample of closed){
  const key=sample.providerId+'\0'+sample.kind;
  if(!groups.has(key))groups.set(key,[]);
  groups.get(key).push(sample);
 }
 const results=[];
 for(const [key,group] of [...groups].sort((a,b)=>a[0].localeCompare(b[0]))){
  const [providerId,kind]=key.split('\0');
  const accepted=group.filter(x=>x.status==='accepted');
  const unresolved=group.filter(x=>x.status==='pending');
  const rejected=group.filter(x=>x.status==='rejected-without-accepted-output');
  // Recency must be checked PER ACCEPTED WORKLOT. One contemporary success
  // cannot refresh a collection of ancient model/provider performance samples.
  const freshnessMs=maxAgeDays*86400000;
  const fresh=group.filter(x=>x.lastObservedAt+freshnessMs>now);
  const freshAccepted=fresh.filter(x=>x.status==='accepted');
  const expiredCases=group.length-fresh.length;
  const completed=freshAccepted.map(x=>Math.ceil(x.totalActiveMs/60000));
  const lastObserved=Math.max(...group.map(x=>x.lastObservedAt));
  const expiry=lastObserved+maxAgeDays*86400000;
  const current=lastObserved<=now&&expiry>now;
  const enough=freshAccepted.length>=minAcceptedSamples;
  const uncontested=unresolved.length===0;
  const p50=quantile(completed,.5),p75=quantile(completed,.75),
   p90=quantile(completed,.9);
  const dispersion=completed.length?median(completed.map(x=>Math.abs(x-median(completed)))):null;
  const observedEffort=group.reduce((sum,x)=>sum+x.totalActiveMs,0);
  const first=group.reduce((m,x)=>Math.min(m,x.lastObservedAt),Infinity);
  const body={
   type:'StudioProductionDurationEvidence',version:1,
   providerId,operationKind:kind,
   asOf:new Date(now).toISOString(),
   observedFrom:new Date(first).toISOString(),
   observedAt:new Date(lastObserved).toISOString(),
   expiresAt:new Date(expiry).toISOString(),
   acceptedWorklots:accepted.length,
   freshAcceptedWorklots:freshAccepted.length,
   expiredHistoricalWorklots:expiredCases,
   rejectedWithoutAcceptance:rejected.length,
   unresolvedWorklots:unresolved.length,
   observedWorklots:group.length,
   observedAttempts:group.reduce((n,x)=>n+x.attempts,0),
   rejectedAttempts:group.reduce((n,x)=>n+x.rejectedAttempts,0),
   observedActiveMinutes:Math.ceil(observedEffort/60000),
   conditionalOnAcceptedP50Minutes:p50,
   conditionalOnAcceptedP75Minutes:p75,
   conditionalOnAcceptedP90Minutes:p90,
   acceptedWorklotMedianAbsoluteDeviationMinutes:dispersion,
   observedAcceptanceFraction:round(accepted.length/group.length),
   planningMinutesP75:current&&enough&&uncontested?p75:null,
   status:!current?'STALE_DURATION_OBSERVATIONS':
    !enough?'INSUFFICIENT_ACCEPTED_SOURCE_EVIDENCE':
    !uncontested?'CENSORED_UNREVIEWED_WORK_REQUIRES_RECEIVING':
    'CONDITIONAL_EMPIRICAL_DURATION_READY_FOR_SCHEDULING',
   limitation:'Observed effort/approval per original source worklot, stratified by actual provider and operation. Quantiles condition on independent accepted outcomes; censored and rejected work remain separately visible. Sample counts are not iid-model success probabilities, warranties, supplier availability, source rights, contractor acceptance or customer-paid costs.'
  };
  results.push(Object.freeze({id:digest(body),...body}));
 }
 return Object.freeze({
  type:'StudioProductionMetrologyProjection',version:1,
  asOf:new Date(now).toISOString(),
  sampleCount:seen.size,
  distinctWorklots:cases.size,
  providerOperationEvidence:Object.freeze(results),
  note:'Read-only empirical statistics from external source-owned reviewed work. Nothing is generated, costed, staffed or appointed by this scientific calculation.'
 });
}

/**
 * Measure the conditional occupation of one *observed* production resource
 * calendar, without claiming actual worker/provider execution or inventing a
 * second scheduler. Single-client and multi-client Coesite results use the
 * same assay. Only original source worklot labels and measured time intervals
 * contribute; held and already accepted work consumes no forecast capacity.
 */
export function measureStudioCapacityPlan({schedule,resourceCalendars,asOf}={}){
 insist(schedule && ['FiniteCapacityMediaProductionSchedule',
  'FiniteCapacityMediaProductionPortfolioSchedule'].includes(schedule.type) &&
  Array.isArray(schedule.workOrders),'existing Coesite media schedule required');
 const now=millis(asOf,'capacity observation as-of');
 insist(millis(schedule.asOf,'original Coesite planning time')===now,
  'capacity assay must use the exact original planning instant');
 insist(Array.isArray(resourceCalendars)&&resourceCalendars.length>=1&&
  resourceCalendars.length<=64,'capacity needs 1-64 observed original pool calendars');
 const pools=new Map();
 for(const calendar of resourceCalendars){
  insist(row(calendar),'capacity pool must be a structured record');
  const poolId=text(calendar.poolId,'original resource pool');
  insist(!pools.has(poolId),'duplicate resource pool observation');
  const capacity=calendar.concurrency;
  insist(Number.isSafeInteger(capacity)&&capacity>=1&&capacity<=64,
   'resource pool capacity must be a bounded positive integer');
  const observed=millis(calendar.observedAt,'pool observation');
  const expires=millis(calendar.expiresAt,'pool evidence expiry');
  insist(observed<=now&&expires>now,'stale or future resource capacity evidence');
  insist(Array.isArray(calendar.windows)&&calendar.windows.length>=1&&
   calendar.windows.length<=500,'original capacity windows are required');
  const windows=calendar.windows.map(w=>{
   const start=millis(w.startAt,'observed window start');
   const end=millis(w.endAt,'observed window end');
   insist(start<end&&end<=expires,'resource interval exceeds observed time window');
   return {start,end};
  }).sort((a,b)=>a.start-b.start);
  for(let i=1;i<windows.length;i++)
   insist(windows[i].start>=windows[i-1].end,'overlapping resource calendar windows');
  const remainingWindows=windows.map(w=>({
   start:Math.max(w.start,now),end:w.end
  })).filter(w=>w.end>w.start);
  const availableMs=remainingWindows.reduce((sum,w)=>sum+(w.end-w.start)*capacity,0);
  pools.set(poolId,{capacity,availableMs,windows:remainingWindows,segments:[],bookedMs:0});
 }
 const attributed=new Map(),seen=new Set();
 const commissions=schedule.type==='FiniteCapacityMediaProductionPortfolioSchedule'?
  schedule.sourceCommissions:[schedule.sourceCommission];
 insist(Array.isArray(commissions)&&commissions.length>=1&&
  commissions.every(x=>typeof x==='string'&&x.trim()),
  'schedule must preserve source customer identities');
 for(const work of schedule.workOrders){
  insist(row(work)&&typeof work.worklotId==='string'&&!seen.has(work.worklotId),
   'source worklots must retain unique identities');
  seen.add(work.worklotId);
  const source=work.origin?.commissionId??schedule.sourceCommission;
  insist(commissions.includes(source),'worklot lacks original customer identity');
  insist(Array.isArray(work.segments),'worklot must retain actual schedule segments');
  if(work.state!=='CONDITIONAL_BOOKING_NOT_EXECUTION'){
   insist(work.segments.length===0,
    'held or already received work cannot consume conditional compute capacity');
   continue;
  }
  const pool=pools.get(work.resourcePoolId),lane=work.resourceLane;
  insist(pool&&Number.isSafeInteger(lane)&&lane>=0&&lane<pool.capacity,
   'booked work refers to unavailable pool or resource lane');
  insist(work.segments.length>0,'conditional booking needs bounded source intervals');
  let duration=0,lastEnd=-Infinity;
  for(const raw of work.segments){
   const start=millis(raw.startAt,'scheduled resource start'),
    end=millis(raw.endAt,'scheduled resource end');
   insist(start>=now&&start<end&&start>=lastEnd,
    'source work segments overlap or precede the planning observation');
   insist(pool.windows.some(w=>start>=w.start&&end<=w.end),
    'booked resource time is outside observed availability');
   duration+=end-start;lastEnd=end;
   pool.segments.push({start,end,lane,worklotId:work.worklotId});
  }
  insist(millis(work.startAt,'source work start')===
   millis(work.segments[0].startAt,'first resource segment')&&
   millis(work.finishAt,'source work finish')===lastEnd,
   'booked work start/finish disagrees with original timed segments');
  insist(Number.isSafeInteger(work.estimatedEffortMinutes)&&
   duration===work.estimatedEffortMinutes*60000,
   'booked time differs from source observed work effort');
  pool.bookedMs+=duration;
  attributed.set(source,(attributed.get(source)??0)+duration);
 }
 const findings=[...pools.entries()].sort((a,b)=>a[0].localeCompare(b[0]))
  .map(([poolId,pool])=>{
   const segments=[...pool.segments].sort((a,b)=>a.lane-b.lane||a.start-b.start);
   for(let i=1;i<segments.length;i++)
    if(segments[i].lane===segments[i-1].lane)
     insist(segments[i].start>=segments[i-1].end,
      'multiple original commissions double-book one physical resource lane');
   insist(pool.bookedMs<=pool.availableMs,'conditional bookings exceed available capacity');
   return Object.freeze({poolId,capacity:pool.capacity,
    observedAvailableLaneMinutes:round(pool.availableMs/60000),
    conditionallyBookedLaneMinutes:round(pool.bookedMs/60000),
    conditionallyUnallocatedLaneMinutes:round((pool.availableMs-pool.bookedMs)/60000),
    conditionalOccupancyFraction:pool.availableMs>0?
     round(pool.bookedMs/pool.availableMs):null});
  });
 const totalAvailable=findings.reduce((sum,p)=>sum+p.observedAvailableLaneMinutes,0);
 const totalBooked=findings.reduce((sum,p)=>sum+p.conditionallyBookedLaneMinutes,0);
 const body={
  type:'StudioCapacityPlanningMetrology',version:1,
  asOf:new Date(now).toISOString(),sourceSchedule:schedule.id,
  pools:Object.freeze(findings),
  byOriginalCustomer:Object.freeze([...attributed.entries()]
   .sort((a,b)=>a[0].localeCompare(b[0]))
   .map(([commissionId,ms])=>Object.freeze({
    commissionId,conditionallyBookedLaneMinutes:round(ms/60000)
   }))),
  totalObservedAvailableLaneMinutes:round(totalAvailable),
  totalConditionallyBookedLaneMinutes:round(totalBooked),
  conditionalOccupancyFraction:totalAvailable>0?
   round(totalBooked/totalAvailable):null,
  limitation:'A conditional booking measures forecast occupation of independently claimed provider/crew windows, NOT actual hardware utilization, spent cloud credits, verified resource reservations, executed work, editorial acceptance, audience effects or source consent. Unallocated forecast time is not necessarily usable by an unqualified provider.'
 };
 return Object.freeze({id:digest(body),...body});
}
