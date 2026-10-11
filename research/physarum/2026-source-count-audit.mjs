/** Science #27. Table 1 count transcription, not raw trial-level data.
 * Kuttner & Freiberg, Protist 181 (2026) 126156, DOI 10.1016/j.protis.2026.126156.
 * Source image and underlying dataset still require independent verification.
 */
export const TABLE_1 = Object.freeze([
  {condition:'3mm',tested:390,undecided:174,decisive:216,alternating:152,nonAlternating:64,printedUndecidedPct:30.85},
  {condition:'7mm',tested:296,undecided:48,decisive:248,alternating:136,nonAlternating:112,printedUndecidedPct:13.95},
  {condition:'14mm',tested:345,undecided:65,decisive:280,alternating:146,nonAlternating:134,printedUndecidedPct:15.85},
  {condition:'double7mm',tested:243,undecided:29,decisive:214,alternating:103,nonAlternating:111,printedUndecidedPct:10.66}
]);
export function auditCounts(rows=TABLE_1){
  if(!Array.isArray(rows)||!rows.length)throw new TypeError('nonempty counts required');
  const seen=new Set();
  const audited=rows.map(r=>{
    if(typeof r.condition!=='string'||!r.condition||seen.has(r.condition))throw new Error('duplicate or absent condition');
    seen.add(r.condition);
    for(const key of ['tested','undecided','decisive','alternating','nonAlternating'])
      if(!Number.isSafeInteger(r[key])||r[key]<0)throw new TypeError(key+' must be a count');
    if(!r.tested||!r.decisive||r.tested!==r.undecided+r.decisive||r.decisive!==r.alternating+r.nonAlternating)
      throw new Error('inconsistent outcome accounting for '+r.condition);
    const testedPct=100*r.undecided/r.tested,extraPct=100*r.undecided/(r.tested+r.undecided);
    return {...r,undecidedOfTestedPct:testedPct,alternatingOfDecisivePct:100*r.alternating/r.decisive,
      alternatingOfAllTestedPct:100*r.alternating/r.tested,
      printedPctMatchesTested:Math.abs(testedPct-r.printedUndecidedPct)<0.011,
      printedPctMatchesExtraDenominator:Math.abs(extraPct-r.printedUndecidedPct)<0.011};
  });
  return {totalTested:audited.reduce((s,r)=>s+r.tested,0),
    totalUndecided:audited.reduce((s,r)=>s+r.undecided,0),
    rows:audited,interpretation:'conditional alternation among decisive trials is not an all-trial endpoint; printed undecided percentages require source/data reconciliation',
    status:'PUBLISHED_AGGREGATE_ARITHMETIC_ONLY'};
}
