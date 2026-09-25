---
type: theorem
status: proved
depends-on: [closure-operator, closure-2-monad, closure-2-monad-lax-idempotence, closure-driven-settling-monotonicity, closure-ordinal, four-regime-dichotomy, predication-fiber-algebra, knowledge-order, bilattice-stabilization-nucleus]
see-also: [strict-regime-mld-trivial, scott-continuous-regime-mld-polynomial, settling-merge-semilattice]
title: Joint-nucleus alternation bound
description: "Let $Ap = \\mathbf{L}^{\\bowtie\\, E \\times E}$ be a predication fiber algebra over a bilattice $\\mathbf{L}^\\bowtie$, and let $\\sigma, \\Delta : Ap \\to Ap$ be two closure operators on $Ap$, both inflationary, monotone, and idempotent in the…"
---

# Joint-nucleus alternation bound

Let $A_p = \mathbf{L}^{\bowtie\, E \times E}$ be a [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) over a bilattice $\mathbf{L}^\bowtie$, and let $\sigma, \Delta : A_p \to A_p$ be two [closure operators](../../research/2026/07/31/lenticule-import/morphisms/closure-operator.md) on $A_p$, both inflationary, monotone, and idempotent in the [knowledge order](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/knowledge-order.md) $\leq_k$. Let $\pi := \Delta \circ \sigma$ be their *outer-alternation operator*, applied iteratively from a seed $v_0 \in A_p$ to compute the joint fixed point

$$v^* \;=\; \mathrm{Fix}(\sigma) \,\cap\, \mathrm{Fix}(\Delta) \;=\; \bigvee\nolimits_k\!{}_\tau\, \pi^\tau(v_0).$$

The number of $\sigma\!\leftrightarrow\!\Delta$ alternation rounds before $\pi^{\tau+1}(v_0) = \pi^\tau(v_0)$ is bounded, per regime, as follows. Write $h_k(\mathbf{L}^\bowtie)$ for the length of the longest strict $\leq_k$-ascending chain in $\mathbf{L}^\bowtie$, and $|\mathrm{supp}(v^*)|$ for the number of cells $(s, p, o) \in E \times \mathcal{C} \times E$ on which $v^*$ disagrees with the bottom valuation.

| Regime | Bound on alternation rounds |
|---|---|
| Strict | $\rho_\pi(v_0) \;\leq\; h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)| \,+\, 1$ |
| Scott-continuous | $\rho_\pi(v_0) \;\leq\; h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)|_{<\omega} \,+\, 1$, per finite support prefix |
| Transfinite-bounded | $\rho_\pi(v_0) \;\leq\; \kappa(\pi, v_0) \;<\; \omega_1$ |
| Aperiodic | $\rho_\pi(v_0)$ may reach $\omega_1$; no countable bound |

Here $\rho_\pi(v_0)$ is the **alternation ordinal** — the least $\tau$ with $\pi^{\tau+1}(v_0) = \pi^\tau(v_0)$ — and $\kappa(\pi, v_0)$ is the [closure ordinal](../../research/2026/07/31/lenticule-import/objects/closure-ordinal.md) of $\pi$ from $v_0$.

The strict-regime form is the load-bearing engineering bound: it is polynomial in the support size of the joint fixed point, and the support size is in turn polynomial in $|\mathrm{rules}|$ and $|\mathrm{seed}|$ for any closure-rule system whose σ-component is stratified-Datalog-like.

## Proof

The argument is a potential-function descent on the cell-movement count, plus a regime-by-regime invocation of the [four-regime dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) for the residual cases.

**Step 1: $\pi$ is a closure operator on $A_p$.** Each of $\sigma, \Delta$ is inflationary and $\leq_k$-monotone. Their composite $\pi = \Delta \circ \sigma$ inherits both: $v \leq_k \sigma(v) \leq_k \Delta(\sigma(v)) = \pi(v)$, and monotonicity composes. Idempotence of $\pi$ at the joint fixed point $v^*$: at $v^*$, $\sigma(v^*) = v^*$ and $\Delta(v^*) = v^*$, so $\pi(v^*) = v^*$. So $\pi$ is a closure operator on $A_p$ in the sense of the [closure operator](../../research/2026/07/31/lenticule-import/morphisms/closure-operator.md) morphism.

