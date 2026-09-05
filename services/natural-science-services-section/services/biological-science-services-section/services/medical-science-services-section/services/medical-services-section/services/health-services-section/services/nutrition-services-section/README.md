# Nutrition Services Section

This section holds shared nutrition science: food-composition source records,
nutrient vocabularies, evidence summaries, and portable exchange contracts.
It does not hold any person's intake, body measurements, diagnoses, targets,
prescriptions, laboratory results, or application state.

Nutrition is a health domain with biological, cultural, agricultural,
economic, culinary, and medical relations. Those relations may be represented
without treating a food database as either a complete account of food or a
medical decision-maker.

Emsenn-instance records belong in the corresponding personal nutrition
services section. The software that reads these shared resources belongs in
the engineering-owned nutrition practice system.

The governing architecture is in
`content/text/documents/articles/notes/2026/08/19/2026-08-19-nutrition-science-and-computer-system-architecture.md`.

## Admitted exchange contracts

`lib/schemas/` currently admits four Draft 2020-12 record contracts:

- `urn:red-cup-science:nutrition:intake-candidate:1.0.0` for a
  non-authoritative logging candidate;
- `urn:red-cup-science:nutrition:food-assertion-snapshot:1.0.0` for a
  source-release-pinned set of nutrient assertions;
- `urn:red-cup-science:nutrition:intake-event:1.0.0` for a human-affirmed
  intake that cites its selected snapshot; and
- `urn:red-cup-science:nutrition:biometric-observation:1.0.0` for a
  device/manual/derived biometric reading (resting heart rate, RR-interval
  summaries, RMSSD, sleep duration, step count, and other metrics in the
  same open kebab-case vocabulary) with explicit missingness and consent
  scope.

Every record must include `mediaRetention` affirming
`containsRawPhoto: false`, `containsReceiptImage: false`,
`containsRawAudio: false`, `containsAppearanceEmbedding: false`, and
`containsRawWearablePayload: false`. These schemas validate each record's
shape and local invariants. Bundle-level reference resolution, provenance
agreement between records, and other cross-record guarantees belong to a
separate conformance computer.
