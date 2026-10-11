import test from 'node:test';
import assert from 'node:assert/strict';
import {stratifiedPermutationDiagnostic} from './stratified-permutation-diagnostic.mjs';
let count=0;
const row=(arm,stratum,accepted=true,auditedThrough='2026-09-10T00:00:00Z')=>({
 workRef:'synthetic:'+ ++count,arm,stratum,consumer:'synthetic:independent',
 eligibleAt:'2026-09-01T00:00:00Z',auditedThrough,
 ...(accepted?{acceptedAt:'2026-09-02T00:00:00Z',receiverWitness:'synthetic:receipt'}:{})});
const simpson=()=>[row('cell','high',true),
 ...Array.from({length:8},()=>row('central','high',true)),row('central','high',false),
 row('cell','low',true),...Array.from({length:8},()=>row('cell','low',false)),row('central','low',false)];
test('Simpson sign reversal alone gives weak null evidence in imbalanced 20-row design',()=>{
 const result=stratifiedPermutationDiagnostic(simpson());
 assert.equal(result.strata,2);
 assert.ok(Math.abs(result.observedContrast-1/9)<1e-12);
 assert.ok(Math.abs(result.pRight-0.81)<1e-12);
 assert.equal(result.claimStatus,'SYNTHETIC_NULL_CALIBRATION_ONLY');
});
test('row order cannot change conditional null calibration',()=>{
 const observations=simpson();
 const a=stratifiedPermutationDiagnostic(observations), b=stratifiedPermutationDiagnostic([...observations].reverse());
 assert.ok(Math.abs(a.pRight-b.pRight)<1e-12);
 assert.ok(Math.abs(a.observedContrast-b.observedContrast)<1e-12);
});
test('unresolved follow-up prevents a binary-outcome assay',()=>{
 assert.throws(()=>stratifiedPermutationDiagnostic([row('cell','same',false,'2026-09-01T00:00:00Z'),row('central','same',true)]),/censored/);
});
test('no common support refuses extrapolation',()=>{
 const result=stratifiedPermutationDiagnostic([row('cell','high',true),row('central','low',false)]);
 assert.equal(result.pRight,null);
 assert.equal(result.claimStatus,'NO_COMMON_SUPPORT');
});
test('duplicate work references cannot inflate evidence',()=>{
 const a=row('cell','same',true);
 assert.throws(()=>stratifiedPermutationDiagnostic([a,{...a,arm:'central'}]),/duplicate/);
});
