import { assayChoiceIncentivePair as before } from './github-committed-candidate.mjs';
import { assayChoiceIncentivePair as after } from './choice-incentive-invariance.mjs';
import fs from 'node:fs';
const baseline={
 caseRef:'synthetic-business-1',evidencePin:'frozen-claim-set',customerFactsPin:'buyer-context',
 defaultOptionId:'free',visibleOptionIds:['free','paid'],
 options:[
  {id:'free',optionClass:'free',evidenceRef:'e-free',suitabilityRank:1,customerPriceUSD:0,reason:'free alternative'},
  {id:'paid',optionClass:'commercial',evidenceRef:'e-paid',suitabilityRank:2,customerPriceUSD:50,reason:'optional paid alternative'}
 ],payouts:{free:0,paid:5}
};
const mutations={
 'payout-only': x=>{},
 'display-order-drift': x=>x.visibleOptionIds.reverse(),
 'changed-customer-price': x=>x.options[1].customerPriceUSD=80,
 'changed-offer-rationale': x=>x.options[1].reason='different factual basis',
 'changed-suitability-rank': x=>{x.options[0].suitabilityRank=2;x.options[1].suitabilityRank=1;}
};
const report=[];
for (const [id,mutate] of Object.entries(mutations)) {
 const perturbed=structuredClone(baseline);
 perturbed.payouts.paid=80;
 mutate(perturbed);
 const args={baseline,perturbed,verifyFrozenEvidence:()=>true};
 const a=before(args),b=after(args);
 report.push({case:id,committed:{status:a.status,reason:a.reason,changed:a.changed},corrected:{status:b.status,reason:b.reason,changed:b.changed}});
}
fs.writeFileSync('committed-vs-corrected.json',JSON.stringify(report,null,2)+'\n');
for (const x of report) console.log(`${x.case}: committed=${x.committed.status} / corrected=${x.corrected.status}`);
if(report.find(x=>x.case==='display-order-drift').corrected.changed[0]!=='visible-option-order')process.exitCode=1;
if(report.find(x=>x.case==='changed-customer-price').corrected.status!=='unassessable')process.exitCode=1;
