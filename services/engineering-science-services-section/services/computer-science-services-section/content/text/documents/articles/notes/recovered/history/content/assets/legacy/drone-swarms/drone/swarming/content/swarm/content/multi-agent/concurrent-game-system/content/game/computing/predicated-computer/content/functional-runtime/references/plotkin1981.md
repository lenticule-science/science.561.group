---
type: reference
class: academic
status: cited
authors: [Plotkin, Gordon D.]
year: 1981
title: "A Structural Approach to Operational Semantics"
venue: "DAIMI FN-19, Computer Science Department, Aarhus University; reissued 2004 in Journal of Logic and Algebraic Programming 60--61, pp. 17--139"
---

## Source

G. D. Plotkin. *A Structural Approach to Operational Semantics.* Technical Report DAIMI FN-19, Computer Science Department, Aarhus University, Denmark, September 1981. Reissued 2004 in *Journal of Logic and Algebraic Programming*, volumes 60–61, pages 17–139, with a retrospective "The origins of structural operational semantics" by Plotkin (pp. 3–15).

## Form

Technical report (and retrospectively, journal special issue). The originating presentation of *structural operational semantics* (SOS): a discipline for specifying the operational semantics of programming languages by inference rules whose conclusions are evaluation steps and whose premises are sub-evaluations.

## Content summary

The report develops SOS as the alternative to denotational semantics (which loses step structure) and to ad-hoc reduction-relation presentations (which are not induction-friendly). The presentation covers:

1. **Small-step SOS** — evaluation as a relation $\langle e, s\rangle \Rightarrow \langle e', s'\rangle$ specified by syntax-directed inference rules. Each rule reduces a redex (the leftmost-outermost reducible position, or whatever congruence the rules license) and propagates substate consistently.
2. **Big-step (natural) semantics** — evaluation as a relation $\langle e, s\rangle \Downarrow v$ that hides the step structure but preserves the inductive-on-derivation discipline. (Plotkin contrasts both styles; the small-step style scales better to languages with non-termination and concurrency.)
3. **Configurations** — the pair $\langle e, s\rangle$ of expression and store, with the store's type determined by the language's mutable-state discipline.
4. **Congruence rules vs reduction rules** — the syntactic discipline that separates "step in a sub-position" from "actually reduce here", giving a confluent presentation when the underlying reduction relation is confluent.
5. **Bisimulation and the equivalence-of-semantics arguments** that an SOS specification can be proved adequate for the corresponding denotational semantics by structural induction on the SOS derivation.

The methodological commitment: every property of evaluation should be provable by induction on the SOS derivation. This is the structural-operational discipline: the proof is *driven by* the rules, with each rule's conclusion-property following from its premises' properties via the rule's own structural shape.

## Position in the corpus

Functional-runtime-platform's [evaluate](../morphisms/evaluate.md) morphism inherits the SOS discipline as its specification register: evaluation is specified by inference rules, the witness chain records the SOS derivation, and per-rule properties (preservation, progress, determinism) are proved by induction on the derivation.

[type-soundness](../theorems/type-soundness.md) is the canonical example of the SOS-and-Pierce template combined: the soundness theorem is *progress + preservation* (per [pierce2002](pierce2002.md)), with each part proved by induction on the SOS derivation. The induction's step cases follow directly from the SOS rule structure; the proof is a uniform template that scales across every type-system extension the subtheory might commit to.

[function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md) is also SOS-shaped: pure-function evaluation produces a deterministic SOS derivation given inputs; replay reconstructs the same derivation; the witness chain records both the original and the replay derivations for byte-equivalence comparison.

The [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md) narrative places Plotkin's SOS as the *evaluation-specification* step on the line: prior approaches either lost step-structure (denotational) or could not scale soundness proofs (ad-hoc reduction relations). SOS is what makes the subtheory's evaluation specification machine-checkable.

The 2004 reissue with Plotkin's retrospective documents the report's reception and the development of SOS into the standard discipline of programming-language semantics; the report itself remained an Aarhus technical report from 1981 to 2004 despite being one of the most influential documents in the field.

## Where used

- [evaluate](../morphisms/evaluate.md)
- [type-soundness](../theorems/type-soundness.md)
- [function-purity-replay-fidelity](../theorems/function-purity-replay-fidelity.md)
- [structural-lineage-from-church-to-roc](teaching/explanations/structural-lineage-from-church-to-roc.md)
- [what-functional-runtime-platform-inherits](teaching/explanations/what-functional-runtime-platform-inherits.md)
- [compile-cache-vs-substrate-faithful-evaluation](questions/compile-cache-vs-substrate-faithful-evaluation.md)
