---
type: concept
class: artifact-recipe
see-also: [store-path, store, flake]
title: Derivation
description: "A derivation, in Nix, is the recipe for a single build step: an attribute-set with a fixed shape that names which builder to run, with which arguments, in which environment, against which input dependencies, on which platform, and where…"
---

# Derivation

A *derivation*, in Nix, is the recipe for a single build step: an attribute-set with a fixed shape that names which builder to run, with which arguments, in which environment, against which input dependencies, on which platform, and where to place the resulting outputs. After evaluation, a derivation is materialized as a `.drv` file in the store — a serialized, content-addressed record of the recipe.

A derivation, concretely, has the following structural slots:

- `name` — a human-readable label.
- `system` — the platform tuple the build targets (e.g. `x86_64-linux`).
- `builder` — the executable that runs the build (a path into the store, typically a shell or compiler).
- `args` — the arguments passed to the builder.
- `env` — environment variables exposed to the builder.
- `inputDrvs` — the set of other derivations that must be realized before this one builds.
- `inputSrcs` — the set of source paths the build reads.
- `outputs` — the set of outputs the build produces (typically `out`, sometimes also `dev`, `bin`, `lib`, `man`, etc.). Each output has a predetermined store path.

Two structural commitments distinguish a Nix derivation from "a build script":

- **The recipe is content-addressed.** Two derivations whose recipes are byte-identical (modulo the canonical .drv serialization) get the same store path. Two whose recipes differ — in any input-affecting way — get different store paths. This is what makes builds reproducible and what makes binary caches possible.
- **The build is hermetic.** A builder runs in a sandbox that exposes only the declared `inputDrvs` and `inputSrcs`; the network is off (unless the derivation is fixed-output and declares its result hash); the filesystem outside the sandbox is hidden; ambient state cannot leak in. The output bytes are a function of the recipe.

A derivation is the unit at which Nix reasons about *what to build*; a [store path](store-path.md) is the unit at which Nix reasons about *what has been built*; a [flake](flake.md) is the unit at which Nix reasons about *modular collections of derivations and their boundaries*.

## How a derivation is produced

Derivations are not authored directly. A user authors a Nix expression (a `.nix` file); the [evaluator](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/_index.md) reduces the expression to values; when a value is a function call to `derivation { … }` (or to a higher-level helper like `mkDerivation` or `writeShellApplication` that wraps it), the evaluator emits a `.drv` file. The .drv file is the canonical serialization of the derivation; from it, the output store path is computed deterministically as a hash of the recipe.

The two-step structure — *evaluate to derivation*, *build the derivation* — is structural: evaluation is pure and lazy; building is the impure, sandboxed step where bytes are produced.

## Earlier material

The derivation is the philosophical argument at the center of relationality. It begins from a single claim — that something exists — and shows, through nine recursive phases, that each structure's [coherence](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/coherence.md) necessarily generates the next. No axioms are assumed. No mathematical framework is posited. Everything is earned from the requirements of consistent existence.

Each phase follows a triple pattern. Given a structure whose coherence has been established:

1. That coherence cannot not derive a **dynamic of determination** — an act that the structure's own persistence requires.
2. That determination cannot not derive a **dynamic of relation** — a condition that stabilizes what the act produces.
3. That relation cannot not derive a **dynamic of structure** — a minimal configuration that formalizes the interplay.

The new structure leaves something undetermined. That undetermined remainder [incites](../../../../../relationality-services-section/content/text/glossary/concepts/incitement.md) the next phase.

**Phase 1 — Existential coherence.** To claim that something exists is to claim it is not what it is not. This claim has dynamics: including (what something is) and excluding (what it is not). For these to hold coherently, a minimal structure stabilizes the interplay between inclusion and exclusion. But the dynamics by which this coherence is sustained remain undetermined.

**Phase 2 — Relational coherence.** Sustaining the coherence of existing requires an ongoing act: relating — the continuous maintenance of the interplay between including and excluding. Relating introduces reflexive sequence: each relational unit can relate to itself, producing deepened structure. The condition of relation and the structure of relational form arise. But what coheres relational form itself remains undetermined.

