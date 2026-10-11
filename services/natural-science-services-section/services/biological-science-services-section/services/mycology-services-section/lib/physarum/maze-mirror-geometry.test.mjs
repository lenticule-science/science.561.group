import test from 'node:test';
import assert from 'node:assert/strict';
import {assayMirrorPair} from './maze-mirror-geometry.mjs';

const base = () => ({
  frame:{axis:'x',axisAtMm:0,scienceRevision:'candidate-science-rev-1',coordinateFrameId:'candidate-local-frame'},
  targets:[{id:'forced-turn',toleranceMm:0.15},{id:'choice-junction',toleranceMm:0.15}],
  left:{unitId:'printed-left-1',scienceRevision:'candidate-science-rev-1',coordinateFrameId:'candidate-local-frame',landmarks:[
    {id:'forced-turn',xMm:-3,yMm:5,uncertaintyMm:0.02},
    {id:'choice-junction',xMm:-5,yMm:10,uncertaintyMm:0.02}]},
  right:{unitId:'printed-right-1',scienceRevision:'candidate-science-rev-1',coordinateFrameId:'candidate-local-frame',landmarks:[
    {id:'forced-turn',xMm:3.05,yMm:5.02,uncertaintyMm:0.02},
    {id:'choice-junction',xMm:5.03,yMm:10.01,uncertaintyMm:0.02}]}
});
const check=(name,mutate,reason,positive=false)=>test(name,()=>{
  const input=base(); mutate(input);
  const out=assayMirrorPair(input);
  assert.equal(out.status,positive?'CANDIDATE_NEEDS_INDEPENDENT_MEASUREMENT_AND_ASSAY':'METROLOGY_HOLD');
  if(reason)assert.ok(out.reasons.includes(reason), JSON.stringify(out));
});
check('synthetic mirror coordinates are candidate only',()=>{},null,true);
check('both physical units cannot be same id',x=>x.right.unitId=x.left.unitId,'distinct_print_unit_ids_required');
check('science frame cannot be missing',x=>delete x.frame,'science_owned_mirror_frame_required');
check('frame id must be recorded',x=>x.frame.coordinateFrameId='TBD','science_owned_mirror_frame_required');
check('science revision must match prints',x=>x.right.scienceRevision='stale','science_revision_mismatch');
check('calibration frame mismatch cannot be compared',x=>x.left.coordinateFrameId='camera-pixels','coordinate_frame_mismatch');
check('same handedness cannot fake mirrored pair',x=>x.right.landmarks=x.left.landmarks.map(p=>({...p})),'reflection_out_of_tolerance:forced-turn');
check('missing landmark rejects a pair',x=>x.right.landmarks.pop(),'missing_pair_landmark:choice-junction');
check('extra undeclared landmark rejects a pair',x=>x.left.landmarks.push({id:'wall',xMm:0,yMm:2,uncertaintyMm:0.01}),'undeclared_or_missing_landmark');
check('duplicate landmark rejects a pair',x=>x.left.landmarks.push({...x.left.landmarks[0]}),'left_invalid_or_duplicate_measurement');
check('nonfinite measurement rejects a pair',x=>x.left.landmarks[0].xMm=NaN,'left_invalid_or_duplicate_measurement');
check('negative uncertainty rejects a pair',x=>x.right.landmarks[0].uncertaintyMm=-0.1,'right_invalid_or_duplicate_measurement');
check('unreasonable tolerance is rejected',x=>x.targets[0].toleranceMm=0,'invalid_or_duplicate_target');
check('missing target set rejected',x=>x.targets=[],'at_least_two_frozen_landmarks_required');
check('axis uncertainty guard band rejects edge',x=>x.right.landmarks[0].xMm=3.13,'reflection_out_of_tolerance:forced-turn');
check('y-axis error is independently constrained',x=>x.right.landmarks[0].yMm=5.14,'reflection_out_of_tolerance:forced-turn');
check('a symmetric centerline cannot prove handedness',x=>{
  for(const u of [x.left,x.right])for(const p of u.landmarks){p.xMm=0;p.uncertaintyMm=0.02;}
},'mirror_handedness_not_demonstrated');
check('single mirrored point insufficient',x=>{x.targets=x.targets.slice(0,1);for(const u of [x.left,x.right])u.landmarks=u.landmarks.slice(0,1)},'at_least_two_frozen_landmarks_required');
check('y-axis mirror is valid with appropriate coords',x=>{
  x.frame.axis='y';
  x.left.landmarks=[{id:'forced-turn',xMm:2,yMm:-3,uncertaintyMm:0.01},{id:'choice-junction',xMm:4,yMm:-5,uncertaintyMm:0.01}];
  x.right.landmarks=[{id:'forced-turn',xMm:2,yMm:3,uncertaintyMm:0.01},{id:'choice-junction',xMm:4,yMm:5,uncertaintyMm:0.01}];
},null,true);
