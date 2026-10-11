/**
 * Candidate Science assay, not a deployed commercial guard.
 * Tests paired invariance of customer-facing suitability decisions under
 * a perturbation of *provider remuneration only*, with verified frozen
 * consumer-relevant evidence. No private customer facts are ingested.
 * A callback returning true is only a caller assertion; independent
 * authentication must be established outside this library. Matching evidence
 * and customer pins alone does not prove terms or policy revision stayed fixed;
 * the caller's verifier must certify those exact frozen conditions.
 */
const str = x => typeof x === 'string' && x.trim().length > 0;
const object = x => x !== null && typeof x === 'object' && !Array.isArray(x);
const finiteNonnegative = x => typeof x === 'number' && Number.isFinite(x) && x >= 0;
const sorted = x => [...x].sort((a,b) => a.localeCompare(b));

function parseDecision(row) {
  if (!object(row) || !str(row.caseRef) || !str(row.evidencePin) ||
      !str(row.customerFactsPin) || !str(row.defaultOptionId) ||
      !Array.isArray(row.options) || row.options.length === 0 ||
      !Array.isArray(row.visibleOptionIds) || !object(row.payouts))
    throw new TypeError('invalid choice record');
  const byId = new Map();
  for (const x of row.options) {
    if (!object(x) || !str(x.id) || byId.has(x.id) ||
        !str(x.evidenceRef) || !['free','commercial','professional'].includes(x.optionClass) ||
        !Number.isSafeInteger(x.suitabilityRank) || x.suitabilityRank < 1)
      throw new TypeError('invalid or duplicated option');
    byId.set(x.id,x);
  }
  if (!byId.has(row.defaultOptionId) || row.visibleOptionIds.length !== new Set(row.visibleOptionIds).size ||
      !row.visibleOptionIds.every(x => str(x) && byId.has(x)) ||
      !row.visibleOptionIds.includes(row.defaultOptionId))
    throw new TypeError('invalid visible/default option');
  if (Object.keys(row.payouts).length !== byId.size ||
      [...byId.keys()].some(id => !Object.hasOwn(row.payouts,id) || !finiteNonnegative(row.payouts[id])))
    throw new TypeError('payout vector does not match option set');
  return byId;
}

// Preserve the entire fixed option record except suitabilityRank (the decision
// output being tested). In particular, changed customer price, availability,
// explanation or other customer-relevant terms defeat a payout-only contrast.
// Canonical key ordering prevents incidental JSON object-key order false alarms.
const canonical = value => {
  if (Array.isArray(value)) return value.map(canonical);
  if (object(value)) return Object.fromEntries(
    Object.entries(value).sort(([a],[b])=>a.localeCompare(b))
      .map(([key,member])=>[key,canonical(member)]));
  return value;
};
const projectFacts = options => JSON.stringify(sorted([...options.keys()]).map(id => {
  const {suitabilityRank, ...fixed}=options.get(id);
  return [id,canonical(fixed)];
}));
const projectRanking = options => JSON.stringify(sorted([...options.keys()]).map(id =>
  [id,options.get(id).suitabilityRank]));
const projectPayouts = (row, options) => JSON.stringify(sorted([...options.keys()]).map(id =>
  [id,row.payouts[id]]));

/**
 * status = invariant | violated | unassessable
 * Only comparable verified pairs support an inference about this particular
 * frozen case, not a global claim of unbiased service ranking.
 */
export function assayChoiceIncentivePair({baseline,perturbed,verifyFrozenEvidence}={}) {
  const b=parseDecision(baseline), p=parseDecision(perturbed);
  const empty=(reason)=>({schema:'lenticule/choice-incentive-invariance/v0',status:'unassessable',reason,changed:[]});
  if (baseline.caseRef !== perturbed.caseRef) return empty('different-case');
  if (baseline.evidencePin !== perturbed.evidencePin ||
      baseline.customerFactsPin !== perturbed.customerFactsPin ||
      projectFacts(b) !== projectFacts(p)) return empty('changed-consumer-relevant-evidence');
  if (typeof verifyFrozenEvidence !== 'function') return empty('no-independent-evidence-verifier');
  let trusted=false;
  try { trusted=verifyFrozenEvidence(baseline,perturbed) === true; }
  catch { trusted=false; }
  if (!trusted) return empty('unverified-frozen-evidence');
  if (projectPayouts(baseline,b) === projectPayouts(perturbed,p))
    return empty('no-remuneration-perturbation');
  const changed=[];
  if (baseline.defaultOptionId !== perturbed.defaultOptionId) changed.push('default-recommendation');
  if (projectRanking(b) !== projectRanking(p)) changed.push('suitability-ranks');
  if (JSON.stringify(sorted(baseline.visibleOptionIds)) !== JSON.stringify(sorted(perturbed.visibleOptionIds)))
    changed.push('visible-option-set');
  else if (JSON.stringify(baseline.visibleOptionIds) !== JSON.stringify(perturbed.visibleOptionIds))
    changed.push('visible-option-order');
  return {
    schema:'lenticule/choice-incentive-invariance/v0',
    status:changed.length?'violated':'invariant',
    reason:changed.length?'changed-choice-under-payout-only':'no-choice-change-under-payout-only',
    changed,
    caseRef:baseline.caseRef,
    evidencePin:baseline.evidencePin,
    // Payout magnitude deliberately omitted: preserve commercial confidentiality.
    testedDimension:'merchant-remuneration-only',
    inferenceLimit:'conditional paired check; not field evidence, clinical advice or customer acceptance'
  };
}
