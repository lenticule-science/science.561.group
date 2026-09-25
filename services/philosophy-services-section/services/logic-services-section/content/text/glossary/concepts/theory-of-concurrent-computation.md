---
name: theory-of-concurrent-computation
type: theorem
status: proved
description: Nominal sets and event structures — the theory of name-passing concurrency and causal parallelism — are external to the realizability world. The S∞-action on nominal sets is incompatible with any PCA; no geometric morphism from the nominal-sets topos into any realizability topos exists. Concurrent computation is connected to the ambient theory of computing through CGS via symmetric game arenas.
see-also: [what-is-the-theory-of-computing, what-are-the-subtheories-of-computing]
title: theory-of-concurrent-computation
---

# The Theory of Concurrent Computation

**Theorem.** The theory of concurrent name-passing computation — modeled by the Fraenkel-Mostowski topos $\mathbf{Sets}^{\mathbf{I}}$ (nominal sets, Gabbay-Pitts 1999) and by categories of event structures (Winskel 1986) — is external to the realizability world. No geometric morphism from $\mathbf{Sets}^{\mathbf{I}}$ into any realizability topos $RT(A)$ exists. The connection to the ambient theory of computing runs through $\mathbf{CGS}$, not through $\mathbf{Eff}$.

**Proof.**

*The nominal sets topos.* $\mathbf{Sets}^{\mathbf{I}}$ is the Grothendieck topos of presheaves over the category $\mathbf{I}$ of finite sets and injections. Its objects carry a global action of the infinite symmetric group $S_\infty = \mathrm{colim}_n S_n$ (finite permutations of a countably infinite name set $\mathbb{A}$), and every element has finite support: only finitely many names in $\mathbb{A}$ can distinguish it from its orbit. The $\pi$-calculus is modeled here: processes, channels, and name-mobility are nominal sets; fresh name generation is modeled by the $\nu$-binder acting on the $\mathbb{A}$-action.

*Incompatibility with any PCA.* A realizability topos $RT(A)$ is built over a PCA $A = (\omega, \cdot)$ with a discrete, countable carrier and a partial recursive application. A geometric morphism $\mathbf{Sets}^{\mathbf{I}} \to RT(A)$ would require the $S_\infty$-action to be representable in $RT(A)$'s internal logic. But $S_\infty$ acts on $\mathbb{A}$ by permuting an infinite set of names, which is fundamentally incompatible with the discrete, finitary application structure of any PCA: no PCA can internalize the $S_\infty$-action because PCA application is defined on natural numbers with no group-equivariance structure. Therefore no geometric morphism $\mathbf{Sets}^{\mathbf{I}} \to RT(A)$ exists for any PCA $A$.

*The dualizing-object obstruction.* $\mathbf{Sets}^{\mathbf{I}}$ has no dualizing object for its Day-convolution tensor: a dualizing object would need to encode $\mathbb{A} \setminus F$ (the complement of any finite name-set), but finite-support requires all elements to depend on only finitely many names, whereas complements of finite sets in $\mathbb{A}$ are infinite. No $*$-autonomous structure on $\mathbf{Sets}^{\mathbf{I}}$ is known; it resists embedding into the linear world that accommodates Eff (via Dialectica) and game semantics (directly).

*Connection via CGS.* $\mathbf{CGS}$ (concurrent games with symmetry) accommodates nominal computation through its symmetry groupoids: if the symmetry groupoid of arena $A$ contains $\mathrm{FSym}(\mathbb{A})$ (finite permutations of the name set), strategy equivalence classes track which permutations the strategy treats as interchangeable — exactly the $\mathrm{FSym}(\mathbb{A})$-equivariance of nominal sets. The Abramsky-Ghica-Murawski-Ong-Stark (2004) full abstraction theorem for the $\nu$-calculus (fresh-name allocation) is a tight morphism from the nominal-set operational model into $\mathbf{CGS}$. Concurrent computation thus enters the ambient theory of computing via $\mathbf{CGS}$'s symmetric arenas, not via realizability. $\square$
