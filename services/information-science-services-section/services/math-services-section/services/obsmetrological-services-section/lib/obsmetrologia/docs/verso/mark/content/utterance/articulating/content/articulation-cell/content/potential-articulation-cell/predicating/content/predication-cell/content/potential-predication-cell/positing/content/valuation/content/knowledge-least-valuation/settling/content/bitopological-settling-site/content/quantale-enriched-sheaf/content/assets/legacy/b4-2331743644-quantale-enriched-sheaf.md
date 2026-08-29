---
name: quantale-enriched-sheaf
description: "A generalization of Ghrist-et-al's quantale-enriched cellular sheaves on graphs to Q-enriched sheaves on arbitrary Grothendieck sites. The Layer-1 ingredient of the cellular extension plan: the generalization that lets the Lawvere Laplacian framework apply to the bitopological-settling-site."
kind: sheaf
on-site: "Grothendieck site (T, J) — for the substrate, the bitopological-settling-site"
valued-in: "Q-Cat_cwl — complete weighted lattices with Q-functors as morphisms"
parameter-quantale: "Q (commutative unital quantale)"
generalizes: "Ghrist-Lopez-North-Riess 2025 graph-cellular sheaves"
depends-on: [d-frame, bitopological-settling-site]
derives-from: docs/dev/scraps/quantale-enriched-sheaf.md
---

# Q-enriched sheaf on a Grothendieck site

A generalization of Ghrist–Lopez–North–Riess 2025's **quantale-enriched cellular sheaves on graphs** to **Q-enriched sheaves on arbitrary Grothendieck sites**.

This is the **Layer-1 ingredient of the cellular extension plan** — the generalization that lets the Lawvere Laplacian framework apply to the bitopological-settling-site and other non-graph Grothendieck sites.

## Quantales and Q-enriched categories

Fix a **commutative unital quantale** `Q = (Q, ·, 1, ⪯)` — a complete lattice with associative-commutative-unital binary operation `·` that distributes over arbitrary suprema:

$$p \cdot \bigvee_{i \in I} q_i \;=\; \bigvee_{i \in I} (p \cdot q_i).$$

Examples of quantales:

- `Q = 2 = {0, 1}` (Boolean): Q-enriched = ordinary sheaves of sets.
- `Q = [0, 1]` (Lukasiewicz): Q-enriched = fuzzy sheaves.
- `Q = [0, ∞]` (Lawvere): Q-enriched = metric-style sheaves.
- `Q = d-frame`: Q-enriched = bilattice-flavored sheaves (substrate's application).

## Q-enriched categories: `Q-Cat_cwl`

A **Q-enriched category** has Q-valued hom-objects: for each pair of objects `a, b`, a hom-value `hom(a, b) ∈ Q`. The composition is a Q-multiplication; the identities are `hom(a, a) ⪰ 1`.

The category `Q-Cat_cwl` is the **complete weighted lattices** with Q-functors as morphisms. It is symmetric monoidal closed (Stubbe 2005) — has tensor product `⊗_Q` and internal Hom.

## Q-enriched sheaves on a Grothendieck site

For a Grothendieck site `(T, J)`, a **Q-enriched sheaf** is a functor

$$\mathcal{F} \;:\; \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$$

satisfying the sheaf condition for the topology `J`: for every cover `{σ_i → σ}_i`, the diagram

$$\mathcal{F}(\sigma) \to \prod_i \mathcal{F}(\sigma_i) \rightrightarrows \prod_{i, j} \mathcal{F}(\sigma_i \times_\sigma \sigma_j)$$

is an equalizer in `Q-Cat_cwl`.

## Application: cohomological framework #3

The substrate's **cohomological framework #3** (cellular-sheaf-on-clopen-lattice, Q-enriched parallel-pair) uses Q-enriched sheaves on the bitopological-settling-site. The sheaf `F_U` (d-frame-valued, sibling $thing) is a Q-enriched sheaf where `Q = d-frame`.

The framework provides cohomology classes for the substrate's settlement classification — `H^n(T*, F)` in Q-enriched cohomology.

## Six-functor package

The Q-enriched sheaf category supports the standard **six-functor package**:

- Tensor `⊗` and internal Hom `Hom` (closed symmetric monoidal structure).
- Pullback `f*` and pushforward `f_*` for site morphisms.
- Compactly-supported pushforward `f_!` and exceptional inverse `f^!`.

The substrate uses the closed-monoidal piece for now; the six-functor extensions are downstream development.

## Position

`finite-settlement-algebra/hacking/library/quantale-enriched-sheaf/`. Settling tier — the Q-enriched sheaf category that cohomological framework #3 lives in.

## Derivation source

Adapted from `predication-categories/objects/quantale-enriched-sheaf.md`, preserved at `docs/dev/scraps/`. The archive cites Ghrist–Lopez–North–Riess 2025 and Stubbe 2005 as foundational sources.
