---
title: "Survey of MetroPlat Theory Drift"
description: "A working audit naming the places where the potential @emsenn/metroplat package drifts from the theory in the dev notes, so the next design slice makes it more a next-generation relational instrument than a large Node library with good vocabulary."
date-created: 2026-06-30
keywords:
  - action
  - instrument
  - diffraction
  - temperature
  - RMN
  - package
  - service
  - hole
  - MCP
  - structure
  - morphism
  - witness
---

# Survey of Infography [renamed later to MetroPlat] Theory Drift

Date: 2026-06-30
Status: working audit

This note identifies current drift between the potential `@emsenn/metroplat`
package and the theory stated in the dev notes. It is not a rewrite plan for
the whole package. It names the places where the next design slice should make
the package more like a next-generation relational instrument rather than a
large Node library with good vocabulary.

## Grounding

Opened theory notes:

- `dev/content/notes/2026/06/23/2026-06-23-research-on-relation-model-notation-as-agent-tool-bytecode.md`
- `dev/content/notes/2026/06/25/2026-06-25-research-on-the-non-reductive-computation-thesis.md`
- `dev/content/notes/2026/06/25/2026-06-25-research-on-witness-journal-the-relation-witness-information-log.md`
- `dev/content/notes/2026/06/25/2026-06-25-research-on-the-wire-codec-projector-unification.md`
- `dev/content/notes/2026/06/28/2026-06-28-research-on-the-relational-instrument.md`
- `dev/content/notes/2026/07/04/2026-07-04-research-on-the-categorical-node-packaging-placement-law.md` (consolidates the former `2026-06-28-research-on-the-derived-normal-form-for-relating.md` and `2026-06-28-research-on-the-derived-node-realization-contract.md`)
- `dev/content/notes/2026/06/29/2026-06-29-research-on-the-informational-matter-phase-ladder.md`
- `dev/content/notes/2026/06/30/2026-06-30-research-on-temperature-and-diffraction-as-the-two-missing-instruments.md`
- `dev/content/notes/2026/06/30/2026-06-30-research-on-the-one-machine-the-differential-bypass-and-the-sector-charges.md`

Opened implementation:

- `package.json`
- `lib/computing/index.mts`
- `lib/language/index.mts`
- `src/actions/index.mts`
- `src/running/action.mts`
- `src/running/category.mts`
- `src/running/dispatch.mts`
- `src/running/induce.mts`
- `src/running/invocation.mts`
- `src/running/serving.mts`
- `src/projections/action-apex.mts`
- `src/projections/witness/stream.mts`
- `src/registries/action-instruments.mts`
- `src/registries/morphism-packets.mts`
- `src/registries/witness-instruments.mts`
- `services/mcp/index.mts`
- `sites/hole/index.mts`

Measurements run against the built package:

```json
{
  "actions": 34,
  "morphisms": 16,
  "boundaries": 18,
  "runTerm": 19,
  "freeTs": 0,
  "morphismPackets": 19,
  "actionInstrumentPhases": {
    "metroplat.phase.strict-finite": 34
  },
  "registeredInstrumentPhases": {
    "metroplat.phase.boundary-only": 4,
    "metroplat.phase.glassy-metastable": 2,
    "metroplat.phase.scott-stream": 1,
    "metroplat.phase.strict-finite": 2,
    "metroplat.phase.transfinite-closure": 1
  },
  "packageExports": {
    "total": 104,
    "lib": 14,
    "src": 79,
    "services": 8,
    "sites": 2
  }
}
```

`pnpm exec tsc --noEmit` passed. `node dev/scripts/check-derived-boundaries.mjs`
passed.

## What is already aligned

The package is not merely cosmetic. Several major theory commitments are now
real.

- `lib/computing/index.mts` contains a pure phase-indexed relational Hoare
  contract layer: material context, move, phase, lens, witness policy,
  energetics, refinements, instruments, verification plans, and outcome reports.
- `src/running/category.mts` has actions with domain/codomain structures,
  contracts, composition reports, RMN audit, and serializable morphism structures.
- `src/running/action.mts` enforces structure pre/post boundaries and composes only
  RMN-backed action bodies.
- `src/registries/morphism-packets.mts` publishes executable RMN morphism packets
  for RMN-backed actions.
- `src/running/dispatch.mts` and `src/running/invocation.mts` carry morphism
  packets and contract outcome material into invocation witnesses.
- The built action audit reports zero structure-to-structure morphisms left as free
  TypeScript bodies.
- The witness stream has a real Scott-stream contract rather than pretending an
  append-only feed is a finite response.

So the next work should not be "add contracts" or "add RMN" in the abstract.
Those are present. The drift is in the authority ordering and in which
instruments are allowed to remain strict-finite Node/package projections.

## Drift 1: live actions still collapse to the strict-finite phase

