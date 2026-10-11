import test from 'node:test';
import assert from 'node:assert/strict';
import {assayVerifiedEffectBindings as assay} from './verified-effect-binding.mjs';
const workRef='causeway-services/koios-news-site#16';
const requiredStages=['discovery','keyboard','authority','delivery','acknowledgement'];
const asOf='2026-10-11T07:00:00Z';
const manifest=(effectRef='release-A',props={})=>({manifestId:`manifest-${effectRef}`,workRef,effectRef,sourceRef:'owner:manifest',components:[{componentId:'web',revision:`${effectRef}-web`},{componentId:'receiver',revision:`${effectRef}-receiver`}],...props});
const event=(stage,effectRef='release-A',props={})=>({evidenceId:`${effectRef}-${stage}`,workRef,effectRef,manifestId:`manifest-${effectRef}`,componentId:stage==='delivery'||stage==='acknowledgement'?'receiver':'web',revision:`${effectRef}-${stage==='delivery'||stage==='acknowledgement'?'receiver':'web'}`,sourceRef:`provider:${stage}`,status:'observed',verdict:'pass',stage,observedAt:'2026-10-11T06:00:00Z',...props});
const base=(events,manifests=[manifest()])=>({workRef,requiredStages,events,manifests,asOf});
const trust={verifyManifest:()=>true,verifyEvidence:()=>true};
const run=(events,manifests=[manifest()],verify=trust)=>assay(base(events,manifests),verify);
test('several provider components can substantiate one effect when version manifest binds them',()=>{
 const r=run(requiredStages.map(s=>event(s)));
 assert.deepEqual(r.conditionallyCompleteEffects,['release-A']);
 assert.deepEqual(r.effects[0].missing,[]);
 assert.match(r.limit,/not delivery/);
});
test('complete union of evidence across incompatible effect manifests proves neither',()=>{
 const r=run(requiredStages.map((s,i)=>event(s,i<2?'release-A':'release-B')),[manifest('release-A'),manifest('release-B')]);
 assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.equal(r.effects.length,2);
});
test('component revision mismatch cannot be re-labelled as a valid receipt',()=>{
 const ev=requiredStages.map(s=>event(s)); ev[3]={...ev[3],revision:'receiver-revision-B'};
 const r=run(ev);assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.equal(r.rejected[0].reason,'component-revision-mismatch');
});
test('a forged effectRef does not borrow the manifest owner',()=>{
 const ev=requiredStages.map(s=>event(s));ev[2]={...ev[2],effectRef:'release-B'};
 const r=run(ev);assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.equal(r.rejected[0].reason,'effect-mismatch');
});
test('a foreign work reference cannot be substituted',()=>{
 const ev=requiredStages.map(s=>event(s));ev[2]={...ev[2],workRef:'other-client/issue#1'};
 const r=run(ev);assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.equal(r.rejected[0].reason,'wrong-work');
});
test('self-asserted manifest and receipts never count without verification callbacks',()=>{
 const r=run(requiredStages.map(s=>event(s)),[manifest()],{});
 assert.deepEqual(r.conditionallyCompleteEffects,[]);assert.equal(r.effects[0].manifestAuthenticated,false);
});
test('failed or throwing manifest verification rejects all related observations',()=>{
 const r=run(requiredStages.map(s=>event(s)),[manifest()],{verifyManifest:()=>{throw Error('offline')},verifyEvidence:()=>true});
 assert.deepEqual(r.conditionallyCompleteEffects,[]);assert.equal(r.rejected.length,requiredStages.length);
});
test('unverified provider receipt does not imply stage completion',()=>{
 const r=run(requiredStages.map(s=>event(s)),[manifest()],{verifyManifest:()=>true,verifyEvidence:e=>e.stage!=='acknowledgement'});
 assert.deepEqual(r.conditionallyCompleteEffects,[]);assert.equal(r.rejected[0].reason,'unauthenticated-evidence');
});
test('reported evidence does not count as independent observation',()=>{
 const ev=requiredStages.map(s=>event(s));ev[0]={...ev[0],status:'reported'};
 const r=run(ev);assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.equal(r.rejected[0].reason,'not-observed');
});
test('contested report prevents silent positive classification',()=>{
 const ev=requiredStages.map(s=>event(s));ev.push(event('delivery','release-A',{evidenceId:'extra-delivery-failure',verdict:'fail'}));
 const r=run(ev);assert.deepEqual(r.conditionallyCompleteEffects,[]);
 assert.deepEqual(r.effects[0].contested,['delivery']);
});
test('missing manifest and unattested component are rejected without promotion',()=>{
 const ev=requiredStages.map(s=>event(s));ev[0]={...ev[0],manifestId:'absent'};
 const r=run(ev);assert.equal(r.rejected[0].reason,'missing-manifest');
});
test('future evidence is excluded even on the same UTC day',()=>{
 const ev=requiredStages.map(s=>event(s));ev[0]={...ev[0],observedAt:'2026-10-11T07:00:01Z'};
 const r=run(ev);assert.equal(r.rejected[0].reason,'future-evidence');
});
test('Gregorian invalid dates rejected, leap days handled correctly',()=>{
 const ev=requiredStages.map(s=>event(s));ev[0]={...ev[0],observedAt:'2026-02-30T06:00:00Z'};
 assert.throws(()=>run(ev),/Gregorian/);
 ev[0]={...ev[0],observedAt:'2024-02-29T06:00:00Z'};
 assert.deepEqual(run(ev).conditionallyCompleteEffects,['release-A']);
});
test('duplicate IDs and duplicate manifests reject before calculating coverage',()=>{
 const ev=requiredStages.map(s=>event(s));ev[1]={...ev[1],evidenceId:ev[0].evidenceId};
 assert.throws(()=>run(ev),/duplicate evidence/);
 assert.throws(()=>run([], [manifest(),manifest()]),/duplicate effect manifest/);
});
test('results are input-order invariant',()=>{
 const ev=requiredStages.map(s=>event(s));assert.deepEqual(run(ev),run(ev.reverse()));
});
test('zero evidence is never accepted',()=>{
 const r=run([]);assert.equal(r.conditionallyCompleteEffects.length,0);
});
