/**
 * Physarum #27: exploratory, exact-binomial replication-power envelope.
 * This is NOT the power for a geometry-by-turn interaction, GLMM, or abstract-memory hypothesis.
 * Decisiveness is explicitly modeled as a separate observed outcome.
 */
const fail = (message) => { throw new RangeError(message); };
const positive = (x) => Number.isFinite(x) && x > 0;
const checkProbability = (x, name) => {
  if (!(Number.isFinite(x) && x > 0 && x <= 1)) fail(name + ' must be in (0,1]');
};
const logFactorial = [0];
const lf = n => { while (logFactorial.length <= n) logFactorial.push(logFactorial.at(-1) + Math.log(logFactorial.length)); return logFactorial[n]; };
function binomPmf(n, k, p) {
  if (k < 0 || k > n) return 0;
  if (p === 1) return k === n ? 1 : 0;
  if (p === 0) return k === 0 ? 1 : 0;
  return Math.exp(lf(n)-lf(k)-lf(n-k) + k*Math.log(p) + (n-k)*Math.log1p(-p));
}
/** Two-tailed symmetric exact binomial test: reject in both equally sized tails. */
export function exactBinomialPower(n, alternative, alpha=0.05) {
  if (!Number.isSafeInteger(n) || n < 1 || n > 10000) fail('n must be a positive bounded integer');
  if (!positive(alpha) || alpha >= 0.5) fail('alpha must be between 0 and 0.5');
  checkProbability(alternative, 'alternative');
  if (alternative < 0.5) fail('design assumes alternation above 0.5');
  let cumulative = 0, cutoff = -1;
  for (let k=0; k<=Math.floor(n/2); k++) {
    const next=cumulative + binomPmf(n,k,0.5);
    if (2*next > alpha + 1e-12) break;
    cumulative=next; cutoff=k;
  }
  if (cutoff < 0) return {n,alpha,alternative,lowerCutoff:null,upperCutoff:null,power:0};
  let power=0;
  for (let k=0; k<=cutoff; k++) power+=binomPmf(n,k,alternative);
  for (let k=n-cutoff; k<=n; k++) power+=binomPmf(n,k,alternative);
  return {n,alpha,alternative,lowerCutoff:cutoff,upperCutoff:n-cutoff,power:Math.min(1,power)};
}
export function minimumDecisiveN({alternative, targetPower=0.9, alpha=0.05, maxN=3000}={}) {
  checkProbability(alternative, 'alternative');
  if (alternative <= 0.5) fail('alternative must be above chance');
  checkProbability(targetPower,'targetPower');
  if (!Number.isSafeInteger(maxN) || maxN < 2 || maxN > 10000) fail('maxN out of bounds');
  for (let n=2; n<=maxN; n++) {
    const result=exactBinomialPower(n,alternative,alpha);
    if (result.power >= targetPower) return result;
  }
  return {status:'UNDETERMINED_WITHIN_MAX_N',maxN,targetPower,alternative};
}
export function assayObservedCounts(rows) {
  if (!Array.isArray(rows) || !rows.length) fail('condition rows required');
  const ids=new Set();
  return rows.map(r=>{
    if (!r || typeof r.id!=='string' || !r.id || ids.has(r.id)) fail('condition IDs must be unique');
    ids.add(r.id);
    for(const k of ['tested','undecided','alternating','nonalternating'])
      if (!Number.isSafeInteger(r[k]) || r[k] < 0) fail('invalid count: '+r.id+'.'+k);
    if (r.tested !== r.undecided+r.alternating+r.nonalternating || r.tested === 0)
      fail('mutually exclusive outcomes must exhaust tested: '+r.id);
    const decisive = r.alternating+r.nonalternating;
    if (decisive===0) fail('cannot estimate alternation with zero decisive trials');
    return {id:r.id,tested:r.tested,decisive,undecided:r.undecided,
      conditionalAlternation:r.alternating/decisive,
      undecidedRate:r.undecided/r.tested,
      allStartedAlternating:r.alternating/r.tested,
      decisiveRate:decisive/r.tested};
  });
}
/** Select sensitivity assumptions: yields are lower bounds, cluster factors design heuristics. */
export function startCountEnvelope({decisiveN, decisiveYieldLowerBound, designEffect=1}={}) {
  if (!Number.isSafeInteger(decisiveN) || decisiveN < 1) fail('decisiveN invalid');
  checkProbability(decisiveYieldLowerBound,'decisiveYieldLowerBound');
  if (!(Number.isFinite(designEffect) && designEffect>=1 && designEffect<=10))
    fail('designEffect must be a stated heuristic in [1,10]');
  const inflatedDecisiveTarget=Math.ceil(decisiveN*designEffect);
  return {decisiveN,decisiveYieldLowerBound,designEffect,inflatedDecisiveTarget,
    requiredStarts:Math.ceil(inflatedDecisiveTarget/decisiveYieldLowerBound),
    qualification:'EXPLORATORY_BINOMIAL_ONLY_NOT_GLMM_OR_GEOMETRY_POWER'};
}
export function geometryReadiness({frozenScienceRevision, independentAssayReceipt, originalGeometry, correctedGeometry,
  tolerances, mirroredBuild, preRegisteredContrast, undecidedEndpoint}={}) {
  const missing=[];
  for(const [key,v] of Object.entries({frozenScienceRevision,independentAssayReceipt,originalGeometry,
    correctedGeometry,tolerances,mirroredBuild,preRegisteredContrast,undecidedEndpoint})) {
    if (typeof v!=='string' || !v.trim() || /^(UNVERIFIED|UNFROZEN|UNKNOWN)$/i.test(v)) missing.push(key);
  }
  return {status: missing.length ? 'SCIENCE_HOLD':'DOCUMENTARY_CANDIDATE_REQUIRES_PROVIDER_AND_INDEPENDENT_READBACK',missing};
}
