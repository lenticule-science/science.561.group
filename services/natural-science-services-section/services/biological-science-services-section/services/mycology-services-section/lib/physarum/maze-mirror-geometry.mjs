/**
 * Candidate pairwise reflection metrology for Physarum #27.
 * Checks a declared science-owned mirror frame against independently recorded
 * per-unit landmark coordinates. It cannot authenticate measurements, infer
 * geometry from STL files, or grant Science/Engineering receiving.
 */
const finite = x => typeof x === 'number' && Number.isFinite(x);
const ident = x => typeof x === 'string' && x.trim().length > 0 &&
  !/^(?:unknown|tbd|pending|unverified|fixture-only)$/i.test(x.trim());

export function assayMirrorPair({frame, left, right, targets} = {}) {
  const failures = [];
  if (!frame || !['x','y'].includes(frame.axis) || !finite(frame.axisAtMm) ||
      !ident(frame.scienceRevision) || !ident(frame.coordinateFrameId))
    failures.push('science_owned_mirror_frame_required');
  if (!left || !right || !ident(left.unitId) || !ident(right.unitId) ||
      left.unitId===right.unitId) failures.push('distinct_print_unit_ids_required');
  if (left?.scienceRevision!==frame?.scienceRevision || right?.scienceRevision!==frame?.scienceRevision)
    failures.push('science_revision_mismatch');
  if (left?.coordinateFrameId!==frame?.coordinateFrameId ||
      right?.coordinateFrameId!==frame?.coordinateFrameId)
    failures.push('coordinate_frame_mismatch');
  if (!Array.isArray(targets) || targets.length<2) failures.push('at_least_two_frozen_landmarks_required');
  const targetMap=new Map();
  if (Array.isArray(targets)) for (const t of targets) {
    if(!ident(t?.id)||targetMap.has(t.id)||!finite(t.toleranceMm)||t.toleranceMm<=0)
      failures.push('invalid_or_duplicate_target');
    else targetMap.set(t.id,t.toleranceMm);
  }
  const makeMap=(u,label)=>{
    const map=new Map();
    if(!Array.isArray(u?.landmarks)||!u.landmarks.length) failures.push(label+'_measurements_required');
    else for(const p of u.landmarks) {
      if(!ident(p?.id)||map.has(p.id)||![p.xMm,p.yMm,p.uncertaintyMm].every(finite)||p.uncertaintyMm<0)
        failures.push(label+'_invalid_or_duplicate_measurement');
      else map.set(p.id,p);
    }
    return map;
  };
  const lm=makeMap(left,'left'),rm=makeMap(right,'right');
  const residuals=[];
  let demonstrablyOffAxis=false;
  for(const [id,toleranceMm] of targetMap) {
    const l=lm.get(id),r=rm.get(id);
    if(!l||!r){failures.push('missing_pair_landmark:'+id);continue;}
    if(frame && ['x','y'].includes(frame.axis) && finite(frame.axisAtMm)) {
      const side=frame.axis;
      const expected={xMm:l.xMm,yMm:l.yMm};
      const key=side==='x'?'xMm':'yMm';
      expected[key]=2*frame.axisAtMm-expected[key];
      const allowance=l.uncertaintyMm+r.uncertaintyMm;
      const errorX=Math.abs(expected.xMm-r.xMm);
      const errorY=Math.abs(expected.yMm-r.yMm);
      const passX=errorX+allowance<=toleranceMm+1e-12;
      const passY=errorY+allowance<=toleranceMm+1e-12;
      residuals.push({id,errorXmm:errorX,errorYmm:errorY,uncertaintyBudgetMm:allowance,toleranceMm,passX,passY});
      if(!passX||!passY) failures.push('reflection_out_of_tolerance:'+id);
      const offAxis=Math.abs(l[key]-frame.axisAtMm);
      if(offAxis>allowance+toleranceMm) demonstrablyOffAxis=true;
    }
  }
  if(lm.size!==targetMap.size || rm.size!==targetMap.size ||
      [...lm.keys()].some(id=>!targetMap.has(id)) || [...rm.keys()].some(id=>!targetMap.has(id)))
    failures.push('undeclared_or_missing_landmark');
  if(!demonstrablyOffAxis) failures.push('mirror_handedness_not_demonstrated');
  return {status:failures.length?'METROLOGY_HOLD':'CANDIDATE_NEEDS_INDEPENDENT_MEASUREMENT_AND_ASSAY',
    reasons:[...new Set(failures)], residuals};
}
