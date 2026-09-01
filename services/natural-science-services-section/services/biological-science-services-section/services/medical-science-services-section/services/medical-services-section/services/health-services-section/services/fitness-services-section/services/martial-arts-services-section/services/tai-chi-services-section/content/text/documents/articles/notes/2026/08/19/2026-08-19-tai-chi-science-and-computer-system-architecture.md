---
title: Tai Chi Science and Computer System Architecture
description: "Authority, data ownership, privacy boundaries, package topology, and staged development plan for shared Tai Chi science, the Tai Chi practice computer, and practitioner-local state."
date-created: 2026-08-19
date-updated: 2026-08-28
type: specification
authors:
  - codex
---

# Tai Chi science and computer system architecture

## Decision

Develop Tai Chi as three cooperating but non-interchangeable regions:

1. **Tai Chi science** owns shared claims, terminology, lineages, curricula,
   movement descriptions, reference observations, evidence, and the schemas by
   which those resources and observations can be exchanged.
2. **The Tai Chi practice computer** owns computation and interaction:
   importing a corpus and practitioner state, presenting lessons, observing
   movement through replaceable sensor adapters, rendering skeletal traces,
   and producing new practitioner-local records.
3. **A practitioner's personal Tai Chi section** owns only that practitioner's
   local state: sessions, skeletal traces, reflections, preferences,
   assignments, and teacher feedback addressed to that practitioner.

The personal section is not a fork of the science corpus and does not own an
application implementation. The application must be replaceable without
migrating the meaning of the personal records.

## Generative relation

The shared science section generates the vocabulary and contracts. The
engineering section realizes those contracts as a computer system. A personal
section supplies one local instance of the state ports consumed by that
computer.

```text
Tai Chi science ──contracts/curricula/references──┐
                                                  ├─> practice computer
Emsenn Tai Chi ─────local state records───────────┘          │
                                                            ├─ browser face
ephemeral camera frames ─> pose-estimator adapter ─> trace ──┘
                            │
                            └─ raw frames end here
```

Containment does not imply epistemic authority. A skeletal trace is an
observation produced by an estimator. It is not proof of correct Tai Chi.
Derived measurements are interpretations of a trace. Teacher comments are
judgments by a named teacher. Self-reports are reports by the practitioner.
The system must preserve those different authorities rather than flattening
them into one score.

## Science-owned resources

The science section may own:

- lineage and curriculum identifiers;
- posture, transition, drill, form, application, and principle descriptions;
- prerequisite and part-of relations between curriculum nodes;
- reference skeletal traces whose subject consent and license permit use;
- controlled joint-set and coordinate-space profiles;
- exercise adaptations and their authoring provenance;
- research summaries with population, intervention, outcome, and limitation
  boundaries;
- versioned schemas for practice sessions, skeletal traces, derived
  observations, and teacher annotations.

It must not own a practitioner's health facts, private recordings, practice
history, or teacher correspondence.

No single canonical Tai Chi form is presumed. A curriculum node is always
qualified by lineage or teaching authority. Cross-lineage comparison is an
explicit relation between versioned resources, never an invisible merge.

## Engineering-owned system

The `tai-chi-practice-system-services-section` is seated under personal health
computer systems engineering because it composes a system for one person's
health practice, devices, and state. Human-interface and sensing capabilities
remain generic dependencies rather than its taxonomic parent.

Its intended cover is:

- **`tai-chi-practice-computer`**, admitted now: the pure application core.
  It assembles imported science resources and personal state into application
  state and defines ports for capture, storage, time, rendering, and teacher
  exchange. It owns no camera, filesystem, network, or clock directly.
- **browser face**, declared but not yet materialized: implements rendering,
  file import/export, and an ephemeral camera capture adapter.
- **local state adapter**, declared but not yet materialized: maps portable
  records to the house dated-state path law using
  `@red-cup-engineering/dated-state-writing-service`.
- **teacher exchange**, deliberately unadmitted: a later boundary for
  deliberately shared traces and annotations. It does not arise merely because
  networking is convenient.

This separation allows the same pure computer to operate in a static browser,
a local desktop wrapper, tests, or a future teacher tool without moving domain
rules into presentation code.

## Reused house capabilities

The system consumes existing capabilities rather than growing private copies:

- `@red-cup-engineering/json-schema-services-section` admits schemas,
  performs bounded Draft 2020-12 validation, and resolves only an explicitly
  supplied schema corpus.
