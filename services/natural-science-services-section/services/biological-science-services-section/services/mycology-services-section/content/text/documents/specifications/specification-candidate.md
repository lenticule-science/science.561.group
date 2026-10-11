# Physarum printed-maze apparatus — specification gate (candidate)

Work reference: lenticule-science/science-services-section#27.
Science owner: lenticule-science/science-services-section.
Engineering physical-fabrication owner: UNKNOWN.
Independent Science assayer and Engineering receiver: UNKNOWN.
Stage: SCIENCE_HOLD; this document does not commission CAD, fabrication, spending, or experiments.

## Source and competing explanations

Kuttner and Freiberg, *Protist* 181 (2026), 126156, DOI 10.1016/j.protis.2026.126156, observed 152 alternating, 64 nonalternating and 174 undecided outcomes in 390 starts for the 3 mm condition. The decisive-only alternation rate is 152/216; the all-starts alternating rate is 152/390. Neither result alone discriminates turn memory from geometry or directional persistence. Reid et al., PNAS (2012), DOI 10.1073/pnas.1215037109, independently motivates controlling environmental trail memory.

## Required source freeze before fabrication

Science must record original and corrected measured geometries, source rights and figure reuse rights, wall/corner landmarks, material/substrate contact constraints, tolerance in mm, instrument uncertainty, and mirror transform. Unknown measurements are UNKNOWN, not zero. Store exact science revision, immutable CAD digest and generated export digests separately.

## Proposed causal contrasts for preregistration

1. Original asymmetric 3 mm form versus symmetric correction, with the forced-turn history matched.
2. Matched local junction with approach-history variation, to test geometry-only predictions.
3. Mirrored forms and counterbalanced forced-turn direction, orientation, batch and maze unit.
4. Prespecified external-trail manipulation only after moisture, nutrition and surface confounds are shown acceptably controlled.

Primary outcome among decisive trials is alternating versus nonalternating. Record undecided and both-arm separately for every started trial; freeze the protocol for combining either category *before* data collection. Make between-geometry effect the confirmatory contrast only after independent science assay; compute its own power with batch/maze clustering. The earlier one-sample exact-binomial power is an exploratory sensitivity envelope, not an interaction-power guarantee.

## Interfaces and acceptance

Candidate input `PhysarumMazeSpec/v0`: immutable scientific reference, geometry family and landmarks, mirror transform, tolerances, material constraints, endpoint protocol, and pre-registration identifier.
Candidate output `MazeBuildManifest/v0`: source and export digests, part/lot/printer identity, measured landmark errors with method/instrument, mirrored-unit pairing, cleaning protocol and batch trace.
Candidate `TrialOutcome/v0`: started-trial ID, maze unit and geometry revision, blinded choice label, both-arm and undecided flags, time, batch and exclusion reason.

Negative controls: reject missing original geometry, missing tolerance, hand-edited STL, right/left mirror mismatch, differing revision, duplicate unit ID, unblinded allocation, undeclared both-arm reclassification, missing calibration or receipt. No fabricated part passes without independent measured tolerance and science protocol readback.

The originating issue is research work, not independently verified Group Board authorization for a physical manufacturing order. Red Cup physical owner, financial capacity, operating release and independent receiving remain unverified.
