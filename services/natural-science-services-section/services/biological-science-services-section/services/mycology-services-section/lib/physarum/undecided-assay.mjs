/**
 * Lenticule Science #27: outcome admission and nondecision sensitivity.
 * Synthetic mathematical counterexample only; no measured Physarum effect.
 */
export const WORK_REF = 'lenticule-science/science-services-section#27';
export const OUTCOMES = Object.freeze(['alternate','repeat','undecided','both_arms']);
const mandatory = (value,field) => {
  if (typeof value !== 'string' || !value.trim()) throw new TypeError(field + ' is required');
};
export function assayTrials(rows) {
  if (!Array.isArray(rows) || !rows.length) throw new TypeError('nonempty trials required');
  const counts = {alternate:0,repeat:0,undecided:0,both_arms:0};
  const ids = new Set(), strata = new Map(), kinds = new Set();
  for (const row of rows) {
    for (const field of ['trialId','workRef','sourceRevision','geometryVersion','apparatusUnit','sessionId']) {
      mandatory(row?.[field],field);
    }
    if (row.workRef !== WORK_REF) throw new Error('wrong work_ref');
    if (ids.has(row.trialId)) throw new Error('duplicate trialId');
    ids.add(row.trialId);
    if (!['synthetic','observed'].includes(row.dataKind)) throw new TypeError('invalid dataKind');
    kinds.add(row.dataKind);
    if (kinds.size > 1) throw new Error('synthetic and observed data cannot be pooled');
    if (row.dataKind === 'observed') {
      for (const field of ['preregistrationRef','protocolRevision','observationSourceRef']) {
        mandatory(row[field],field);
      }
    }
    if (!['left','right'].includes(row.forcedTurn)) throw new TypeError('invalid forcedTurn');
    if (!['north','east','south','west'].includes(row.orientation)) throw new TypeError('invalid orientation');
    if (!Number.isFinite(row.distanceMm) || row.distanceMm <= 0) throw new TypeError('invalid distanceMm');
    if (!OUTCOMES.includes(row.outcome)) throw new TypeError('invalid outcome');
    counts[row.outcome]++;
    const key = JSON.stringify([row.geometryVersion,row.distanceMm,row.forcedTurn,row.orientation,row.sessionId]);
    if (!strata.has(key)) strata.set(key,{alternate:0,repeat:0,undecided:0,both_arms:0});
    strata.get(key)[row.outcome]++;
  }
  const summarize = c => {
    const total = OUTCOMES.reduce((n,k)=>n+c[k],0), decisive = c.alternate+c.repeat;
    return {...c,total,decisive,alternateAmongDecisive:decisive?c.alternate/decisive:null,
      notDecisive:c.undecided+c.both_arms};
  };
  return {schemaVersion:'lenticule-physarum-nondecision/v1',workRef:WORK_REF,
    dataKind:rows[0].dataKind,overall:summarize(counts),
    byStratum:[...strata].map(([key,c])=>({key,...summarize(c)})),
    status:'SOURCE-LEVEL-ASSAY-ONLY'};
}
/** Hypothetical binary-potential sensitivity interval; not a CI or memory estimator. */
export function binaryCompletionBound({alternate,repeat,undecided,both_arms}) {
  for (const n of [alternate,repeat,undecided,both_arms]) {
    if (!Number.isSafeInteger(n) || n<0) throw new TypeError('counts must be nonnegative integers');
  }
  if (both_arms>0 || alternate+repeat+undecided===0) return null;
  const n=alternate+repeat+undecided;
  return {lower:alternate/n,upper:(alternate+undecided)/n,
    hypothesis:'unverified latent binary choice for undecided trials ONLY'};
}
