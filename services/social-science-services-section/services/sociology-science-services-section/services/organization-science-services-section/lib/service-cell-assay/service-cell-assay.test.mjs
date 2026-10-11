import test from 'node:test';
import assert from 'node:assert/strict';
import { assessWorkCohorts, classifyReceiving } from './service-cell-assay.mjs';
const START='2026-09-01T00:00:00Z';
const AUDIT='2026-09-10T00:00:00Z';
const ACCEPT='2026-09-03T00:00:00Z';
let n=0;
function row(arm,stratum,accepted=true,auditedThrough=AUDIT) {
  return {workRef:'synthetic:'+ ++n,arm,stratum,consumer:'independent synthetic receiver',eligibleAt:START,
    auditedThrough, ...(accepted ? {acceptedAt:ACCEPT,receiverWitness:'synthetic:receipt'}:{})};
}
test('negative control: Simpson reversal is visible in a composition-imbalanced cohort',()=>{
  const rows=[row('cell','high',true),
    ...Array.from({length:8},()=>row('central','high',true)),row('central','high',false),
    row('cell','low',true), ...Array.from({length:8},()=>row('cell','low',false)),row('central','low',false)];
  const result=assessWorkCohorts(rows);
  assert.ok(result.contrast.upper < 0,'pooled contrast is negative');
  assert.ok(result.commonSupportContrast.lower > 0,'standardized contrast is positive');
  assert.equal(result.claimStatus,'DESCRIPTIVE_ONLY');
  assert.equal(result.commonSupportContrast.strata.length,2);
});
test('unknown followup widens bounds and cannot become a failure',()=>{
  const rows=[row('cell','same',true),row('cell','same',false,START),row('central','same',false),row('central','same',false,START)];
  const result=assessWorkCohorts(rows);
  assert.equal(result.commonSupportContrast.lower,0);
  assert.equal(result.commonSupportContrast.upper,1);
  assert.equal(classifyReceiving(rows[1]),'unresolved');
});
test('only common strata enter standardized comparison; no extrapolation',()=>{
  const result=assessWorkCohorts([row('cell','only-cell',true),row('cell','both',true),row('central','both',false)]);
  assert.deepEqual(result.excludedStrata,['only-cell']);
  assert.equal(result.commonSupportContrast.lower,1);
});
test('no common support reports no standardized contrast',()=>{
  const result=assessWorkCohorts([row('cell','A',true),row('central','B',false)]);
  assert.equal(result.commonSupportContrast,null);
  assert.deepEqual(result.excludedStrata,['A','B']);
});
test('duplicate canonical workRef cannot enter both cohort arms',()=>{
  const a=row('cell','same');
  assert.throws(()=>assessWorkCohorts([a,{...a,arm:'central'}]),/duplicate workRef/);
});
