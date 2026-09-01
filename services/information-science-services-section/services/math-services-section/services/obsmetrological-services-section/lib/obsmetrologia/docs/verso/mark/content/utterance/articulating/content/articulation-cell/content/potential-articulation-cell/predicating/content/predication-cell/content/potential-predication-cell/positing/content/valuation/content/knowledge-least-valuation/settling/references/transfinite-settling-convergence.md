---
kind: theorem
status: proved
depends-on: [spatiotemporal-knowledge-presheaf, settling-continuity, closure-drivenness, scott-continuous-closure, closure-operator, increment-sequence, predication-fiber-algebra, settling-quiescence, settling-bound, knowledge-order]
---

# Transfinite settling convergence under Scott-continuity

Let $v$ be a [settling-continuous](../concepts/settling-continuity.md), [closure-driven](../concepts/closure-drivenness.md) [spatiotemporal knowledge presheaf](../objects/spatiotemporal-knowledge-presheaf.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$.
If the [closure operator](../morphisms/closure-operator.md) $\mathrm{cl}$ is [Scott-continuous](../concepts/scott-continuous-closure.md) on each fiber and the [increment sequence](../objects/increment-sequence.md) $(u_\tau)$ is eventually zero — there exists $\tau_0 < \lambda$ with $u_\tau(p) = \bot$ for all $\tau > \tau_0$ and all $p$ — then there exists $\tau^* \leq \tau_0 + \omega$ such that $v$ is [quiescent](../concepts/settling-quiescence.md) at $\tau^*$.

## Proof

After $\tau_0$, the settling evolves only by closure: $v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p))$.
Let $w_n := \mathrm{cl}_p^n(v_{\tau_0}(p))$.
The sequence $(w_n)_{n < \omega}$ is $\leq_k$-directed by inflationarity of $\mathrm{cl}_p$.
By [settling continuity](../concepts/settling-continuity.md) at $\tau_0 + \omega$, $v_{\tau_0 + \omega}(p) = \bigvee_k \{w_n : n < \omega\}$.
By Scott-continuity,

$$\mathrm{cl}_p\!\bigl(v_{\tau_0 + \omega}(p)\bigr) = \bigvee_k \{\mathrm{cl}_p(w_n)\} = \bigvee_k \{w_{n+1}\} = v_{\tau_0 + \omega}(p).$$

So $v_{\tau_0 + \omega}(p)$ is a fixed point of $\mathrm{cl}_p$, and $v_{\tau_0 + \omega + 1}(p) = v_{\tau_0 + \omega}(p)$.
Taking $\tau^* = \tau_0 + \omega$ completes the argument. $\square$

## Corollary

The [settling convergence](settling-convergence.md) theorem is the finite instance: when $\mathbf{L}, E, \mathcal{C}$ are finite, every closure operator is Scott-continuous vacuously (finite lattices have no non-trivial directed joins to preserve), and the $\omega$-bound sharpens to $\tau^* < \tau_0 + \omega$ via the finite-chain argument.

## Remark

Non-Scott-continuous closure — typical when inference rules have infinitary antecedents, such as $\forall x \in E.\, p(x) \Rightarrow q$ with infinite $E$ — has closure ordinal exceeding $\omega$.
The four-regime classification analyzes this regime rigorously.
