/**
 * Public presentation assurance for an already-reviewed Hearing Access route.
 * Not diagnostic, triage, suitability ranking, or commercial optimization.
 * Independent receiver checks must verify the supplied evidence receipts.
 */
const ALLOWED_EVENTS = new Set([
  'landing_view','finder_start','finder_complete','route_presented',
  'intervention_view','comparison_open','merchant_click',
  'setup_guide_open','caregiver_mode_selected'
]);
const TELEMETRY_CATEGORIES = Object.freeze({
  flow_step:['landing','finder','result','compare','merchant','followup'],
  channel:['direct','search','referral','other'],
  option_class:['free','commercial','professional'],
  outcome_class:['completed','abandoned','clicked','dismissed']
});
const DISCLOSURE = /(?:earn|receive).{0,80}(?:commission|referral fee|affiliate fee)/i;
const ISO_DATE = /^\d{4}-\d\d-\d\d(?:T\d\d:\d\d(?::\d\d)?(?:\.\d+)?(?:Z|[+-]\d\d:\d\d))?$/;
const string = x => typeof x === 'string' && x.trim().length > 0;
const object = x => x && typeof x === 'object' && !Array.isArray(x);

export function auditHearingOfferPresentation(packet) {
  const failures = [];
  const fail = (code,detail) => failures.push({code,detail});
  if (!object(packet)) return {ok:false,failures:[{code:'missing-packet',detail:'Missing packet'}]};
  const {upstream,view,telemetry=[],receiving} = packet;
  if (!object(upstream) || !string(upstream.routeId) || !string(upstream.assuranceReceipt)
      || !string(upstream.reviewAuthority) || !ISO_DATE.test(upstream.reviewedAt || ''))
    fail('unverified-upstream-route','Require upstream route, authority, date and receipt');
  const options = Array.isArray(upstream?.eligibleOptions) ? upstream.eligibleOptions : [];
  if (!options.length) fail('no-eligible-options','Require upstream eligible option set');
  const seen = new Set();
  for (const x of options) {
    if (!object(x) || !string(x.id) || seen.has(x.id) || !Number.isInteger(x.suitabilityRank)
        || x.suitabilityRank < 1 || !['free','commercial','professional'].includes(x.class)
        || !string(x.reason) || !string(x.evidenceRef))
      fail('invalid-option','Require unique id, class, rank, reason and evidence');
    if (string(x?.id)) seen.add(x.id);
  }
  const byId = new Map(options.filter(x=>object(x)&&string(x.id)).map(x=>[x.id,x]));
  const first = byId.get(view?.startHere);
  if (!first) fail('start-not-eligible','Start here must be upstream eligible');
  else {
    const ranks = options.map(x=>x?.suitabilityRank).filter(Number.isInteger);
    if (first.suitabilityRank !== Math.min(...ranks))
      fail('commercially-displaced-best-fit','Start here must reflect upstream suitability, not payout');
  }
  const alternatives = Array.isArray(view?.alternatives) ? view.alternatives : [];
  if (alternatives.some(id=>!byId.has(id))) fail('ineligible-alternative','Alternatives must be upstream eligible');
  if (options.some(x=>x?.class==='free')
      && ![view?.startHere,...alternatives,view?.freeRoute].some(id=>byId.get(id)?.class==='free'))
    fail('suppressed-free-route','At least one eligible free route must be visible');
  if (view?.freeRoute && byId.get(view.freeRoute)?.class !== 'free')
    fail('mislabelled-free-route','Free route must actually be classified free');
  if (view?.requiresAccount || view?.requiresEmail)
    fail('basic-answer-gated','Basic useful result cannot require account or email');
  if (view?.featured) {
    const x=view.featured, option=byId.get(x.id);
    if (upstream?.routeClass !== 'shopping-eligible' || option?.class !== 'commercial')
      fail('improper-commercial-route','Only admitted commercial options may receive paid placement');
    if (x.label !== 'Paid featured option' || !string(x.disclosure) || !DISCLOSURE.test(x.disclosure))
      fail('concealed-commercial-placement','Paid placement needs proximate plain-language fee disclosure');
    if (x.claimsIndependentBest || x.claimsClinicalBest || x.claimsTestProvedFit)
      fail('misleading-superlative','No independent, clinical or test-proven paid superiority claim');
    if (!string(x.selectionReceipt) || !string(x.merchantRelationshipRef))
      fail('unaccountable-commercial-selection','Require selection and relationship receipts');
  }
  if (!Array.isArray(telemetry)) fail('invalid-telemetry','Require event array');
  else for (const [i,event] of telemetry.entries()) {
    if (!object(event) || !ALLOWED_EVENTS.has(event.name)) {
      fail('tracking-event-not-approved',`Event ${i} is not an approved funnel event`); continue;
    }
    if (!object(event.fields) || Object.entries(event.fields).some(([k,v])=>
        !Object.hasOwn(TELEMETRY_CATEGORIES,k) || !TELEMETRY_CATEGORIES[k].includes(v)))
      fail('promotional-health-data-leak',`Event ${i} contains non-allowlisted tracking data`);
  }
  if (!object(receiving) || !string(receiving.remedyRoute) || !string(receiving.receiverTestReceipt)
      || !string(receiving.accessibilityTestReceipt) || !string(receiving.publicationAuthorityReceipt))
    fail('unreceived-public-remedy','Require complaint/remedy route, independent receiver, functional accessibility and publication authority receipts');
  return {ok:failures.length===0,failures};
}
