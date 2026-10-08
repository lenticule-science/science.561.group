---
name: concurrent-computation
description: Nominal sets and event structures — the theory of name-passing process calculi and causal concurrency. External to Eff (the S∞-action is incompatible with any PCA); models fresh name generation, channel mobility, and concurrent causality orders. Connected to CGS via the concurrent-games-with-symmetry embedding of nominal arenas.
component-of: computing
title: concurrent-computation
---

# Concurrent Computation

The theory of concurrency grounded in nominal sets (Gabbay-Pitts 1999) and event structures (Winskel 1986). Nominal sets form the Fraenkel-Mostowski topos $\mathbf{Sets}^{\mathbf{I}}$ (the Schanuel topos for the category $\mathbf{I}$ of finite sets and injections): objects have a global action of the infinite symmetric group $S_\infty$ modeling fresh name generation. The π-calculus (Milner-Parrow-Walker 1992) is modeled here: processes, channels, and name-mobility are nominal sets.

$\mathbf{Sets}^{\mathbf{I}}$ is not a subtopos of $\mathbf{Eff}$ — the $S_\infty$-action is incompatible with any PCA's discrete application structure. Nor is it connected to $\mathbf{Eff}$ by any geometric morphism. It is external to the realizability world entirely. The connection to the ambient theory of computing runs through $\mathbf{CGS}$: concurrent games with symmetry (Castellan-Clairambault-Winskel 2017) accommodate nominal arenas by equipping arenas with symmetry groupoids that include $\mathrm{FSym}(\mathbb{A})$ (finite permutations of a countably infinite name set); the Abramsky-Ghica-Murawski-Ong-Stark (2004) full abstraction theorem for the ν-calculus lives in this fragment.

Event structures (stable, general, prime) give the causal-order account of concurrency: a computation is a set of events with a partial order (causality) and a conflict relation. The category of stable event structures is Cartesian closed but not a realizability category.
