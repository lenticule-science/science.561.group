import assert from 'node:assert/strict';
import {assayVerifiedEffectBindings} from './verified-effect-binding.mjs';
const stages=['discover','scope','payment','delivery','receipt'];
const workRef='causeway-services/public-services-section#17';
const at='2026-10-11T06:00:00Z';
function manifest(effectRef){return {manifestId:'m:'+effectRef,effectRef,workRef,sourceRef:'public-contract',components:[{componentId:'web',revision:effectRef+'/web'},{componentId:'settlement',revision:effectRef+'/settle'}]};}
function event(stage,effectRef,idx){const componentId=['payment','delivery','receipt'].includes(stage)?'settlement':'web';return {evidenceId:'e:'+idx+':'+stage,workRef,manifestId:'m:'+effectRef,effectRef,componentId,revision:effectRef+'/'+(componentId==='web'?'web':'settle'),sourceRef:'provider:'+stage,status:'observed',verdict:'pass',stage,observedAt:at};}
const cases=[];
for(let i=0;i<25;i++) {
 const A='effect-'+i;
 const proper=stages.map(s=>event(s,A,i));
 cases.push({kind:'valid-independent-component-join',truth:true,manifests:[manifest(A)],events:proper,verifiers:true});
 cases.push({kind:'spliced-effects',truth:false,manifests:[manifest(A),manifest(A+'b')],events:stages.map((s,j)=>event(s,j<2?A:A+'b',i+100)),verifiers:true});
 cases.push({kind:'wrong-component-revision',truth:false,manifests:[manifest(A)],events:proper.map((e,j)=>j===3?{...e,revision:'other/revision'}:e),verifiers:true});
 cases.push({kind:'reported-not-observed',truth:false,manifests:[manifest(A)],events:proper.map((e,j)=>j===1?{...e,status:'reported'}:e),verifiers:true});
 cases.push({kind:'missing-independent-verifier',truth:false,manifests:[manifest(A)],events:proper,verifiers:false});
 cases.push({kind:'missing-stage',truth:false,manifests:[manifest(A)],events:proper.slice(0,4),verifiers:true});
}
const tally={};let naiveFP=0, strictFP=0, strictTP=0, naiveTP=0;
for(const c of cases){
 const naive=stages.every(s=>c.events.some(e=>e.stage===s&&e.verdict==='pass'));
 const options=c.verifiers?{verifyManifest:()=>true,verifyEvidence:()=>true}:{};
 const r=assayVerifiedEffectBindings({workRef,requiredStages:stages,manifests:c.manifests,events:c.events,asOf:'2026-10-11T07:00:00Z'},options);
 const strict=r.conditionallyCompleteEffects.length>0;
 assert.equal(strict,c.truth,'strict negative/positive control '+c.kind);
 tally[c.kind]??={n:0,naivePositive:0,strictPositive:0};
 tally[c.kind].n++;tally[c.kind].naivePositive+=Number(naive);tally[c.kind].strictPositive+=Number(strict);
 if(!c.truth){naiveFP+=Number(naive);strictFP+=Number(strict);}else{naiveTP+=Number(naive);strictTP+=Number(strict);}
}
console.log(JSON.stringify({scope:'synthetic methodological controls, not empirical service measurement',cases:cases.length,naiveFalsePositives:naiveFP,strictConditionalFalsePositives:strictFP,naiveTruePositives:naiveTP,strictConditionalTruePositives:strictTP,byCase:tally},null,2));
