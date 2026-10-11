import test from 'node:test';
import assert from 'node:assert/strict';
import {assayChoiceIncentivePair as assay} from './choice-incentive-invariance.mjs';
const base=()=>({
 caseRef:'anonymous-vignette-1',evidencePin:'signed-public-facts-v1',customerFactsPin:'budget-public-v1',
 options:[
  {id:'public',optionClass:'free',evidenceRef:'ref-free',suitabilityRank:1},
  {id:'paid',optionClass:'commercial',evidenceRef:'ref-paid',suitabilityRank:2}],
 defaultOptionId:'public',visibleOptionIds:['public','paid'],payouts:{public:0,paid:0}
});
const copy=x=>structuredClone(x);
const trusted={verifyFrozenEvidence:()=>true};
test('commissions changing alone do not force a changed recommendation',()=>{
 const b=base(),p=copy(b);p.payouts.paid=40;
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).status,'invariant');
});
test('swapped source ranks remain a violation even if every local rank check passes',()=>{
 const b=base(),p=copy(b);p.payouts.paid=40;
 p.options[0].suitabilityRank=2;p.options[1].suitabilityRank=1;p.defaultOptionId='paid';
 const r=assay({baseline:b,perturbed:p,...trusted});
 assert.equal(r.status,'violated');
 assert.deepEqual(r.changed,['default-recommendation','suitability-ranks']);
 assert.ok(b.options.find(x=>x.id===b.defaultOptionId).suitabilityRank===1);
 assert.ok(p.options.find(x=>x.id===p.defaultOptionId).suitabilityRank===1);
});
test('suppressing otherwise eligible options under payout perturbation is detected',()=>{
 const b=base(),p=copy(b);p.payouts.paid=30;p.visibleOptionIds=['public'];
 assert.deepEqual(assay({baseline:b,perturbed:p,...trusted}).changed,['visible-option-set']);
});
test('changed consumer price or suitability record is not misdiagnosed as incentive bias',()=>{
 const b=base(),p=copy(b);p.payouts.paid=30;p.customerFactsPin='consumer-price-changed';
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).reason,'changed-consumer-relevant-evidence');
});
test('unverified evidence never supports invariant or violated findings',()=>{
 const b=base(),p=copy(b);p.payouts.paid=30;
 assert.equal(assay({baseline:b,perturbed:p}).status,'unassessable');
 assert.equal(assay({baseline:b,perturbed:p,verifyFrozenEvidence:()=>false}).status,'unassessable');
 assert.equal(assay({baseline:b,perturbed:p,verifyFrozenEvidence:()=>{throw Error('bad signature')}}).status,'unassessable');
});
test('zero contrast and crossed case identities are unassessable',()=>{
 const b=base(),p=copy(b);
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).reason,'no-remuneration-perturbation');
 p.payouts.paid=30;p.caseRef='other';
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).reason,'different-case');
});
test('changed option class/source evidence is not a payout-only comparison',()=>{
 const b=base(),p=copy(b);p.payouts.paid=30;p.options[1].evidenceRef='new-evidence';
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).reason,'changed-consumer-relevant-evidence');
});
test('malformed or duplicate option/payout identities fail closed',()=>{
 const b=base(),p=copy(b);p.payouts.paid=20;
 p.options[1].id='public';
 assert.throws(()=>assay({baseline:b,perturbed:p,...trusted}),/duplicated option/);
 const p2=copy(b);p2.payouts.paid=Infinity;
 assert.throws(()=>assay({baseline:b,perturbed:p2,...trusted}),/payout vector/);
});
test('permutation of presented option order does not change assessment',()=>{
 const b=base(),p=copy(b);p.options.reverse();p.payouts.paid=30;
 assert.equal(assay({baseline:b,perturbed:p,...trusted}).status,'invariant');
});

test('remuneration-only presentation-order drift is not called invariant',()=>{
 const b=base(),p=copy(b);p.payouts.paid=30;p.visibleOptionIds.reverse();
 assert.deepEqual(assay({baseline:b,perturbed:p,...trusted}).changed,['visible-option-order']);
});
