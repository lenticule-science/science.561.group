---
type: concept
class: discipline-gap
status: draft
depends-on:
  - ../../teaching/explanations/derivation.md
  - ../../../../../../predicated-computing/concepts/self-representation.md
  - ../../../../../../predicated-computing/concepts/closure-conditions.md
see-also:
  - derivation-as-cell-shape.md
title: Partial self-representation
description: Per self-representation, the substrate commits that "every operative element of the predicated computer is itself an entity in the same substrate the operative elements act on.
---

# Partial self-representation

Per [self-representation](../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the substrate commits that *"every operative element of the predicated computer is itself an entity in the same substrate the operative elements act on. There is no privileged engine, registry, or runtime that lives outside the substrate."*

Nix is **partially self-representing**. Some of the substrate's machinery is itself stored in the Nix store as ordinary entities; some of it is not. Identifying which is which is structurally important because the substrate's seven [closure-conditions](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/closure-conditions.md) — particularly *procedure closure* (condition 6) and *reference closure* (condition 4) — depend on the engine's machinery being *in* the substrate.

## What Nix does represent in the substrate

- **Derivations are store paths.** A `.drv` file is a content-addressed entity in the store; it can be queried (`nix-store --query --deriver`), referenced from other derivations (as `inputDrvs`), and audited like any other store path.
- **Built artifacts are store paths.** Compiled binaries, libraries, configuration files — everything Nix produces lives in the store.
- **The Nix evaluator and daemon, when Nix-built, are store paths.** In a Nix-managed system, `nixpkgs.nix` is a derivation whose outputs are the evaluator and the daemon binaries. The runtime is therefore a store entity, satisfying — for the Nix-built case — the substrate's "the engine is in the substrate" commitment at a coarse granularity.

## What Nix does not represent in the substrate

- **The Nix language semantics is in C++ source code, not in substrate entities.** What counts as a valid expression, what evaluation reduces what to what, the rules of laziness, the behavior of the `derivation` primitive — all live in the `nix` evaluator's source. To change the language is to edit C++, rebuild Nix, and ship a new evaluator.

  Compare the substrate's `self-representation.md` line 14:

  > *"Closure rules are entities. A closure rule's premise pattern, conclusion pattern, and declared invariants are predications on a closure-rule entity. A query for 'what closure rules apply at this predicate' is a substrate traversal, not a call into a privileged registry. Editing a closure rule is editing predications; the edit produces an event in the event log like any other mutation."*

  Nix does not satisfy this. Editing a Nix closure rule is editing the evaluator's source code, not editing predications in the store. There is no event in any log; there is a new compiler-built evaluator binary.

- **Shapes / type discipline are not substrate entities.** Per `self-representation.md` line 15, *"Shapes are entities. A constraint shape's targeted predicate, admissible values, and severity are predications on a shape entity."* Nix has type checking inside the language (sort of — it is a small dynamic-typed language) but the type discipline is in the evaluator, not in the store.

- **The closure-rule system itself has no substrate handle.** A query like *"what rules apply to this derivation?"* has no in-store answer. Rules apply by virtue of the evaluator's behavior; there is no `(rule, applies-at, derivation)` predication an operator can traverse.

## Where Nix sits on the seven closure conditions

Per [closure-conditions](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/closure-conditions.md), the seven conditions are: atom admission, identity closure, composite closure, reference closure, constraint classification, procedure closure, coherence closure.

Sketching where Nix lands on each (status: draft, not formally checked):

- **(1) Atom admission.** Yes — store paths are atoms; they are admitted by build or substitution.
- **(2) Identity closure.** Partial — store-path identity is by recipe content (input-addressed) or output content (CA mode), which is identity-by-relations on the *outgoing* side. See [derivation-as-cell-shape](derivation-as-cell-shape.md) for the partiality.
- **(3) Composite closure.** Partial — composing derivations (one's outputs as another's inputs) produces a composite derivation that is itself a store entity. But the composition operations (the Nix language combinators that build derivations from derivations) live in the language, not as store entities.
- **(4) Reference closure.** Partial — references between store paths are tracked (the references-graph is in the metadata DB) and queryable. But operations *between* derivations — the build, the evaluation — are operations on the evaluator's process state, not store entities.
- **(5) Constraint classification.** No — Nix has no shape entities. Validity is checked by the evaluator's language semantics, not by substrate-level shapes.
- **(6) Procedure closure.** No — the procedures that operate on the store (build, evaluate, instantiate, garbage-collect) are not store entities; they are commands run from the evaluator/daemon binaries.
- **(7) Coherence closure.** No, in the substrate's specific sense. Compatible local sections do not assemble into globally coherent content via substrate-level coherence-glue; they assemble via the Nix language's evaluation order. Two flakes whose outputs disagree about how to build the same upstream derivation produce a hash mismatch, not a substrate-level repair.

By the closure-conditions arc (`closure-conditions.md` lines 33-39), Nix is between *bare presence* (condition 1 only) and *composable structure* (conditions 1-4) — depending on how strictly "operations are in-region" is read. Nix is *not* a closed predicated computer in the substrate's sense.

## Why this matters

Reading Nix as a partial-self-representing predicated-computing-shaped system makes precise *what would have to be added* to lift Nix into a full predicated computer: a substrate-level encoding of the language semantics, shape entities for the type discipline, procedure entities for build/evaluate/garbage-collect, and a coherence-glue mechanism beyond hash equality. Each of these is a real engineering question, not a vague aspiration.

The current sub-theory does not propose lifting Nix this way; it records the gap honestly so that any downstream work that wants Nix-as-substrate-realization knows what it is committing to.
