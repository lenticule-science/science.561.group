import test from 'node:test';
import assert from 'node:assert/strict';
import {assayEvidenceCohorts} from './evidence-cohort.mjs';
test('evidence from two effects cannot be spliced into a complete receipt',()=>{
 const r=assayEvidenceCohorts({workRef:'test',requiredStages:['delivery','acknowledgement'],events:[{evidenceId:'a',effectRef:'one',stage:'delivery',verdict:'pass'},{evidenceId:'b',effectRef:'two',stage:'acknowledgement',verdict:'pass'}]});
 assert.deepEqual(r.completeEffects,[]);
 assert.equal(r.crossEffectSpliceRisk,true);
});

test('cross-work evidence cannot be relabeled into the target work',()=>{
 const input={workRef:'causeway-services/koios-news-site#16',requiredStages:['delivery'],events:[
  {evidenceId:'one',workRef:'causeway-services/another-service#91',effectRef:'A',stage:'delivery',verdict:'pass'}]};
 assert.throws(()=>assayEvidenceCohorts(input),/work reference mismatch/);
});
test('same-effect contradictory results block completion',()=>{
 const r=assayEvidenceCohorts({workRef:'x',requiredStages:['delivery'],events:[
  {evidenceId:'a',effectRef:'A',stage:'delivery',verdict:'pass'},
  {evidenceId:'b',effectRef:'A',stage:'delivery',verdict:'fail'}]});
 assert.deepEqual(r.completeEffects,[]);
 assert.deepEqual(r.effects[0].contradicted,['delivery']);
});
test('duplicate evidence identity is rejected',()=>{
 assert.throws(()=>assayEvidenceCohorts({workRef:'x',requiredStages:['delivery'],events:[
  {evidenceId:'duplicate',effectRef:'A',stage:'delivery',verdict:'pass'},
  {evidenceId:'duplicate',effectRef:'B',stage:'delivery',verdict:'pass'}]}),/reused evidence identity/);
});
