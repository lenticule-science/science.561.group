/** Recompute the article's stated two-tailed binomial tests from its printed
 * cell counts. This is a publication-arithmetic check, NOT trial-level data,
 * cluster-aware analysis, multiplicity correction, or mechanism inference.
 */
const logFactorial=[0];
function logFact(n){for(let j=logFactorial.length;j<=n;j++)logFactorial.push(logFactorial[j-1]+Math.log(j));return logFactorial[n]}
function logadd(a,b){if(a===-Infinity)return b;const x=Math.max(a,b);return x+Math.log1p(Math.exp(Math.min(a,b)-x))}
export function exactTwoSidedHalfBinomial(success,n){
 if(!Number.isSafeInteger(success)||!Number.isSafeInteger(n)||n<1||n>10000||success<0||success>n)
  throw new TypeError('success and n must be valid integer binomial counts');
 const k=Math.min(success,n-success),ln2=Math.log(2),nf=logFact(n);
 let logp=-Infinity;
 for(let j=0;j<=k;j++)logp=logadd(logp,nf-logFact(j)-logFact(n-j)-n*ln2);
 return Math.min(1,2*Math.exp(logp));
}
/** Each case has success/n from Table 1 and a printed p-value. p<.001
 * readings are censored and can only be tested for consistency with bound.
 * Numeric p-values are checked to the printed three decimals.
 */
export function auditPrintedPValues(cases){
 if(!Array.isArray(cases)||!cases.length)throw new TypeError('nonempty hypothesis cases required');
 const ids=new Set();
 const rows=cases.map(c=>{
  if(typeof c.id!=='string'||!c.id||ids.has(c.id))throw new TypeError('duplicate or absent p-value test ID');
  ids.add(c.id);
  const exactP=exactTwoSidedHalfBinomial(c.alternate,c.decisive);
  let consistent;
  if(typeof c.printedP==='string'&&/^<0\.001$/.test(c.printedP))consistent=exactP<0.001;
  else if(typeof c.printedP==='number'&&Number.isFinite(c.printedP)&&c.printedP>=0&&c.printedP<=1)
    consistent=Math.abs(exactP-c.printedP)<=0.000501;
  else throw new TypeError('invalid printed p-value');
  return {id:c.id,alternate:c.alternate,decisive:c.decisive,printedP:c.printedP,
    exactTwoSidedBinomialP:exactP,consistentWithClaimedTest:consistent,
    disposition:consistent?'NUMERICALLY_CONSISTENT':'FAILED_PRINTED_P_RECONCILIATION'};
 });
 return {assay:'conditional binomial H0=0.5; exact two-sided unadjusted',status:rows.every(r=>r.consistentWithClaimedTest)?'CONSISTENT':'FAILED_P_RECONCILIATION',rows};
}

/** Join published Table 1 counts and printed p-values by their condition IDs,
 * not their presentation order. The DOI/workRef are self-declared corpus
 * provenance guards, NOT authentication of the publisher or trial data.
 */
export function buildPublishedBinomialCases(countTable,printedTable){
 if(typeof countTable?.workRef!=='string'||!countTable.workRef||printedTable?.workRef!==countTable.workRef)
  throw new TypeError('publication workRef mismatch');
 if(typeof countTable.source?.doi!=='string'||!countTable.source.doi||
   typeof printedTable.source?.doi!=='string'||printedTable.source.doi!==countTable.source.doi)
  throw new TypeError('publication DOI mismatch');
 if(countTable.source.table!=='Table 1'||printedTable.source.table!=='Table 1')
  throw new TypeError('both inputs must describe Table 1');
 if(!Array.isArray(countTable.conditions)||countTable.conditions.length===0||
    !Array.isArray(printedTable.rows)||printedTable.rows.length!==countTable.conditions.length)
  throw new TypeError('one published p-value row per Table 1 condition required');
 const byId=new Map();
 for(const row of printedTable.rows){
  if(typeof row?.id!=='string'||!row.id||byId.has(row.id))
   throw new TypeError('duplicate or missing published p-value condition ID');
  byId.set(row.id,row);
 }
 const seen=new Set();
 return countTable.conditions.flatMap(r=>{
  if(typeof r?.id!=='string'||!r.id||seen.has(r.id))
    throw new TypeError('duplicate or missing count condition ID');
  seen.add(r.id);
  const printed=byId.get(r.id);
  if(!printed)throw new TypeError('unknown or missing published p-value condition ID: '+r.id);
  const right=r.forcedRight?.right,left=r.forcedRight?.left,
        nextRight=r.forcedLeft?.right,nextLeft=r.forcedLeft?.left;
  return [
   {id:r.id+':all',alternate:r.alternate,decisive:r.decisive,printedP:printed.all},
   {id:r.id+':forcedRight',alternate:left,decisive:right+left,printedP:printed.forcedRight},
   {id:r.id+':forcedLeft',alternate:nextRight,decisive:nextRight+nextLeft,printedP:printed.forcedLeft}
  ];
 });
}
/** FDR correction for an explicitly specified scientific hypothesis family.
 * Does not decide the family or infer physical mechanism.
 */
export function benjaminiHochberg(pValues){
 if(!Array.isArray(pValues)||pValues.length===0)throw new TypeError('nonempty probability family required');
 const n=pValues.length;
 for(const p of pValues)if(typeof p!=='number'||!Number.isFinite(p)||p<0||p>1)
  throw new TypeError('probabilities must be finite numbers between zero and one');
 const ordered=pValues.map((p,i)=>({p,i})).sort((a,b)=>a.p-b.p||a.i-b.i);
 const q=Array(n);let ceiling=1;
 for(let k=n-1;k>=0;k--){
  ceiling=Math.min(ceiling,ordered[k].p*n/(k+1));
  q[ordered[k].i]=ceiling;
 }
 return q;
}
