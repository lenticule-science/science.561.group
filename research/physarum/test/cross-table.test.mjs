import {readPublishedTable1} from './published-table1-fixture.mjs';
import test from 'node:test';
import assert from 'node:assert/strict';
import {crossAuditDirectionTables,WORK_REF} from '../forced-turn-audit.mjs';
// Table 1 transcribed from Kuttner/Freiberg, Protist 181 (2026), p3.
import {readFileSync} from 'node:fs';
const table1=readPublishedTable1();
// Table 2 transcribed from same paper p4; source is an accessible text rendering
// rather than an independently inspected native PDF table/image.
const table2=JSON.parse(readFileSync(new URL('../paper-table2-transcribed.json',import.meta.url),'utf8'));
test('published Table 2 lateral counts and Table 1 arm subcounts match for all rows',()=>{
 const x=crossAuditDirectionTables(table1,table2);assert.ok(x.rows.every(r=>r.table2LateralMatchesTable1Arms));
});
test('the 7mm cardinal total matches decisive 248 but lateral counts sum 246',()=>{
 const x=crossAuditDirectionTables(table1,table2);
 assert.equal(x.status,'FAILED_CROSS_TABLE_RECONCILIATION');
 assert.deepEqual(x.rows.map(r=>r.fullyReconciled),[true,false,true,true]);
 assert.deepEqual(x.rows[1].residual,{decisiveMinusCardinal:0,decisiveMinusLateral:2,lateralMinusArm:0});
});
test('negative control changes to cardinal input yield additional discrepancy',()=>{
 const corrupted=structuredClone(table2);corrupted.conditions[0].north--;
 const x=crossAuditDirectionTables(table1,corrupted);
 assert.deepEqual(x.rows[0].residual,{decisiveMinusCardinal:1,decisiveMinusLateral:0,lateralMinusArm:0});
});
test('bad categories and duplicate or malformed Table 2 fields are refused',()=>{
 const a=structuredClone(table2);a.conditions[0].id='absent';assert.throws(()=>crossAuditDirectionTables(table1,a),/unknown/);
 const b=structuredClone(table2);b.conditions[0].id=b.conditions[1].id;assert.throws(()=>crossAuditDirectionTables(table1,b),/unknown|duplicate/);
 const c=structuredClone(table2);c.conditions[2].west=-1;assert.throws(()=>crossAuditDirectionTables(table1,c),/nonnegative/);
});
