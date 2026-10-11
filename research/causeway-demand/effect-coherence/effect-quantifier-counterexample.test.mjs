import test from 'node:test';
import assert from 'node:assert/strict';
import {countEffectSplices,classifyCoverage} from './effect-quantifier-counterexample.mjs';

test('2x2 diagonal is a witness against swapping forall and exists',()=>{
 assert.deepEqual(classifyCoverage([[true,false],[false,true]]),{naive:true,coherent:false,spliced:true});
 assert.deepEqual(countEffectSplices(2,2),{naive:9n,coherent:7n,naiveOnly:2n});
});
test('formula agrees with every Boolean relation up to 3x3',()=>{
 for(let k=1;k<=3;k++)for(let n=1;n<=3;n++){
  const counts={naive:0n,coherent:0n,naiveOnly:0n};
  for(let mask=0;mask<2**(k*n);mask++){
   const rows=Array.from({length:k},(_,i)=>Array.from({length:n},(_,j)=>Boolean(mask&(1<<(i*n+j)))));
   const r=classifyCoverage(rows);
   if(r.naive)counts.naive++;
   if(r.coherent)counts.coherent++;
   if(r.spliced)counts.naiveOnly++;
   assert.equal(r.coherent&&!r.naive,false);
  }
  assert.deepEqual(counts,countEffectSplices(k,n));
 }
});
test('seven-stage two-effect space has 1,932 combinatorially spliced positives',()=>{
 assert.deepEqual(countEffectSplices(2,7),{naive:2187n,coherent:255n,naiveOnly:1932n});
});
