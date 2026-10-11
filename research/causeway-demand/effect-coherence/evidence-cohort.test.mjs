import test from 'node:test';
import assert from 'node:assert/strict';
import {assayEvidenceCohorts} from './evidence-cohort.mjs';
const stages=['discovery','noAccount','keyboard','screenReader','authority','delivery','acknowledgement'];
const mk=(stage,effectRef='rev-A',verdict='pass')=>({evidenceId:`${stage}/${effectRef}/${verdict}`,effectRef,stage,verdict});
const q=events=>assayEvidenceCohorts({workRef:'causeway-services/koios-news-site#16',requiredStages:stages,events});
test('one effect with all seven facets is structurally complete, not customer accepted',()=>{
 const r=q(stages.map(s=>mk(s)));assert.deepEqual(r.completeEffects,['rev-A']);assert.match(r.limit,/unverified/);
});
test('spliced stages from unrelated revisions never establish one complete effect',()=>{
 const r=q(stages.map((s,i)=>mk(s,i<4?'rev-A':'rev-B')));
 assert.deepEqual(r.completeEffects,[]);assert.equal(r.crossEffectSpliceRisk,true);
 assert.equal(r.unionCoverage.length,7);assert.equal(r.effects.length,2);
});
test('missing stage is incomplete and cannot be silently filled by another effect',()=>{
 const r=q(stages.slice(0,-1).map(s=>mk(s)));assert.equal(r.effects[0].structurallyComplete,false);assert.deepEqual(r.effects[0].missing,['acknowledgement']);
});
test('contradictory pass/fail for same effect and stage blocks completion',()=>{
 const r=q([...stages.map(s=>mk(s)),mk('delivery','rev-A','fail')]);
 assert.deepEqual(r.completeEffects,[]);assert.deepEqual(r.effects[0].contradicted,['delivery']);
});
test('a completed effect and a separate incomplete effect do not contaminate each other',()=>{
 const r=q([...stages.map(s=>mk(s)),mk('discovery','rev-B')]);
 assert.deepEqual(r.completeEffects,['rev-A']);assert.equal(r.crossEffectSpliceRisk,false);
});
test('reused evidence identifiers across effects are rejected',()=>{
 assert.throws(()=>q([mk('discovery'),{...mk('discovery','rev-B'),evidenceId:'discovery/rev-A/pass'}]),/reused evidence/);
});
test('unknown/rejected effect, malformed evidence and unlisted stages fail closed',()=>{
 assert.throws(()=>q([{evidenceId:'x',effectRef:'',stage:'discovery',verdict:'pass'}]),/invalid evidence/);
 assert.throws(()=>q([{evidenceId:'x',effectRef:'rev-A',stage:'unlisted',verdict:'pass'}]),/invalid evidence/);
 assert.throws(()=>assayEvidenceCohorts({workRef:'x',requiredStages:['same','same'],events:[]}),/invalid evidence-cohort input/);
});
test('order invariance and no evidence do not create acceptance',()=>{
 const events=stages.map(s=>mk(s));
 assert.deepEqual(q(events),q([...events].reverse()));
 const empty=q([]);assert.equal(empty.completeEffects.length,0);assert.equal(empty.unionCoverage.length,0);
});

test('explicitly different public workRef cannot be laundered into the same effect',()=>{
 const wrong={...mk('discovery'),workRef:'causeway-services/another-service#91'};
 assert.throws(()=>q([wrong]),/work reference mismatch/);
});