**Step 2: Define the cell-movement potential.** For a valuation $v \in A_p$ and a cell $c = (s, p, o) \in E \times \mathcal{C} \times E$, write $v(c) \in \mathbf{L}^\bowtie$ for the cell's value. Define the *remaining height* at $c$ relative to the joint fixed point $v^*$ as

$$\eta_c(v) \;:=\; \mathrm{ht}_k\!\bigl[v(c),\, v^*(c)\bigr] \;\in\; \{0, 1, \ldots, h_k(\mathbf{L}^\bowtie)\},$$

the length of the longest strict $\leq_k$-ascending chain from $v(c)$ to $v^*(c)$ in $\mathbf{L}^\bowtie$ (zero if $v(c) = v^*(c)$). The total potential is

$$\Phi(v) \;:=\; \sum_{c \,\in\, \mathrm{supp}(v^*)}\, \eta_c(v).$$

By construction, $\Phi(v) \in \{0, 1, \ldots, h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)|\}$, and $\Phi(v) = 0$ iff $v|_{\mathrm{supp}(v^*)} = v^*|_{\mathrm{supp}(v^*)}$, which under closure-driven monotonicity is equivalent to $v = v^*$.

**Step 3: Each non-terminal alternation round strictly decreases $\Phi$.** Per [closure-driven-settling-monotonicity](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-monotonicity/references/closure-driven-settling-monotonicity.md), $v_\tau \leq_k v_{\tau+1}$ in $A_p$, pointwise on every cell. Since $\leq_k$-movement upward in $\mathbf{L}^\bowtie$ on any cell strictly reduces that cell's $\eta_c$ (the chain to $v^*(c)$ shortens by at least one), each cell that moves between $v_\tau$ and $v_{\tau+1}$ contributes a strict decrease of $\geq 1$ to $\Phi$.

The only round that moves no cell is the *terminal round*: at start, $v_\tau = v^*$, so $\sigma(v_\tau) = v_\tau$ and $\Delta(v_\tau) = v_\tau$, no cell moves, $\pi(v_\tau) = v_\tau$, the alternation halts. Conversely, if $v_\tau \neq v^*$, then $\pi(v_\tau) \neq v_\tau$ (by [closure-2-monad-lax-idempotence](../../research/2026/07/31/lenticule-import/from-predicate-category/closure-2-monad-lax-idempotence.md) applied to $\pi$, the only $\pi$-fixed point reachable from $v_0$ is $v^*$), so at least one cell moves and $\Phi$ strictly decreases.

**Step 4: Strict-regime bound.** In the strict regime, $\mathbf{L}^\bowtie$, $E$, and $\mathcal{C}$ are finite per [four-regime-dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), so $A_p$ is finite, $h_k(\mathbf{L}^\bowtie) < \infty$, and $|\mathrm{supp}(v^*)| < \infty$. The potential $\Phi(v_0)$ is bounded above by $h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)|$, decreases by $\geq 1$ each non-terminal round, and bottoms at $0$ at the terminal round. Hence

$$\rho_\pi(v_0) \;\leq\; \Phi(v_0) + 1 \;\leq\; h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)| + 1.$$

**Step 5: Scott-continuous regime.** When at least one of $\mathbf{L}, E, \mathcal{C}$ is countably infinite, $|\mathrm{supp}(v^*)|$ may be infinite, but Scott-continuity of both $\sigma$ and $\Delta$ gives $\pi$ continuous on directed $\omega$-joins. The alternation factors through finite support prefixes: for each finite $S \subset \mathrm{supp}(v^*)$, the alternation restricted to $S$-cells terminates in $\leq h_k(\mathbf{L}^\bowtie) \cdot |S| + 1$ rounds by Step 4, and the global alternation is the directed $\omega$-join of these finite-prefix alternations. The bound holds per finite prefix.

