import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {crossAuditDirectionTables} from '../forced-turn-audit.mjs';
import {buildPublishedBinomialCases, auditPrintedPValues, benjaminiHochberg} from '../binomial-publication-audit.mjs';
const read=(p)=>JSON.parse(readFileSync(new URL(p,import.meta.url),'utf8'));
const table1=read('../paper-table1.json');
const table2=read('../paper-table2-transcribed.json');
const printed=read('../paper-table1-pvalues-transcribed.json');
const clone=structuredClone;

test('source-bound cross-table join rejects different DOI and workRef',()=>{
  assert.equal(crossAuditDirectionTables(table1,table2).status,'FAILED_CROSS_TABLE_RECONCILIATION');
  for(const [key,edited] of [['doi',{...table2,source:{...table2.source,doi:'10.0000/other'}}],['workRef',{...table2,workRef:'other'}]])
    assert.throws(()=>crossAuditDirectionTables(table1,edited),new RegExp(key,'i'));
  const noSource=clone(table2);delete noSource.source;
  assert.throws(()=>crossAuditDirectionTables(table1,noSource),/DOI/);
});
test('published p-values attach by condition identifier, never by array index',()=>{
 const original=buildPublishedBinomialCases(table1,printed);
 const shuffled=clone(printed);shuffled.rows.reverse();
 assert.deepEqual(buildPublishedBinomialCases(table1,shuffled),original);
 assert.equal(auditPrintedPValues(original).rows.length,12);
});
test('published p-value source rejects duplicates, missing conditions and unknown conditions',()=>{
 const duplicate=clone(printed);duplicate.rows[1].id=duplicate.rows[0].id;
 assert.throws(()=>buildPublishedBinomialCases(table1,duplicate),/duplicate/);
 const missing=clone(printed);missing.rows.pop();
 assert.throws(()=>buildPublishedBinomialCases(table1,missing),/one.*per|missing|count/i);
 const unknown=clone(printed);unknown.rows[0].id='unknown-maze';
 assert.throws(()=>buildPublishedBinomialCases(table1,unknown),/unknown|unmatched|missing/i);
});
test('published p-value join requires DOI, same workRef, and source metadata',()=>{
 const wrong=clone(printed);wrong.source.doi='10.9999/unrelated';
 assert.throws(()=>buildPublishedBinomialCases(table1,wrong),/DOI/);
 const foreign=clone(printed);foreign.workRef='foreign';
 assert.throws(()=>buildPublishedBinomialCases(table1,foreign),/workRef/);
 const noSource=clone(printed);delete noSource.source;
 assert.throws(()=>buildPublishedBinomialCases(table1,noSource),/DOI/);
});
test('Benjamini-Hochberg gives stable ordered q-values and refuses invalid inputs',()=>{
 assert.deepEqual(benjaminiHochberg([.04,.01,.03,.02]),[.04,.04,.04,.04]);
 assert.deepEqual(benjaminiHochberg([0,.25,.5,1]),[0,.5,2/3,1]);
 for(const bad of [[NaN],[Infinity],[1.1],[-.1],['.05'],[]])
   assert.throws(()=>benjaminiHochberg(bad),/probabilit|nonempty/i);
});
test('12 displayed cells give three q<.05; the research family is explicit, not inferred',()=>{
 const cases=buildPublishedBinomialCases(table1,printed);
 const p=auditPrintedPValues(cases).rows.map(r=>r.exactTwoSidedBinomialP);
 assert.equal(benjaminiHochberg(p).filter(q=>q<.05).length,3);
 const totalOnly=benjaminiHochberg([p[0],p[3],p[6],p[9]]);
 assert.equal(totalOnly.filter(q=>q<.05).length,1);
 assert.ok(totalOnly[1]>benjaminiHochberg(p)[3]);
});