The theory says ordinary deterministic computation is a strict crystalline
special case, not the foundation. The relational-instrument note states that
the architecture exists to include finite normal form, streaming approximation,
transfinite closure, aperiodic local order, glassy metastability,
contradiction-preserving settlement, and boundary-only observability.

The code has the phase vocabulary:

- `strictFinitePhase`
- `scottStreamPhase`
- `transfiniteClosurePhase`
- `aperiodicOrderPhase`
- `glassyMetastablePhase`
- `boundaryOnlyPhase`

But all 34 live action instruments currently instantiate
`metroplat.phase.strict-finite`. That makes the action apex read as a classical
request/response package surface, even when actions are reading settlement,
non-Scott firings, first cohomology, limit stages, Lean authority, and other
material whose theory is not simply finite function evaluation.

This is the largest current drift.

Design move:

- Stop using `strictFinitePhase` as the default for every action.
- Add explicit phase selection to action declaration, with a strict-finite
  default only for genuinely finite admissions and pure finite transforms.
- Move settlement-read actions onto `transfiniteClosurePhase` where they read
  stage/limit/cofinal material.
- Move aperiodic substitution and MLD-style actions onto `aperiodicOrderPhase`
  where their correctness is local-window or hull based.
- Keep raw protocol control and host observation under `boundaryOnlyPhase`.
- Keep witness SSE under `scottStreamPhase`.

The goal is not more enum variety. The goal is that a tool client can see which
computations are normal-form finite, which are approximating streams, which are
boundary-only observations, and which are local aperiodic order readings.

## Drift 2: phase admissibility is still partly string/keyword based

The contract layer has useful reports, but several phase checks still decide
phase fit by searching textual material fields. For example,
`closureMatchesPhase`, `finalityMatchesPhase`, `lensMatchesPhase`, and
`contradictionAccounted` use token tests over closure strings, lens strings,
constraints, postcondition ids, and energetic descriptions.

That is a good migration scaffold, but it is not yet the theory. The
relational-instrument note says a phase regime is contractually relevant
material, not a namespace or metaphor. The non-reductive thesis says coherence
failure and contradiction preservation are results, not prose around results.

Design move:

- Introduce a carried `PhaseEvidence` or `PhaseWitness` family.
- Make phase reports read structured evidence instead of text tokens:
  closure-depth witness, finality witness, contradiction witness, observability
  witness, energetic witness, and coordination-cost witness.
- Keep textual descriptions as documentation, but remove their authority from
  deciding `ok`.
- For the first slice, implement this for `scottStreamPhase` and
  `transfiniteClosurePhase`, because both already have concrete structures in the
  package.

This would turn phase validation from "does the note-like string mention the
right words?" into "does the instrument carry the right witness object?"

## Drift 3: instruments are still often induced from actions, not actions from instruments

The relational-instrument note reverses the ordinary software order:

```text
contract -> projection -> implementation -> witnessed refinement
```

The current action layer does improve ordinary actions by projecting
`Action -> RelationalInstrument` in `src/registries/action-instruments.mts`.
That is valuable, but it is still downstream of authored action declarations.
The action constructor supplies a default contract when none is provided, and
the action-instrument registry reads each action as an instrument after the fact.

That means the system can still begin with verbs, codecs, summaries, and
closures, then wrap them in contract calculus. The theory wants the reverse.

Design move:

- Add an `instrumentAction(...)` projection that derives a runnable action from
  a `RelationalInstrument` plus an implementation projection.
- Make new capabilities enter through `RelationalInstrument` first.
- Keep `actionInstrument(...)` as an admission path for legacy or host-boundary
  actions, not as the normative design path.
- Generate action descriptors, MCP tools, OpenAPI, forms, prompts, witness
  policies, and tests from the instrument when possible.

The source of authority should become the instrument contract, not the Node
action shape.

## Drift 4: MCP discovery links contracts, but not the RMN body packet

The RMN note says `tools/list` should include or link the RMN morphism packet
for pure tools. The package now creates morphism packet resources, and induced
bins include those resources. But `src/projections/action-apex.mts` currently
builds MCP tool descriptors with schema, contract, phase, lens, witness policy,
endpoint projection, and settlement fields. It does not attach a direct
`x-metroplat-morphism-packet` resource link for RMN-backed actions.

So a client can discover the tool and separately discover packet resources, but
the semantic body does not yet travel with the tool descriptor.

Design move:

- Add a direct packet reference on each RMN-backed MCP tool descriptor:

```text
x-metroplat-morphism-packet:
  id: metroplat.morphism.packet.<verb>
  resource: metroplat://.../morphism-packet/...
  bodyFormat: rmn-core-0.1
  digest: sha256:...
```

- Mirror the same link into OpenAPI operation extensions.
- Add a test that every MCP tool for an action with `runTerm` links the matching
  morphism packet resource.

This is a narrow, high-leverage fix because it realizes the RMN note without
changing the evaluator.

## Drift 5: service exports remain too importable for the derived root law

