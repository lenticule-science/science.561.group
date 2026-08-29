---
name: closure 2-monad
description: The 2-functor Cl on the 2-category of predication-fibrations, defined by fiberwise application of a closure-operator family. With unit η (inclusion-into-closure) witnessing inflationarity and multiplication μ witnessing idempotence (strict or lax up to coherence).
---

Given a $\mathcal{C}$-natural [closure-operator](closure-operator.md) family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$, the **closure 2-monad** is the 2-functor

$$\mathrm{Cl} : \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \to \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$$

on the 2-category of [predication-fibrations](../structures/predication-fibration.md), defined by fiberwise application of the closure family:

$$\mathrm{Cl}(\mathcal{E})_q := \mathrm{cl}_q(\mathcal{E}_q).$$

**Unit** $\eta : 1 \Rightarrow \mathrm{Cl}$ is the inclusion-into-closure: at each fiber, $\eta_{\mathcal{E}, p}(v) : v \to \mathrm{cl}_p(v)$ witnesses inflationarity $v \leq_k \mathrm{cl}_p(v)$ in the knowledge order.

**Multiplication** $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is the nested-closure collapse. In the strict case, $\mu$ is identity; in the lax case, $\mu$ is a canonical non-identity 2-cell witnessing idempotence up to coherence.

In the 2-categorical setting, the strict-idempotence axiom of the underlying closure-operator is replaced by lax-idempotence: $\mu \dashv \eta_\mathrm{Cl}$ with identity counit (Kelly–Lack K1). Under Scott-continuity, the revised definition reduces to the strict-idempotent closure-operator.
