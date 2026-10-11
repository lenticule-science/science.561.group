import test from 'node:test';
import assert from 'node:assert/strict';
import {adjudicateEffects, wilson95} from './adjudicate-effect-binding.mjs';
const row=(id,truth,prediction,extra={})=>({workRef:'causeway-services/koios-news-site#16',effectRef:id,sourceRevision:'revision-1',service:'correction-intake',providerRef:'provider-A',reviewerRef:'independent-reviewer',publisherRef:'koios-publisher',truth,prediction,...extra});
const trusted={verifyAdjudication:()=>true};
test('false completion and false rejection remain distinct; no denominator splicing',()=>{
 const r=adjudicateEffects([row('a','complete','complete'),row('b','incomplete','complete'),row('c','incomplete','incomplete'),row('d','complete','incomplete')],trusted);
 assert.deepEqual(r.counts,{trueComplete:1,trueIncomplete:1,falseComplete:1,falseIncomplete:1,truthUnknown:0,abstained:0,untrusted:0,concordant:2,qualified:4});
 assert.equal(r.falseCompleteRate.rate,0.5);assert.equal(r.falseIncompleteRate.rate,0.5);assert.equal(r.accuracy,0.5);
});
test('unknown truth does not count as false rejection or false completion',()=>{
 const r=adjudicateEffects([row('unknown','indeterminate','complete'),row('one','incomplete','complete')],trusted);
 assert.equal(r.counts.truthUnknown,1);assert.equal(r.falseCompleteRate.denominator,1);
});
test('self-adjudication is untrusted even if callback says yes',()=>{
 const r=adjudicateEffects([row('a','complete','complete',{reviewerRef:'koios-publisher'})],trusted);
 assert.equal(r.counts.untrusted,1);assert.equal(r.falseIncompleteRate,null);
});
test('without independent verifier all known truth labels stay untrusted',()=>{
 const r=adjudicateEffects([row('a','complete','complete')]);assert.equal(r.counts.untrusted,1);assert.equal(r.accuracy,null);
});
test('abstention is separately counted and not a correct verdict',()=>{
 const r=adjudicateEffects([row('a','complete','abstain'),row('b','incomplete','incomplete')],trusted);
 assert.equal(r.counts.abstained,1);assert.equal(r.counts.qualified,2);
 assert.equal(r.accuracy,1);
});
test('duplicate effect refs and invalid rows are rejected',()=>{
 assert.throws(()=>adjudicateEffects([row('a','complete','complete'),row('a','incomplete','complete')],trusted),/duplicate effect/);
 assert.throws(()=>adjudicateEffects([row('x','not-a-gold-label','complete')],trusted),/invalid adjudication/);
});
test('assay is permutation invariant including by-service output',()=>{
 const a=[row('a','complete','complete'),row('b','incomplete','complete'),row('c','incomplete','incomplete',{service:'marketplace'})];
 assert.deepEqual(adjudicateEffects(a,trusted),adjudicateEffects([...a].reverse(),trusted));
});
test('Wilson uncertainty is wide for one all-correct case and shrinks for large sample',()=>{
 const one=wilson95(0,1),n100=wilson95(0,100);
 assert.ok(one.upper>0.7);assert.ok(n100.upper<0.04);
 assert.equal(wilson95(0,0),null);
});
test('verification throws fail closed',()=>{
 const r=adjudicateEffects([row('a','complete','complete')],{verifyAdjudication:()=>{throw Error('provider down')}});
 assert.equal(r.counts.untrusted,1);
});

test('strata are separated by both service and provider, not pooled identities',()=>{
 const a=row('a','incomplete','complete');
 const b=row('b','complete','complete',{providerRef:'provider-B'});
 const r=adjudicateEffects([a,b],trusted);
 assert.equal(Object.keys(r.byServiceProvider).length,2);
 assert.equal(r.byServiceProvider['correction-intake | provider-A'].falseComplete,1);
 assert.equal(r.byServiceProvider['correction-intake | provider-B'].complete,1);
});
test('invalid provider identity fails closed',()=>{
 assert.throws(()=>adjudicateEffects([row('a','complete','complete',{providerRef:''})],trusted),/invalid adjudication/);
});
