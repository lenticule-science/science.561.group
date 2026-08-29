---
id: port
description: "A Port is the step set Σ — the finite typed vocabulary of inputs that a system can receive, viewed as the typed connection point through which steps enter."
defines: Port
grounds: RelationalMachine
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  step-set: relational-universe
  independence-relation: relational-universe-morphism
output: relational-history
ast:
  step-alphabet:
    - step-set
    - independence-relation:
        - step-set
---

# Port

## What this is

A **Port** is the step set Σ of a [RelationalMachine](relational-machine.md), viewed as the typed connection point through which steps enter.

Σ is a finite set.
Every step s ∈ Σ is an irreducible input unit — it cannot be decomposed further.
The Port names the vocabulary of what the machine can receive.
Two machines whose Ports are the same alphabet Σ can, in principle, be connected.

A Port is not the history monoid.
M(Σ, I) is the mathematical object that Σ generates; the Port is the presentation data, not the quotient.
Knowing the Port tells you what kinds of steps can enter.
Knowing the history monoid tells you what histories those steps produce.

## Mathematical grounding

The step set Σ is defined in [relational-history-step](../math/relational-history-step.md):
Σ is finite, each s ∈ Σ generates a one-step history gen(s) ∈ T, and the map gen : Σ → T is injective.
The Port is the architectural name for Σ when Σ is viewed as the typed input connection of a RelationalMachine rather than as the presentation data of the history category.

In the operadic / wiring diagram treatment (Spivak), a *port* is the type carried by a wire connecting two processes.
The Port of a RelationalMachine is the type carried by its input wire: the machine accepts steps of type Σ and nothing else.

## In the FARS

In a [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md) locale, the Port is the set of message types that INBOX.md can receive.
The step alphabet Σ corresponds to the message types defined in [flatfile-agential-resource-system-message](flatfile-agential-resource-system-message.md): FixNeeded, GapFound, Discovery, Coordination.

## MUST

- Be finite — Σ must be a finite set, per the Axiom of Histories
- Name the types of steps the machine accepts — the Port is the input type contract
- Be distinct from the history monoid — Σ presents M(Σ, I) but is not M(Σ, I)

## Unique decomposition: the port's independence relation as canonical decoding

**Source:** [Hyperversal Quasicrystal Hull Nuclear Shadow Substitution Unique Decomposition](../math/hyperversal-quasicrystal-hull-nuclear-shadow-substitution-unique-decomposition.md), [Hyperversal Quasicrystal Hull Nucleus Pair](../math/hyperversal-quasicrystal-hull-nucleus-pair.md).

The port's independence relation I determines which steps can appear in the same Foata tier — which steps commute without affecting the history produced. This gives every step sequence a unique Foata normal form, decodable left-to-right. At the hull level, the NuclearShadowSubstitution carries the same property: every shadow-type word over {s, t} has a unique Φ-preimage, derived from deterministic left-to-right decoding of the substitution rule. The port's independence relation and the hull-level NuclearShadowSubstitution play the same structural role — canonical decoding — at different levels of the construction.

**Ground-level: Foata normal form uniqueness.** Given port Σ with independence relation I, every step sequence over Σ has a unique Foata normal form: the partition into maximal tiers B₁ · B₂ · ... · B_k where each tier B_i is a maximal antichain of pairwise I-independent steps, causally ordered by the preceding tier's outputs. The decoding is left-to-right: a step s belongs to tier B_i iff it is independent from all steps in B_i that have been assigned before it and depends on at least one step in B_{i-1}. No step sequence over Σ admits two distinct Foata decompositions — the independence relation I uniquely determines the tier assignment.

