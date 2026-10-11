/**
 * Public → Science evidence admission, v0.3. No Science decision, customer
 * acceptance, engineering specification, or public publication is conferred.
 */
const STATUS = new Set(['observed', 'reported', 'contested']);
const METHODS = new Set(['public-readback', 'provider-receipt', 'reported-issue', 'customer-report']);
const OUTCOMES = new Set(['public_surface', 'reported_service', 'not_delivered', 'unknown']);
const RIGHTS = new Set(['public', 'restricted']);
const HEX = /^[a-f0-9]{40}$/;
const REF = /^(?:[\w.-]+\/[\w.-]+#\d+|ni:\/\/\/sha-256;[A-Za-z0-9_-]+)$/;
function assert(condition, message) { if (!condition) throw new TypeError(message); }
function nonempty(value) { return typeof value === 'string' && value.trim().length > 0; }
// Coesite and Science must agree on which observations name possible instants.
// Date.parse alone normalizes impossible Gregorian days, 24:00, and excessive fractional digits.
const INSTANT = /^(\d{4})-(\d{2})-(\d{2})T([01]\d|2[0-3]):([0-5]\d):([0-5]\d)(?:\.(\d{1,9}))?(Z|[+-](?:0\d|1[0-4]):[0-5]\d)$/u;
function timestamp(value) {
  const m = typeof value === 'string' ? INSTANT.exec(value) : null;
  if (!m) return false;
  const year = Number(m[1]), month = Number(m[2]), day = Number(m[3]);
  const leap = year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
  const days = [31, leap ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (month < 1 || month > 12 || day < 1 || day > days[month - 1]) return false;
  const offset = m[8];
  if (offset !== 'Z' && Number(offset.slice(1, 3)) === 14 && offset.slice(4) !== '00') return false;
  return Number.isFinite(Date.parse(value));
}
function url(value) { try { const u=new URL(value); return u.protocol === 'https:' && !u.username && !u.password && !u.search && !u.hash; } catch { return false; } }
function validate(row, {verifyObservation} = {}) {
  assert(row && typeof row === 'object' && !Array.isArray(row), 'record must be an object');
  assert(row.schema === 'public-science-feedback/v0.3', 'unsupported schema');
  assert(REF.test(row.workRef) && REF.test(row.publicWorkRef), 'stable original and public work refs required');
  assert(row.source && nonempty(row.source.repository) && nonempty(row.source.path) && HEX.test(row.source.blobSha), 'source must pin a real blob SHA');
  assert(row.hypothesis && nonempty(row.hypothesis.claim) && nonempty(row.hypothesis.falsifier) &&
    nonempty(row.hypothesis.negativeControl), 'claim, falsifier and negative control required');
  assert(row.scienceDecision && row.scienceDecision.state === 'unadjudicated' &&
    row.scienceDecision.ref === null, 'intake cannot impersonate a Science decision');
  assert(row.kind === 'challenge' || row.kind === 'new_feature', 'invalid feedback kind');
  assert(row.outcome && OUTCOMES.has(row.outcome.kind) && nonempty(row.outcome.detail), 'service outcome required');
  assert(row.outcome.receiverStatus === 'unverified', 'independent customer acceptance requires an external provider verifier, never intake self-certification');
  assert(nonempty(row.sourcePrincipal), 'source principal required');
  assert(row.rights && RIGHTS.has(row.rights.visibility), 'rights classification required');
  assert(Array.isArray(row.observations) && row.observations.length > 0, 'observations required');
  const ids = new Set();
  for (const o of row.observations) {
    assert(nonempty(o.id) && !ids.has(o.id), 'unique observation id required'); ids.add(o.id);
    assert(STATUS.has(o.status) && timestamp(o.at) && nonempty(o.detail), 'invalid observation');
    assert(Array.isArray(o.evidence) && o.evidence.length > 0, 'evidence required');
    for (const e of o.evidence) {
      assert(METHODS.has(e.method) && url(e.url) && nonempty(e.observer), 'evidence provenance required');
      if (o.status === 'observed')
        assert(e.method === 'public-readback' || e.method === 'provider-receipt', 'reported evidence cannot count as observed');
      if (e.method === 'provider-receipt') assert(nonempty(e.providerReceipt), 'missing provider receipt');
      if (o.status === 'observed') {
        let authenticated = false;
        if (typeof verifyObservation === 'function') {
          try {
            authenticated = verifyObservation({
              workRef: row.workRef, publicWorkRef: row.publicWorkRef,
              source: row.source, observation: o, evidence: e
            }) === true;
          } catch { authenticated = false; }
        }
        assert(authenticated, 'observed evidence lacks independent authenticated readback');
      }
    }
  }
  assert(!('engineeringSpec' in row) && !('publicationAuthorization' in row), 'source feedback does not authorize downstream effects');
  return row;
}
function admissionForValidatedRow(row) {
  const route = row.kind === 'new_feature' ? 'public-to-science' : 'public-to-science-feedback';
  return Object.freeze({
    workRef: row.workRef, publicWorkRef: row.publicWorkRef,
    sourceVersion: `${row.source.repository}:${row.source.path}@${row.source.blobSha}`,
    route, statuses: row.observations.map(o => ({id:o.id,status:o.status})),
    scienceDecision: 'unadjudicated', claimFalsified: false,
    customerAcceptance: row.outcome.receiverStatus,
    engineeringSpecificationAuthorized: false,
    next: row.kind === 'new_feature' ? 'Public→Science demand review' : 'Science falsification assay and decision'
  });
}
export function admitPublicFeedback(input, options = {}) {
  return admissionForValidatedRow(validate(input, options));
}
export function publicProjection(input, options = {}) {
  const row = validate(input, options);
  const admission = admissionForValidatedRow(row);
  if (row.rights.visibility === 'restricted')
    return Object.freeze({schema:row.schema,visibility:'restricted',observationCount:row.observations.length,scienceDecision:'unadjudicated'});
  return Object.freeze({
    schema: row.schema, workRef: row.workRef, publicWorkRef: row.publicWorkRef,
    route: admission.route, scienceDecision: admission.scienceDecision,
    customerAcceptance: admission.customerAcceptance,
    observations: row.observations.map(o => ({
      id:o.id, status:o.status,
      publicEvidence:o.status === 'observed'
        ? o.evidence.filter(e => e.method === 'public-readback').map(e => e.url)
        : []
    }))
  });
}

/**
 * Compare a reported/publisher-readback article snapshot to a CURRENT pinned
 * editorial quality target. This is NOT a reader-outcome experiment and does
 * not establish that today's target bound an older article at publication.
 * A caller authenticates both policy provenance and article readback; the
 * row's self-asserted provenance cannot certify either.
 */
export function assessCurrentEditorialTarget(snapshot, policy, {verifyPolicy, verifyArticle} = {}) {
  assert(snapshot && typeof snapshot === 'object' && !Array.isArray(snapshot), 'article snapshot required');
  assert(policy && typeof policy === 'object' && !Array.isArray(policy), 'editorial policy required');
  assert(snapshot.articleUrl && url(snapshot.articleUrl), 'safe article URL required');
  const profile = snapshot.profile;
  const budget = policy.profiles?.[profile]?.evidenceBudget;
  const policyIsReal = typeof verifyPolicy === 'function' && (() => {
    try { return verifyPolicy(policy) === true; } catch { return false; }
  })();
  const articleVersionPinned = typeof snapshot.articleVersionDigest === 'string' &&
    /^(?:[a-f0-9]{64}|ni:\/\/\/sha-256;[A-Za-z0-9_-]+)$/.test(snapshot.articleVersionDigest) &&
    timestamp(snapshot.versionObservedAt);
  const metricsPresent = Number.isSafeInteger(snapshot.bodyWords) && snapshot.bodyWords >= 0 &&
    Number.isSafeInteger(snapshot.contextSections) && snapshot.contextSections >= 0;
  const hasTarget = budget && Number.isSafeInteger(budget.targetWords?.minimum) &&
    Number.isSafeInteger(budget.minimumSections);
  const profileBound = snapshot.profileEvidence === 'publisher-profile-receipt';
  let metricsAuthenticated = false;
  if (typeof verifyArticle === 'function') {
    try { metricsAuthenticated = verifyArticle(snapshot) === true; } catch { metricsAuthenticated = false; }
  }
  const comparable = Boolean(policyIsReal && articleVersionPinned && metricsPresent && hasTarget && profileBound);
  const gap = comparable
    ? {wordsBelow: snapshot.bodyWords < budget.targetWords.minimum,
       sectionsBelow: snapshot.contextSections < budget.minimumSections}
    : null;
  const observed = comparable && metricsAuthenticated;
  return Object.freeze({
    classification: observed ? 'observed-current-target' : comparable ? 'reported-current-target' : 'indeterminate',
    profile: profile ?? null,
    currentTargetGap: gap === null ? 'unknown' : (gap.wordsBelow || gap.sectionsBelow),
    gapDetails: gap,
    articleMetricsAuthenticated: observed,
    historicalPolicyBreach: 'unassessed',
    readerComprehensionImpact: 'unmeasured',
    next: !comparable ? 'Authenticate policy version, publisher profile, immutable article version, and comparable metrics'
      : !observed ? 'Obtain authenticated version-matched article readback'
      : 'Study reader comprehension with preregistered controls before causal claims'
  });
}
