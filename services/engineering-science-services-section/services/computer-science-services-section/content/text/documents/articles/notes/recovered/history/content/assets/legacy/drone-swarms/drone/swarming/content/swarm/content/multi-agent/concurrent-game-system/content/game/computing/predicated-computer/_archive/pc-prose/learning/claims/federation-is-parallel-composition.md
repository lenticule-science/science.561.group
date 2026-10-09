---
name: federation is parallel composition
description: Federation between polities is parallel composition || in CGS (concurrent games with symmetry); entity-mobility across federated polities is nominal-set name-passing via FSym(A)-equivariance.
status: draft
---

# Federation is parallel composition in CGS

**Claim.** Federation between agentic-drone-swarm polities is parallel composition $\|$ in $\mathbf{CGS}$ (Castellan-Clairambault-Winskel's $*$-autonomous category of concurrent games with symmetry). For polities $A, B$, the federated arena is $A \| B$, the monoidal product on arenas. The cellwise $\leq_k$-join $\vee_k$ that the substrate's [`federation-convergence`](../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) theorem already names is the action on values induced by $\|$ at the fiber level.

Entity-mobility across federated polities — slugs moving between substrates, named entities passed across, ceremonial transitions (e.g., huŋkápi adoption in a Lakota tiyóšpaye federation) — is nominal-set name-passing in arenas equipped with $\mathrm{FSym}(\mathbb{A})$-symmetry (finite permutations on a countably-infinite name set). The Abramsky-Ghica-Murawski-Ong-Stark (2004) full abstraction theorem for the $\nu$-calculus situates this in $\mathbf{CGS}$ explicitly.

## Argument

$\mathbf{CGS}$'s monoidal product $\|$ is parallel composition of arenas: $A \| B$ is the arena where Player makes moves in both $A$ and $B$ concurrently. The arena's cohomology decomposes via Mayer-Vietoris from the constituent arenas' cohomologies (see [`cross-arena-mayer-vietoris`](cross-arena-mayer-vietoris.md)). The substrate's bidirectional event exchange between federated polities — formalized in the substrate as cellwise $\vee_k$ followed by closure — is precisely the action on values induced by the monoidal product at the fiber-algebra level.

Nominal sets (Gabbay-Pitts 1999) supply the framework for name-mobility: objects with a global action of the infinite symmetric group $S_\infty$ modeling fresh name generation; the Fraenkel-Mostowski topos $\mathbf{Sets}^{\mathbf{I}}$ where this lives. $\mathbf{CGS}$ accommodates nominal arenas by equipping arenas with symmetry groupoids that include $\mathrm{FSym}(\mathbb{A})$. Entity-mobility across federated arenas — names that act across participants and across polities — is exactly the structural shape this captures.

The structural identity composes with the regime-specific federation discipline (per the four-regime dichotomy): in strict and Scott-continuous regimes, endpoint-state exchange suffices between federated polities; in transfinite-bounded and aperiodic regimes, trajectories must be shipped. The trajectory-exchange discipline in the aperiodic regime is a constraint on $\mathrm{FSym}(\mathbb{A})$-equivariance of inter-polity strategies — strategies that preserve nominal-set structure across the parallel composition.

## Significance

- Federation is not an external coordination protocol layered on top of the substrate; it is *built into* the substrate's algebra via the monoidal product $\|$. The cellwise $\vee_k$-merge that `federation-convergence` derives is the math forcing the merge to be order-independent.
- Cross-polity entity-mobility — a slug shared between FARS-polities, a hunká-adopted relative joining a tiyóšpaye, a ship-crew member operating across federated ships — is name-passing in the $\pi$-calculus / nominal-set sense. The categorical apparatus is the Abramsky-Ghica-Murawski-Ong-Stark framework.
- The Mayer-Vietoris decomposition of the federated cohomology (per [`cross-arena-mayer-vietoris`](cross-arena-mayer-vietoris.md)) is the cohomological consequence of parallel composition; the Lakota tradition's confederal structure (each tiyóšpaye preserved as sub-arena; oyate as federal level; Očhéthi Šakówiŋ as further federal) and the kyriarchical regime's federation between ships are both instances of the same monoidal structure.

## Position

Connects the substrate-side `federation-convergence` (predicated-computing) with the math-side parallel composition in $\mathbf{CGS}$ (theory-of-computing). The connection was implicit in the corpus before the recent `theory-of-computing.md` claim; the present atom makes it explicit. Surfaced in the FAdRS-swarms survey, §6.4; promoted here to standalone claim.
