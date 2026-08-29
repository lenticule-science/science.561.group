---
id: aperiodicity
name: Aperiodicity
description: "Quasicrystalline Aperiodicity"
---

### Theorem — Convergence and Aperiodicity {#aperiodicity}

*The pattern the tower produces and whether it converges.*

The invariant sheaf $H^\ast$ is not periodic — no global symmetry of the history category is invisible
to the invariant modal data. This aperiodicity is not a geometric hypothesis; it is a theorem, and
the nuclei are its witnesses. The question of whether the depth tower converges in a metric sense
leads to the Fischer-Rao conjecture.

#### Theorem — Quasicrystalline Aperiodicity {#thm-aperiodicity}

The invariant sheaf $H^\ast$ defines a pattern over $(T,J)$ with:

1. **Local finiteness of fibers.** For each history $t$, the fiber $H_t^\ast$ is a finite Heyting
   algebra. For any finite subdiagram of $T$ and any finite covering family, the set of compatible
   assignments of invariant elements over that diagram is finite.

2. **Local finiteness of extensions.** The set of immediate successors
   $\{t' \in T : t \leq t',\; \ell(t') = \ell(t)+1\}$ of any history $t$ is finite (since $\Sigma$
   is finite by the Axiom of Histories).

3. **Global aperiodicity.** There is no nontrivial automorphism $\alpha : T \xrightarrow{\sim} T$
   preserving $J$ such that $\alpha^\ast H^\ast \cong H^\ast$ as sheaves of Heyting algebras.

> **Dependency note.** Parts (1) and (2) follow from the history axiom and fiber doctrine alone. Part (3) — global
> aperiodicity — depends critically and exclusively on the Axiom of History Separation. Without
> it, a relational universe with constant nuclear pair $(\sigma_t, \Delta_t) = (\sigma_0, \Delta_0)$ would admit
> automorphisms invisible to $H^\ast$, making the invariant pattern globally periodic. Part (3) is
> precisely the content of the Axiom of History Separation.

> **Important.** The claim of "local repetitiveness" in the strong quasicrystal sense (every local
> pattern recurs with bounded gaps) does **not** follow from all eight axioms alone. Proving strong repetitivity
> would require an additional hypothesis on the history monoid — for example, a substitution-invariance
> condition or the existence of a repetitivity function in the sense of Lagarias–Pleasants (2003).

**Proof.**

*(1) Local finiteness of fibers.* The fiber $H_t^\ast = \mathrm{Fix}(\sigma_t) \cap
\mathrm{Fix}(\Delta_t)$ is a sub-Heyting algebra of the finite $H_t$ (the fiber doctrine), hence finite. A
compatible invariant assignment over a finite diagram lies in a finite product of finite sets. ✓

*(2) Local finiteness of extensions.* Since $|\Sigma| < \infty$ (the Axiom of Histories), there are at most
$|\Sigma|$ immediate successors of any $t$. ✓

*(3) Global aperiodicity.* Suppose $\alpha : T \xrightarrow{\sim} T$ is nontrivial, preserves $J$,
and satisfies $\alpha^\ast H^\ast \cong H^\ast$. This is precisely the situation excluded by the Axiom
of History Separation: no nontrivial topology-preserving automorphism of $T$ is invisible to the invariant layer.
Therefore $\alpha = \mathrm{id}_T$, contradicting nontriviality. ✓ $\square$
