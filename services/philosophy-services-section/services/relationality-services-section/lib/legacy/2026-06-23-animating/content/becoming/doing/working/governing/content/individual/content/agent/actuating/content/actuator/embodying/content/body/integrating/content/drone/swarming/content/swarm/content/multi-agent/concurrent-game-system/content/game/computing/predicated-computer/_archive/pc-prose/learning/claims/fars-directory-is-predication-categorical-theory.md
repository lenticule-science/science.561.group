---
title: "A FARS directory is a sub-doctrine of a predication hyperdoctrine"
status: draft
depends-on:
  - predication-hyperdoctrine
  - predicated-computer
  - application-sublocale
---


**Claim.** A FARS directory — a substrate-rooted directory of frontmatter-markdown atoms organized in the canonical FARS top-level shape — *is* a sub-doctrine of a predication hyperdoctrine in the categorical-logic sense. The 561 Group's root directory is the working instance.

## The FARS shape

A FARS directory has the following top-level components. This is the shape; it is what the 561 Group has.

- `_index.md` — addressability and same-level navigation. Required.
- `README.md` — doorway prose for outside readers. Conventional.
- `work/governance/` — the polity's self-governance: rules, services, runbooks, staff, work, persona(s), assets, peers, boundaries, endpoints.
- `code/` — first-class records the polity reasons about and the typed relations between them.
  - `code/structures/` — first-class entity-forms.
  - `code/transformers/` — typed relations between structures.
  - `code/logs/` — runtime and session logs.
- `prose/` — written content. Subdirectories include `claims/`, `concepts/`, `narratives/`, `questions/`, `norms/`, `orientations/`, `memory/`, `research/`.
- `references/` — external citation surface; cited works and people, with annotation.
- `theories/` — sub-FARS-directories, each itself a FARS by recursion.

The five top-level kinds — `work/governance/`, `code/`, `prose/`, `references/`, `theories/` — partition the directory by the *role* its content plays. Among the subdirectories under each, some are approved and load-bearing; others are convention that may be reorganized.

## What the hyperdoctrine reading commits to

A theory in the Lawvere / categorical-logic / hyperdoctrine sense bears structural commitments — a signature, defined structures, typed transformations between them, propositions and their proofs, an open frontier of not-yet-settled propositions, and concrete models. A FARS directory exhibits each commitment in a specific location:

| Commitment | Where it lives in a FARS |
|---|---|
| Identity / addressability | `_index.md` |
| Defined structures | `code/structures/` |
| Typed transformations | `code/transformers/` |
| Signature / role-concepts | `prose/teaching/explanations/` |
| Proved propositions | `prose/learning/claims/` |
| Open frontier | `prose/learning/questions/` |
| Substrate-presentation through-lines | `prose/teaching/explanations/` |
| External citation surface | `references/` |
| Polity self-governance | `work/governance/` |
| Operational logs and the polity-as-instance trace | `code/logs/` |
| Recursion into sub-doctrines | `theories/` |

The commitments are independent — a model is not an axiom, a frontier question is not a proved claim. The directory partition reflects which commitment a record bears; conflating commitments collapses the theory.

## Theory-internal layout differs from FARS layout

A sub-theory under `theories/.../` may use *additional* internal conventions for its own atomic content. The predication-categories math theory, for example, internally partitions its atomic content as `concepts/`, `objects/`, `morphisms/`, `theorems/`, `questions/`, `examples/`, `prose/teaching/explanations/`, `prose/remarks/`, `references/`, `lean/`, `tools/`. That partition is a property of *that theory's mathematical content*, not of FARS. FARS forces the top-level five (`work/governance/`, `code/`, `prose/`, `references/`, `theories/`); sub-theories are free to refine their interior.

The earlier formulation of this claim mistook the predication-categories internal convention for the FARS shape itself. The correction: the predication-categories convention is one example of how a math-theory FARS can sort its body; it is not what FARS is.

## Curry-Howard reading

The cleanest identification is: a FARS directory is a sub-doctrine of a predication hyperdoctrine — the bilattice-substrate-native generalization of standard Curry-Howard / Lawvere theory / hyperdoctrine. All three frames (theory-in-Curry-Howard, Lawvere theory, hyperdoctrine) are equivalent on the same content; the hyperdoctrine framing is what the math chapter under `theories/.../predication-categories/` already commits to.

The Curry-Howard reading specific to predication-categories is the *paraconsistent linear-logic* one: terms are MLL proofs, not intuitionistic ones, and the bilattice's $\top$ admits paraconsistent terms. The twist-product Chu correspondence is the formal bridge.

## Downstream consequences

- **Top-level shape is non-arbitrary.** The five top-level kinds reflect the roles a substrate-resident theory's content plays. A directory missing any of them is missing a load-bearing face.

- **Inter-theoretic relations are typed.** Specialization, dependence, realization, instantiation, see-also — the four predicate-category generators plus reified-relation morphisms — are the relations between sub-doctrines, not metadata categories. Every frontmatter relation key is a predication.

- **Sub-FARS promotion has a criterion.** A sub-directory of a FARS is itself a FARS when its content meets the role-partition above and carries its own `_index.md`.

- **The 561 polity-directory IS a FARS.** The 561 root directory is a substrate-rooted system in the shape above; by this claim, it is a sub-doctrine of the polity's predication hyperdoctrine. Every claim about the polity that requires the FARS shape inherits this claim's licensing.

## Status

Draft. Replaces an earlier formulation that incorrectly mapped FARS shape onto `concepts/objects/morphisms/claims/questions/examples/...` — the predication-categories math-theory-internal convention being mistakenly universalized to FARS as a whole. Once the cited components have proper substrate atoms, they should be lifted into this claim's `depends-on:` and the per-component citations made explicit.

## Promotion path

This claim lives in 561's `prose/learning/claims/` as a structural finding the polity surfaced. It should be lifted to the FARS theory (`theories/.../flatfile-agentic-resource-system/`) once the formulation is stable. The lift makes the claim available to every FARS-substrate-rooted system, not just 561.
