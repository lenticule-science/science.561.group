---
name: closure 2-monad
description: The 2-functor Cl on the 2-category of predication-fibrations, defined by fiberwise application of a closure-operator family. With unit η (inclusion-into-closure) witnessing inflationarity and multiplication μ witnessing idempotence (strict or lax up to coherence).
title: closure 2-monad
---

Given a $\mathcal{C}$-natural [closure-operator](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/closure/library/closure-2-monad/closure-operator.md) family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$, the **closure 2-monad** is the 2-functor

$$\mathrm{Cl} : \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \to \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$$

on the 2-category of [predication-fibrations](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/closure/library/structures/predication-fibration.md), defined by fiberwise application of the closure family:

$$\mathrm{Cl}(\mathcal{E})_q := \mathrm{cl}_q(\mathcal{E}_q).$$

**Unit** $\eta : 1 \Rightarrow \mathrm{Cl}$ is the inclusion-into-closure: at each fiber, $\eta_{\mathcal{E}, p}(v) : v \to \mathrm{cl}_p(v)$ witnesses inflationarity $v \leq_k \mathrm{cl}_p(v)$ in the knowledge order.

**Multiplication** $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is the nested-closure collapse. In the strict case, $\mu$ is identity; in the lax case, $\mu$ is a canonical non-identity 2-cell witnessing idempotence up to coherence.

In the 2-categorical setting, the strict-idempotence axiom of the underlying closure-operator is replaced by lax-idempotence: $\mu \dashv \eta_\mathrm{Cl}$ with identity counit (Kelly–Lack K1). Under Scott-continuity, the revised definition reduces to the strict-idempotent closure-operator.
