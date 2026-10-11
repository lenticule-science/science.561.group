import {assayChoiceIncentivePair as current} from './github-committed-candidate.mjs';
import {assayChoiceIncentivePair as corrected} from './choice-incentive-invariance.mjs';
const b={caseRef:'synthetic-1',evidencePin:'frozen-public-evidence',customerFactsPin:'same-price',defaultOptionId:'free',
 options:[{id:'free',optionClass:'free',evidenceRef:'frozen-a',suitabilityRank:1},{id:'paid',optionClass:'commercial',evidenceRef:'frozen-b',suitabilityRank:2}],
 visibleOptionIds:['free','paid'],payouts:{free:0,paid:0}};
const p=structuredClone(b); p.payouts.paid=10;p.visibleOptionIds.reverse();
const args={baseline:b,perturbed:p,verifyFrozenEvidence:()=>true};
console.log(JSON.stringify({githubCommitted:current(args),locallyCorrected:corrected(args)},null,2));
