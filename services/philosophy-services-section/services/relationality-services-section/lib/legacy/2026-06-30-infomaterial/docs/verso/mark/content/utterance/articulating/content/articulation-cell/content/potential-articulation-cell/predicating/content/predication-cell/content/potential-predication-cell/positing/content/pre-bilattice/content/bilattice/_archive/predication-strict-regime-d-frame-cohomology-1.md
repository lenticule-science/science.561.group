---
kind: theorem
status: proved
depends-on: [d-frame-valued-sheaf, d-frame-cohomology-comparison, strict-regime-cohomology-vanishing, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy, settling-quiescence, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf, non-scott-continuous-firing-ordinal]
---

# Strict-regime d-frame cohomology

For a knowledge presheaf $v$ in the [strict regime](four-regime-dichotomy.md) — finite $\mathbf{L}, E, \mathcal{C}$ and closure ordinal $\kappa < \omega$ — the [d-frame-valued cohomology](../objects/d-frame-valued-sheaf.md) of $\mathbb{F}_v$ on the [bitopological settling site](../objects/bitopological-settling-site.md) is

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*, \mathbb{F}_v) \;\cong\; \begin{cases} (\mathcal{P}(\Delta^{+, \mathrm{Belnap}}_{\tau^*}),\, \mathcal{P}(\Delta^{-, \mathrm{Belnap}}_{\tau^*}),\, \mathrm{con},\, \mathrm{tot}) & n = 0, \\ 0 & n \geq 1, \end{cases}$$

where $\tau^*$ is the quiescence stage, $\Delta^{+, \mathrm{Belnap}}_{\tau^*}$ and $\Delta^{-, \mathrm{Belnap}}_{\tau^*}$ are the eventual sets of truth-positive and falsity-positive cells (cells in $\{\mathbf{t}, \top\}$ and $\{\mathbf{f}, \top\}$ respectively), and $(\mathrm{con}, \mathrm{tot})$ are the d-frame relations on the powerset frames recording joint consistency and totality of cell configurations.

## Proof

The strict regime makes the bitopological settling site **finite**: $\mathcal{C}$ finite gives a finite predicate-axis, $\lambda \leq \omega$ with quiescence at $\tau^* < \omega$ gives a finite settling-axis after [settling-locally-constant truncation](settling-locally-constant-cohomology.md), and finite $\mathbf{L}, E$ give finite paired-Priestley fibers (Priestley dual of a finite distributive bilattice is a finite poset; paired Priestley adds the swap involution, still finite).

The [Tarski Laplacian](../narratives/d-frame-cohomology-framework.md) framework of [@ghrist-riess2022] applies directly to cellular d-frame-valued sheaves on finite cell complexes. Specifically:

**Step 1: Site reduction.** By [settling-locally-constant cohomology](settling-locally-constant-cohomology.md), the strict-regime bitopological settling site $\mathbf{T}^*$ has the same cohomology as its truncation $\mathbf{T}^*_{\leq \tau^*}$. The truncated site is a finite Grothendieck site with paired-Priestley fibers, finite predicate-axis, finite settling-axis.

**Step 2: Cellular structure.** Each fiber $X_q^\tau$ is a finite paired Priestley space — a 0-dimensional cell complex (vertices = points, no higher cells, since finite Priestley spaces have discrete topology). The full site assembles fibers via the predicate-category and settling-endofunctor structure, giving a 3-axis cellular structure (fiber 0-dim, settling-axial dim 1, predicate-axial dim 1) — the same 3-axis decomposition that grounds the existing [vanishing-above-degree-1](settling-cohomology-vanishes-above-degree-1.md) result on the $\mathbf{Ab}$-valued side.

**Step 3: Tarski Laplacian on 0-dim fiber.** On a 0-dim cell complex, the Tarski Laplacian on cochains has cochain group $C^0$ = product of d-frame values at points and $C^n = 0$ for $n \geq 1$. The Laplacian's fixed-point cohomology trivially gives $H^0_{\mathrm{fiber}}$ = product of fiber values; $H^n_{\mathrm{fiber}} = 0$ for $n \geq 1$.

**Step 4: Leray-style assembly.** The 3-axis decomposition's Leray spectral sequence collapses on $p + q \leq 1$ in the strict regime: the fiber axis contributes degree 0 only; the settling axis contributes degree $\leq 1$; the predicate axis contributes degree $\leq 1$. By the same 3-axis bound that gives $H^{\geq 2} = 0$ in the existing $\mathbf{Ab}$-valued strict-regime theorem, the d-frame-valued global cohomology vanishes above degree 1.

