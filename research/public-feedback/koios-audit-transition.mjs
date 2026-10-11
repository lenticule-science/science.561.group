/**
 * Cross-snapshot Public -> Science producer-audit comparison.
 * Compares *records* of repeated producer assays, not independently sampled
 * readers, live website bytes, or policy compliance. A refreshed issue clock
 * must not be mistaken for an improved article or a new field sample.
 * workRef: 561-group/bare-cedar-fog#260
 * publicWorkRef: causeway-services/koios-news#4
 */
const HEX40 = /^[a-f0-9]{40}$/;
const TIME = /^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d+)?Z$/;
const SLUG = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;
const ROUTE = /^posts\/[a-z0-9]+(?:-[a-z0-9]+)*\/index\.html$/;
const assert = (condition, message) => { if (!condition) throw new TypeError(message); };
function stamp(value) {
  assert(typeof value === 'string' && TIME.test(value) && Number.isFinite(Date.parse(value)),
    'UTC snapshot observation timestamp required');
  return Date.parse(value);
}
function canonical(article) {
  assert(article && SLUG.test(article.slug), 'canonical article slug required');
  assert(typeof article.ok === 'boolean' && Number.isSafeInteger(article.words) && article.words >= 0 &&
    Number.isSafeInteger(article.sections) && article.sections >= 0 && Array.isArray(article.failures) &&
    article.failures.every(s => typeof s === 'string' && s.length > 0), 'bounded structural assay required');
  assert(new Set(article.failures).size === article.failures.length, 'duplicate failure tags');
  assert(article.ok === (article.failures.length === 0), 'structurally contradictory assay');
  // Exclude transient local absolute paths, prose, observation clock, and
  // provider status: not independently proven publication versions.
  return [article.ok, article.words, article.sections, [...article.failures].sort()];
}
function structural(snapshot) {
  assert(snapshot?.kind === 'koios.news.observed-feedback/v1', 'expected feedback kind');
  const ms = stamp(snapshot.observedAt);
  const routes = snapshot.sensors?.publication?.articleRoutes;
  const articles = snapshot.articles;
  assert(Array.isArray(routes) && Array.isArray(articles), 'publication routes and audited articles required');
  assert(routes.every(x => typeof x === 'string' && ROUTE.test(x)) &&
    new Set(routes).size === routes.length, 'publisher route set must be unique and canonical');
  const rows = new Map();
  for (const a of articles) {
    const v = canonical(a);
    assert(!rows.has(a.slug), 'duplicate slug must not count as independent article');
    rows.set(a.slug,v);
  }
  const issue = snapshot.sensors?.editorialFeedback?.issues?.find(x=>x.number===4);
  assert(issue?.url === 'https://github.com/causeway-services/koios-news/issues/4' &&
    typeof issue.body === 'string', 'source issue #4 required');
  const found = [...issue.body.matchAll(/\b(\d+) published articles lack the current minimum depth or contextual sections\./g)];
  assert(found.length === 1, 'single versioned reported issue count required');
  const n = Number(found[0][1]);
  assert(Number.isSafeInteger(n) && n >= 0, 'safe issue count required');
  const flagCount = articles.filter(a => !a.ok).length;
  const routeSet = new Set(routes);
  return {ms,rows,routes:routeSet,issueCount:n,flagCount,
    eligibleCount:articles.length, unassessedRoutes:[...routeSet].filter(x=>!rows.has(x.slice(6,-11))).length};
}
function provenance(pin) {
  assert(pin?.websiteRepo === 'causeway-services/koios-news' && HEX40.test(pin.websiteCommit) &&
    pin.gitlinkPath === 'data' && HEX40.test(pin.gitlinkTarget) &&
    pin.feedbackRepo === 'causeway-services/koios-news-data' &&
    pin.feedbackPath === 'feedback/latest.json' && HEX40.test(pin.feedbackBlob) &&
    pin.gitlinkTarget === pin.feedbackCommit, 'complete Gitlink-bound source provenance required');
}
function trusted(fn,pin,snapshot) {
  try { return typeof fn==='function' && fn({pin,snapshot}) === true; }
  catch { return false; }
}
export function compareKoiosProducerAudits({earlier,later}, {verifyCarrier}={}) {
  assert(earlier?.pin && later?.pin, 'both source pins required');
  provenance(earlier.pin);provenance(later.pin);
  const a=structural(earlier.feedback),b=structural(later.feedback);
  assert(b.ms>a.ms, 'later observation must strictly follow earlier observation');
  const authenticated=trusted(verifyCarrier,earlier.pin,earlier.feedback) &&
    trusted(verifyCarrier,later.pin,later.feedback);
  const base=Object.freeze({
    schema:'public-science-producer-transition/v0.1',
    workRef:'561-group/bare-cedar-fog#260',publicWorkRef:'causeway-services/koios-news#4',
    earlierObservedAt:earlier.feedback.observedAt,laterObservedAt:later.feedback.observedAt,
    intervalSeconds:(b.ms-a.ms)/1000,
    sourceIntegrity:authenticated?'two-authenticated-publisher-snapshots':'unverified',
    independentFieldObservations:0,customerOutcomes:'unmeasured',
    historicalPolicyCompliance:'unadjudicated',
    scienceDecision:'unadjudicated',engineeringSpecificationAuthorized:false
  });
  if(!authenticated)return Object.freeze({...base,producerComparison:'unavailable'});
  const all = new Set([...a.rows.keys(),...b.rows.keys()]);
  const added=[],removed=[],changed=[];
  for (const slug of all){
    if(!a.rows.has(slug))added.push(slug);
    else if(!b.rows.has(slug))removed.push(slug);
    else if(JSON.stringify(a.rows.get(slug))!==JSON.stringify(b.rows.get(slug)))changed.push(slug);
  }
  const addedRoutes=[...b.routes].filter(x=>!a.routes.has(x));
  const removedRoutes=[...a.routes].filter(x=>!b.routes.has(x));
  return Object.freeze({...base,
    producerComparison:'authenticated-repeated-producer-assays-not-independent-readership',
    earlier:{publishedRoutes:a.routes.size,assessedArticles:a.eligibleCount,
      reportedIssueCount:a.issueCount,structurallyFlagged:a.flagCount},
    later:{publishedRoutes:b.routes.size,assessedArticles:b.eligibleCount,
      reportedIssueCount:b.issueCount,structurallyFlagged:b.flagCount},
    changedArticleAssayCount:changed.length,changedArticleSlugs:changed.sort(),
    addedArticleAssays:added.sort(),removedArticleAssays:removed.sort(),
    addedPublishedRoutes:addedRoutes.sort(),removedPublishedRoutes:removedRoutes.sort(),
    identicalAssayRows:changed.length===0&&added.length===0&&removed.length===0,
    identicalManifestRoutes:addedRoutes.length===0&&removedRoutes.length===0,
    unchangedReportedIssueCount:a.issueCount===b.issueCount,
    issueReportAgreesWithAssays:a.issueCount===a.flagCount&&b.issueCount===b.flagCount,
    sourceVersionMatch:'unknown-not-identified-by-producer-assay-records',
    interpretation:'Repeated publisher measurements can corroborate stable producer-reported structure, not evidence-equivalent public article bytes or reader outcomes'
  });
}
