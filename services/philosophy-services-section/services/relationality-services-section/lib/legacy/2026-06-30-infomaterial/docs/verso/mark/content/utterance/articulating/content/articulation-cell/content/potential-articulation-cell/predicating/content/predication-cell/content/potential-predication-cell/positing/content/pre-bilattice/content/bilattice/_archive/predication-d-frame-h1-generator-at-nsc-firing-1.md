---
type: theorem
status: proved
depends-on: [d-frame-valued-sheaf, d-frame-cohomology-comparison, non-scott-continuous-firing-ordinal, transfinite-bounded-regime-h1-generators, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf]
---

# D-frame H¹-generator at a non-Scott-continuous firing

The structural construction of a d-frame-valued $H^1$-generator $D_\mu$ at each non-Scott-continuous firing ordinal $\mu$ of a predication settling. This construction is the chapter's most-load-bearing piece of new mathematics on the d-frame side: it is cited by the [transfinite-bounded-regime](transfinite-bounded-regime-d-frame-cohomology.md) and [aperiodic-regime](aperiodic-regime-d-frame-cohomology.md) d-frame cohomology theorems for their $H^1$-content, by the [d-frame Verdier composition](d-frame-verdier-composition.md) for orbit-type analysis, and by the [strong-MLD via composed-duality orbits](strong-mld-via-composed-duality.md) for the firing-orbit-type function.

Centralizing the construction here lets downstream theorems cite it directly rather than reproducing the argument.

## Setup

Let $v$ be a predication settling on a base $(\mathbf L, \mathcal C, E, \lambda)$ with closure ordinal $\kappa$. Let $\mu \in L_{\mathrm{ns}}(\kappa)$ be a [non-Scott-continuous firing ordinal](../concepts/non-scott-continuous-firing-ordinal.md) below $\kappa$ — a stage at which the closure operator's action does not commute with directed suprema, producing a cellular jump in the bitopological settling site that contributes a non-coboundary cocycle to the d-frame cochain complex.

By the [transfinite-bounded $H^1$-generators theorem](transfinite-bounded-regime-h1-generators.md) applied at the abelian-shadow level, exactly one cell is newly designated at each NSC firing $\mu$ on each evidence side. Call the newly-added cell at $\mu$ the **firing cell** of $\mu$, denoted $(s_\mu, o_\mu, q_\mu) \in E \times E \times \mathcal C$.

## The d-frame generator $D_\mu$

The d-frame generator at firing $\mu$ is determined by the bilattice value of the firing cell at the firing stage $\tau = \mu$:

$$D_\mu \;:=\; (L_+(D_\mu),\, L_-(D_\mu),\, \mathrm{con}(D_\mu),\, \mathrm{tot}(D_\mu)) \;\in\; \mathbf{dFrm}.$$

The construction proceeds by case on the firing's evidence side:

**Case 1 — truth-only firing** ($v_\mu(q_\mu)(s_\mu, o_\mu) = \mathbf t$, with no falsity-component prior to $\mu$). The firing cell contributes to $L_+$ alone:

$$D_\mu = (\mathbb Z, 0, \text{trivial-con}, \text{trivial-tot}).$$

The $L_+$ component is rank-1 (one new cell on the truth-positive side); the $L_-$ component is zero (no new cell on the falsity-positive side); the consistency relation is trivial (no co-witnessing $\top$-cell); the totality relation is trivial (the new cell is fully settled on its own side).

**Case 2 — falsity-only firing** ($v_\mu(q_\mu)(s_\mu, o_\mu) = \mathbf f$, with no truth-component prior to $\mu$). Symmetric to Case 1:

$$D_\mu = (0, \mathbb Z, \text{trivial-con}, \text{trivial-tot}).$$

**Case 3 — $\top$-firing** (both components first appear at $\mu$ — simultaneous truth-and-falsity assertions arrive at $\mu$). Both sides contribute simultaneously, with consistency-failure at the co-witness:

