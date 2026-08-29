---
name: theory-of-linear-computation
type: theorem
status: proved
description: MLL and MALL are sub-*-autonomous categories of CGS strictly below ILL in the linear logic fragment lattice — the fragments of computing where each resource is used exactly once, with no copying or discarding.
see-also: [what-is-the-theory-of-computing, what-are-the-subtheories-of-computing]
---

# The Theory of Linear Computation

**Theorem.** The multiplicative (MLL) and multiplicative-additive (MALL) fragments of linear logic are sub-$*$-autonomous categories of $\mathbf{CGS}$ (concurrent games with symmetry), sitting strictly below ILL in the fragment lattice MLL $<$ MALL $<$ ILL $<$ LL. They are the theories of resource-sensitive computation without the $!$ comonad.

**Proof.**

*The fragment lattice.* The linear logic fragment lattice is the lattice of $*$-autonomous sub-categories of $\mathbf{CGS}$ ordered by inclusion:
- **MLL**: tensor $\otimes$, par $\invamp$, and their units $\mathbf{1}$, $\bot$, with the involutive negation $(-)^\perp$. No additives, no $!$.
- **MALL**: MLL plus additive conjunction $A \mathbin{\&} B$ (internal choice: provide either $A$ or $B$ as the environment requests) and additive disjunction $A \oplus B$ (external choice: commit to $A$ or $B$).
- **ILL**: MALL plus the comonad $!A$ (the "of course" modality: $A$ may be used any number of times). The Kleisli category $\mathcal{Kl}(!) \simeq \mathbf{Eff}$ recovers the Cartesian closed theory of computable functions.
- **CLL**: MALL plus both $!$ and $?$ (the "why not" comonad), giving full classical linear logic with the $*$-autonomous self-duality $A \cong (A^\perp)^\perp$.
- **LL**: All of the above; the full comonadic structure.

*MLL and MALL are $*$-autonomous.* The $*$-autonomous structure of $\mathbf{CGS}$ restricts to each fragment: the dualizing object $(-)^\perp$ (Opponent-Player swap) and the monoidal product $\otimes$ (parallel composition) are defined in terms of the game-arena structure, which requires no $!$-structure. Removing $!$ from $\mathbf{CGS}$ gives a $*$-autonomous category where every type is used exactly once — a resource-sensitive computation.

*Strict inclusions.* MLL $\subsetneq$ MALL: additive conjunction is the game-theoretic "choose which component to provide," not expressible as a tensor. MALL $\subsetneq$ ILL: the $!$ comonad introduces unbounded copying and discarding (contraction and weakening) — the structural rules that characterize unrestricted computation. Without $!$, programs cannot reuse inputs; the exponential $A \to B$ in the Cartesian sense ($= {!}A \multimap B$) does not exist. $\square$