The derived Node realization contract says service commitments are normally
bins, and importable service helpers should move into `src/` if they are package
realization rather than process ownership.

The current package export map has 104 exports, including eight `./services/*`
subpaths:

- `./services/filesystem-store`
- `./services/invocation-ledger`
- `./services/static-site-store`
- `./services/workspace-scanner`
- `./services/lean-workspace`
- `./services/http/app`
- `./services/http/ws-session`
- `./services/mcp`

Some of these may be intentional service APIs. But under the derived root law,
each one needs an explicit decision:

- Is this a process boundary? Keep it as a bin or service-only entry.
- Is this a pure/package realization helper? Move the importable API to `src/`
  and let `services/` bind process/env/stdin/stdout/filesystem.
- Is this a downstream app/site helper? Move it to `sites/` or `apps/`.

Design move:

- Add a small export classification report for every service export:
  `process-boundary`, `package-realization-helper`, or `site/app-surface`.
- For the first cleanup slice, move only the helpers already imported by
  package consumers into `src/` facades and leave process entrypoints in
  `services/`.
- Keep no compatibility shims unless the live tree proves a consumer needs one.

## Drift 6: temperature and diffraction are named as missing instruments, but not yet package instruments

The newest notes identify temperature and diffraction as paired missing
instruments: temperature as bulk thermodynamic completion, diffraction as
boundary spectral completion. The phase-ladder note is careful that finite
autocorrelation and finite diffraction mass are not analytic Fourier/Lebesgue
diffraction, and positive-temperature dynamics is still not a universal
real-valued closure law.

The package has good shadows:

- finite autocorrelation in `lib/closure/analysis/aperiodic-autocorrelation.mts`
  with an explicit boundary that it is not a diffraction measure;
- many measurement/evaluator term packets;
- phase signatures and energetic obligations;
- hole as a finite no-readout structure and site surface.

But the package does not yet expose "temperature" or "diffraction" as honest
relational instruments with maturity and frontier boundaries. That matters
because the product needs these as instruments, not just theory notes.

Design move:

- Add two frontier instruments, not overclaiming:
  `metroplat.instrument.matter.temperature-frontier` and
  `metroplat.instrument.matter.diffraction-frontier`.
- Each should carry:
  material context, structure presentations, phase, lens, witness policy,
  energetics, current built evidence, and explicit missing obligations.
- The diffraction instrument should expose finite autocorrelation and finite
  measured residue as built evidence while marking Fourier/Lebesgue spectral
  classifier as missing.
- The temperature instrument should expose T=0 Lyapunov / balanced flux evidence
  where available and mark positive real-valued smoothing as frontier.

This gives downstream clients a truthful instrument surface: "this is the
missing instrument and here is exactly which part is built."

## Drift 7: hole is correctly finite, but not yet integrated as the agent/horizon phase

`sites/hole/index.mts` is disciplined: it computes a finite causal set,
readout exterior, no-readout interior, shroud, effects, laws, and EAVT rows. Its
contract explicitly refuses entropy, area, radiation, agency, and smooth horizon
promotion.

That is good. The drift is that the surrounding package still treats hole
mostly as a site/root observation, while the theory notes use hole as the
horizon-bearing phase where an agent is not assigned but condensed.

Design move:

- Keep the finite hole site exactly conservative.
- Add a separate `holePhaseInstrument` that relates:
  finite no-readout structure, boundary-only observability, shroud lens, witness
  policy, and the explicit non-claims.
- Do not assert agency. Instead expose a frontier obligation:
  "prove or refute agency-bearing systems as finite no-readout/shroud structures."

This preserves the existing earned implementation while making the phase role
queryable.

## Recommended next slices

1. Narrow MCP/RMN alignment:
   add `x-metroplat-morphism-packet` links to MCP and OpenAPI descriptors, with
   tests. This is the smallest high-confidence fix.

2. Phase evidence structure:
   replace the string-based phase acceptance path for `scottStreamPhase` and
   `transfiniteClosurePhase` with structured phase witnesses.

3. Action phase migration:
   classify all current actions by phase and move non-finite reads off the
   strict-finite default.

4. Frontier instruments:
   add honest temperature/diffraction/hole-phase instruments that carry
   built evidence and missing obligations without promoting research notes to
   facts.

5. Instrument-first action generation:
   introduce `instrumentAction(...)` and use it for one new capability before
   trying to migrate the whole action apex.

## Current conclusion

MetroPlat has moved past the toy/helper phase. The contract calculus, RMN
packets, witness rows, phase signatures, and boundary projections are real.

The significant drift is that the system still often behaves like a
strict-finite Node package whose contracts describe actions after they are
declared. The theory wants a mixed-phase, non-boolean, witness-bearing
instrument whose contracts generate the software faces. The next improvements
should therefore make phase and morphism bodies more directly discoverable,
make phase evidence structured, and put new capabilities through instruments
before they become actions.