- `@red-cup-engineering/dated-state-writing-service` writes and reads the
  visible `data/state/YYYY/MM/DD/` tree for Node-side local custody.
- `@red-cup-engineering/semantic-content-identify-service` may identify
  immutable, admitted exports after their canonical representation is settled.
  A semantic identity never substitutes for the dated address of a personal
  event.
- `@red-cup-engineering/relative-posix-filepath-admission-service` admits
  bundle-relative paths before filesystem projection.
- `@red-cup-engineering/http-server-application-contract-service` and
  `@red-cup-engineering/compose-http-application-service` are the server-side
  contracts if a local HTTP host is later required.
- The Weiqi kernel/web split is the product-spine precedent: a pure executable
  model feeds a browser face which never reimplements domain semantics.

Dependency versions belong in a materialized package manifest, not in this
architecture record. The record names responsibilities; package locks settle
particular versions.

## Skeletal observation boundary

The camera adapter may receive video frames only while the practitioner has
made an explicit capture gesture and browser camera permission is live. Each
frame is passed directly to a replaceable pose-estimator adapter. The only
durable product of that adapter is a normalized landmark observation.

The following are architectural invariants:

1. Raw image, video, audio, segmentation masks, thumbnails, and embeddings
   derived from raw appearance are never part of a practice-state record.
2. The capture adapter must stop every media track when capture ends, when the
   route is left, or when an error prevents observation.
3. A trace manifest must affirm `containsRawImage: false`,
   `containsRawVideo: false`, `containsRawAudio: false`,
   `containsSegmentationMask: false`, `containsAppearanceEmbedding: false`,
   and `rawMediaRetention: "none"`.
4. Frames have monotonically increasing elapsed times, but an estimator is not
   required to emit one observation per camera frame.
5. Estimator name, model version, joint-set profile, coordinate-space profile,
   and confidence fields travel with the trace. Data may not masquerade as
   detector-independent.
6. The persisted trace uses a stable canonical joint vocabulary. Detector
   output is projected at the adapter boundary; detector-native landmark
   arrays do not leak into personal state.
7. Missing or low-confidence joints remain missing or uncertain. The system
   must not invent smooth certainty merely because animation looks nicer.
8. Skeletal traces remain sensitive personal movement data. Removing pixels
   reduces exposure but does not make gait, proportions, disability, or
   characteristic movement anonymous.

The initial exchange representation is a JSON manifest plus newline-delimited
JSON frames. NDJSON permits streaming writes, bounded-memory reading, partial
recovery after interruption, and future compression without changing frame
semantics.

## Observation, derivation, and assessment

Three record families remain separate:

- **Observation:** what a versioned sensor/estimator reported, with confidence.
- **Derivation:** a reproducible computation over observations, such as an
  angle, velocity, sway estimate, phase boundary, or comparison distance.
- **Assessment:** a claim by a named authority about practice, safety, or
  curriculum performance, citing observations or derivations as evidence.

A teacher may disagree with an automated derivation without either record
being overwritten. A new algorithm appends a new derivation. It never rewrites
the original trace. “Correctness score” is not admitted as a primitive.

## Portable state bundle

A portable personal state directory has this logical shape:

```text
data/state/
  YYYY/MM/DD/
    YYYY-MM-DD-tai-chi-practice-session.json
    YYYY-MM-DD-tai-chi-skeletal-trace-manifest.json
    YYYY-MM-DD-tai-chi-skeletal-trace-frames.ndjson
    YYYY-MM-DD-tai-chi-reflection.json
    YYYY-MM-DD-tai-chi-derived-observations.ndjson
    YYYY-MM-DD-tai-chi-teacher-annotations.ndjson
```

A session record references trace and annotation records by admitted relative
path. Large traces remain separate from session metadata. Files are
append-created or atomically replaced according to their declared record
semantics; a browser cache is never the sole canonical copy.

The browser may use IndexedDB or OPFS as a working cache. Both are
origin-scoped and may be cleared. Therefore the application must continuously
show whether local work is merely cached or has been exported to visible
personal files. Import and export are first-class operations, not a settings
afterthought.

## Browser security posture

- Static and local-first is the initial deployment posture.
- No account, analytics identifier, advertising SDK, remote inference, or
  teacher upload is admitted in the first browser face.
- Camera use requires a secure context, an explicit practitioner gesture, and
  a visible capture state.
- The pose model executes on the practitioner's device.
- A restrictive Permissions Policy grants camera access only to the
  application origin; third-party frames receive none.