**Step 5: $H^1$ vanishes by quiescence.** The settling-axial $H^1$ generators are indexed by [non-Scott-continuous firing ordinals](../concepts/non-scott-continuous-firing-ordinal.md). In the strict regime, the closure ordinal $\kappa < \omega$ means there are no countable limit ordinals $\mu < \kappa$ — so $L_{\mathrm{ns}}$ is empty, no $H^1$ generators, $H^1_{\mathbf{dFrm}} = 0$. Predicate-axial $H^1$ similarly vanishes by the strict-regime quiescence on the predicate-axis (finite chains, no transfinite structure).

**Step 6: $H^0$ is global d-frame data.** With higher cohomology vanishing, $H^0_{\mathbf{dFrm}}$ is exactly the global sections of $\mathbb{F}_v$ on the truncated site — the d-frame whose $L_+$ component is the powerset frame of all eventually-truth-positive cells, $L_-$ is the powerset of eventually-falsity-positive cells, and consistency / totality are inherited from the global cell configuration. $\square$

## Shadow comparison instance

By the [d-frame ↔ $\mathbf{Ab}$ comparison](d-frame-cohomology-comparison.md), the shadow functor $\mathbb{S}$ sends this d-frame-valued cohomology to the pair

$$\mathbb{S}\bigl(H^n_{\mathbf{dFrm}}(\mathbf{T}^*, \mathbb{F}_v)\bigr) \;=\; \bigl(H^n(\mathbf{T}^*, \mathcal{F}_v^{(k)}),\, H^n(\mathbf{T}^*, \mathcal{F}_v^{(k, -)})\bigr).$$

In the strict regime the existing [strict-regime cohomology vanishing](strict-regime-cohomology-vanishing.md) gives both shadows as $\mathbb{Z}^{N_k}$ in degree 0 (paraconsistent count) and $\mathbb{Z}^{N_{k, -}}$ in degree 0 (negative paraconsistent count), with both vanishing for $n \geq 1$.

The d-frame cohomology then has the *additional* consistency / totality structure (relations on the cell-set subsets) recorded in degree 0, beyond what the abelianized shadow encodes. This additional content corresponds in classical terms to: "which cells co-witness inconsistency (intersect under con failure) and which cells are settled vs. left $\bot$ (covered by tot)". The bigraded refinement's [inconsistency sheaf](../objects/inconsistency-sheaf.md) recovers the inconsistency-witness data via $\mathcal{F}_v^{(\top)} = \mathcal{F}_v^{(k)} \cap \mathcal{F}_v^{(k, -)}$, but only as a relational projection; the d-frame setting carries this data intrinsically.

So the strict-regime case is the worked verification: **the d-frame-valued cohomology recovers the $\mathbf{Ab}$-valued cohomology under shadowing, with strictly more information at $H^0$ via consistency / totality, and same vanishing in higher degrees**.

## Reading

This is the framework's first concrete application — the strict regime where finite cellular structure and quiescence make the Tarski Laplacian framework apply directly without extension. The theorem confirms three things:

1. The framework computes meaningful invariants in our setting (not just abstract framework articulation).
2. The $H^0$-level extra content (consistency, totality) is real and recoverable, validating the d-frame setting's structural-faithfulness goal.
3. The higher-degree vanishing matches the $\mathbf{Ab}$-valued case — so no surprising $H^{\geq 2}$ content emerges in the simplest regime.

The theorem also establishes a methodological pattern for the chapter's other regimes: each regime's d-frame cohomology can be approached by (a) recognizing the cellular structure of the bitopological site in that regime, (b) applying the appropriate Laplacian framework (Tarski for finite, Lawvere for quantale-enriched), (c) connecting to the existing $\mathbf{Ab}$-valued cohomology via the shadow comparison.

For the concrete worked-out instance see [strict-regime d-frame computation](../examples/strict-regime-d-frame-computation.md). The Scott-continuous regime is the natural next case (settling stabilizes at $\omega$, fibers become countably-cellular but still finite-dimensional). Transfinite-bounded and aperiodic require Layer 2 / 3 of the [cellular extension plan](../narratives/cellular-extension-plan.md).
