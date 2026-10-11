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
