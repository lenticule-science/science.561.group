/**
 * Candidate Science instrument: prevent evidence from different service effects
 * from being aggregated into a fictional completed outcome.
 * This checks only structural coverage. It does not authenticate evidence,
 * authorize effects, test user comprehension, or accept customer delivery.
 */
const nonempty = x => typeof x === 'string' && x.trim().length > 0;

export function assayEvidenceCohorts({workRef, requiredStages, events}) {
  if (!nonempty(workRef) || !Array.isArray(requiredStages) || requiredStages.length === 0 ||
      !requiredStages.every(nonempty) || new Set(requiredStages).size !== requiredStages.length ||
      !Array.isArray(events) || events.length > 10000) {
    throw new TypeError('invalid evidence-cohort input');
  }
  const allowed = new Set(requiredStages);
  const seenIds = new Set();
  const groups = new Map();
  const union = new Set();
  for (const row of events) {
    if (!row || !nonempty(row.evidenceId) || !nonempty(row.effectRef) ||
        !allowed.has(row.stage) || !['pass','fail','unknown'].includes(row.verdict)) {
      throw new TypeError('invalid evidence-cohort event');
    }
    if (Object.hasOwn(row, 'workRef') && row.workRef !== workRef) throw new TypeError('work reference mismatch');
    if (seenIds.has(row.evidenceId)) throw new TypeError('reused evidence identity');
    seenIds.add(row.evidenceId);
    const group = groups.get(row.effectRef) ?? {passed:new Set(), failed:new Set(), unknown:new Set()};
    group[row.verdict === 'pass' ? 'passed' : row.verdict === 'fail' ? 'failed' : 'unknown'].add(row.stage);
    groups.set(row.effectRef, group);
    if (row.verdict === 'pass') union.add(row.stage);
  }
  const effects = [...groups].map(([effectRef,g]) => {
    const uncontested = requiredStages.filter(s => g.passed.has(s) && !g.failed.has(s));
    const missing = requiredStages.filter(s => !uncontested.includes(s));
    const contradicted = requiredStages.filter(s => g.passed.has(s) && g.failed.has(s));
    return {effectRef, uncontested, missing, contradicted,
      structurallyComplete: missing.length === 0};
  }).sort((a,b)=>a.effectRef.localeCompare(b.effectRef));
  const completeEffects=effects.filter(x=>x.structurallyComplete).map(x=>x.effectRef);
  return {
    schema:'lenticule/evidence-cohort-assay/v1',workRef,
    effects,completeEffects,
    unionCoverage:requiredStages.filter(s=>union.has(s)),
    crossEffectSpliceRisk:completeEffects.length===0 && requiredStages.every(s=>union.has(s)),
    limit:'Structural cohort coverage only; authenticated binding, real service effects and independent customer acceptance remain unverified.'
  };
}
