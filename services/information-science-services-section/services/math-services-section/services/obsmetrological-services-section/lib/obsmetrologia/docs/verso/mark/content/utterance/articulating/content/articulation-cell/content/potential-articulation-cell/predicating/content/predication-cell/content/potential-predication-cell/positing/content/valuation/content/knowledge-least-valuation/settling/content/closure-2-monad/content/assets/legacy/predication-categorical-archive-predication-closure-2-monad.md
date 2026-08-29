---
type: morphism
class: 2-monad
symbol: "\\mathrm{Cl}"
closes: predication-fibration
depends-on: [closure-operator, predication-fibration, predicate-category-naturality, knowledge-order]
---

# Closure 2-monad

Given a $\mathcal{C}$-natural [closure operator](closure-operator.md) family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$, the **closure 2-monad** is the 2-functor

$$\mathrm{Cl} : \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \to \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$$

on the 2-category of [predication fibrations](../objects/predication-fibration.md), defined by fiberwise application of the closure family:

$$\mathrm{Cl}(\mathcal{E})_q := \mathrm{cl}_q(\mathcal{E}_q).$$

**Unit** $\eta : 1 \Rightarrow \mathrm{Cl}$ is the inclusion-into-closure: at each fiber, $\eta_{\mathcal{E}, p}(v) : v \to \mathrm{cl}_p(v)$ witnesses inflationarity $v \leq_k \mathrm{cl}_p(v)$ in the [knowledge order](teaching/explanations/knowledge-order.md).

**Multiplication** $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is the nested-closure collapse. In the strict case, $\mu$ is identity; in the lax case, $\mu$ is a canonical non-identity 2-cell witnessing idempotence up to coherence.

## Two KZ structures disentangled

The closure 2-monad on $\mathbf{PrFib}(\mathcal{C})$ is distinct from the [Gray–Street fibration 2-monad](../theorems/gray-street-fibration-monad.md) $\mathbb{M}$ on $\mathbf{Cat}/\mathcal{C}$:

- $\mathbb{M}$-algebra status — "$\mathcal{E}$ is a fibration" — is a vertical structural property.
- $\mathrm{Cl}$-algebra status — "$\mathcal{E}$'s state is closed under $\mathcal{C}$-inference" — is a saturation property.

They compose: a presheaf that is both an $\mathbb{M}$-algebra (cloven fibration) and a $\mathrm{Cl}$-algebra ($\mathcal{C}$-closed) is a fully $\mathcal{C}$-closed [predication settling](../objects/predication-settling.md).

## 2-categorical closure operator

In the 2-categorical setting, the strict-idempotence axiom of the underlying [closure operator](closure-operator.md) is replaced by lax-idempotence: $\mu \dashv \eta_\mathrm{Cl}$ with identity counit (Kelly–Lack K1). The revised four axioms:

1. Monotone in $\leq_k$ (2-functoriality).
2. Inflationary (unit of 2-monad).
3. Lax-idempotent ($\mu \dashv \eta_\mathrm{Cl}$ with identity counit).
4. $\mathcal{C}$-natural.

Under [Scott-continuity](teaching/explanations/scott-continuous-closure.md), the revised definition reduces to the strict-idempotent [closure operator](closure-operator.md): lax-idempotence plus Scott-continuity implies strict idempotence.
