---
id: relational-machine-stepping-map
description: "The RelationalMachineSteppingMap is the family of maps γ_t : X(t) → X(s★t) constituting the G_s-coalgebra structure on a RelationalMachineCarrier — the mechanism by which one step s advances the carrier's state from history t to history s★t."
defines: RelationalMachineSteppingMap
component-of: RelationalMachineCarrier
uses: DirectedComonad
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Machine Stepping Map

## What this is

The **RelationalMachineSteppingMap** is the family of maps that advances a [RelationalMachineCarrier](relational-machine-carrier.md) forward by one step.

Fix a step s ∈ Σ and a [RelationalMachineCarrier](relational-machine-carrier.md) X.
The stepping map is the family γ = {γ_t : X(t) → X(s★t)}, natural in t.
Each γ_t takes the carrier's state at history t and produces its state at history s★t.
The stepping map is what makes a carrier a carrier: a sheaf without stepping maps is just state storage; a sheaf with stepping maps can advance.

The stepping map is the covariant pole of the [Passage](../math/passage.md).
The restriction map goes backward: H(f) : H_{t'} → H_t forgets the extension.
The stepping map goes forward: γ_t : X(t) → X(s★t) produces the extension.
These two directions are inverses under the counit law.

## Mathematical grounding

The full construction is in [directed-comonad](../math/directed-comonad.md).
The directed comonad G_s : R → R sends F ↦ F(s★−).
A stepping map is a natural transformation γ : X → G_s X, i.e., the G_s-coalgebra structure map on X.

Two laws must hold, derived from the comonad axioms:

**Counit law** (from [directed-comonad](../math/directed-comonad.md)):
ε_X(t) ∘ γ_t = id_{X(t)}.
The counit ε_X(t) : X(s★t) → X(t) restricts back to the shorter history.
Stepping forward by s and then restricting back by ε recovers the original state.
γ is a section of ε_X — the stepping map must be right-invertible by restriction.

**Coassociativity law** (from [directed-comonad](../math/directed-comonad.md)):
γ_{s★t} ∘ γ_t = ν_X(t).
Two sequential stepping maps cohere with the comonad comultiplication ν_X.
For a carrier, ν_X(t) = γ_{s★t} — this is the concrete formula that makes coKleisli composition explicit in terms of stepping maps.

## In the FARS

In a [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md) locale, the RelationalMachineSteppingMap is instantiated each session.
The improvement skill reads the carrier at history t (the current entity files), processes incoming steps from `INBOX.md`, and writes the updated entity files — this write is the stepping map γ_t, producing the carrier state at s★t.
The counit law is satisfied by the fact that reading the files after the write and then reverting would recover the original state (version control / git is the counit mechanism).

A RelationalMachineSteppingMap MUST be natural in t — the maps must cohere across restriction.
It MUST satisfy the counit law — stepping forward then restricting back is the identity.
It MUST satisfy the coassociativity law — two sequential applications cohere with comultiplication.
It MUST be a section of the restriction map at each history — γ_t must be right-invertible by ε_X(t).

## CoKleisli composition: sequential stepping as the dynamic layer

**Source:** [Relational Universe Directed Step Comonad Shift Functor Sequential Composition](../math/relational-universe-directed-step-comonad-shift-functor-sequential-composition.md).

The stepping map is not just a single-step mechanism — it generates a full sequential composition algebra via the CoKleisli category of the directed comonad. Two stepping operations can be composed into a single sequential operation, and the resulting composition law is the CoKleisli composition. This gives the relational machine's step-by-step execution a precise algebraic structure: the sequence of steps is not a mere list but an element of the CoKleisli category.

**CoKleisli composition of stepping maps.** Given two stepping operations f: G_s X → Y and g: G_s Y → Z (each sending a "one-step-shifted carrier" to the next carrier), their sequential composition in the CoKleisli category is:

CoKleisliCompose(g, f) = g ∘ G_s(f) ∘ RelationalUniverseDirectedComonadComultiplication(X)

Concretely, at history t: first apply the comultiplication to produce X(s★s★t), then apply G_s(f) = f at history s★t to produce Y(s★t), then apply g to produce Z(t). When X is a carrier with stepping map RelationalMachineSteppingMap(γ), the comultiplication is concrete: RelationalUniverseDirectedComonadComultiplication(X)(t) = γ_{s★t} — stepping map at the shifted history. The CoKleisli composition is the formal expression of "step twice, processing each stage."

**The KZ (lax idempotence) property.** The directed comonad RelationalUniverseDirectedComonad(s) has the KZ property: G_s applied to the counit ε equals the comultiplication ν (G_s ε ≅ ν). This holds because T is a thin category — all 2-cells in T are unique, so the KZ coherence condition is trivially satisfied. In stepping map terms: the KZ property says that stepping forward by s and then restricting back (applying the counit) is the same as applying the comultiplication. A stepping map that satisfies both the counit law and the KZ property is automatically consistent with all higher-order sequential compositions.

**The three-layer dynamic structure.** The directed comonad defines three interlocking layers at each complete construction stage:

| Layer | Object | Direction | Operation |
|---|---|---|---|
| Static | RelationalHistoryFixedFiber ⊆ RelationalHistoryFiber | None | Nuclei (RelationalHistoryFiberSaturatingNucleus, RelationalHistoryFiberTransferringNucleus) act; already settled |
| Dual | (RelationalUniverseObservationSheaf)* ⊆ RelationalUniverseObservationSheaf | Contravariant | Dual nuclei on the observation side |
| Dynamic | RelationalUniverseDirectedComonad(s)-coalgebras (RelationalMachineCarrier instances) | Forward along step s | CoKleisli composition of stepping maps |

The RelationalMachineSteppingMap is the carrier's Dynamic-layer structure: it is what makes a sheaf into a carrier (a G_s-coalgebra), and CoKleisli composition is the composition law for the Dynamic layer.

**Compatibility with the fixed fiber.** On RelationalHistoryFixedFiber (the doubly-quiescent sub-sheaf), the directed comonad restricts cleanly: G_s(RelationalHistoryFixedFiber)(t) = RelationalHistoryFixedFiber at s★t, which is again in the fixed fiber because restriction maps on RelationalHistoryFixedFiber are isomorphisms of fixed-point algebras. A carrier whose stepping maps take values in RelationalHistoryFixedFiber is a "settled carrier" — one that advances through history while remaining in the doubly-stable layer. Furthermore, the construction-observation duality is preserved: G_s(RelationalUniverseObservationSheaf) ≅ (G_s RelationalHistoryFiber)∨ — the dual layer is preserved under one step of CoKleisli dynamics.

**One complete turn.** After one complete pass through the four phases (algebra, language, geometry, dynamics), the relational universe R_0 = Sh(T^(0), J|_{T^(0)}) has all three layers in place: the static layer (fiber algebras with nuclei), the dual layer (the observation sheaf), and the dynamic layer (the directed comonad and its coalgebra structure). The stepping map is the dynamic layer's concrete instantiation — the mechanism by which the operators U_G and G_s are "armed to produce R_1, and from R_1 to produce R_2, and so on without limit."

**Proposition (Stepping maps generate the dynamic layer).** The RelationalMachineSteppingMap family γ = {γ_t: X(t) → X(s★t)} is precisely the G_s-coalgebra structure that places carrier X in the Dynamic layer of the three-layer structure. Sequential composition of steps is CoKleisli composition in coKl(G_s), with the explicit formula CoKleisliCompose(g, f) = g ∘ G_s(f) ∘ RelationalUniverseDirectedComonadComultiplication(X). The KZ property (G_s ε ≅ ν, following from T being thin) guarantees that the stepping map's counit and coassociativity laws are the only conditions needed for full CoKleisli compatibility — no additional coherence data is required.

*Source.* Directed comonad definition, counit, and process carriers from [Relational Universe Directed Step Comonad §Directed Comonad](../math/relational-universe-directed-step-comonad-shift-functor-sequential-composition.md#directed-comonad). CoKleisli composition from [§CoKleisli Category](../math/relational-universe-directed-step-comonad-shift-functor-sequential-composition.md). Three-layer table from [§Compatibility with Relational Universe Structure](../math/relational-universe-directed-step-comonad-shift-functor-sequential-composition.md). Status: comonad laws are established in RelationalUniverseModalAdjointChain; the KZ property follows from T being thin. $\square$

## Open questions

- Whether the CoKleisli composition law has an operational interpretation in the FARS: whether two sequential skill invocations (two steps s₁, s₂) compose as CoKleisli morphisms, and whether the comultiplication RelationalUniverseDirectedComonadComultiplication provides a canonical way to compute the "two-step carrier state" from the one-step state.
- Whether the three-layer structure (Static/Dual/Dynamic) corresponds to a partition of the FARS entity space: static entities = settled spec files (in RelationalHistoryFixedFiber), dual entities = their observational shadows (RelationalUniverseObservationSheaf), dynamic entities = carriers with active stepping maps (processes in flight).
