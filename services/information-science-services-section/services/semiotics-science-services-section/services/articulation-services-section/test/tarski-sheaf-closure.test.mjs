import test from 'node:test';
import assert from 'node:assert/strict';
import { admitTarskiSheafComplex, settleTarskiSheaf, isTarskiCompatible } from '../dist/lib/articulating/predicating/positing/settling/analysis/tarski-sheaf-closure.mjs';
import { valuation } from '../dist/lib/articulating/predicating/positing/settling/analysis/closure-rule-system.mjs';
import { readValuationFiber } from '../dist/lib/articulating/predicating/positing/valuation-fiber-algebra.mjs';
const values=['absurd','potential','active','stable'];
const identity=Object.fromEntries(values.map(v=>[v,v]));
// Independent pair-of-evidence-bits oracle for the FOUR knowledge order.
const bits={absurd:0,potential:1,active:2,stable:3};
const leq=(a,b)=>(bits[a]|bits[b])===bits[b];
const admitted=(vertices,edges)=>{const r=admitTarskiSheafComplex({vertices,edges});assert.equal(r.kind,'admitted');return r.complex;};
const read=(section)=>Object.fromEntries(section.points.map(p=>[p,readValuationFiber(section,p)]));

test('directed restriction propagates only to its target and preserves contradiction',()=>{
 const complex=admitted(['a','b','c'],[{src:'a',tgt:'b',restrict:identity},{src:'b',tgt:'c',restrict:identity}]);
 assert.deepEqual(read(settleTarskiSheaf(complex,{a:'potential',b:'active'}).section),{a:'potential',b:'stable',c:'stable'});
 assert.deepEqual(read(settleTarskiSheaf(complex,{c:'potential'}).section),{a:'absurd',b:'absurd',c:'potential'});
});
test('refuses nonmonotone restrictions and undeclared endpoints at admission',()=>{
 assert.equal(admitTarskiSheafComplex({vertices:['a'],edges:[{src:'a',tgt:'a',restrict:{...identity,absurd:'stable'}}]}).reason,'nonmonotone-restriction');
 assert.equal(admitTarskiSheafComplex({vertices:['a'],edges:[{src:'a',tgt:'b',restrict:identity}]}).reason,'invalid-edge');
});
test('all monotone FOUR restrictions settle to the least compatible assignment for every two-stalk seed',()=>{
 let count=0;
 for (const a of values) for (const p of values) for (const f of values) for (const t of values) {
  const restrict={absurd:a,potential:p,active:f,stable:t};
  if (!values.every(x=>values.every(y=>!leq(x,y)||leq(restrict[x],restrict[y])))) continue;
  count++;
  const complex=admitted(['x','y'],[{src:'x',tgt:'y',restrict}]);
  for (const x of values) for (const y of values) {
   const result=settleTarskiSheaf(complex,{x,y}); const closed=read(result.section);
   assert.equal(result.compatible,true); assert.ok(leq(x,closed.x)&&leq(y,closed.y));
   assert.deepEqual(read(settleTarskiSheaf(complex,closed).section),closed);
   for (const cx of values) for (const cy of values) if (leq(x,cx)&&leq(y,cy)&&leq(restrict[cx],cy)) {
    assert.ok(isTarskiCompatible(complex,valuation(['x','y'],{x:cx,y:cy})));
    assert.ok(leq(closed.x,cx)&&leq(closed.y,cy));
   }
  }
 }
 assert.equal(count,36);
});
