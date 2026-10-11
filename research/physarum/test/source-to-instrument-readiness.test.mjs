import {readPublishedTable1} from './published-table1-fixture.mjs';
import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {assaySourceToInstrument} from '../source-to-instrument-readiness.mjs';
const read=(path)=>JSON.parse(readFileSync(new URL(path,import.meta.url),'utf8'));
const method=read('../method-source-20261011.json');
const table1=readPublishedTable1();
const table2=read('../paper-table2-transcribed.json');
const assay=(m=method,a=table1,b=table2)=>assaySourceToInstrument(m,a,b);

test('source method links to published tables and reproduces 7mm discrepancy',()=>{
 const r=assay();assert.equal(r.sourceGate,'SOURCE_DISCREPANCY_REPRODUCED');
 assert.deepEqual(r.sevenMm,{reportedDecisive:248,forcedSideTotal:246,cardinalTotal:248,unreconciled:2});
 assert.deepEqual(r.sourceTotals,{tested:1274,undecided:316,decisive:958,undecidedFraction:316/1274});
 assert.equal(r.missingInstrumentProperties.length,11);
 assert.equal(r.releaseToConfirmatoryFabrication,false);
});
test('negative control catches forged correction in method source even when numeric assay still runs',()=>{
 const m=structuredClone(method);m.sourceDiscrepancies.unreconciledCount=0;
 assert.equal(assay(m).sourceGate,'SOURCE_CLAIM_MISMATCH_OR_UNRECONCILED');
});
test('negative control rejects swapped provenance or authority',()=>{
 const a=structuredClone(table2);a.workRef='an-unrelated-study';
 assert.throws(()=>assay(method,table1,a),/provenance/);
 const b=structuredClone(table1);b.source.doi='10.0000/other';
 assert.throws(()=>assay(method,b,table2),/provenance/);
});
test('negative control catches printed-table drift without silently fixing record',()=>{
 const a=structuredClone(table1);a.conditions[1].forcedRight.right+=1;
 assert.equal(assay(method,a,table2).sourceGate,'SOURCE_CLAIM_MISMATCH_OR_UNRECONCILED');
});
test('apparent independent science acceptance cannot grant fabrication authority',()=>{
 const m=structuredClone(method);m.authorityBoundary.independentScientificReceivingVerified=true;
 const r=assay(m);assert.equal(r.releaseToConfirmatoryFabrication,false);
});
test('input source records are immutable under analysis',()=>{
 const snapshot=JSON.stringify([method,table1,table2]);assay();
 assert.equal(JSON.stringify([method,table1,table2]),snapshot);
});
