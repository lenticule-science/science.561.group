---
title: "Predicated Nix"
component-of: nix
---

# Predicated Nix

The reading of [Nix](../../_index.md) through the [predicated-computing](../../../../../predicated-computing/_index.md) apparatus. The sub-theory is *cross-cutting*: it depends on both the [nix](../../_index.md) parent (which describes Nix on its own terms) and the predicated-computing peer-corpus (which provides the substrate apparatus the reading uses). It does not subsume either; it produces a third object — a structural map between them.

The motivating question: *to what extent is Nix a predicated computer?* The motivating answer (after reading enough of the predicated-computing concepts to ground claims rather than reach for them): Nix is **a Scott-continuous closure-rule system over a thin partial-order value-domain at the system-realization scope, with strong hash-discipline and wavefront-locality, but without the substrate's predicate-category typing on predicates, bilattice value-domain, full self-representation, or witnessed event log.** That sentence is unpacked in [narratives/nix-mapped-onto-the-substrate](narratives/nix-mapped-onto-the-substrate.md); the constituent claims live as concepts; the parts that the initial mapping pass could not ground are filed as questions.

## What this sub-theory commits to

- **Each concept names a specific structural correspondence or mismatch** between Nix and the predicated-computing apparatus, not a generic analogy. Where a correspondence is partial, the partiality is named.
- **Each correspondence cites the substrate text it depends on** — the predication-categories or predicated-computing concept, by relative path. A correspondence that cannot be grounded in a read text is filed as a question, not asserted as a concept.
- **The value-domain mismatch is not minimized.** Nix's value-domain is thin (something close to {⊥, recipe-known, realized}); the substrate's is a residuated bilattice (FOUR by default, richer admissible). The bilattice machinery does not apply to Nix as it stands; this sub-theory does not pretend otherwise.
- **The predicate-category typing mismatch is not minimized.** Per [predication-cell](../../../../../predicated-computing/concepts/predication-cell.md) line 17, *"the predicate is a typed coordinate, not a label"*; Nix's predicates are labels. The substrate's reindexing apparatus over $\mathcal{C}$ has no Nix counterpart.

## Convention

Inherits the [deployment-systems](../../../../_index.md) and [nix](../../_index.md) conventions. One entity per file; YAML frontmatter; lower-kebab-case slugs.

Cross-theory references:

- `depends-on:` — entities this note reads from, in any theory. Predicated-nix notes typically cite nix-side concepts (for what Nix actually does) and predicated-computing concepts (for the substrate apparatus the correspondence is drawn against).
- `see-also:` — non-load-bearing related entities.
- `instantiates:` — for predicated-nix concepts that realize a predicated-computing concept *in the Nix substrate*, this is the substrate concept being instantiated.

## Layout

- `concepts/` — named correspondences and mismatches between Nix and the substrate. Each is grounded in a specific substrate text.
- `narratives/` — walking documents that compose the concepts into a story.
- `questions/` — claims that the initial mapping pass could not ground from the texts already read; explicit invitations to further study.
- `theorems/` — claims that *can* be grounded but await formal statement and proof. Empty until stated.
- `objects/`, `morphisms/`, `examples/`, `references/` — to be added as content lands.

## Status

Initial draft. The opening narrative records the substrate-mapping pass; four concepts capture the load-bearing correspondences and mismatches; four questions record the unverified parts. The sub-theory is honest about its limits: claims that depend on texts not yet read (the four-regime-dichotomy theorem, Jung-Rivieccio duality, the closure-2-monad theorems, the federation-convergence theorem, the predication-fibration / hyperdoctrine objects) are filed as questions, not asserted as concepts.

## Reading order

For a reader new to this sub-theory:

1. [narratives/nix-mapped-onto-the-substrate](narratives/nix-mapped-onto-the-substrate.md) — the orienting walk-through, with citations into the predicated-computing texts each claim depends on.
2. The four concepts, in order: [derivation-as-cell-shape](concepts/derivation-as-cell-shape.md), [thin-value-domain](concepts/thin-value-domain.md), [scott-continuous-closure-rule-system](concepts/scott-continuous-closure-rule-system.md), [partial-self-representation](concepts/partial-self-representation.md).
3. The four open questions, in any order.
