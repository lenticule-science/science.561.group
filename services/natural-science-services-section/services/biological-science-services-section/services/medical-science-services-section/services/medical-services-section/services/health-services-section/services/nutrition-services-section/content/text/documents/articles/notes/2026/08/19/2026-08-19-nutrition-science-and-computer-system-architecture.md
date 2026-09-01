---
title: Nutrition Science and Computer System Architecture
description: "Authority, provenance, uncertainty, custody boundaries, package topology, and staged development of nutrition science and practice computing."
date-created: 2026-08-19
date-updated: 2026-08-28
type: specification
authors:
  - codex
---

# Nutrition science and computer system architecture

## Decision

Develop nutrition as three cooperating, non-interchangeable regions:

1. **Nutrition science** owns shared food-composition source descriptions,
   nutrient vocabulary and units, food and recipe modelling contracts,
   evidence summaries, and versioned exchange schemas.
2. **The nutrition practice computer** owns computation and interaction. It
   imports declared science bundles and a practitioner's state, records intake
   and recipe transformations, preserves estimates and provenance, computes
   transparent aggregates, and produces new local records through explicit ports.
3. **A practitioner's nutrition section** owns only that person's local state:
   logs, recipes, purchase/import records, preferences, targets, biometrics,
   private notes, and any deliberately retained practitioner correspondence.

The personal section does not fork shared food facts or own application code.
The application is replaceable without migrating the meaning of personal
records. A branded food lookup is an assertion from a source at a time, not an
eternal fact about a food.

```text
nutrition science ──composition/evidence/contracts──┐
                                                     ├─> nutrition practice computer
Emsenn nutrition ──intake/recipes/targets/imports────┘            │
                                                                  ├─ browser face
food labels / receipts / health-provider exports ─> import ports ─┘
```

## Why this must clear the present market

Cronometer is the immediate benchmark: it advertises barcode logging and up to
84 nutrients, integrations, recipes, and custom tracking; its documented plans
include raw-data export, custom foods/recipes, custom biometrics, timestamped
data, fasting, reports, and a professional workflow. Its client restrictions
for eating disorders signal that a nutrition program cannot always expose every
metric indiscriminately.

MacroFactor competes on adaptive expenditure/coaching and now AI-assisted food
logging. MyFitnessPal competes on frictionless logging, including barcode,
voice, and meal scanning. The required bar is therefore fast capture, broad
nutrient detail, sensible aggregation, integrations, recipe workflows,
personalization, and export—not merely a calorie diary.

This system's differentiator is not a confident black box. It is a durable,
inspectable food-and-intake ledger that preserves the distinction among a
measured composition value, a manufacturer label, a user estimate, a receipt
parse, a photo suggestion, and a derived total. It can recommend an action only
with the cited inputs, uncertainty, and claim boundary visible.

### Current primary sources

