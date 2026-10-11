/** Reproducible source-to-instrument gap assay for Science #27.
 * Checks documentary completeness only; a claimed evidenceRef is not
 * authenticated and this function never authorizes physical fabrication.
 */
export function assayInstrumentMethods(x){
 if(x?.workRef!=='lenticule-science/science-services-section#27' ||
    x?.groupDemand!=='561-group/561-group-services-section#2')
   throw new TypeError('unexpected science or Group work reference');
 if(x.reference?.doi!=='10.1016/j.protis.2026.126156')
   throw new TypeError('published source DOI is missing or mismatched');
 const geo=x.reportedNominalGeometry??{};
 const fields=['corridorWidthMm','startCorridorLengthMm','choiceArmLengthMm', 'doubleTurnSeparationMm'];
 for(const k of fields)if(!Number.isFinite(geo[k])||geo[k]<=0)
   throw new TypeError('invalid published nominal geometry: '+k);
 if(!Array.isArray(geo.singleTurnDecisionDistancesMm)||
    geo.singleTurnDecisionDistancesMm.length!==3||
    geo.singleTurnDecisionDistancesMm.some(n=>!Number.isFinite(n)||n<=0))
   throw new TypeError('missing or invalid published decision distances');
 const endpoint=x.experimentalEndpoint;
 if(!Array.isArray(endpoint)||!['alternating','nonalternating','undecided'].every(v=>endpoint.includes(v)))
   throw new TypeError('undecided must be an explicit third outcome');
 const missing=[];
 const u=x.unmeasuredOrUnspecified??{};
 for(const key of ['actualPrintMaterial','wallHeightMm','wallThicknessMm','criticalCornerRadiiMm',
   'originalThreeMmAsymmetryGeometryFile','dimensionalToleranceMm','measuredPhysicalMazeDimensions',
   'vibrationExposureDuringOriginalAssay','magneticFieldExposureDuringOriginalAssay',
   'calibratedEquipmentRecords','physicalReceiverAcceptance'])
   if(u[key]===undefined||u[key]===null)missing.push(key);
 const sourceIssues=[];
 if(!x.reference.nativePdfPageImageInspected)sourceIssues.push('NATIVE_PAGE_NOT_INSPECTED');
 if(!x.reference.trialLevelDataAvailable)sourceIssues.push('TRIAL_DATA_UNVERIFIED');
 if(x.sourceDiscrepancies?.unreconciledCount!==0)sourceIssues.push('SOURCE_AGGREGATE_DISCREPANCY');
 if(x.sourceDiscrepancies?.nativeSourceOrRawDataDisposition!=='RECONCILED')sourceIssues.push('SOURCE_NOT_RECONCILED');
 if(!x.authorityBoundary?.preRegistrationAccepted)sourceIssues.push('PRE_REGISTRATION_NOT_ACCEPTED');
 if(!x.authorityBoundary?.independentScientificReceivingVerified)sourceIssues.push('INDEPENDENT_SCIENCE_RECEIVING_UNVERIFIED');
 return {
   workRef:x.workRef,principal:'561-group',researchRequired:true,
   reportedNominalDimensionsAcceptedAsMeasured:false,
   missingMeasuredInstrumentProperties:missing,sourceIssues,
   disposition:missing.length||sourceIssues.length?'EXPLORATORY_ONLY':'DOCUMENTARY_PRECHECK_ONLY',
   confirmation:'This assay cannot itself establish source authenticity, physical metrology, independent receiving, or fabricate authorization.',
   permitted:['parametric geometry exploration','nonconfirmatory calibration coupons'],
   notPermittedToClaim:['confirmed experimental apparatus','preregistered tolerance release','completed replication']
 };
}
