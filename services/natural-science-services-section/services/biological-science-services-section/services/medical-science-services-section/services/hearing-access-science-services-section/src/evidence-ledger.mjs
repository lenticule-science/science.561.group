export const EVIDENCE_AT = '2026-10-06';

const claims = Object.freeze({
  'remote-speech-in-noise.consumer-hardware': Object.freeze({
    state: 'HELD_LIMITED',
    engineeringDisposition: 'PROTOTYPE_AND_VALIDATE',
    source: 'https://pubmed.ncbi.nlm.nih.gov/42490540/',
    evidence: 'Remote matrix sentence testing on uncalibrated consumer devices showed high test-retest reliability (r=0.82), strong lab agreement (r=0.78), and small mean bias in 20 normal-hearing participants.',
    limitation: 'Small normal-hearing sample; does not establish performance in hearing-loss populations or clinical equivalence for 561 implementation.'
  }),
  'din.computer-screening': Object.freeze({
    state: 'HELD',
    engineeringDisposition: 'PROTOTYPE_AND_VALIDATE',
    source: 'https://pubmed.ncbi.nlm.nih.gov/28240983/',
    evidence: 'US computer-administered DIN validation reported AUC 0.95-0.96 for hearing-loss criteria in 40 adults.',
    limitation: 'Validation belongs to that implementation/population; thresholds cannot be transplanted without validating 561 stimuli and delivery.'
  }),
  'din.antiphasic-triage': Object.freeze({
    state: 'HELD',
    engineeringDisposition: 'PROTOTYPE_AND_VALIDATE',
    source: 'https://pubmed.ncbi.nlm.nih.gov/34799493/',
    evidence: 'In 489 participants, antiphasic DIN sensitivity/specificity were 90%/84% for detecting hearing loss; sequential antiphasic+diotic DIN categorized normal, bilateral SNHL, and unilateral/asymmetric SNHL-or-CHL groups with false-negative rates below 10%.',
    limitation: 'A screening/triage result is not a diagnosis; 561 must validate its own implementation and referral thresholds.'
  }),
  'din.otc-fitting-validation': Object.freeze({
    state: 'NOT_YET_HELD',
    engineeringDisposition: 'DO_NOT_USE_AS_FITTING_VALIDATION',
    source: 'https://pubmed.ncbi.nlm.nih.gov/38666901/',
    evidence: 'DIN correlated with other measures in untreated and prescription-aid groups and appeared feasible for monitoring, but the OTC subgroup was small and the authors call for further validation.',
    limitation: 'Do not claim DIN validates a specific OTC hearing-aid fitting.'
  }),
  'hearing-aid.service-model-matters': Object.freeze({
    state: 'HELD',
    engineeringDisposition: 'MODEL_SUPPORT_AS_INTERVENTION',
    source: 'https://pubmed.ncbi.nlm.nih.gov/40372746/',
    evidence: '2025 randomized trial (245 completers) found generally positive OTC outcomes but significantly better global outcomes under audiologist best-practice service; high-end vs low-end technology did not significantly change outcomes.',
    limitation: 'The trial used specific service models and devices; magnitude should not be generalized to every product or support program.'
  }),
  'otc-hearing-aid.usability-support-gap': Object.freeze({
    state: 'HELD',
    engineeringDisposition: 'DESIGN_ASSISTED_SETUP_AND_FOLLOWUP',
    source: 'https://pubmed.ncbi.nlm.nih.gov/40875386/',
    evidence: 'In 82 older adults, 68% were unsuccessful on at least one OTC hearing-aid management task; volume adjustment, smartphone pairing, and wax-guard replacement were common difficulties.',
    limitation: 'Single study; use to motivate usability/support design, not to predict an individual user.'
  }),
  'din.generic-data-contract': Object.freeze({
    state: 'HELD',
    engineeringDisposition: 'ADOPT_WITH_ATTRIBUTION',
    source: 'https://github.com/dbSPLab/din-specification',
    evidence: 'An open CC-BY-4.0 generic DIN options/results specification defines interoperable assay parameters and JSON result fields across implementations.',
    limitation: 'The specification is a data/protocol contract; it does not grant rights to any particular speech stimulus set or validate a 561 implementation.'
  })
});

export function claimFor(id) {
  return claims[id] ?? Object.freeze({ state: 'UNKNOWN', engineeringDisposition: 'RESEARCH_REQUIRED', evidence: 'No current evidence record.', limitation: 'Unknown.' });
}

export function engineeringDispositionFor(id) {
  return claimFor(id).engineeringDisposition;
}

export function researchBacklog() {
  return Object.freeze([
    'Validate 561-owned/licensed en-US digit stimuli and masking noise; do not assume upstream stimulus rights.',
    'Compare diotic versus antiphasic DIN on representative hearing-loss categories against reference audiometry.',
    'Measure test-retest variance across browser, OS, wired/Bluetooth, headphone type, and realistic ambient-noise conditions.',
    'Estimate calibration-independent failure envelopes and integrity checks rather than pretending consumer hardware is calibrated.',
    'Test questionnaire + DIN incremental value for routing, while keeping diagnosis outside the public MVP.',
    'Study whether assisted setup/follow-up changes device adoption, successful use, and abandonment.'
  ]);
}
