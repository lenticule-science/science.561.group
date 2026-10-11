import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {assayInstrumentMethods} from '../instrument-assay.mjs';
const report=JSON.parse(readFileSync(new URL('../method-source-20261011.json',import.meta.url),'utf8'));
test('author-reported nominal dimensions are not mistaken for measured printed mazes',()=>{
 const r=assayInstrumentMethods(report);
 assert.equal(r.disposition,'EXPLORATORY_ONLY');
 assert.equal(r.reportedNominalDimensionsAcceptedAsMeasured,false);
 assert.equal(r.missingMeasuredInstrumentProperties.length,11);
 assert.ok(r.sourceIssues.includes('SOURCE_AGGREGATE_DISCREPANCY'));
 assert.ok(r.sourceIssues.includes('INDEPENDENT_SCIENCE_RECEIVING_UNVERIFIED'));
});
test('negative control refuses wrong research ownership and DOI',()=>{
 const a=structuredClone(report);a.workRef='unapproved';assert.throws(()=>assayInstrumentMethods(a),/reference/);
 const b=structuredClone(report);b.reference.doi='10.0000/other';assert.throws(()=>assayInstrumentMethods(b),/DOI/);
});
test('negative control refuses hidden undecided endpoint',()=>{
 const a=structuredClone(report);a.experimentalEndpoint=['alternating','nonalternating'];
 assert.throws(()=>assayInstrumentMethods(a),/undecided/);
});
test('negative control refuses impossible reported physical geometry',()=>{
 const a=structuredClone(report);a.reportedNominalGeometry.corridorWidthMm=-5;
 assert.throws(()=>assayInstrumentMethods(a),/geometry/);
});
test('self-asserted record completeness cannot count as verified physical release',()=>{
 const a=structuredClone(report);
 for(const key of Object.keys(a.unmeasuredOrUnspecified))a.unmeasuredOrUnspecified[key]='unverified-assertion';
 a.reference.nativePdfPageImageInspected=true;
 a.reference.trialLevelDataAvailable=true;
 a.sourceDiscrepancies.unreconciledCount=0;
 a.sourceDiscrepancies.nativeSourceOrRawDataDisposition='RECONCILED';
 a.authorityBoundary.preRegistrationAccepted=true;
 a.authorityBoundary.independentScientificReceivingVerified=true;
 const r=assayInstrumentMethods(a);
 assert.equal(r.disposition,'DOCUMENTARY_PRECHECK_ONLY');
 assert.match(r.confirmation,/cannot itself establish/);
 assert.equal(r.reportedNominalDimensionsAcceptedAsMeasured,false);
});
