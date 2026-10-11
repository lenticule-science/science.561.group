import test from 'node:test';
import assert from 'node:assert/strict';
import {assayRemedyPath} from './remedy-route-assay.mjs';
const digest='a'.repeat(64);
const stages={discovery:'public-readback',noAccount:'task-test',keyboard:'task-test',screenReader:'task-test',authority:'authority-record',delivery:'provider-receipt',acknowledgement:'independent-receipt',editorialDecision:'editorial-record',publishedCorrection:'public-readback'};
const event=(stage,props={})=>({id:stage,stage,method:stages[stage],status:'observed',verdict:'pass',actorId:stage==='acknowledgement'?'reader-2':'provider-1',sourceUrl:'https://example.org/verified/',sourceDigest:digest,at:'2026-10-11T05:15:00Z',receiverId:'koios-editor',submissionId:'test-001',authorityRef:'approved-provider-record',correctionId:'revision-001',decision:'corrected',observationContext:'koios:site-rev-A',...props});
const baseline=mode=>({schema:'lenticule/public-remedy-assay/v1',workRef:'causeway-services/koios-news-site#16',mode,events:['discovery','noAccount','keyboard','screenReader','authority','delivery','acknowledgement'].map(s=>event(s))});
const options={verifyEvidence:()=>true,asOf:'2026-10-11T05:30:00Z'};
test('empty trace is unknown, never zero problems or success',()=>{const x=assayRemedyPath({...baseline('live'),events:[]},options);assert.equal(x.liveIntake,'unverified');assert.equal(x.stages.discovery,'unknown');});
test('visible link alone is not verified intake',()=>{const x=assayRemedyPath({...baseline('live'),events:[event('discovery')]},options);assert.equal(x.liveIntake,'unverified');});
test('provider delivery without independent acknowledgement fails closure',()=>{const r=baseline('live');r.events=r.events.filter(e=>e.stage!=='acknowledgement');assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');});
test('same actor switching office labels is not independent acknowledgement',()=>{const r=baseline('live');r.events.find(e=>e.stage==='acknowledgement').actorId='provider-1';assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');});
test('mismatched submission IDs cannot correlate',()=>{const r=baseline('live');r.events.find(e=>e.stage==='acknowledgement').submissionId='other';assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');});
test('mismatched receiver binding cannot correlate',()=>{const r=baseline('live');r.events.find(e=>e.stage==='authority').receiverId='wrong-receiver';assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');});
test('reported public route is not observed even if verifier returns true',()=>{const r=baseline('live');r.events.forEach(e=>e.status='reported');assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');});
test('missing external verification cannot establish observed service',()=>{assert.equal(assayRemedyPath(baseline('live')).liveIntake,'unverified');});
test('verified complete correlated live trace supports only structural intake',()=>{const x=assayRemedyPath(baseline('live'),options);assert.equal(x.liveIntake,'verified');assert.equal(x.liveCorrection,'unverified');assert.equal(x.humanTaskSuccess,'unmeasured');});
test('synthetic pass cannot be misrepresented as production effect',()=>{const x=assayRemedyPath(baseline('synthetic'),options);assert.equal(x.intakeEvidence,'verified');assert.equal(x.liveIntake,'unverified');});
test('independent decision plus public witness can establish a correction only when correlated',()=>{const r=baseline('live');r.events.push(event('editorialDecision'),event('publishedCorrection',{actorId:'public-reader-3'}));const x=assayRemedyPath(r,options);assert.equal(x.liveCorrection,'verified');});
test('same actor cannot independently witness its own correction publication',()=>{const r=baseline('live');r.events.push(event('editorialDecision'),event('publishedCorrection'));assert.equal(assayRemedyPath(r,options).liveCorrection,'unverified');});
test('mis-correlated public readback cannot establish correction',()=>{const r=baseline('live');r.events.push(event('editorialDecision'),event('publishedCorrection',{actorId:'reader',correctionId:'another'}));assert.equal(assayRemedyPath(r,options).liveCorrection,'unverified');});
test('published correction is not assumed from acknowledgement',()=>{const x=assayRemedyPath(baseline('live'),options);assert.equal(x.correctionEvidence,'unverified');});
test('observed failed path produces explicit failure, not unverified success',()=>{const r=baseline('live');r.events.find(e=>e.stage==='delivery').verdict='fail';assert.equal(assayRemedyPath(r,options).liveIntake,'observed-failure');});
test('contradictory authenticated observations are contested',()=>{const r=baseline('live');r.events.push(event('delivery',{id:'delivery-2',verdict:'fail'}));assert.equal(assayRemedyPath(r,options).liveIntake,'contested');});
test('missing keyboard or screen-reader mode blocks functional claim',()=>{for(const stage of ['keyboard','screenReader','noAccount']){const r=baseline('live');r.events=r.events.filter(e=>e.stage!==stage);assert.equal(assayRemedyPath(r,options).liveIntake,'unverified');}});
test('future evidence is rejected',()=>{const r=baseline('live');r.events[0].at='2026-10-11T05:31:00Z';assert.throws(()=>assayRemedyPath(r,options),/provenance/);});
test('impossible Gregorian evidence timestamp rejected',()=>{const r=baseline('live');r.events[0].at='2026-02-30T05:00:00Z';assert.throws(()=>assayRemedyPath(r,options),/calendar/);});
test('proof URI with token and fragment is rejected',()=>{for(const url of ['https://example.org/?token=secret','https://example.org/#cred']){const r=baseline('live');r.events[0].sourceUrl=url;assert.throws(()=>assayRemedyPath(r,options),/provenance/);}});
test('duplicate evidence IDs rejected',()=>{const r=baseline('live');r.events[1].id=r.events[0].id;assert.throws(()=>assayRemedyPath(r,options),/duplicate/);});
test('wrong stage method rejected',()=>{const r=baseline('live');r.events[0].method='provider-receipt';assert.throws(()=>assayRemedyPath(r,options),/type/);});
test('unauthorized positive editorial disposition rejected',()=>{const r=baseline('live');r.events.push(event('editorialDecision',{decision:'review-pending'}));assert.throws(()=>assayRemedyPath(r,options),/decision/);});
test('Gregorian month lengths admit October 31 and December 31 but not November 31',()=>{
  for(const date of ['2026-10-31T05:15:00Z','2026-12-31T05:15:00Z']){
    const r=baseline('synthetic');r.events[0].at=date;
    assert.equal(assayRemedyPath(r,{...options,asOf:'2027-01-01T00:00:00Z'}).intakeEvidence,'verified');
  }
  const r=baseline('synthetic');r.events[0].at='2026-11-31T05:15:00Z';
  assert.throws(()=>assayRemedyPath(r,{...options,asOf:'2027-01-01T00:00:00Z'}),/calendar/);
});

test('mixed site revisions with each stage in their union never verify any one service effect',()=>{
  const r=baseline('live');r.events.forEach((e,i)=>e.observationContext=i<4?'koios:site-rev-A':'koios:site-rev-B');
  const x=assayRemedyPath(r,options);assert.equal(x.liveIntake,'unverified');
  assert.equal(x.effects.length,2);assert.ok(x.effects.every(e=>e.outcome==='unverified'));
});
test('correction decision and public witness cannot be spliced across revisions',()=>{
  const r=baseline('live');r.events.push(event('editorialDecision'),event('publishedCorrection',{actorId:'public-reader-3',observationContext:'koios:site-rev-B'}));
  const x=assayRemedyPath(r,options);assert.equal(x.liveCorrection,'unverified');
});
test('records without a service-effect context fail closed',()=>{
  const r=baseline('live');delete r.events[0].observationContext;
  assert.throws(()=>assayRemedyPath(r,options),/provenance/);
});
