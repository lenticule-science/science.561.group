import test from 'node:test';
import assert from 'node:assert/strict';
import {auditForcedTurnTable,WORK_REF} from '../forced-turn-audit.mjs';
import {readFileSync} from 'node:fs';
const data=JSON.parse(readFileSync(new URL('../paper-table1.json',import.meta.url),'utf8'));
const clone=()=>structuredClone(data);
const eq=(actual,expected)=>assert.ok(Math.abs(actual-expected)<1e-8,`${actual} != ${expected}`);
test('all four rows reconcile to 1274 tested / 316 undecided / 958 decisive',()=>{assert.deepEqual(auditForcedTurnTable(data).totals,{tested:1274,undecided:316,decisive:958,undecidedFraction:316/1274})});
test('every forced-turn arm maps correctly into conditional alternate/repeat',()=>{
 const x=auditForcedTurnTable(data);for(const row of x.conditions)assert.equal(row.forcedRight.decisive+row.forcedLeft.decisive,row.decisive-row.sourceResidual.decisive);
 eq(x.conditions[0].forcedRight.alternationAmongDecisive,82/119);
 eq(x.conditions[0].forcedLeft.alternationAmongDecisive,70/97);
});
test('3mm undecideds remain visible in unconditional rate and hypothetic bounds',()=>{
 const x=auditForcedTurnTable(data).conditions[0];eq(x.alternationAmongDecisive,152/216);
 eq(x.observedAlternationAmongAllTrials,152/390);
 eq(x.undecidedAmongAllTrials,174/390);
 assert.deepEqual(x.latentBinaryCompletionBounds,[152/390,326/390]);
 assert.ok(x.latentBinaryCompletionBounds[0]<0.5&&x.latentBinaryCompletionBounds[1]>0.5);
});
test('printed percentages follow extra-denominator arithmetic, not the actual trial denominator',()=>{
 const x=auditForcedTurnTable(data).conditions;assert.ok(x.every(r=>r.printedMatchesExtraDenominator));assert.ok(x.every(r=>!r.printedMatchesCorrectDenominator));
});
test('no direction-wise exposure can be inferred for undecided trials',()=>{
 for(const r of auditForcedTurnTable(data).conditions){assert.equal(r.forcedTurnExposureIdentified,false);assert.match(r.limitation,/cannot infer/)}
});
test('negative control flags inverted arm outcome map without silently repairing publication',()=>{
 const x=clone();[x.conditions[0].forcedRight.left,x.conditions[0].forcedRight.right]=[x.conditions[0].forcedRight.right,x.conditions[0].forcedRight.left];
 const audit=auditForcedTurnTable(x);assert.equal(audit.sourceCountDisposition,'FAILED_SOURCE_ARM_RECONCILIATION');assert.equal(audit.conditions[0].sourceArmCountsReconciled,false);
});
test('negative control refuses internally contradictory totals and duplicate conditions',()=>{
 const x=clone();x.conditions[0].decisive=215;assert.throws(()=>auditForcedTurnTable(x),/accounting/);
 const y=clone();y.conditions.push(y.conditions[0]);assert.throws(()=>auditForcedTurnTable(y),/duplicate/);
});
test('negative control refuses wrong owner, missing side, invalid percent',()=>{
 const x=clone();x.workRef='unapproved';assert.throws(()=>auditForcedTurnTable(x),/workRef/);
 const y=clone();delete y.conditions[1].forcedLeft.right;assert.throws(()=>auditForcedTurnTable(y),/forcedLeft.right/);
 const z=clone();z.conditions[0].printedUndecidedPercent=NaN;assert.throws(()=>auditForcedTurnTable(z),/percentage/);
});
test('7mm published aggregate has exactly two decisive observations absent from directional tables',()=>{
  const audit=auditForcedTurnTable(data);assert.equal(audit.sourceCountDisposition,'FAILED_SOURCE_ARM_RECONCILIATION');
  assert.deepEqual(audit.conditions.map(r=>r.sourceArmCountsReconciled),[true,false,true,true]);
  assert.deepEqual(audit.conditions[1].sourceResidual,{decisive:2,alternate:0,repeat:2});
});
test('input is unchanged by assay',()=>{const x=clone();const before=JSON.stringify(x);auditForcedTurnTable(x);assert.equal(JSON.stringify(x),before)});
for(const emptyForce of ['forcedRight','forcedLeft'])test(`empty ${emptyForce} stratum retains zero counts and explicitly has no conditional rate`,()=>{
 const x=clone();x.conditions=[x.conditions[0]];
 const row=x.conditions[0];
 const observedForce=emptyForce==='forcedRight'?'forcedLeft':'forcedRight';
 row[emptyForce]={right:0,left:0};
 row[observedForce]=observedForce==='forcedRight'?{right:row.repeat,left:row.alternate}:{right:row.alternate,left:row.repeat};
 const before=structuredClone(x);
 const audit=auditForcedTurnTable(x),result=audit.conditions[0];
 assert.equal(audit.sourceCountDisposition,'AGGREGATES_RECONCILE');
 assert.deepEqual(result[emptyForce],{decisive:0,alternating:0,alternationAmongDecisive:null,conditionalRateDisposition:'NO_DECISIVE_OBSERVATIONS'});
 assert.deepEqual(result[observedForce],{decisive:216,alternating:152,alternationAmongDecisive:152/216,conditionalRateDisposition:'COMPUTED_FROM_DECISIVE_COUNTS'});
 assert.equal(result.forcedTurnExposureIdentified,false);
 assert.deepEqual(JSON.parse(JSON.stringify(audit)),audit);
 assert.deepEqual(x,before);
});
test('observed strata with zero alternating counts retain a defined zero rate',()=>{
 const x=clone();x.conditions=[x.conditions[0]];
 const row=x.conditions[0];row.alternate=0;row.repeat=row.decisive;
 row.forcedRight={right:100,left:0};row.forcedLeft={right:0,left:116};
 const before=structuredClone(x),result=auditForcedTurnTable(x).conditions[0];
 assert.equal(result.sourceArmCountsReconciled,true);
 for(const force of ['forcedRight','forcedLeft']){
  assert.equal(result[force].alternationAmongDecisive,0);
  assert.equal(result[force].conditionalRateDisposition,'COMPUTED_FROM_DECISIVE_COUNTS');
 }
 assert.deepEqual(x,before);
});
