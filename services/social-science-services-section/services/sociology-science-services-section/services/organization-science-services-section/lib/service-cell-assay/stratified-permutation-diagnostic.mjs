/**
 * Science-method diagnostic for fully observed, binary outcomes. This is a
 * synthetic null calibration, not a causal estimator or deployed 561 assay.
 * Conditional exchangeability within pre-treatment strata is a hypothetical
 * null whose relevance to field data must be assessed independently.
 */
import { classifyReceiving } from './service-cell-assay.mjs';
const choose = (n,k) => {
  if (k < 0 || k > n) return 0;
  let value = 1;
  for (let i=1;i<=Math.min(k,n-k);i++) value=value*(n-i+1)/i;
  return value;
};
export function stratifiedPermutationDiagnostic(rows,{maxStates=100000,horizonDays=7}={}) {
  if (!Array.isArray(rows) || !rows.length) throw new TypeError('nonempty observations required');
  const ids=new Set(), groups=new Map();
  for (const row of rows) {
    if (ids.has(row.workRef)) throw new Error('duplicate workRef');
    ids.add(row.workRef);
    const status=classifyReceiving(row,{horizonDays});
    if (status==='unresolved') throw new Error('censored observations have no binary randomization assay');
    if (!['cell','central'].includes(row.arm)) throw new TypeError('invalid arm');
    const group=groups.get(row.stratum)??{cell:[],central:[]};
    group[row.arm].push(status==='accepted' ? 1:0);
    groups.set(row.stratum,group);
  }
  if ([...groups.values()].some(g=>!g.cell.length||!g.central.length))
    return {claimStatus:'NO_COMMON_SUPPORT',pRight:null};
  const n=rows.length;
  let observed=0,dist=[{contrast:0,p:1}];
  for (const [,g] of groups) {
    const nCell=g.cell.length,nCentral=g.central.length,nStratum=nCell+nCentral;
    const successesCell=g.cell.reduce((a,b)=>a+b,0);
    const successesCentral=g.central.reduce((a,b)=>a+b,0);
    const totalSuccess=successesCell+successesCentral;
    const weight=nStratum/n;
    observed+=weight*(successesCell/nCell-successesCentral/nCentral);
    const local=[];
    for (let x=Math.max(0,totalSuccess-nCentral);x<=Math.min(nCell,totalSuccess);x++) {
      const count=choose(nCell,x)*choose(nCentral,totalSuccess-x);
      const probability=count/choose(nStratum,totalSuccess);
      local.push({contrast:weight*(x/nCell-(totalSuccess-x)/nCentral),p:probability});
    }
    if (dist.length*local.length>maxStates) throw new RangeError('state limit');
    dist=dist.flatMap(a=>local.map(b=>({contrast:a.contrast+b.contrast,p:a.p*b.p})));
  }
  const pRight=dist.reduce((sum,outcome)=>sum+(outcome.contrast>=observed-1e-12?outcome.p:0),0);
  return {claimStatus:'SYNTHETIC_NULL_CALIBRATION_ONLY',strata:groups.size,
    observedContrast:observed,pRight,states:dist.length,
    limitation:'Null assumes outcomes exchangeable within strata; not established in field data.'};
}
