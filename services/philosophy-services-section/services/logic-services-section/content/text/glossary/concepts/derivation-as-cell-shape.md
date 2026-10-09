---
type: concept
class: correspondence
status: draft
depends-on:
  - ../../teaching/explanations/derivation.md
see-also:
  - thin-value-domain.md
  - ../../../../../../predicated-computing/concepts/predication-cell.md
title: Derivation as cell shape
description: A Nix derivation, after evaluation, is a .drv record that names structural slots — inputDrvs, inputSrcs, builder, args, env, outputs, system.
---

# Derivation as cell shape

A Nix [derivation](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/teaching/explanations/derivation.md), after evaluation, is a `.drv` record that names structural slots — `inputDrvs`, `inputSrcs`, `builder`, `args`, `env`, `outputs`, `system`. From this one record, relations of the shape `(s, p, o)` can be extracted:

- `(output-path, depends-on, input-path)` for each input in `inputDrvs ∪ inputSrcs`;
- `(output-path, builds-using, builder-path)`;
- `(output-path, targets-system, system-tuple)`;
- `(output-path, outputs, output-path)` (the derivation reports its own outputs).

The triple shape is there. The cell-shape correspondence with [predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/predication-cell.md) is, however, **partial**, and the partiality is structural rather than incidental.

## The match

Per [predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/predication-cell.md), a predication cell is an ordered triple $(s, p, o)$ oriented from subject to object through the predicate, with subject-and-object positions not interchangeable. Nix's derivation relations have this orientation: an output `depends-on` an input is not the same statement as an input `depends-on` an output. The orientation is intrinsic to the recipe.

## The mismatch — predicates as labels, not typed coordinates

The substrate's `predication-cell.md` (line 17) commits explicitly:

> *"The predicate is a typed coordinate, not a label. Predicates live in a small category $\mathcal{C}$ — the predicate category — with morphisms in four classes (specialization, converse, subject-projection, object-projection). The predicate coordinate of a cell carries the typing that licenses reindexing along these morphisms; "label" is too thin a word for the role."*

Nix's "predicates" are field names in an attribute set (`inputDrvs`, `inputSrcs`, `builder`, `args`). They have no $\mathcal{C}$ over them. There is no specialization morphism between, say, `inputDrvs` and `inputSrcs`; no converse generator that produces a "depended-on-by" predicate from `depends-on`; no projection morphism collapsing along a diagonal. Nix's relations are *labels in the RDF sense* — exactly the impoverished form `predication-cell.md` warns against.

The structural consequence: the substrate's compositional machinery that depends on $\mathcal{C}$ — reindexing along $\mathcal{C}$-morphisms, naturality of the fiber functor, the predicate-uniformity discipline of the closure-rule language (defined in predication-categories' `closure-rule-language.md`, summarized in [closure-rule](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/closure-rule.md)) — does not have direct counterparts in Nix because there is no $\mathcal{C}$ to be natural over.

## Identity-by-relations is also partial

Per [identity-by-relations](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/predicated-computing/concepts/identity-by-relations.md): *"an entity is identified by which relations it participates in"*; per [predicated-computer](../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md): *"two entities are the same when their incident-predication structure is the same."*

A Nix store path's hash is computed from the .drv content — the *outgoing* relations of the derivation cell (its inputs, its builder, its system, its env). Two derivations with the same .drv content get the same store path. So Nix has identity-by-outgoing-relations.

But the substrate says *incident*-predication structure — incoming edges count too. Adding a thousand new derivations that depend on `/nix/store/abc...-foo` does not change the hash of `foo`. Nix's identity is invariant under incoming edges. The substrate's identity is not.

(Content-addressed derivations weaken this in the other direction: same recipe can yield different identity if outputs differ. Default Nix is input-addressed; CA mode is opt-in.)

## What the partial correspondence supports

The partial correspondence is enough for the substrate's *byte-level* hash discipline to apply: same canonical form → same hash → same store path. See [scott-continuous-closure-rule-system](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/deployment-systems/theories/nix/theories/predicated-nix/concepts/scott-continuous-closure-rule-system.md) for what the partial correspondence supports at the closure-rule level, and [thin-value-domain](thin-value-domain.md) for what it does not.

## What the partial correspondence does not support

The substrate's reindexing machinery, the four-class generator structure, the predicate-uniformity discipline of closure rules, and the substrate's federation morphisms (which compose along $\mathcal{C}$-morphisms) all depend on $\mathcal{C}$ being a real category, not a label set. To lift Nix into the substrate's full apparatus, an actual predicate category over Nix's field names would have to be constructed — a separate sub-theory's worth of work.
