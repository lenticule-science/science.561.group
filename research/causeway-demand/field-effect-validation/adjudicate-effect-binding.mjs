/**
 * An assay of a candidate service-effect classifier against independently
 * adjudicated outcomes. Analysis is conditional on a trusted external witness.
 * No user identifiers, claims of production calibration, or auto-acceptance.
 */
const TRUTH=new Set(['complete','incomplete','indeterminate']);
const PRED=new Set(['complete','incomplete','abstain']);
const valid=x=>typeof x==='string'&&x.trim().length>0;
const safeVerify=(callback,row)=>{
  if(typeof callback!=='function')return false;
  try{return callback(row)===true;}catch{return false;}
};
// Wilson score interval, z=1.95996 for nominal 95%; meaningful only as
// binomial descriptive interval conditional on sampling/label assumptions.
export function wilson95(numer,denom){
  if(!Number.isSafeInteger(numer)||!Number.isSafeInteger(denom)||numer<0||denom<0||numer>denom)throw new TypeError('invalid count');
  if(!denom)return null;
  const z=1.959963984540054, z2=z*z, p=numer/denom, d=1+z2/denom;
  const center=(p+z2/(2*denom))/d;
  const half=(z/d)*Math.sqrt(p*(1-p)/denom+z2/(4*denom*denom));
  return {rate:p,lower:Math.max(0,center-half),upper:Math.min(1,center+half),numerator:numer,denominator:denom};
}
export function adjudicateEffects(rows,{verifyAdjudication}={}){
  if(!Array.isArray(rows)||rows.length>100000)throw new TypeError('invalid rows');
  const seen=new Set();
  const tally={trueComplete:0,trueIncomplete:0,falseComplete:0,falseIncomplete:0,truthUnknown:0,abstained:0,untrusted:0,concordant:0,qualified:0};
  const slices=new Map();
  for(const row of rows){
    if(!row||!valid(row.workRef)||!valid(row.effectRef)||!valid(row.sourceRevision)||!valid(row.reviewerRef)||!valid(row.publisherRef)||!valid(row.service)||!valid(row.providerRef)||!TRUTH.has(row.truth)||!PRED.has(row.prediction))throw new TypeError('invalid adjudication');
    const key=`${row.workRef}\u0000${row.effectRef}`;
    if(seen.has(key))throw new TypeError('duplicate effect identity');seen.add(key);
    const sliceKey=`${row.service} | ${row.providerRef}`;
    const b=slices.get(sliceKey)??{service:row.service,providerRef:row.providerRef,complete:0,incomplete:0,falseComplete:0,falseIncomplete:0,abstained:0,unknown:0};
    slices.set(sliceKey,b);
    if(row.truth==='indeterminate'){tally.truthUnknown++;b.unknown++;continue;}
    if(row.reviewerRef===row.publisherRef||!safeVerify(verifyAdjudication,row)){tally.untrusted++;continue;}
    tally.qualified++;
    if(row.prediction==='abstain'){tally.abstained++;b.abstained++;continue;}
    if(row.truth==='complete'){
      b.complete++;if(row.prediction==='complete'){tally.trueComplete++;tally.concordant++;}else{tally.falseIncomplete++;b.falseIncomplete++;}
    }else{
      b.incomplete++;if(row.prediction==='incomplete'){tally.trueIncomplete++;tally.concordant++;}else{tally.falseComplete++;b.falseComplete++;}
    }
  }
  const sc=Object.create(null);for(const [service,b] of [...slices].sort(([x],[y])=>x.localeCompare(y))){sc[service]={...b,falseCompleteRate:wilson95(b.falseComplete,b.incomplete),falseIncompleteRate:wilson95(b.falseIncomplete,b.complete)};}
  const completeBase=tally.trueComplete+tally.falseIncomplete;
  const incompleteBase=tally.trueIncomplete+tally.falseComplete;
  return {schema:'lenticule/field-effect-adjudication/v1',counts:tally,
    falseCompleteRate:wilson95(tally.falseComplete,incompleteBase),
    falseIncompleteRate:wilson95(tally.falseIncomplete,completeBase),
    accuracy:tally.concordant/(tally.concordant+tally.falseComplete+tally.falseIncomplete)||null,
    byServiceProvider:sc,
    limitations:'Conditional on independently authenticated gold labels and sampled effect population. Undecidable/untrusted/abstained cases are not evidence of accurate classification. Wilson intervals assume independent Bernoulli sampling and are descriptive, not population guarantees. No customer acceptance inferred.'};
}
