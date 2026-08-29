# Tai Chi Services Section

This section holds shared knowledge and services concerning Tai Chi. Its
placement records its identity as a martial art and a cross-domain fitness
practice. Relationships to Traditional Chinese Medicine, contemplative
practice, culture, pedagogy, and particular lineages may be expressed without
collapsing those distinct domains into one another.

Emsenn's personal Tai Chi practice belongs in the corresponding personal
services section rather than in this shared scientific section.

## Skeletal-trace exchange contracts

`lib/schemas/` defines the versioned Draft 2020-12 exchange contracts for a
skeletal-trace manifest, each NDJSON frame, and a practitioner-local practice
session. The manifest declares the estimator provenance, controlled joint-set
profile, coordinate-space profile, sensitivity, and an affirmative absence of
raw images, video, audio, segmentation masks, and appearance embeddings. Frames contain only normalized canonical-vocabulary joint
observations with confidence; missing joints are omitted rather than invented.

`lib/verify-skeletal-trace-bundle.mjs` uses the canonical
`@red-cup-engineering/json-schema-services-section` for all structural
validation, then checks the cross-record relationships JSON Schema cannot
express: manifest/frame trace identity, strict elapsed-time monotonicity,
coordinate dimensionality, and session temporal order. Synthetic fixtures
exercise the contracts without representing a person.

No derived-observation schema is admitted yet. The architecture records that
derivations require their own versioned algorithm, input, unit, uncertainty,
and invalid-regime model; choosing those now would manufacture a false
scientific settlement.
