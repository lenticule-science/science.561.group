import test from 'node:test';
import assert from 'node:assert/strict';
import {admitPublicFeedback, publicProjection} from './evidence-assay.mjs';
import fixture from './koios-live-observation.json' with {type:'json'};
const clone = () => structuredClone(fixture);
const verifyObservation = ({observation, evidence}) => observation.status === 'observed' &&
  evidence.method === 'public-readback' &&
  evidence.url.startsWith('https://koios.news/posts/');
const verified = {verifyObservation};
const admit = x => admitPublicFeedback(x, verified);
const project = x => publicProjection(x, verified);
const rejects = (mutate,match) => {const x=clone();mutate(x);assert.throws(()=>admit(x),match);};
test('live public page and issue report stay separated',()=>{
  const r=admit(clone());
  assert.deepEqual(r.statuses,[{id:'page-cbs-20261010',status:'observed'},{id:'page-blast-20261010',status:'observed'},{id:'reported-batch-20261010',status:'reported'},{id:'reported-batch-20261011',status:'reported'}]);
  assert.equal(r.claimFalsified,false);
  assert.equal(r.route,'public-to-science-feedback');
  assert.equal(r.engineeringSpecificationAuthorized,false);
  assert.equal(r.customerAcceptance,'unverified');
});
test('public view does not imply independent customer receiving',()=>{assert.equal(project(clone()).customerAcceptance,'unverified');});
test('missing original work_ref fails',()=>rejects(x=>x.workRef='',/work refs/));
test('moving main ref instead of blob fails',()=>rejects(x=>x.source.blobSha='main',/blob SHA/));
test('incomplete falsification conditions fail',()=>rejects(x=>x.hypothesis.negativeControl='',/negative control/));
test('scientific acceptance by intake fails',()=>rejects(x=>x.scienceDecision={state:'accepted',ref:'self'},/Science decision/));
test('reported sensor cannot call itself observed',()=>rejects(x=>x.observations[2].status='observed',/reported evidence/));
test('unverifiable evidence fails',()=>rejects(x=>x.observations[0].evidence[0].url='http://example.org/',/evidence provenance/));
test('tokenized public URL fails to prevent leakage',()=>rejects(x=>x.observations[0].evidence[0].url='https://example.org/?token=secret',/evidence provenance/));
test('observations must have valid timestamp',()=>rejects(x=>x.observations[0].at='tomorrow',/invalid observation/));
test('duplicate observation fails',()=>rejects(x=>x.observations[2].id=x.observations[0].id,/unique/));
test('self receipt cannot certify customer acceptance',()=>rejects(x=>{x.outcome.receiverStatus='independently_verified';x.outcome.receipt={receiver:x.sourcePrincipal,witness:'independent',reference:'receipt'};},/external provider verifier/));
test('same receiver and witness cannot certify acceptance',()=>rejects(x=>{x.outcome.receiverStatus='independently_verified';x.outcome.receipt={receiver:'r',witness:'r',reference:'receipt'};},/external provider verifier/));
test('missing independent receipt cannot certify acceptance',()=>rejects(x=>{x.outcome.receiverStatus='independently_verified';},/external provider verifier/));
test('new features return to Public → Science demand lane',()=>{const x=clone();x.kind='new_feature';const r=admit(x);assert.equal(r.route,'public-to-science');assert.equal(r.engineeringSpecificationAuthorized,false);});
test('engineering spec from customer claim is rejected',()=>rejects(x=>{x.engineeringSpec={change:'alter newsroom'};},/downstream effects/));
test('no automatic publication',()=>rejects(x=>{x.publicationAuthorization=true;},/downstream effects/));
test('restricted evidence and private report details not projected',()=>{
  const x=clone();x.rights.visibility='restricted';x.observations[0].detail='sensitive report';
  const projection=project(x);const text=JSON.stringify(projection);
  assert.ok(!text.includes('sensitive report'));assert.ok(!text.includes('koios.news/posts'));assert.ok(!text.includes('causeway-services'));
});
test('public projection exposes only readback URLs, never internal issue/sensor records',()=>{
  const p=project(clone());const text=JSON.stringify(p);
  assert.ok(text.includes('koios.news/posts/'));assert.ok(!text.includes('github.com/causeway-services/koios-news/issues/4'));
});
test('invalid outcome fails closed',()=>rejects(x=>x.outcome.kind='customer_accepted',/service outcome/));
test('bad status fails closed',()=>rejects(x=>x.observations[0].status='verified',/invalid observation/));
test('no independent observer verifier refuses observational promotion',()=>{assert.throws(()=>admitPublicFeedback(clone()),/independent authenticated readback/);});
test('true must be literal; an object is not a provider receipt',()=>{assert.throws(()=>admitPublicFeedback(clone(),{verifyObservation:()=>({ok:true})}),/independent authenticated readback/);});
test('reported evidence can be admitted without readback but does not become observed',()=>{
  const x=clone();x.observations=x.observations.filter(o=>o.status==='reported');
  const r=admitPublicFeedback(x);assert.ok(r.statuses.every(o=>o.status==='reported'));assert.equal(r.customerAcceptance,'unverified');
});
test('contested observation requires no fictitious external readback',()=>{
  const x=clone();x.observations=x.observations.filter(o=>o.status==='reported');x.observations[0].status='contested';assert.equal(admitPublicFeedback(x).statuses[0].status,'contested');
});
test('report falsely relabeled as observed is rejected even with friendly verifier',()=>{
  const x=clone();x.observations[2].status='observed';assert.throws(()=>admitPublicFeedback(x,{verifyObservation:()=>true}),/reported evidence/);
});
test('observational verifier rejection or throw is fail closed',()=>{
  assert.throws(()=>admitPublicFeedback(clone(),{verifyObservation:()=>false}),/independent authenticated readback/);
  assert.throws(()=>admitPublicFeedback(clone(),{verifyObservation:()=>{throw new Error('backend down')}}),/independent authenticated readback/);
});
test('unverified reported public URLs are excluded from public projection',()=>{
  const x=clone();x.observations=x.observations.filter(o=>o.status==='reported');x.observations[0].evidence.push({method:'public-readback',url:'https://example.org/uncorroborated',observer:'self'});assert.equal(publicProjection(x).observations[0].publicEvidence.length,0);
});
test('URL fragment is not suitable for public evidence projection',()=>{rejects(x=>x.observations[0].evidence[0].url='https://koios.news/posts/ok/#private',/evidence provenance/);});
test('new feature pressure routes through canonical science demand',()=>{const x=clone();x.kind='new_feature';assert.equal(admit(x).route,'public-to-science');});
test('public projection verifies each direct observation exactly once',()=>{
  let count=0;const p=publicProjection(clone(),{verifyObservation:()=>{count++;return true}});assert.equal(count,2);assert.equal(p.observations.length,4);
});
