---
type: theorem
status: proved
depends-on: [predication-model, settling-convergence, closure-operator, predication-settling, settling-quiescence, residuated-lattice, entity-set, predicate-category]
---

# Every closure-driven settling with finite base produces a predication model

Let $v$ be a settling-continuous, closure-driven [predication settling](../objects/predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathbf{L}$, $E$, and $\mathcal{C}$ all finite and $\lambda \geq \omega$. Then there exists $\tau^* < \omega$ such that the settling is [quiescent](teaching/explanations/settling-quiescence.md) at $\tau^*$ and $v_{\tau^*}$ is a [predication model](../objects/predication-model.md).

## Proof

By [settling convergence](settling-convergence.md), there exists $\tau^* < \omega$ at which $v$ is quiescent: $v_\tau(p) = v_{\tau^*}(p)$ for every $p \in \mathcal{C}$ and all $\tau \geq \tau^*$.

Since $v$ is closure-driven, $v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p))$ for every $\tau$. Applying this at $\tau = \tau^*$ and using $\tau^* + 1 < \lambda$ (which holds since $\lambda \geq \omega$ and $\tau^* < \omega$):

$$v_{\tau^*+1}(p) = \mathrm{cl}_p(v_{\tau^*}(p)).$$

Quiescence gives $v_{\tau^*+1}(p) = v_{\tau^*}(p)$. Substituting:

$$\mathrm{cl}_p(v_{\tau^*}(p)) = v_{\tau^*}(p) \quad \text{for every } p \in \mathcal{C}.$$

So $v$ is quiescent at $\tau^*$ and the quiescent value is a $\mathrm{cl}$-fixpoint at every predicate. By definition, $v$ is a predication model with $\hat\tau = \tau^*$. $\square$

## What finite base buys

Finiteness of $\mathbf{L}$, $E$, and $\mathcal{C}$ ensures the knowledge-order chain $(v_\tau(p))_{\tau \geq \tau_0}$ stabilizes in finitely many steps — a direct consequence of $A_p = \mathbf{L}^{\bowtie\, E \times E}$ being finite. Without finiteness, the settling may accumulate knowledge at every transfinite step and reach a predication model only at a limit ordinal (if at all).

## Corollary — the all-$\top$ settling is always a model

For any closure operator and any base, the constant settling $v_\top$ assigning $\top$ at every cell and step is a predication model: $\top$ is the $\leq_k$-maximum of $\mathbf{L}^\bowtie$, so $\mathrm{cl}_p(\top) \geq_k \top$ (inflationarity) and $\mathrm{cl}_p(\top) \leq_k \top$ (maximality) force $\mathrm{cl}_p(\top) = \top$. Quiescence is immediate. This gives an unconditional predication model at every base, independent of finiteness.