**Phase 3 — Sustained relational dynamics.** Relational form requires an act that mediates between relating and relation: relating-relation. This produces relational self-coherence and, from it, the structure of relational [closure](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/closure.md) — the self-maintenance of relation through relating. But what determines the coherence of the self-sustaining relational unit remains undetermined.

**Phase 4 — Bounded relational coherence.** The self-sustaining unit must [distinguish](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/terms/distinguish.md) itself from what it is not — from relationlessness. This produces boundary-excluding, relational negation, and the structure of relational boundary. But what determines the coherence of the bounded unit remains undetermined.

**Phase 5 — Reflexive relational coherence.** The relational boundary itself must be related — [reflexion](../../../../../../content/text/glossary/concepts/reflexion.md) folds the boundary into the system it bounds. This produces reflexive relating, reflexive relation, and reflexive form: the structure that ensures exclusion itself is coherently stabilized within relation. But what coheres the reflexive unit remains undetermined.

**Phase 6 — Multirelational coherence.** The reflexive unit must be differentiated from other reflexive units. This produces external [differentiation](../../../../../relationality-services-section/content/text/glossary/concepts/differentiation.md), the condition of co-presence, and the structure of relational tension — the interplay between distinct units that preserves both their distinctness and their mutual relationality. But what determines the coherence of many coexisting units remains undetermined.

**Phase 7 — Relational field coherence.** Multiple units require two simultaneous acts: inter-unit relating (local coherence between units) and field-integrating (global coherence across the whole). These produce mutual relationality, field coherence, and the structures of mutual relational form and field form. Reflexive equilibrium ensures that the system stabilizes under further deepening. But what determines the coherence of the integrated field remains undetermined.

**Phase 8 — Meta-boundary coherence.** The entire relational field must be distinguished from what lies beyond it. This produces meta-boundary excluding, meta-negation, and the structure of meta-boundary — formalizing the division between the relational field and its outside. But what determines the coherence of the meta-boundary remains undetermined.

**Phase 9 — Meta-relational coherence.** The meta-boundary itself must be related. Two acts arise: meta-reflexive relating (folding the meta-boundary back into the system) and meta-transcendence (engaging with what lies beyond). These produce meta-reflexive relation, meta-expansion, and the structures of meta-reflexive form and meta-extension. Closure at this level exposes new implicit dynamics — each closed relational domain compels the emergence of a new domain. The derivation does not terminate; it unfolds.

The nine phases organize into five movements that develop the formal vocabulary of relationality:

1. [Logical Origination](../../../../../../content/text/glossary/concepts/logical-origination.md) (Phases 1–2) — from the primitive act of distinction through the logical structure of [recognition](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/recognition.md)
2. [Structural Stabilization](../../../../../../content/text/glossary/concepts/structural-stabilization.md) (Phases 3–4) — from sustained relating through [closure](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/closure.md), boundary, and [balance](../../../../../relationality-services-section/content/text/glossary/concepts/balance.md)
3. [Directed Dynamics](../../../../../relationality-services-section/content/text/glossary/concepts/directed-dynamics.md) (Phase 5) — from reflexive relating through directed [flow](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/processes/flow.md) and the two modes of determination ([incitement](../../../../../relationality-services-section/content/text/glossary/concepts/incitement.md) and [induction](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/induction.md))
4. [Geometric Cohesion](../../../../../../content/text/glossary/concepts/geometric-cohesion.md) (Phases 6–7) — from co-presence through the architecture that binds local and global
5. [Emergent Containment](../../../../../../content/text/glossary/concepts/emergent-containment.md) (Phases 8–9) — from the meta-boundary through states, evolution, and [measurement](../../../../../../content/text/glossary/concepts/measurement.md)

Each movement identifies correspondences to established mathematics — not as the primary content, but as validation that the philosophical structures are formally well-founded.

- [Relational Ontology](../../../../../../content/text/glossary/terms/relational-ontology.md) — the philosophical claim the derivation demonstrates
- [The Five Mathematical Systems](../../../../../relationality-services-section/content/text/glossary/terms/five-mathematical-systems.md) — how the derivation connects to four mathematical universes
- [Incitement](../../../../../relationality-services-section/content/text/glossary/concepts/incitement.md) — the phenomenon that drives each phase forward
- [Induction](../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-2/domains/ai-generated-relationality/domains/phenomena/induction.md) — the complementary phenomenon of completed structure producing new properties
