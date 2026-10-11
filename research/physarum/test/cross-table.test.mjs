import test from 'node:test';
import assert from 'node:assert/strict';
import {crossAuditDirectionTables,WORK_REF} from '../forced-turn-audit.mjs';
import {readFileSync} from 'node:fs';
const table1=JSON.parse(readFileSync(new URL('../paper-table1.json',import.meta.url),'utf8'));
const table2=JSON.parse(readFileSync(new URL('../paper-table2-transcribed.json',import.meta.url),'utf8')).conditions;
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
 const corrupted=structuredClone(table2);corrupted[0].north--;
 const x=crossAuditDirectionTables(table1,corrupted);
 assert.deepEqual(x.rows[0].residual,{decisiveMinusCardinal:1,decisiveMinusLateral:0,lateralMinusArm:0});
});
test('bad categories and duplicate or malformed Table 2 fields are refused',()=>{
 const a=structuredClone(table2);a[0].id='absent';assert.throws(()=>crossAuditDirectionTables(table1,a),/unknown/);
 const b=structuredClone(table2);b[0].id=b[1].id;assert.throws(()=>crossAuditDirectionTables(table1,b),/unknown|duplicate/);
 const c=structuredClone(table2);c[2].west=-1;assert.throws(()=>crossAuditDirectionTables(table1,c),/nonnegative/);
});
for(const direction of [1,-1])test(`conserved lateral total cannot conceal a directional shift of ${direction}`,()=>{
 const one=structuredClone(table1);one.conditions=[one.conditions[0]];
 const two=[structuredClone(table2[0])];
 assert.equal(crossAuditDirectionTables(one,two).status,'RECONCILED');
 two[0].right+=direction;two[0].left-=direction;
 const before=structuredClone({one,two});
 const audit=crossAuditDirectionTables(one,two),row=audit.rows[0];
 assert.deepEqual(row.residual,{decisiveMinusCardinal:0,decisiveMinusLateral:0,lateralMinusArm:0});
 assert.equal(row.table2LateralMatchesTable1Arms,false);
 assert.equal(row.fullyReconciled,false);
 assert.equal(audit.status,'FAILED_CROSS_TABLE_RECONCILIATION');
 assert.deepEqual({one,two},before);
});
