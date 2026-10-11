/** Science #27: independently derive source-accounting gate for an instrument proposal.
 * This is a static provenance/arithmetic review of transcribed literature, not
 * an observation, independent epistemic receiving, or fabrication release.
 */
import {auditForcedTurnTable,crossAuditDirectionTables} from './forced-turn-audit.mjs';
import {assayInstrumentMethods} from './instrument-assay.mjs';

export function assaySourceToInstrument(methods,table1,table2){
 const documentary=assayInstrumentMethods(methods);
 if (table1?.workRef!==methods.workRef || table2?.workRef!==methods.workRef ||
     table1?.source?.doi!==methods.reference.doi || table2?.source?.doi!==methods.reference.doi)
   throw new TypeError('published aggregate provenance does not match the instrument source');
 if(table1?.source?.nativePdfPageImageVerified!==false ||
    methods.reference.nativePdfPageImageInspected!==false ||
    methods.reference.trialLevelDataAvailable!==false)
   throw new Error('unexpected source-verification upgrade: requalify provenance before this assay');
 const counts=auditForcedTurnTable(table1);
 const cross=crossAuditDirectionTables(table1,table2);
 const medium=table1.conditions.find(r=>r.id==='medium-7mm');
 const table2Medium=table2.conditions.find(r=>r.id==='medium-7mm');
 if(!medium || !table2Medium)throw new TypeError('7 mm source condition absent');
 const sourceDecisive=medium.decisive;
 const sourceSideTotal=medium.forcedRight.right+medium.forcedRight.left+
   medium.forcedLeft.right+medium.forcedLeft.left;
 const sourceCardinalTotal=table2Medium.north+table2Medium.south+
   table2Medium.east+table2Medium.west;
 const observedUnreconciled=counts.conditions.reduce((sum,r)=>sum+Math.abs(r.sourceResidual.decisive),0);
 const claim=methods.sourceDiscrepancies??{};
 const claimedConsistent=(claim.sevenMmDecisiveTotal===sourceDecisive&&
   claim.sevenMmForcedSideTotal===sourceSideTotal&&
   claim.sevenMmCardinalTotal===sourceCardinalTotal&&
   claim.unreconciledCount===observedUnreconciled&&
   claim.nativeSourceOrRawDataDisposition==='NOT_YET_RECONCILED');
 const sourceGate = claimedConsistent &&
   counts.sourceCountDisposition==='FAILED_SOURCE_ARM_RECONCILIATION' &&
   cross.status==='FAILED_CROSS_TABLE_RECONCILIATION' ?
   'SOURCE_DISCREPANCY_REPRODUCED':'SOURCE_CLAIM_MISMATCH_OR_UNRECONCILED';
 return {
  workRef:methods.workRef,originatingGroupDemand:methods.groupDemand,
  evidenceKind:'published aggregates transcribed from accessible HTML; native figures and raw data unverified',
  sourceGate,sourceClaimsMatchTranscriptions:claimedConsistent,
  sourceTotals:counts.totals,
  sevenMm:{reportedDecisive:sourceDecisive,forcedSideTotal:sourceSideTotal,
    cardinalTotal:sourceCardinalTotal,unreconciled:sourceDecisive-sourceSideTotal},
  instrumentStatus:documentary.disposition,
  missingInstrumentProperties:documentary.missingMeasuredInstrumentProperties,
  releaseToConfirmatoryFabrication:false,
  permittedNow:['parametric exploration','nonconfirmatory machine calibration coupons'],
  unresolved:['native publication page verification','original trial-level data or uncertainty-aware preregistration',
    'independent scientific receiving','measured maze geometry and tolerance','separate Engineering acceptance']
 };
}