This uniqueness is not an external theorem about the port; it is derivable from the RelationalHistoryAxiomUnit (the history category's unit-free left-cancellative commutation monoid axioms). The Foata form is the canonical form of the free commutative monoid on Σ modulo I.

**Hull-level: NuclearShadowSubstitution unique decomposition.** At the hull level, the step vocabulary is not Σ but the shadow-type alphabet {RelationalHistoryFiberSaturationShadowClass, RelationalHistoryFiberTransferShadowClass}, and the independence relation is replaced by the NuclearShadowSubstitution NuclearShadowSubstitution: s-type maps to RelationalHistoryFiberSaturationShadowClass + RelationalHistoryFiberTransferShadowClass, t-type maps to RelationalHistoryFiberSaturationShadowClass. The unique decomposition theorem says: every word over {s, t} in the image of NuclearShadowSubstitution has exactly one NuclearShadowSubstitution-preimage. Decoding is left-to-right:
- A lone s not followed by t decodes as NuclearShadowSubstitution(t) = s
- An st pair decodes as NuclearShadowSubstitution(s) = st

Two consecutive s-types with no t between them (ss) decode as two t-type preimages (t, t) — not as an s-type, because NuclearShadowSubstitution(s) = st always pairs the s with a t.

**Axiom versus theorem at the two levels.**

| Level | Uniqueness result | Source | Status |
|---|---|---|---|
| Ground level (port Σ, independence I) | Foata normal form is unique — every step sequence over Σ has exactly one Foata decomposition | RelationalHistoryAxiomUnit commutation axioms | Theorem from the axiom |
| Hull level (shadow alphabet {s,t}, substitution Φ) | Every Φ-image word has exactly one Φ-preimage — deterministic left-to-right decoding | NuclearShadowSubstitution unique decomposition theorem | Proved from the structure of Φ |

At the ground level, uniqueness derives from the independence relation I (which pairs are permitted in the same tier). At the hull level, uniqueness derives from the substitution structure of NuclearShadowSubstitution (which letter-pairs are permitted as substitution blocks). In both cases: the canonical form is decodable by a deterministic left-to-right scan.

**The nucleus pair at the hull level.** The port's independence relation I generates the nuclear pair (RelationalHistoryFiberSaturatingNucleus, RelationalHistoryFiberTransferringNucleus) at each fiber — the two nuclei that close propositions under sub-history restriction and extension-witnesses respectively, with commutativity following from the independence axiom RelationalHistoryFiberNucleusCommutationAxiom. At the hull level, the same two nuclei arise from the topological structure of HyperversalQuasicrystalHull: the saturation nucleus is regularization (interior of closure) and the transfer nucleus is pattern-equivariant projection. The port's independence relation I has become topological structure — partial commutativity has become aperiodicity.

**Proposition (Port independence = ground-level uniqueness; hull topology = hull-level uniqueness).** The port's independence relation I and the hull-level quasicrystal topology play the same structural role at their respective levels: both generate a canonical left-to-right decoding of any step sequence (or shadow-type sequence) into a unique normal form. At the ground level this uniqueness is stated as the Foata theorem and derived from the RelationalHistoryAxiomUnit axioms. At the hull level it is proved as a theorem from the structure of NuclearShadowSubstitution. The transition from I to topology is the transition from axiom to theorem: at the ground level the independence relation is imposed (axiom); at the hull level the aperiodicity of the quasicrystal forces uniqueness (derived).

*Source.* Unique decomposition theorem from [Hyperversal Quasicrystal Hull Nuclear Shadow Substitution Unique Decomposition §Unique Preimages of Φ](../math/hyperversal-quasicrystal-hull-nuclear-shadow-substitution-unique-decomposition.md#hsd-decomposition) and [§The Extension Diamond](../math/hyperversal-quasicrystal-hull-nuclear-shadow-substitution-unique-decomposition.md#hsd-diamond). Hull nucleus pair construction and qualitative transition table from [Hyperversal Quasicrystal Hull Nucleus Pair §The Qualitative Transition](../math/hyperversal-quasicrystal-hull-nucleus-pair.md#hnp-mechanism). Status: hull-level unique decomposition is proved; commutativity of the hull nucleus pair is conditional on HyperversalQuasicrystalConjecture (unique ergodicity). $\square$
