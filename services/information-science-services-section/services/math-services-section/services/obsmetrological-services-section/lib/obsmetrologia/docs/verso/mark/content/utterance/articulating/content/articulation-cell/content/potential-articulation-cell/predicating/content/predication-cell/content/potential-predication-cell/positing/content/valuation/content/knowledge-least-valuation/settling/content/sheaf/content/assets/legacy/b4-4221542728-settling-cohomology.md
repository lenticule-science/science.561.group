---
name: settling-cohomology
description: "The cohomology of a KZ-coherent sheaf on the bitopological-settling-site, defined as right-derived functors of bounded global sections plus a direct limit over the settling-bound. H^n(T*_{≤σ}, F) for σ ≤ κ; the substrate's central cohomological invariants."
symbol: "H^n(T*, -)"
realizes: [cohomological-equivalence]
depends-on: [bitopological-settling-site, settling-associated-sheaf, settling-bound]
derives-from: docs/dev/scraps/settling-cohomology.md
---

# Settling cohomology

The cohomology of a KZ-coherent sheaf on the bitopological-settling-site, defined as right-derived functors of bounded global sections, plus a direct limit over the settling-bound.

## Bounded global sections

The site `T*_site` does not in general have a terminal object — the predicate-category `C` has a terminal predicate (the top predicate), but the settling direction is **unbounded** (every ordinal `τ < λ` is a potential index; `λ` itself is not necessarily a settling-step). So `T*_site` lacks a strict global-sections functor at full settling.

To define cohomology, the substrate uses **bounded sub-sites**:

For `σ ≤ κ` (or `σ < ∞`), let

$$\mathbf{T}^*_{\leq \sigma}$$

be the full subcategory of `T*_site` on objects `(q, τ, U)` with `τ ≤ σ`, with topology `J_{≤σ}` inherited by restriction.

The **bounded global sections functor** is

$$\Gamma_{\leq \sigma} \;:\; \mathrm{Sh}_{\mathrm{KZ}}(\mathbf{T}^*_{\leq \sigma}) \to \mathbf{Ab}, \quad \mathcal{F} \mapsto \Gamma(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}).$$

The terminal object of `T*_{≤σ}` exists (`τ = σ` is the top in the truncated settling axis); global sections are well-defined.

## Right-derived functors

For `n ≥ 0`, the **`n`-th bounded settling cohomology** is

$$H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}) \;:=\; R^n \Gamma_{\leq \sigma}(\mathcal{F}).$$

The right-derived functors exist because the category of KZ-coherent sheaves is reflective in the larger sheaf category (archive theorem `kz-coherent-sheaves-reflective`), so it has enough injectives. Standard homological-algebra machinery gives the derived functors.

## Direct limit over the settling-bound

For the **full settling cohomology** (at the closure-ordinal or settling-bound), take the direct limit:

$$H^n(\mathbf{T}^*, \mathcal{F}) \;:=\; \varinjlim_{\sigma \to \kappa}\; H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}).$$

The direct limit is well-defined: each bounded cohomology is a `Z`-module; restriction maps between bounded sub-sites give compatible morphisms; the colimit in `Ab` exists.

For closure-ordinals `κ < ω` (strict-finite regime), the direct limit stabilizes immediately — `H^n(T*, F) = H^n(T*_{≤κ}, F)` for any `σ ≥ κ`. Higher regimes require genuine transfinite colimit.

## Why this is the right cohomology

The cohomology theory must respect three conditions to be operationally meaningful:

1. **Closure-equivariance**: respect the closure-2-monad on the algebraic side via Jung–Rivieccio duality. This is what KZ-coherent sheaves are designed to provide; non-KZ sheaves break closure-equivariance.
2. **Settling-functoriality**: the direct-limit-over-`σ` makes cohomology functorial in settling progression — cells designated later contribute to cohomology at later `σ`, with the colimit assembling the full data.
3. **Boundedness**: bounded sub-sites are necessary because the full site lacks a terminal object. The direct limit reassembles the bounded computations into the full invariant.

The KZ-coherent-sheaf framework + bounded sub-site + direct-limit construction satisfies all three.

## Classifying invariants live here

The substrate's central cohomological invariants are settling-cohomology classes:

- **`H^0`** — rank: total newly-designated cells (sum across stages and predicates).
- **`H^1`** — classifying class: the aperiodic-classifying-invariant `cl-inv(v) := [1_{F_U}] ∈ H^1(T*_{≤κ}, F_U)` lives here.
- **`H^n` for `n ≥ 2`** — typically vanish (cohomological-framework's higher-degree-vanishing claim, status sketch).

So settling-cohomology is the categorical machinery that **produces the classifying invariants**. The aperiodic-classifying-invariant and cohomological-equivalence both rely on it.

## Position

`finite-settlement-algebra/hacking/library/settling-cohomology/`. Settling tier — the cohomology functor on settling-tier sheaves.

## Derivation source

Adapted from `predication-categories/objects/settling-cohomology.md`, preserved at `docs/dev/scraps/`.