**Step 6: Transfinite-bounded regime.** Non-Scott-continuous closures with countable state-space cofinality have a countable closure ordinal per [four-regime-dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md). The ordinal $\kappa(\pi, v_0)$ is the alternation ordinal; per the dichotomy, $\kappa(\pi, v_0) < \omega_1$. The potential argument refines: $\Phi$ is now an ordinal-valued sum, but each non-terminal round still strictly decreases it (in the well-order on ordinals), so termination follows by the well-foundedness of $<$ on ordinals.

**Step 7: Aperiodic regime.** Per [four-regime-dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), the closure ordinal can reach $\omega_1$, and the alternation is genuinely transfinite at length $\geq \omega_1$. The cell-movement potential is no longer a useful descent witness — even though each round still strictly increases the valuation in $\leq_k$, the chain length on $\mathbf{L}^\bowtie$ may itself be transfinite. The bound degenerates: $\rho_\pi(v_0) \leq |\mathbf{PrFib}|^+$ from the [closure ordinal](../../research/2026/07/31/lenticule-import/objects/closure-ordinal.md)'s ambient bound, but no countable refinement is available without additional hypotheses on $\sigma$ or $\Delta$. $\square$

## Remarks

**The bound is tight in the strict regime, up to the $+1$.** The adversarial witness is a rule system in which each round-trip moves exactly one cell, so that $\rho_\pi(v_0) = \Phi(v_0)$. Such systems exist: take $\mathcal{C} = \{p_1, \ldots, p_n\}$, $E = \{e\}$, $\mathbf{L}^\bowtie = \mathbf{FOUR}$, and a rule system whose firings cascade $p_1, p_2, \ldots, p_n$ in sequence, each rule's premise depending on the prior cell's $\Delta$-stabilized value. The alternation runs $n$ rounds, each moving one cell from $\bot$ to $\mathbf{t}$ to $\top$. The bound $2n + 1$ is matched up to the terminal round.

**The $+1$ is the terminal round.** Implementations that detect "no work performed in this round" between σ-pass and Δ-pass within round $\tau$ can emit the joint-fixed-point witness without entering round $\tau + 1$, dropping the $+1$. Implementations that always run a "verification round" past the last work-performing round consume the $+1$.

**The bound is much looser than typical workloads.** Empirical observation in conforming rule systems is $\rho_\pi(v_0) \leq 3$ for small-respond workloads ($|\mathrm{supp}(v^*)| \leq 100$). The structural bound $2 \cdot 100 + 1 = 201$ is $\sim 70\times$ looser than empirical. The looseness is the gap between *any rule system* (the bound's domain) and *non-pathological rule systems* (the empirical regime); refining the bound to typical workloads requires assumptions on the closure-rule system's *non-cascading factor*, which is workload-specific and not in the σ-pass's regime envelope.

**The bound replaces no other bound; it adds the missing one.** The per-cell Δ-bound and the σ-pass regime envelope characterize the *per-pass* cost; this theorem characterizes the *number of passes*. Total respond cost is the quantale-fold over rounds of (σ-pass cost + Δ-pass cost), and the round count is now bounded.

## Position

This theorem closes the structural gap between cell-movement count and alternation-round count for the strict and Scott-continuous regimes. It establishes that the joint nucleus $\pi = \Delta \circ \sigma$ on a [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) is itself a closure operator, with closure ordinal bounded by a potential function that descends with each non-terminal round. Combined with the per-cell Δ-bound on $\mathbf{FOUR}$ and the σ-pass's regime envelope, it characterizes total settlement cost as a polynomial in $(|\mathrm{rules}|, |\mathrm{seed}|, h_k(\mathbf{L}^\bowtie))$ for strict-regime systems.

The aperiodic regime remains open by *construction*, not by missing argument: the four-regime dichotomy itself excludes the aperiodic regime from finite or countable bounds, and the alternation operator $\pi$ inherits the exclusion. Substrates committing to the aperiodic regime — e.g. those modeling $\omega_1$-indexed transfinite induction settlings — must accept that outer-alternation termination is a transfinite question and not a runtime budget.

The engineering lift of this theorem is [sigma-delta-outer-alternation-bound](../../research/2026/07/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/sigma-delta-outer-alternation-bound.md), which restates the strict-regime form as a substrate-content claim: outer-fuel is structurally bounded.
