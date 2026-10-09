---
type: theorem
status: proved
depends-on: [d-frame-valued-sheaf, d-frame-cohomology-comparison, strict-regime-d-frame-cohomology, scott-continuous-regime-cohomology-vanishing, scott-continuous-closure, settling-continuity, four-regime-dichotomy, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf]
---

# Scott-continuous-regime d-frame cohomology

For a predication settling $v$ in the [Scott-continuous regime](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) — possibly infinite $E$ or $\mathcal{C}$, [Scott-continuous closure](../../predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md), and closure ordinal $\kappa \leq \omega$ — the [d-frame-valued cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) of $\mathbb{F}_v$ is

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*, \mathbb{F}_v) \;\cong\; \begin{cases} \displaystyle \varinjlim_{n < \omega} H^0_{\mathbf{dFrm}}(\mathbb{F}_v|_{\leq n}) & n = 0, \\ 0 & n \geq 1, \end{cases}$$

where the colimit is taken over finite-stage truncations and inherits d-frame structure (powerset frames, consistency, totality) from the directed system of finite-stage d-frames.

## Proof

The proof follows the [methodology](prose/teaching/explanations/d-frame-cohomology-methodology.md)'s five steps, with Scott-continuity making step 4 (global assembly) work via filtered colimits.

**Step 1: Cellular structure.** For a Scott-continuous regime settling, each paired Priestley fiber $X_q^\tau$ is countably-cellular but locally finite — finite cellular structure at each finite truncation, assembling into a countable cell complex via direct limit. This matches predication categories' [@ayzenberg-magai2025]-style analysis of finite truncations on the existing $\mathbf{Ab}$-valued side.

**Step 2: Laplacian framework.** [@ghrist-riess2022]'s Tarski Laplacian framework applies on each finite truncation, with the colimit assembly handled by the filtered-colimit machinery in step 4. (Quantale enrichment via [@ghrist-et-al2025]'s Lawvere Laplacian provides an alternative route; for the Scott-continuous case the Tarski version suffices.)

**Step 3: Fiber-by-fiber computation.** Each finite-stage fiber gives the strict-regime computation: $H^0_{\mathrm{fiber}, \leq n}$ is the global d-frame on the truncated fiber, and $H^{\geq 1}_{\mathrm{fiber}, \leq n} = 0$ by [strict-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/strict-regime-d-frame-cohomology.md).

**Step 4: Global assembly via filtered colimit.** The d-frame-valued sheaf $\mathbb{F}_v$ on the $\omega$-limit fiber is the filtered colimit of finite-stage sheaves:

$$\mathbb{F}_v|_\omega \;\cong\; \varinjlim_{n < \omega} \mathbb{F}_v|_n.$$

This is exactly Scott-continuity expressed at the d-frame level: every cell newly truth-positive (or falsity-positive) at any finite stage is captured at some $n$, and Scott-continuity of the closure operator means no cells are added at the $\omega$-limit beyond those captured by the colimit.

**Filtered-colimit commutativity.** The Tarski Laplacian framework on locally-finite cellular sheaves commutes with filtered colimits in the value category. For powerset frames this is direct: $\mathcal{P}(\bigcup_n S_n) = \varinjlim_n \mathcal{P}(S_n)$. For consistency and totality relations, the colimit is the *eventually-true* relation: $(A, B) \in \mathrm{con}_\omega$ iff $(A_n, B_n) \in \mathrm{con}_n$ for all sufficiently large $n$. Hence:

$$H^q_{\mathbf{dFrm}}(\mathbb{F}_v|_\omega) \;\cong\; \varinjlim_{n < \omega} H^q_{\mathbf{dFrm}}(\mathbb{F}_v|_n).$$

**Step 5: Vanishing.** From step 3, each $H^{\geq 1}_{\mathbf{dFrm}}(\mathbb{F}_v|_n) = 0$. The filtered colimit of zero d-frames is the trivial d-frame, so $H^{\geq 1}_{\mathbf{dFrm}}(\mathbb{F}_v|_\omega) = 0$. The $H^0$ statement follows from the colimit identity. $\square$

## Shadow comparison

By the [d-frame ↔ $\mathbf{Ab}$ comparison](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) and the existing [Scott-continuous-regime cohomology vanishing](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/scott-continuous-regime-cohomology-vanishing.md):

$$\mathbb{S}\bigl(H^0_{\mathbf{dFrm}}(\mathbb{F}_v|_\omega)\bigr) \;\cong\; \bigl(\varinjlim_n \mathbb{Z}^{N_k(n)},\, \varinjlim_n \mathbb{Z}^{N_{k, -}(n)}\bigr),$$

matching the existing Scott-continuous $\mathbf{Ab}$-valued $H^0$ pair on the paraconsistent and negative-paraconsistent sides. Higher-degree cohomology vanishes on both the d-frame and shadow sides.

## What's still queued

The strict and Scott-continuous regimes complete the "directly-applicable" part of the framework — where the published Tarski Laplacian framework applies (with filtered-colimit machinery for Scott-continuous) without requiring the [cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md)'s deeper layers.

The transfinite-bounded regime is the next case. It introduces non-Scott-continuous firings — limit ordinals where the closure adds content not derivable from finite earlier stages. These firings produce $H^1$ generators on the existing $\mathbf{Ab}$-valued side; the d-frame analogue requires Layer 2 of the extension plan (fibered cellular sites with varying cellular structure) to assemble correctly. This is where the chapter's substantive open work begins.
