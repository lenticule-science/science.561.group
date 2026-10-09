# Hearing Access Science Services Section — seed research program

Status: ACTIVE_RESEARCH / NOT_A_CLINICAL_VALIDATION
Evidence snapshot: 2026-10-06

## Founding question

Which observations obtainable from uncontrolled consumer computing equipment and self-report carry reliable information about real-world auditory function, with what uncertainty, and which downstream actions can those observations safely justify?

The program deliberately does **not** begin with “reproduce a clinical audiogram in a browser.” Absolute pure-tone thresholds are unusually sensitive to transducer calibration and environment. Current evidence makes suprathreshold speech-in-noise measurement a stronger first experimental primitive, while FDA examples make diagnostic audiometer claims a separate regulatory boundary.

## Current hypotheses

H1. A browser-delivered speech-in-noise assay can yield useful test/retest information despite consumer-hardware level offsets, provided the implementation and population are validated.

H2. Sequential antiphasic and diotic DIN contains more routing information about asymmetry/conductive-like patterns than diotic DIN alone, but remains screening/triage evidence rather than diagnosis.

H3. A functional questionnaire plus a validated speech-in-noise observable will outperform either alone for deciding among: monitor/education, self-directed accessibility support, OTC consideration, professional hearing evaluation, and medical warning-sign referral.

H4. Support is itself an intervention variable. Setup, pairing, handling, education, and follow-up can materially affect whether a technically adequate device becomes useful in practice.

## Experimental ladder

0. **Reproduce/open-contract bench work.** Implement the CC-BY-4.0 dbSPLab generic DIN option/result contract. Resolve a commercially usable en-US stimulus corpus separately; the specification license does not imply audio rights.
1. **Bench robustness.** Browser/OS/device matrix; wired vs Bluetooth; level-offset simulation; ambient-noise perturbation; deterministic test/retest fixtures.
2. **Normal-hearing assay study.** Establish internal reference distributions, practice effects, failure envelopes, and remote/lab agreement.
3. **Clinical-reference validation.** Compare 561 DIN variants and questionnaire outputs against reference audiometry/speech-in-noise testing in a sufficiently varied adult sample. Pre-register endpoints and thresholds before looking at outcomes.
4. **Routing validation.** Estimate sensitivity/specificity/calibration for the *routing decisions* Public actually needs; minimize false reassurance and measure subgroup error.
5. **Intervention study.** Test whether assisted setup/follow-up changes adoption, use, abandonment, and self-reported benefit independently of hardware tier.

## Engineering handoff

Engineering may build research instrumentation, deterministic routing infrastructure, privacy-preserving local execution, assay descriptors, and test harnesses now. It must not label a 561 browser assay diagnostic, infer a clinical audiogram, or validate a hearing-aid fitting until corresponding evidence and regulatory work are received.

## Current primary evidence

- Folmer et al. 2017, computer DIN validation: https://pubmed.ncbi.nlm.nih.gov/28240983/
- De Sousa et al. 2021, diotic + antiphasic DIN triage: https://pubmed.ncbi.nlm.nih.gov/34799493/
- Zeitler et al. 2024, DIN monitoring/OTC pilot: https://pubmed.ncbi.nlm.nih.gov/38666901/
- Wu et al. 2025, hearing-aid service-model RCT: https://pubmed.ncbi.nlm.nih.gov/40372746/
- Coco et al. 2025, OTC usability in older adults: https://pubmed.ncbi.nlm.nih.gov/40875386/
- 2026 remote matrix-sentence reliability on uncalibrated consumer devices: https://pubmed.ncbi.nlm.nih.gov/42490540/
- Open generic DIN specification (CC-BY-4.0): https://github.com/dbSPLab/din-specification

## Unresolved local vocabulary

The canonical local expansions/contracts for **IDPP** and **ROPE** were not recoverable from the current Cold Red Gate L-space or the accessible GitHub history during this seed run. Do not invent them. Preserve the labels as an explicit knowledge gap and SYNC_BACK/reconcile once the canonical source is available.