$$D_\mu = (\mathbb Z, \mathbb Z, \text{con-fails-on-singleton-pair}, \text{trivial-tot}).$$

The consistency relation explicitly records the $(\mathbf t, \mathbf f)$-disagreement at the firing cell as a $\top$-witness — the singleton pair $(\{(s_\mu, o_\mu, q_\mu)\}, \{(s_\mu, o_\mu, q_\mu)\}) \in L_+ \times L_-$ is the unique con-failure.

## Properties

**Functoriality.** $D_\mu$ is functorial in the firing data: if $\mu \mapsto \mu'$ is a firing-ordinal-bijection induced by an MLD-equivalence $(\phi, \delta)$, then $D_\mu \cong D_{\mu'}$ as d-frames via the bijection's transport on entities and predicates.

**Shadow projection.** Under the [shadow functor](d-frame-cohomology-comparison.md) $\mathbb S : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$, the d-frame generator projects to:

- $\mathbb S_+(D_\mu) = \mathbb Z$ if $\mu$ is a truth-only or $\top$ firing, else 0.
- $\mathbb S_-(D_\mu) = \mathbb Z$ if $\mu$ is a falsity-only or $\top$ firing, else 0.

So $\mathbb S(D_\mu)$ partitions the firings by evidence side, matching the existing $\mathbf{Ab}$-valued [transfinite-bounded $H^1$-generators](transfinite-bounded-regime-h1-generators.md) theorem applied to $\mathcal F_v^{(k)}$ (positive paraconsistent) and $\mathcal F_v^{(k, -)}$ (negative paraconsistent) separately. The d-frame structure adds the consistency / totality content not visible in the abelianized shadows — specifically, the explicit con-failure recording $\top$-firings as paraconsistent witnesses.

**Behaviour under bilattice negation.** Under the value-category swap $\mathbb D_{\mathrm{val}}$ (per the [bilattice negation on d-frame-valued sheaves theorem](bilattice-negation-on-d-frame-valued-sheaves.md)):

- *Truth-only* $D_\mu = (\mathbb Z, 0, ...) \mapsto (0, \mathbb Z, ...) =$ *falsity-only* $D_\mu$.
- *Falsity-only* $\mapsto$ *truth-only* (symmetric).
- *$\top$-firing* $(\mathbb Z, \mathbb Z, \text{con-fails-on-singleton}, ...) \mapsto (\mathbb Z, \mathbb Z, \text{con-fails-on-swapped-singleton}, ...) \cong (\mathbb Z, \mathbb Z, \text{con-fails-on-singleton}, ...)$ — fixed up to relation-argument swap, which is canonical.

So under $\mathbb D_{\mathrm{val}}$, truth-only and falsity-only firings exchange; $\top$-firings are fixed. This is the unconditional value-category-side firing-orbit-type classification used by the [strong-MLD theorem](strong-mld-via-composed-duality.md).

## Linear independence of the generator family

The collection $\{D_\mu\}_{\mu \in L_{\mathrm{ns}}(\kappa)}$ is linearly independent in $H^1_{\mathbf{dFrm}}$:

A combination $\sum_\mu a_\mu D_\mu = 0$ in $H^1_{\mathbf{dFrm}}$ requires the underlying cochain to be a coboundary — an element of $\mathrm{image}(\delta^0)$. The "newly-addedness" of each $D_\mu$ at $\mu$ — that the firing cell appears at $\mu$ for the first time, with no earlier-stage representative — means no earlier-stage cochain pulls back to a cochain producing $D_\mu$ in $H^1$. Hence the combination cannot be a coboundary unless all $a_\mu$'s with $a_\mu \neq 0$ already produce zero in their stage-of-newly-added-ness, i.e., the combination is identically zero.

This argument is the d-frame analog of the abelian-side linear-independence argument in the [transfinite-bounded $H^1$-generators theorem](transfinite-bounded-regime-h1-generators.md), refined by d-frame-component-wise newly-addedness on each side.
