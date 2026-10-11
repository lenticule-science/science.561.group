import test from 'node:test';
import assert from 'node:assert/strict';
import {admitPublicFeedback, publicProjection} from './evidence-assay.mjs';
const sample = () => ({
  schema:'public-science-feedback/v0.3',
  workRef:'561-group/bare-cedar-fog#260',
  publicWorkRef:'causeway-services/koios-news#4',
  sourcePrincipal:'causeway-services/koios-news',
  source:{repository:'causeway-services/koios-news',path:'policy/law/editorial-product-commissions.json',blobSha:'5ba557090f92e12c50f732170a7a18af28446fd5'},
  kind:'challenge',
  hypothesis:{claim:'Context may improve reader comprehension',falsifier:'No meaningful improvement under a controlled comparison',negativeControl:'Length-matched irrelevant padding'},
  scienceDecision:{state:'unadjudicated',ref:null},
  outcome:{kind:'reported_service',detail:'Synthetic regression observation, not field evidence',receiverStatus:'unverified'},
  rights:{visibility:'public'},
  observations:[{id:'synthetic-public-observation',status:'observed',at:'2026-10-10T20:00:00Z',detail:'Synthetic fixture only',evidence:[{method:'public-readback',url:'https://example.org/example',observer:'untrusted-row'}]}]
});
test('self-declared observed evidence cannot be admitted without an independent readback',()=>{assert.throws(()=>admitPublicFeedback(sample()),/independent authenticated readback/);});
test('provider verification must return literal true',()=>{assert.throws(()=>admitPublicFeedback(sample(),{verifyObservation:()=>({ok:true})}),/independent authenticated readback/);});
test('trusted test verifier preserves provenance but is not an actual provider receipt',()=>{
  const result=admitPublicFeedback(sample(),{verifyObservation:()=>true});assert.equal(result.route,'public-to-science-feedback');assert.equal(result.customerAcceptance,'unverified');assert.equal(result.engineeringSpecificationAuthorized,false);
});
test('a new feature re-enters the canonical Public to Science demand route',()=>{
  const row=sample();row.kind='new_feature';row.observations[0].status='reported';row.observations[0].evidence[0].method='customer-report';assert.equal(admitPublicFeedback(row).route,'public-to-science');
});
test('a reported link must not be projected as authenticated public readback',()=>{const row=sample();row.observations[0].status='reported';assert.deepEqual(publicProjection(row).observations[0].publicEvidence,[]);});