| Benchmark or authority | Concrete current capability relevant here | Source |
| --- | --- | --- |
| Cronometer | Barcode/manual logging; up to 84 nutrients; device sync; recipes; health metrics | [feature page](https://cronometer.com/features/index.html) |
| Cronometer | Custom foods/recipes, raw export, timestamped data, custom biometrics, reports, professional record workflows; an eating-disorder display restriction | [subscription documentation](https://support.cronometer.com/hc/en-us/articles/360028026971-Subscription-Types) |
| MacroFactor | Nutrition tracking, AI-powered photo-assisted food logging, favourites, and a public product roadmap | [official site](https://macrofactor.com/) |
| MyFitnessPal | Diary, barcode, meal scanning, and voice logging are current entry paths; it explicitly disclaims medical substitution | [progress documentation](https://support.myfitnesspal.com/hc/en-us/articles/45246617814669-Introducing-Progress-Overview-Your-Progress-Personalized) |
| USDA FoodData Central | Food-composition search/detail API, data documentation, and CC0/public-domain data | [API guide](https://fdc.nal.usda.gov/api-guide/) |

The table is a product benchmark, not an endorsement and not an import plan.
Every upstream source needs a separate licensing, update, attribution, and
source-version decision before admission.

## Authority and provenance model

Food composition has several legitimate authorities that must never be
flattened into one anonymous nutrient number:

- **Analytical observation:** a named laboratory or reference dataset reports a
  value, method, sample, preparation state, unit, and release/version.
- **Regulatory/manufacturer declaration:** a package label or manufacturer
  record reports a declared serving and nutrients, qualified by jurisdiction,
  label revision, and capture date.
- **Recipe calculation:** the program derives a value from explicitly listed
  ingredient assertions, edible portions, preparation and yield/loss factors,
  and calculation version.
- **Practitioner estimate:** a person estimates item identity, amount, or
  preparation; the estimate carries uncertainty or a bounded range.
- **Imported assertion:** an importer preserves its source system, source ID,
  field mapping, source file identity, and import time without silently
  upgrading its authority.
- **Derived aggregate:** a reproducible calculation sums intake assertions;
  it names inputs, arithmetic rules, time-zone/day-boundary policy, and exclusions.
- **Clinical interpretation:** a named clinician makes a scoped clinical
  judgment. This is neither generated nor silently implied by nutrient arithmetic.

Food identity, product identity, preparation, portion, nutrient value, and
source assertion are separate entities. A barcode may identify a packaged
product, not necessarily a batch, formulation revision, serving mass, or the
food actually eaten. A search result is a candidate, not an automatic log.

## Science-owned resources and contracts

The shared science section may own nutrient identifiers, units, basis
conventions and conversion rules; food/product/ingredient/recipe/preparation
vocabulary; source registry entries with publisher, license, jurisdiction,
release, retrieval address, attribution and update policy; composition
assertions with their source-specific uncertainty; versioned mapping
propositions between sources; evidence summaries with population, exposure,
comparator, outcome, limitations and applicability; and schemas for personal
intake, recipe instances, imports, targets, biometrics, reports and assessments.

It must not own a person's diary, private recipe variants, current body state,
laboratory values, disease history, treatment plan, or inferred diagnosis.

The first admitted Draft 2020-12 exchange contracts are:

- `urn:red-cup-science:nutrition:intake-candidate:1.0.0`;
- `urn:red-cup-science:nutrition:food-assertion-snapshot:1.0.0`; and
- `urn:red-cup-science:nutrition:intake-event:1.0.0`.

All three require a `mediaRetention` object affirming
`containsRawPhoto: false`, `containsReceiptImage: false`,
`containsRawAudio: false`, `containsAppearanceEmbedding: false`, and
`containsRawWearablePayload: false`. Their scope is structural validation of
one record at a time. They do not by themselves establish that referenced
records occur in a supplied bundle, that duplicated provenance agrees across
records, or that any source assertion is scientifically true; those are
separate conformance and evidence obligations.

## Engineering-owned system

`nutrition-practice-system-services-section` belongs under personal health
computer systems engineering because it composes a system for one person's
health practice and practitioner-owned state. Generic interfaces remain
dependencies rather than its taxonomic parent. It comprises:

- **`nutrition-practice-computer`** — admitted now as the pure application
  core. It validates caller-supplied bundles, normalizes declared measures,
  creates append-only intake and recipe records, and returns structured
  diagnostics and explicit port requests. It owns no ambient network, file,
  camera, wearable, health-record connection, credential, or clock.
- **Browser face** — declared, not materialized: a local-first reader and
  authoring surface for import/export, rapid manual logging, recipe work,
  provenance inspection, uncertainty display, and accessibility.
- **Source adapters** — declared, not materialized: bounded adapters for
  composition datasets, barcode lookup, receipt parsing, health-app and wearable
  import. An adapter translates source claims; it does not create authority.
- **Local state adapter** — declared, not materialized: maps portable records
  to the dated state tree using `@red-cup-engineering/dated-state-writing-service`.
- **Care exchange** — deliberately unadmitted: future named-professional
  sharing under separately specified consent, minimum necessary fields,
  encryption, retention, correction, and revocation semantics.

Use existing house capabilities rather than private substitutes: the canonical
JSON Schema service for bounded Draft 2020-12 validation, the dated-state
writer for local custody, and relative POSIX path admission before filesystem
projection. A browser must consume the pure computer; no interface is allowed
to reimplement nutrition semantics as convenient widgets.

## Personal record model

The minimum portable record set is finer-grained than a diary row:

- **intake event:** observed/remembered eating event, local date-time and
  time-zone offset, item/recipe reference, amount and unit, preparation,
  assertion authority, confidence/uncertainty, and optional non-clinical note;
- **food assertion snapshot:** exact source claim selected at log time,
  including source version and all values needed to reproduce the log; later
  database edits never rewrite historical intake;
- **recipe instance:** explicit ingredient snapshots, preparation, yield,
  portions, calculation method and version;
- **target declaration:** practitioner-selected or externally authored target,
  scope, rationale category, authority, effective period, visibility setting,
  and supersession relation; never presented as a diagnosis;
- **biometric observation:** source, measured/entered time, units, precision,
  missingness, and consent scope; readings and clinical interpretations differ;
- **import receipt:** source application/device/file, source IDs, field mapping,
  content identity if settled, import time, duplicates and rejected rows;
- **derived report:** input record addresses and immutable snapshots,
  algorithm/version, arithmetic policy, uncertainty-propagation status, and claim boundary.

The first exchange form is JSON records plus NDJSON collections. Numeric values
are decimal strings paired with UCUM-style unit strings; floating binary values
are prohibited in canonical exchange. Each record declares a schema URI and
source-bundle release. This preserves evidence after a source changes.

## Uncertainty and image boundary

Fast logging may use barcode, text, receipt, voice, or food-image candidates,
but only an affirmed selection becomes an intake event. Image inference is an
estimate of visible food identity and portion; it cannot observe hidden oils,
recipe ingredients, brands, cooking loss, or nutrients. It returns candidates,
confidence, and model/version—not a magically exact meal.

1. No food photographs, receipt images, audio, embeddings, or raw wearable
   payloads enter canonical personal state.
2. A capture/import adapter may process material ephemerally after an explicit
   gesture, then emits only candidate lists or structured import results.
3. An estimate records confidence/bounds and provenance. Reports may show
   coverage and uncertainty; partial logging never becomes complete intake.

## Medical and behavioral-safety boundary

The system may calculate declared intake totals, show source/limits of evidence,
and render targets selected by their stated authority. It does not diagnose,
prescribe, detect an eating disorder, determine medication dosing, declare a
nutrient deficiency, recommend treatment, or infer health outcomes from a log.

Metric visibility is user-controlled: calorie, mass, macro, fasting, target,
comparison, streak, and weight-change views can be independently hidden. The
core preserves authorized records without assuming maximal numerical exposure
is therapeutic. Clinical workflows require separately authorized governance.

## Local custody, imports, and export

The canonical Emsenn state root is a visible dated-file tree:

```text
data/state/
  YYYY/MM/DD/
    YYYY-MM-DD-nutrition-intake-event.ndjson
    YYYY-MM-DD-nutrition-food-assertion-snapshot.ndjson
    YYYY-MM-DD-nutrition-recipe-instance.json
    YYYY-MM-DD-nutrition-target-declaration.json
    YYYY-MM-DD-nutrition-biometric-observation.ndjson
    YYYY-MM-DD-nutrition-import-receipt.json
    YYYY-MM-DD-nutrition-derived-report.json
```

Browser caches are working copies. The program must show whether a change has
reached visible practitioner state. Provider/API credentials are host
capabilities, never in science bundles or portable logs. Importers must be
idempotent against a stated source identity and leave rejected/ambiguous rows
visible for review.

## Development gates

### Gate 0 — contracts and source registry

Establish schemas, sample source registry entries, and synthetic
positive/negative fixtures. Validation must refuse a nutrient value without
unit/basis/source, an intake event without assertion type, non-decimal
canonical numbers, and a report that hides inputs.

### Gate 1 — pure ledger and conformance

Implement the pure computer. It validates cross-references, normalizes declared
units without inventing missing composition, computes reproducible recipe/diary
aggregates, detects duplicate imports, and emits diagnostics. Synthetic fixtures
only; no UI and no upstream API call.

### Gate 2 — local-first browser authoring

Build import/export, manual logging, recipe construction, provenance drilldown,
coverage/uncertainty display, and metric-visibility controls around the pure
computer. It remains useful offline.

### Gate 3 — selected source and device adapters

Admit one source at a time with release pinning, licensing review, mapping
tests, rate-limit behavior, export round-trips, and clear attribution. Barcode
and receipt/image candidates require human affirmation.

### Gate 4 — transparent analysis

Add time-series, target comparison, adaptive-energy-expenditure research, and
biometric correlation only as declared derivations. Each names algorithm, input
coverage, confounders/invalid regimes, uncertainty behavior, and non-clinical
claim boundary.

### Gate 5 — deliberate professional exchange

Only after a separate constitution: consented sharing, role/scope control,
minimum necessary fields, encrypted transport/storage, correction/audit,
retention/deletion, and medical-disclaimer behavior.

## Refusal conditions and open decisions

This architecture refuses a shared science database of personal diets; a
nutrition number detached from source, release, unit, and basis; automatic
replacement of historical food assertions; photos/receipts hidden in canonical
state; an AI estimate quietly becoming fact; implicit medical claims; and a
cloud/professional service before its authority and custody model exists.

Open decisions requiring ADRs with alternatives, evidence, and migration
consequences: the first source dataset/jurisdiction; canonical food and nutrient
identifiers; unit/density conversion; recipe yield and retention factors;
uncertainty representation/propagation; barcode lifecycle; import priority and
deduplication; scope of adaptive expenditure; and every source's license.
