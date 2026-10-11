import test from 'node:test';
import assert from 'node:assert/strict';
import {exactTwoSidedHalfBinomial,auditPrintedPValues} from '../binomial-publication-audit.mjs';
import {readFileSync} from 'node:fs';
const table=JSON.parse(readFileSync(new URL('../paper-table1.json',import.meta.url),'utf8'));
const printed=JSON.parse(readFileSync(new URL('../paper-table1-pvalues-transcribed.json',import.meta.url),'utf8')).rows;
const cases=table.conditions.flatMap((r,i)=>[
 {id:r.id+':all',alternate:r.alternate,decisive:r.decisive,printedP:printed[i].all},
 {id:r.id+':forcedRight',alternate:r.forcedRight.left,decisive:r.forcedRight.right+r.forcedRight.left,printedP:printed[i].forcedRight},
 {id:r.id+':forcedLeft',alternate:r.forcedLeft.right,decisive:r.forcedLeft.right+r.forcedLeft.left,printedP:printed[i].forcedLeft}
]);
const eq=(a,b)=>assert.ok(Math.abs(a-b)<1e-10,`${a} expected ${b}`);
test('known exact binomial boundary checks',()=>{
 eq(exactTwoSidedHalfBinomial(0,3),0.25);
 eq(exactTwoSidedHalfBinomial(2,4),1);
 eq(exactTwoSidedHalfBinomial(4,4),0.125);
 assert.throws(()=>exactTwoSidedHalfBinomial(5,4),/counts/);
});
test('external SciPy oracle for four total comparisons',()=>{
 const expected=[1.94522162387066e-9,.14399981785482543,.51101142704365,.6323902913164329];
 for(const [i,r] of table.conditions.entries())eq(exactTwoSidedHalfBinomial(r.alternate,r.decisive),expected[i]);
});
test('binomial test is symmetric for complement count',()=>{
 for(const [k,n] of [[72,127],[103,214],[79,137]])eq(exactTwoSidedHalfBinomial(k,n),exactTwoSidedHalfBinomial(n-k,n));
});
test('published censored 3mm values are numerically consistent',()=>{
 const a=auditPrintedPValues(cases);assert.deepEqual(a.rows.slice(0,3).map(r=>r.consistentWithClaimedTest),[true,true,true]);
});
test('nine other printed p-values are not reproducible from stated exact two-sided test and cells',()=>{
 const a=auditPrintedPValues(cases);assert.equal(a.status,'FAILED_P_RECONCILIATION');
 assert.equal(a.rows.filter(r=>!r.consistentWithClaimedTest).length,9);
});
test('p-value assay rejects corrupt source cells and duplicate identifiers',()=>{
 const bad=structuredClone(cases);bad[0].alternate=bad[0].decisive+1;assert.throws(()=>auditPrintedPValues(bad),/counts/);
 const dup=structuredClone(cases);dup.push(dup[0]);assert.throws(()=>auditPrintedPValues(dup),/duplicate/);
});
