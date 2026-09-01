---
name: kz-coherent-sheaf
kind: sheaf
description: "A sheaf on the bitopological-settling-site (T*, J) that equalizes the two section maps F(f), F(f') for every Kock-Zöberlein 2-cell f ⇒ f' in the temporal-2-category. The KZ-coherent sub-category Sh^KZ ⊆ Sh is reflective abelian; in strict and Scott-continuous regimes the inclusion is an equivalence because all KZ 2-cells trivialize."
symbol: "F ∈ Sh^KZ(T*, J)"
on-site: "bitopological-settling-site (T*, J)"
valued-in: "Ab (abelian groups) by default; generalizes to Q-Cat_cwl"
coherence-condition: "F(f) = F(f') for every KZ 2-cell f ⇒ f' in the temporal-2-category"
parent-category: "Sh(T*, J) — the full sheaf category"
trivializes-when: "strict (κ<ω) or Scott-continuous (κ=ω) regime (all KZ 2-cells become identities)"
minted-from: theorem-context — referenced by kz-coherent-sheaves-reflective, cech-derived-comparison-on-bitopological-site, sheaf-functoriality-on-bitopological-site, settling-associated-sheaf-well-defined, with no own archive scrap. Reconstructed from the kz-coherent-sheaves-reflective theorem's discussion of the KZ-coherence equalizer condition.
---

# KZ-coherent sheaf

A sheaf on the bitopological-settling-site `(T*, J)` that respects the **Kock–Zöberlein 2-cell structure** of the underlying temporal-2-category.

## Definition

A sheaf `F ∈ Sh(T*, J)` is **KZ-coherent** if, for every KZ 2-cell `f ⇒ f'` in the temporal-2-category `T(C, λ)`, the two induced section maps agree:

$$F(f) \;=\; F(f') \quad \text{as morphisms } F(\sigma') \to F(\sigma).$$

Equivalently, `F` factors through the **2-quotient** of `T*` obtained by identifying KZ-2-cell-related morphisms.

## What the KZ 2-cells encode

The temporal-2-category `T(C, λ)` has:
- 0-cells: predicate-time pairs `(p, τ)`.
- 1-cells: predicate-time morphisms `f: (p, τ) → (p', τ')`.
- 2-cells: comparisons `f ⇒ f'` arising from the **Kock–Zöberlein lax-idempotence** structure of the closure-2-monad applied to the substrate's time-axis.

A KZ 2-cell `f ⇒ f'` says: at the 1-categorical level, `f` and `f'` are different paths through time, but the K1 condition (lax-idempotence) makes them **comparable up to a canonical 2-cell** — neither strictly equal nor independent, but governed by the closure-2-monad's coherence.

KZ-coherence is the sheaf-side reflection of this 1-categorical equivalence: a sheaf is KZ-coherent if it can't tell `f` from `f'`.

## Reflective sub-category structure

The KZ-coherent sub-category `Sh^KZ ⊆ Sh` is **reflective abelian** (per `kz-coherent-sheaves-reflective` at `bitopological-settling-site/docs/dev/theorems/`):

- **Reflectivity**: The reflection `r: Sh → Sh^KZ` sends `F` to the equalizer presheaf-sheafification — the smallest KZ-coherent sheaf admitting a map from `F`. Unit `η_F: F → r(F)` is the universal KZ-coherent quotient.
- **Abelian**: Inherited pointwise from `Sh(T*, J)` (kernels/cokernels of KZ-coherent maps are KZ-coherent).
- **Enough injectives**: An injective `I ∈ Sh^KZ` is constructed by embedding `F ↪ I'` into `Sh`-injective `I'`, then reflecting: `r(I')` is injective in `Sh^KZ`.

## Regime collapse

In the **strict** (κ<ω) and **Scott-continuous** (κ=ω) regimes, all KZ 2-cells in `T(C, λ)` trivialize:

- Strict regime: the temporal-2-category collapses to a 1-category (κ<ω means no transfinite-step 2-cells exist).
- Scott-continuous regime: 2-cells exist but are all identities at the ω-limit (ω-Scott continuity forces strict-idempotence as noted in closure-2-monad-lax-idempotence theorem).

In both regimes, KZ-coherence is **vacuous**: every sheaf is KZ-coherent. The inclusion `Sh^KZ ↪ Sh` becomes an equivalence.

In the **transfinite-bounded** (ω<κ<ω₁) and **aperiodic** (κ≥ω₁) regimes, non-trivial KZ 2-cells appear at transfinite limit steps, and `Sh^KZ ⊊ Sh` is a proper sub-category.

## Why KZ-coherence is the right sheaf class

KZ-coherent sheaves are the sheaves the substrate's cohomology computations naturally target:

| Use case | Why KZ-coherence is needed |
|---|---|
| Settling-associated-sheaf | The sheaf `F` derived from a settling `v` is KZ-coherent because `v`'s firings respect the K1 lax-idempotence — `v(f) = v(f')` for KZ-related `f, f'`. |
| Čech-derived comparison | The Čech vs derived cohomology agreement (cech-derived-comparison-on-bitopological-site) is for KZ-coherent input sheaves; non-KZ-coherent sheaves can have Čech-derived gaps. |
| Sheaf functoriality | Sheaf functoriality under base-change (sheaf-functoriality-on-bitopological-site) is established for KZ-coherent sheaves; the base-change preserves KZ-coherence by the temporal-2-category's functoriality. |
| Verdier duality | The Verdier-duality-bitopological-site exchange acts on `Sh^KZ` — both sheaf and cosheaf sides are KZ-coherent in the derived equivalence. |

## Position

`bitopological-settling-site/library/kz-coherent-sheaf/`. Settling tier — KZ-coherence is a property of sheaves on the bitopological-settling-site, so the sub-category lives inside `bitopological-settling-site/library/`. Direct `library/` (not `hacking/library/`) because KZ-coherent-sheaf is a **derived term** of the site (a sheaf-class earned from the site's 2-categorical structure), not admitted.

## Derivation source

**Minted from theorem context.** Referenced by `kz-coherent-sheaves-reflective` (the only theorem that defines the equalizer condition explicitly), `cech-derived-comparison-on-bitopological-site`, `sheaf-functoriality-on-bitopological-site`, `settling-associated-sheaf-well-defined`. No own archive scrap. Reconstructed from the reflectivity theorem's discussion and the site's temporal-2-category structure.