- Content Security Policy forbids arbitrary script and model origins.
- The app remains fully useful for importing, viewing, journaling, and lessons
  when camera permission is denied.
- Export is explicit. Network synchronization, if later admitted, is a
  separate service and consent event.

## Current browser and estimator basis

These interfaces justify the ports above without making any vendor the domain
model:

- The W3C [Media Capture and Streams specification](https://www.w3.org/TR/mediacapture-streams/)
  defines camera permission, media tracks, privacy indicators, and the
  `getUserMedia` capture boundary. Camera access is therefore a host capability,
  never a property of the pure practice computer.
- MDN documents the [origin private file system](https://developer.mozilla.org/en-US/docs/Web/API/File_System_API/Origin_private_file_system)
  as origin-private, quota-bound storage which is deleted when site storage is
  cleared. This supports using it as a working cache and rejects treating it as
  the practitioner's only durable copy.
- MDN documents [IndexedDB](https://developer.mozilla.org/en-US/docs/Web/API/Window/indexedDB)
  as broadly available asynchronous browser storage, while its documented
  failure and clearing regimes likewise make it a cache/projection rather than
  the canonical personal record.
- Google's current [Pose Landmarker API](https://ai.google.dev/edge/api/mediapipe/python/mp/tasks/vision/PoseLandmarker)
  requires monotonically increasing timestamps in live/video modes and may
  drop live-stream inputs to reduce latency. This is evidence for a trace of
  timestamped observations, not an assumed one-output-per-camera-frame array.

These are replaceable implementations and standards evidence. They do not own
the Tai Chi joint vocabulary, observation semantics, or personal-state format.

## Development gates

### Gate 0 — architecture and contracts

Current work: establish ownership, the computer-system seat, skeletal-trace
schemas, personal state boundary, and refusal conditions.

Exit evidence:

- schemas pass the canonical JSON Schema service's policy inspection;
- positive and negative fixtures exercise raw-media refusal, coordinate
  metadata, confidence bounds, and monotonic frame rules;
- science, engineering, and personal READMEs agree on ownership.

### Gate 1 — observation kernel and bundle conformance

Build a pure package which validates a supplied schema corpus, parses streaming
frames, checks cross-record references and monotonicity, and emits typed
diagnostics. Add golden fixtures from synthetic coordinates, not a person.

No browser UI is required to pass this gate.

### Gate 2 — read/reflect browser

Build the browser face around imported files: curriculum reader, skeletal
trace renderer, session journal, export status, and accessibility. Use
synthetic traces until this face is reliable.

### Gate 3 — ephemeral capture

Admit a pose-estimator adapter behind the capture port. Prove with browser
integration tests that raw frames are not written, media tracks stop, offline
operation works, and trace export survives reload/import.

### Gate 4 — derivation and comparison

Add transparent derived measurements and reference-trace comparison. Each
derivation declares algorithm, version, inputs, units, uncertainty, and known
invalid regimes. Teacher review remains authoritative as its own record kind.

### Gate 5 — deliberate exchange

Only after separate authorization: teacher assignment and annotation exchange,
encryption, retention, revocation semantics, and any hosted service. Accounts
and cloud synchronization do not enter by inertia.

## Refusal conditions

The architecture refuses:

- a database containing personal state under the shared science section;
- curriculum or application code under Emsenn's personal section;
- a browser-only record format which cannot be inspected outside the app;
- saved video “temporarily” awaiting later pose extraction;
- a model-specific landmark array presented as the domain standard;
- automated claims about internal force, relaxation, intent, qi, martial
  efficacy, diagnosis, or safety from visible joint coordinates alone;
- mutation of observations when a derivation or assessment changes;
- a teacher/network service before its authority, consent, and retention model
  are separately constituted;
- interface polish being used as evidence that the underlying observation is
  scientifically valid.

## Open decisions

These remain deliberately unsettled until evidence exists:

- the canonical joint set and whether hands require a separate optional trace;
- coordinate normalization sufficient for meaningful cross-session comparison;
- compression and container format beyond the manifest-plus-NDJSON exchange
  representation;
- which lineage and curriculum become the first complete corpus;
- the first supported pose-estimator implementation;
- the boundary between general movement derivations and Tai Chi-specific
  assessments;
- public licensing for shared curricula, reference traces, and code.

Each decision requires an ADR with alternatives, evidence, and migration
consequences. No implementation default silently settles the domain model.
