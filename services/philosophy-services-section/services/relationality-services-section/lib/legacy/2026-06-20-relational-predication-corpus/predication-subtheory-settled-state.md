---
type: theorem
status: proved
realizes: [closure-restriction, theory-relative-ideal]
depends-on: [closure-restriction-is-closure, closure-restriction, predication-theory, predication-settling, predication-model, predicate-category]
see-also: [subtheory, subtheory-inclusion, theory-relative-ideal]
---

# Subtheory settled state

**Theorem.** Let $T = (\mathbf{L}, \mathcal{C}^T, E, \mathrm{Cl}^T)$ be a [predication theory](../objects/predication-theory.md) with settled state $v^T_\infty$, and let $\pi : \mathcal{C}^S \hookrightarrow \mathcal{C}^T$ be a type embedding. Let $S = (\mathbf{L}, \mathcal{C}^S, E, \mathrm{Cl}^S)$ be the predication theory with [closure restriction](teaching/explanations/closure-restriction.md) $\mathrm{Cl}^S := \pi^*(\mathrm{Cl}^T)$ — a closure operator by [closure-restriction-is-closure](closure-restriction-is-closure.md). Then the settled state of $S$ is

$$v^S_\infty \;=\; \pi^*(v^T_\infty),$$

i.e., $v^S_\infty(p) = v^T_\infty(\pi(p))$ for every $p \in \mathcal{C}^S$.

**Proof.** Let $(v^T_\tau)_{\tau \leq \tau^*}$ be the $\mathrm{Cl}^T$-iteration from $\bot^T$ converging to $v^T_\infty = v^T_{\tau^*}$, and let $(v^S_\tau)$ be the $\mathrm{Cl}^S$-iteration from $\bot^S$. We establish

$$v^S_\tau \;=\; \pi^*(v^T_\tau) \qquad \text{for all } \tau \leq \tau^*$$

by transfinite induction on $\tau$.

**Base case $(\tau = 0)$.** For each $p \in \mathcal{C}^S$:

$$v^S_0(p) \;=\; \bot \;=\; v^T_0(\pi(p)) \;=\; \pi^*(v^T_0)(p). \qquad \checkmark$$

**Successor step $(\tau \to \tau + 1)$.** Assume $v^S_\tau(p) = v^T_\tau(\pi(p))$ for all $p$. For each $p \in \mathcal{C}^S$:

$$v^S_{\tau+1}(p) \;=\; \mathrm{Cl}^S_p\bigl(v^S_\tau(p)\bigr) \;=\; \mathrm{Cl}^T_{\pi(p)}\bigl(v^S_\tau(p)\bigr)$$

by definition of $\mathrm{Cl}^S_p = \mathrm{Cl}^T_{\pi(p)}$. By the inductive hypothesis $v^S_\tau(p) = v^T_\tau(\pi(p))$:

$$=\; \mathrm{Cl}^T_{\pi(p)}\bigl(v^T_\tau(\pi(p))\bigr) \;=\; v^T_{\tau+1}(\pi(p)) \;=\; \pi^*(v^T_{\tau+1})(p). \qquad \checkmark$$

**Limit step $(\tau$ a limit ordinal$)$.** Assume $v^S_\sigma(p) = v^T_\sigma(\pi(p))$ for all $\sigma < \tau$ and all $p \in \mathcal{C}^S$. For each $p$:

$$v^S_\tau(p) \;=\; \bigvee_{\sigma < \tau} v^S_\sigma(p) \;=\; \bigvee_{\sigma < \tau} v^T_\sigma(\pi(p)) \;=\; v^T_\tau(\pi(p)) \;=\; \pi^*(v^T_\tau)(p). \qquad \checkmark$$

The equality of joins holds because evaluating at a fixed predicate, $v \mapsto v(\pi(p))$, is a lattice homomorphism on the fiber algebra $A^T_{\pi(p)}$: it preserves all joins, in particular the ordinal-indexed join defining the limit step.

By transfinite induction, $v^S_\tau = \pi^*(v^T_\tau)$ for all $\tau \leq \tau^*$. At $\tau = \tau^*$:

$$v^S_{\tau^*} \;=\; \pi^*(v^T_{\tau^*}) \;=\; \pi^*(v^T_\infty).$$

It remains to confirm that $v^S_{\tau^*}$ is a $\mathrm{Cl}^S$-fixed point, so that the $\mathrm{Cl}^S$-iteration has converged:

$$\mathrm{Cl}^S_p\bigl(v^S_{\tau^*}(p)\bigr) \;=\; \mathrm{Cl}^T_{\pi(p)}\bigl(v^T_\infty(\pi(p))\bigr) \;=\; v^T_\infty(\pi(p)) \;=\; v^S_{\tau^*}(p),$$

where the middle equality uses the fact that $v^T_\infty$ is a $\mathrm{Cl}^T$-fixed point. So $v^S_{\tau^*}$ is the $\mathrm{Cl}^S$-fixed point reached at $\tau^*$, and no earlier $v^S_\sigma$ (for $\sigma < \tau^*$) is a fixed point (since $v^S_\sigma = \pi^*(v^T_\sigma) <_k \pi^*(v^T_\infty)$ strictly at those predicates where $\mathrm{Cl}^T$ has not yet converged). The settled state of $S$ is therefore $v^S_\infty = v^S_{\tau^*} = \pi^*(v^T_\infty)$. $\square$

## Corollary: every subtheory is theory-ideal

The settled state $v^S_\infty = \pi^*(v^T_\infty)$ equals the [theory-relative ideal](teaching/explanations/theory-relative-ideal.md) of the subscope within $T$: by definition $v^S_{T,\infty} = \pi^*(v^T_\infty)$, and the theorem gives $v^S_\infty = v^S_{T,\infty}$. The resource $(v^S_\infty, \pi, T)$ therefore satisfies $\mathrm{Al}(v^S_\infty, T) = \mathcal{C}^S \times E \times E$ — all cells aligned — so the [idealization morphism](../morphisms/idealization-morphism.md) from $v^S_\infty$ to its own theory-relative ideal is the identity. A subtheory is theory-ideal by necessity, not coincidence; this is what the closure restriction enforces.

## Remark on the converse

The converse fails: theory-ideality does not imply closure restriction. A settling $v^R$ over $(\mathbf{L}, \mathcal{C}^S, E)$ may satisfy $v^R_\infty = \pi^*(v^T_\infty)$ while carrying a closure operator $\mathrm{Cl}^R \neq \pi^*(\mathrm{Cl}^T)$ — two different closure operators can share a minimal fixed point. The theorem shows that the unique closure operator that simultaneously (i) is a $\pi$-restriction of $\mathrm{Cl}^T$ and (ii) has minimal fixed point $\pi^*(v^T_\infty)$ is exactly $\pi^*(\mathrm{Cl}^T)$. Any other operator achieving the same fixed point does so for independent reasons unrelated to $T$'s inference structure.
