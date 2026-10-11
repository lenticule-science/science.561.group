import test from 'node:test';
import assert from 'node:assert/strict';
import {readPublishedTable1, publishedTable1Bytes, verifyPublishedTable1Bytes} from './published-table1-fixture.mjs';

test('one canonical mycology Table 1 source preserves declared provenance and observations',()=>{
 const t=readPublishedTable1();
 assert.equal(t.workRef,'lenticule-science/science-services-section#27');
 assert.equal(t.source.doi,'10.1016/j.protis.2026.126156');
 assert.equal(t.conditions.reduce((n,r)=>n+r.tested,0),1274);
 assert.equal(t.conditions.reduce((n,r)=>n+r.undecidedBothArms,0),316);
});
test('negative control: a one-byte publication mutation is refused at load',()=>{
 const bad=Buffer.from(publishedTable1Bytes());
 bad[15]^=1;
 assert.throws(()=>verifyPublishedTable1Bytes(bad),/source revision mismatch/);
});
test('source discrepancy stays visible: 7mm lateral totals omit two decisive outcomes',()=>{
 const r=readPublishedTable1().conditions.find(x=>x.id==='medium-7mm');
 assert.equal(r.decisive-r.forcedRight.right-r.forcedRight.left-r.forcedLeft.right-r.forcedLeft.left,2);
});
