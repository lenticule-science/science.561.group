import test from 'node:test';
import assert from 'node:assert/strict';
import {auditHearingOfferPresentation} from './causeway-hearing-offer-public-gate.mjs';
import {assayChoiceIncentivePair} from './choice-incentive-invariance.mjs';
function packet(rankA,rankB,startHere){
 return {
  upstream:{routeId:'frozen-1',assuranceReceipt:'demo-upstream-not-authenticated',reviewAuthority:'demo',reviewedAt:'2026-10-11',routeClass:'shopping-eligible',eligibleOptions:[
   {id:'A',class:'free',suitabilityRank:rankA,reason:'test',evidenceRef:'fixed-source-A'},
   {id:'B',class:'commercial',suitabilityRank:rankB,reason:'test',evidenceRef:'fixed-source-B'}]},
  view:{startHere,alternatives:startHere==='A'?['B']:['A'],freeRoute:'A',featured:{id:'B',label:'Paid featured option',disclosure:'Causeway may earn a referral fee.',selectionReceipt:'demo-selection',merchantRelationshipRef:'demo-merchant'}},
  receiving:{remedyRoute:'demo',receiverTestReceipt:'demo',accessibilityTestReceipt:'demo',publicationAuthorityReceipt:'demo'},
  telemetry:[]
 };
}
const a=packet(1,2,'A'),b=packet(2,1,'B');
test('two contradictory upstream rank assignments both pass the exact Causeway presentation gate',()=>{
 assert.deepEqual(auditHearingOfferPresentation(a),{ok:true,failures:[]});
 assert.deepEqual(auditHearingOfferPresentation(b),{ok:true,failures:[]});
});
test('paired comparison detects rank/default change given hypothetical independently authenticated frozen evidence',()=>{
 const toScience=(p,payout)=>({
  caseRef:'demo',evidencePin:'signed-unchanged-demo',customerFactsPin:'fixed-customer-price',
  defaultOptionId:p.view.startHere,visibleOptionIds:[p.view.startHere,...p.view.alternatives],
  options:p.upstream.eligibleOptions.map(o=>({id:o.id,optionClass:o.class,evidenceRef:o.evidenceRef,suitabilityRank:o.suitabilityRank})),
  payouts:{A:0,B:payout}
 });
 const r=assayChoiceIncentivePair({baseline:toScience(a,0),perturbed:toScience(b,20),verifyFrozenEvidence:()=>true});
 assert.equal(r.status,'violated');
 assert.deepEqual(r.changed,['default-recommendation','suitability-ranks','visible-option-order']);
});
test('with no independent verifier, demonstration remains unassessable',()=>{
 const toScience=(p,payout)=>({caseRef:'demo',evidencePin:'unverified',customerFactsPin:'same',defaultOptionId:p.view.startHere,visibleOptionIds:['A','B'],
  options:p.upstream.eligibleOptions.map(o=>({id:o.id,optionClass:o.class,evidenceRef:o.evidenceRef,suitabilityRank:o.suitabilityRank})),payouts:{A:0,B:payout}});
 assert.equal(assayChoiceIncentivePair({baseline:toScience(a,0),perturbed:toScience(b,20)}).status,'unassessable');
});
