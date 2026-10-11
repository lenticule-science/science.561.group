/**
 * Finite-model counterexample to stage-union evidence closure.
 * For k effects and n required stages, a relation is a k*n Boolean matrix.
 * Naive completeness is (forall stage)(exists effect) pass(effect,stage).
 * Coherent completeness is (exists effect)(forall stage) pass(effect,stage).
 * Every coherent relation is naive-complete, but not conversely.
 * Counts concern uniform combinatorial models, not observed error rates.
 */
export function countEffectSplices(k,n){
 if(!Number.isSafeInteger(k)||!Number.isSafeInteger(n)||k<1||n<1||k>32||n>32) throw new TypeError('bounded positive matrix dimensions required');
 const K=BigInt(k),N=BigInt(n);
 const naive=((1n<<K)-1n)**N;
 const coherent=(1n<<(K*N))-((1n<<N)-1n)**K;
 return {naive,coherent,naiveOnly:naive-coherent};
}
export function classifyCoverage(rows){
 if(!Array.isArray(rows)||!rows.length||!rows.every(r=>Array.isArray(r)&&r.length===rows[0].length&&r.every(v=>typeof v==='boolean'))||!rows[0].length) throw new TypeError('rectangular Boolean matrix required');
 const coherent=rows.some(row=>row.every(Boolean));
 const naive=rows[0].every((_,j)=>rows.some(row=>row[j]));
 return {naive,coherent,spliced:naive&&!coherent};
}
