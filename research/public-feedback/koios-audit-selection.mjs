/**
 * Public -> Science: partial identification of Koios publisher structural audit.
 * A source snapshot witnesses what the publisher reports. It is not a sample
 * of independent readers, a proof of deployed page bytes, or a ruling on the
 * publication-date editorial policy. Requires trusted GitHub Gitlink readback.
 * Original work: 561-group/bare-cedar-fog#260
 * Public source: causeway-services/koios-news#4
 */
const SHA = /^[0-9a-f]{40}$/;
const UTC = /^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d+)?Z$/;
const ROUTE = /^posts\/[a-z0-9]+(?:-[a-z0-9]+)*\/index\.html$/;
const SLUG = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;
const PREDICATES = new Set(['insufficient-reporting-depth', 'missing-context-sections']);
function requireThat(ok, why) { if (!ok) throw new TypeError(why); }
function utc(s) { return typeof s === 'string' && UTC.test(s) && Number.isFinite(Date.parse(s)); }
function pinOK(pin) {
  return pin?.parentRepo === 'causeway-services/koios-news' && SHA.test(pin.parentCommit) &&
    pin.gitlinkPath === 'data' && SHA.test(pin.dataCommit) &&
    pin.dataRepo === 'causeway-services/koios-news-data' &&
    pin.path === 'feedback/latest.json' && SHA.test(pin.blobSha);
}
/** The callback MUST validate parent commit -> Gitlink -> data commit -> blob. */
export function identifyKoiosAuditPopulation({pin, feedback}, {verifyProvider} = {}) {
  requireThat(pinOK(pin), 'complete immutable parent/Gitlink/data/blob pin required');
  requireThat(feedback?.kind === 'koios.news.observed-feedback/v1' && utc(feedback.observedAt), 'dated publisher feedback required');
  const routes = feedback.sensors?.publication?.articleRoutes;
  const audits = feedback.articles;
  requireThat(Array.isArray(routes) && Array.isArray(audits), 'publisher route frame and audit population required');
  requireThat(routes.every(r => typeof r === 'string' && ROUTE.test(r)) &&
    new Set(routes).size === routes.length, 'duplicate or noncanonical manifest routes');
  requireThat(audits.every(a => a && SLUG.test(a.slug) && typeof a.ok === 'boolean' &&
    Number.isSafeInteger(a.words) && a.words >= 0 && Number.isSafeInteger(a.sections) && a.sections >= 0 &&
    Array.isArray(a.failures) && a.failures.every(f => typeof f === 'string' && f.length > 0) &&
    new Set(a.failures).size === a.failures.length), 'malformed structural audit');
  requireThat(new Set(audits.map(a => a.slug)).size === audits.length, 'duplicate audit identity');
  const issue = feedback.sensors?.editorialFeedback?.issues?.find(x => x.number === 4);
  requireThat(issue?.url === 'https://github.com/causeway-services/koios-news/issues/4' &&
    typeof issue.body === 'string', 'original reported issue required');
  const issueCounts = [...issue.body.matchAll(/\b(\d+) published articles lack the current minimum depth or contextual sections\./g)];
  requireThat(issueCounts.length === 1 && Number.isSafeInteger(Number(issueCounts[0][1])), 'unique numerical issue report required');
  const match = issue.body.match(/^Observed (\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d+)?Z)\.$/m);
  const issueAt = match?.[1] ?? null;
  requireThat(issueAt === null || utc(issueAt), 'invalid embedded issue observation clock');
  let authenticated = false;
  try { authenticated = typeof verifyProvider === 'function' && verifyProvider({pin, feedback}) === true; }
  catch { authenticated = false; }
  if (!authenticated) return Object.freeze({schema:'public-science-selection/v0.1',
    sourceIntegrity:'unverified',bounds:null,readerOutcomes:'unmeasured',scienceDecision:'unadjudicated',
    engineeringSpecificationAuthorized:false});
  const declared = new Set(routes);
  const joined = audits.filter(a => declared.has('posts/' + a.slug + '/index.html'));
  const joinedRoutes = new Set(joined.map(a => 'posts/' + a.slug + '/index.html'));
  const unassessed = routes.filter(r => !joinedRoutes.has(r));
  const outside = audits.filter(a => !declared.has('posts/' + a.slug + '/index.html')).map(a => a.slug);
  const flagged = joined.filter(a => !a.ok);
  const allFlagged = audits.filter(a => !a.ok);
  const contradictory = audits.some(a => a.ok !== (a.failures.length === 0) ||
    a.failures.some(f => !PREDICATES.has(f)));
  const producerAgreement = Number(issueCounts[0][1]) === allFlagged.length;
  const admissible = !contradictory && producerAgreement && declared.size > 0;
  // No missing-at-random assumption: assign ALL unassessed routes first to
  // pass, then to fail. These are tight logical bounds for the declared frame.
  const bounds = admissible ? Object.freeze({
    declaredRouteCount:declared.size, auditedInFrame:joined.length,
    unassessedCount:unassessed.length, assessedDeficient:flagged.length,
    minDeficientCount:flagged.length, maxDeficientCount:flagged.length+unassessed.length,
    minDeficientShare:flagged.length/declared.size,
    maxDeficientShare:(flagged.length+unassessed.length)/declared.size,
    auditedDeficientShare:joined.length ? flagged.length/joined.length : null,
    denominator:'publisher-declared unique publication routes',
    selectionMechanism:'unknown; missing-at-random NOT assumed',
    outcome:'publisher structural predicate only; no independent customer outcome'
  }) : null;
  const issueAgeSeconds = issueAt === null ? null : (Date.parse(feedback.observedAt)-Date.parse(issueAt))/1000;
  return Object.freeze({schema:'public-science-selection/v0.1',
    workRef:'561-group/bare-cedar-fog#260',publicWorkRef:'causeway-services/koios-news#4',
    sourceIntegrity:'authenticated publisher bytes; NOT independent reader evidence',
    parentCommit:pin.parentCommit,dataCommit:pin.dataCommit,feedbackBlob:pin.blobSha,
    collectorObservedAt:feedback.observedAt,issueObservedAt:issueAt,
    issueAgeSeconds,issueTimeStatus:issueAgeSeconds===null?'unavailable':issueAgeSeconds<0?'contradictory-future-issue':'retained-or-same-clock',
    producerReportedDeficiencies:Number(issueCounts[0][1]),producerAssayDeficiencies:allFlagged.length,
    producerCountsAgree:producerAgreement,assayPredicatesConsistent:!contradictory,
    declaredRoutes:declared.size,assessedInFrame:joined.length,
    unassessedDeclaredRoutes:unassessed,assessmentsOutsideFrame:outside.sort(),bounds,
    pageBytesVerified:false,readerOutcomes:'unmeasured',historicalPolicyCompliance:'unadjudicated',
    scientificHypothesis:'unadjudicated',engineeringSpecificationAuthorized:false,
    nextEvidence:'Authenticate publisher-assigned profile/effective policy and independently versioned article bytes; recruit consenting readers before comprehension inference.'
  });
}
