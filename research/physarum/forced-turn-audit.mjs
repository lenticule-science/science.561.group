/**
 * Lenticule Science research #27 — arithmetic assay for Kuttner/Freiberg
 * Protist 181 (2026) 126156, Table 1 (DOI 10.1016/j.protis.2026.126156).
 * The input is a transcribed aggregate TABLE, not individual trial data.
 * This establishes no Physarum memory effect and no geometric causal effect.
 */
export const WORK_REF = 'lenticule-science/science-services-section#27';
const integer=(x,name)=>{if(!Number.isSafeInteger(x)||x<0)throw new TypeError(name+' must be a nonnegative integer');return x};
const countKeys=['tested','undecidedBothArms','decisive','alternate','repeat'];
const sides=['right','left'];
const forcedTurnSummary=(decisive,alternating)=>({
  decisive,alternating,
  alternationAmongDecisive:decisive===0?null:alternating/decisive,
  conditionalRateDisposition:decisive===0?'NO_DECISIVE_OBSERVATIONS':'COMPUTED_FROM_DECISIVE_COUNTS'
});
export function auditForcedTurnTable(input) {
  if(input?.workRef!==WORK_REF)throw new TypeError('workRef must identify owning Science requirement');
  if(!Array.isArray(input.conditions)||!input.conditions.length)throw new TypeError('nonempty conditions required');
  const seen=new Set();
  let tested=0,undecided=0,decisive=0;
  const conditions=input.conditions.map(row=>{
    if(typeof row?.id!=='string'||!row.id||seen.has(row.id))throw new TypeError('missing or duplicate maze type');
    seen.add(row.id);
    for(const k of countKeys)integer(row[k],k);
    for(const force of ['forcedRight','forcedLeft'])for(const side of sides)integer(row[force]?.[side],force+'.'+side);
    if(row.tested===0||row.decisive===0||row.tested!==row.decisive+row.undecidedBothArms||row.decisive!==row.alternate+row.repeat)
      throw new Error('inconsistent three-outcome accounting: '+row.id);
    const forcedRightN=row.forcedRight.right+row.forcedRight.left;
    const forcedLeftN=row.forcedLeft.right+row.forcedLeft.left;
    const armAlternate=row.forcedRight.left+row.forcedLeft.right;
    const armRepeat=row.forcedRight.right+row.forcedLeft.left;
    const sourceResidual={decisive:row.decisive-(forcedRightN+forcedLeftN),
      alternate:row.alternate-armAlternate,repeat:row.repeat-armRepeat};
    const sourceArmCountsReconciled=Object.values(sourceResidual).every(x=>x===0);
    if(typeof row.printedUndecidedPercent!=='number'||!Number.isFinite(row.printedUndecidedPercent)||
      row.printedUndecidedPercent<0||row.printedUndecidedPercent>100)throw new TypeError('invalid published percentage');
    const computedUndecided=100*row.undecidedBothArms/row.tested;
    const extraDenominator=100*row.undecidedBothArms/(row.tested+row.undecidedBothArms);
    tested+=row.tested;undecided+=row.undecidedBothArms;decisive+=row.decisive;
    return {
      id:row.id,tested:row.tested,decisive:row.decisive,undecided:row.undecidedBothArms,
      sourceArmCountsReconciled,sourceResidual,
      sourceDataDisposition:sourceArmCountsReconciled?'aggregate-arm-counts-consistent':'FAILED_SOURCE_ARM_RECONCILIATION',
      alternationAmongDecisive:row.alternate/row.decisive,
      observedAlternationAmongAllTrials:row.alternate/row.tested,
      undecidedAmongAllTrials:row.undecidedBothArms/row.tested,
      forcedRight:forcedTurnSummary(forcedRightN,row.forcedRight.left),
      forcedLeft:forcedTurnSummary(forcedLeftN,row.forcedLeft.right),
      printedUndecidedPercent:row.printedUndecidedPercent,
      computedUndecidedPercent:computedUndecided,
      printedMatchesCorrectDenominator:Math.abs(computedUndecided-row.printedUndecidedPercent)<0.011,
      printedMatchesExtraDenominator:Math.abs(extraDenominator-row.printedUndecidedPercent)<0.011,
      latentBinaryCompletionBounds:[row.alternate/row.tested,(row.alternate+row.undecidedBothArms)/row.tested],
      forcedTurnExposureIdentified:false,
      limitation:'undecided counts lack forced-turn stratification; cannot infer attempted-turn denominators from decisive counts'
    };
  });
  return {workRef:WORK_REF,sourceKind:'transcribed published aggregate; native table image and trial data still need verification',
    totals:{tested,decisive,undecided,undecidedFraction:undecided/tested},conditions,
    sourceCountDisposition:conditions.every(r=>r.sourceArmCountsReconciled)?'AGGREGATES_RECONCILE':'FAILED_SOURCE_ARM_RECONCILIATION',
    acceptance:'Arithmetic and outcome-label reconciliation only; no preregistered N, CAD tolerance, causal attribution, or live measurement approved.'};
}

export function crossAuditDirectionTables(table1,table2){
 const primary=auditForcedTurnTable(table1);
 if(!Array.isArray(table2)||table2.length!==primary.conditions.length)throw new TypeError('one Table 2 row per Table 1 condition required');
 const seen=new Set();
 const rows=table2.map(r=>{
  if(typeof r?.id!=='string'||seen.has(r.id))throw new TypeError('duplicate or invalid Table 2 condition');
  seen.add(r.id);
  const one=table1.conditions.find(x=>x.id===r.id);
  if(!one)throw new TypeError('unknown Table 2 condition');
  for(const key of ['right','left','north','south','east','west'])integer(r[key],key);
  const rightLeft=r.right+r.left,cardinal=r.north+r.south+r.east+r.west,
    armRight=one.forcedRight.right+one.forcedLeft.right,
    armLeft=one.forcedRight.left+one.forcedLeft.left;
  const residual={decisiveMinusCardinal:one.decisive-cardinal,
    decisiveMinusLateral:one.decisive-rightLeft,
    lateralMinusArm:(rightLeft-(armRight+armLeft))};
  const table2LateralMatchesTable1Arms=r.right===armRight&&r.left===armLeft;
  return {id:r.id,aggregateDecisive:one.decisive,cardinalTotal:cardinal,
    lateralTotal:rightLeft,armTotal:armRight+armLeft,
    table2LateralMatchesTable1Arms,
    residual,fullyReconciled:table2LateralMatchesTable1Arms&&Object.values(residual).every(x=>x===0)};
 });
 return {workRef:WORK_REF,sourceStatus:'two transcribed aggregate tables only; native-page and trial-level verification outstanding',
  status:rows.every(r=>r.fullyReconciled&&r.table2LateralMatchesTable1Arms)?'RECONCILED':'FAILED_CROSS_TABLE_RECONCILIATION',rows};
}
