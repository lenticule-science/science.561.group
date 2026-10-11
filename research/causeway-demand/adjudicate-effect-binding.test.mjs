import test from 'node:test';
import assert from 'node:assert/strict';
import {adjudicateEffects,wilson95} from './adjudicate-effect-binding.mjs';
const base={workRef:'public/causeway',sourceRevision:'r1',service:'publishing',providerRef:'publisher',reviewerRef:'other-receiver',publisherRef:'publisher'};
const r=(effectRef,truth,prediction,extra={})=>({...base,effectRef,truth,prediction,...extra});
const verified={verifyAdjudication:()=>true};

test('complete classifier failure is zero accuracy, not unknown',()=>{
 const v=adjudicateEffects([r('a','complete','incomplete')],verified);
 assert.equal(v.accuracy,0);
 assert.equal(v.classifiedCoverage,1);
 assert.equal(v.counts.falseIncomplete,1);
});
test('abstaining never counts as successful prediction',()=>{
 const v=adjudicateEffects([r('a','complete','abstain')],verified);
 assert.equal(v.accuracy,null);
 assert.equal(v.classifiedCoverage,0);
 assert.equal(v.counts.abstained,1);
});
test('stratum identifiers cannot collide through joined delimiter',()=>{
 const v=adjudicateEffects([
  r('a','incomplete','complete',{service:'s | p',providerRef:'x'}),
  r('b','complete','complete',{service:'s',providerRef:'p | x'})
 ],verified);
 assert.equal(Object.keys(v.byServiceProvider).length,2);
 assert.equal(v.byServiceProvider[JSON.stringify(['s | p','x'])].falseComplete,1);
});
test('independent receiver and verifier are required',()=>{
 const row=r('a','complete','complete',{reviewerRef:'publisher'});
 assert.equal(adjudicateEffects([row],verified).counts.untrusted,1);
 assert.equal(adjudicateEffects([r('b','complete','complete')]).counts.untrusted,1);
});
test('effects cannot repeat within one work reference',()=>{
 assert.throws(()=>adjudicateEffects([
  r('a','complete','complete'),r('a','incomplete','complete')
 ],verified),/duplicate/);
});
test('work reference and effect identities use injective tuple keys',()=>{
 const v=adjudicateEffects([
  r('b\u0000c','complete','complete',{workRef:'a'}),
  r('c','incomplete','incomplete',{workRef:'a\u0000b'})
 ],verified);
 assert.equal(v.counts.qualified,2);
});
test('Wilson interval handles zero denominators',()=>{
 assert.equal(wilson95(0,0),null);
 assert.ok(wilson95(0,1).upper>.7);
});
test('confusion errors have separate conditional denominators',()=>{
 const v=adjudicateEffects([r('a','complete','incomplete'),r('b','incomplete','complete')],verified);
 assert.equal(v.falseCompleteRate.rate,1);
 assert.equal(v.falseIncompleteRate.rate,1);
 assert.equal(v.accuracy,0);
});
test('adjudication is permutation invariant',()=>{
 const rows=[r('a','complete','complete'),r('b','incomplete','complete')];
 assert.deepEqual(adjudicateEffects(rows,verified),adjudicateEffects([...rows].reverse(),verified));
});
