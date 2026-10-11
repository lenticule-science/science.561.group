import test from 'node:test';
import assert from 'node:assert/strict';
import {assayInstrumentMethods} from '../instrument-assay.mjs';

// Deliberately synthetic preflight input. No physical instrument measurements
// and no third-party result is represented by this fixture.
const report={
 workRef:'lenticule-science/science-services-section#27',
 groupDemand:'561-group/561-group-services-section#2',
 reference:{doi:'10.1016/j.protis.2026.126156',
   nativePdfPageImageInspected:false,trialLevelDataAvailable:false},
 reportedNominalGeometry:{corridorWidthMm:5,startCorridorLengthMm:50,
  choiceArmLengthMm:20,doubleTurnSeparationMm:7,
  singleTurnDecisionDistancesMm:[3,7,14]},
 experimentalEndpoint:['alternating','nonalternating','undecided'],
 sourceDiscrepancies:{unreconciledCount:2,nativeSourceOrRawDataDisposition:'NOT_RECONCILED'},
 authorityBoundary:{preRegistrationAccepted:false,independentScientificReceivingVerified:false},
 unmeasuredOrUnspecified:{}
};
const clone=()=>structuredClone(report);
test('source nominal dimensions are never accepted as measurements',()=>{
 const r=assayInstrumentMethods(report);
 assert.equal(r.disposition,'EXPLORATORY_ONLY');
 assert.equal(r.reportedNominalDimensionsAcceptedAsMeasured,false);
 assert.equal(r.missingMeasuredInstrumentProperties.length,11);
 assert.ok(r.sourceIssues.includes('SOURCE_AGGREGATE_DISCREPANCY'));
 assert.ok(r.sourceIssues.includes('INDEPENDENT_SCIENCE_RECEIVING_UNVERIFIED'));
 assert.ok(!r.permitted.includes('confirmatory fabrication'));
});
test('wrong owner or DOI rejected before nominal geometry assessment',()=>{
 const a=clone();a.workRef='unapproved';assert.throws(()=>assayInstrumentMethods(a),/reference/);
 const b=clone();b.reference.doi='10.0000/wrong';assert.throws(()=>assayInstrumentMethods(b),/DOI/);
});
test('both arms/undecided must be explicit outcome',()=>{
 const a=clone();a.experimentalEndpoint=['alternating','nonalternating'];
 assert.throws(()=>assayInstrumentMethods(a),/undecided/);
});
test('impossible nominal dimensions are refused',()=>{
 const a=clone();a.reportedNominalGeometry.corridorWidthMm=-5;
 assert.throws(()=>assayInstrumentMethods(a),/geometry/);
 const b=clone();b.reportedNominalGeometry.singleTurnDecisionDistancesMm=[3,7];
 assert.throws(()=>assayInstrumentMethods(b),/distances/);
});
test('fully self-asserted documents do not authorize fabrication or prove metrology',()=>{
 const a=clone();for(const key of assayInstrumentMethods(a).missingMeasuredInstrumentProperties)a.unmeasuredOrUnspecified[key]='unverified assertion';
 a.reference.nativePdfPageImageInspected=true;a.reference.trialLevelDataAvailable=true;
 a.sourceDiscrepancies.unreconciledCount=0;
 a.sourceDiscrepancies.nativeSourceOrRawDataDisposition='RECONCILED';
 a.authorityBoundary.preRegistrationAccepted=true;
 a.authorityBoundary.independentScientificReceivingVerified=true;
 const r=assayInstrumentMethods(a);
 assert.equal(r.disposition,'DOCUMENTARY_PRECHECK_ONLY');
 assert.match(r.confirmation,/cannot itself establish/);
 assert.equal(r.reportedNominalDimensionsAcceptedAsMeasured,false);
});
test('assay does not mutate provided source records',()=>{
 const a=clone(),before=structuredClone(a);assayInstrumentMethods(a);assert.deepEqual(a,before);
});
