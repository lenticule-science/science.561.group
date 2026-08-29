---

name: sheaf-erasure-code
description: "Sheaf Condition as Optimal Erasure Code"
---

### Conjecture — Sheaf Condition as Optimal Erasure Code {#sheaf-erasure-code}

#### Setup {#sheaf-erasure-setup}

Let $(T, J)$ be the history site and $H \in \mathbf{Sh}(T, J)$ a sheaf. The sheaf
condition (§locality) states: for every history $t$ and every covering family
$\{f_i : t_i \to t\} \in J(t)$, the diagram
$$
H(t) \;\longrightarrow\; \prod_i H(t_i) \;\rightrightarrows\; \prod_{i,j} H(t_i \wedge t_j)
$$
is an equalizer. Equivalently: a global section $a \in H(t)$ is uniquely determined
by its local restrictions $\{H(f_i)(a)\}$ over the cover.

This is precisely the property of an **erasure code**: a global codeword $a$ can be
reconstructed from any sufficiently large subset of its projections onto local
sub-histories. The topology $J$ specifies which subsets suffice (the covering families).

#### The Conjecture {#sheaf-erasure-conjecture}

**Conjecture.** For the history site $(T, J)$ with commutation covers, the sheaf
condition $H \in \mathbf{Sh}(T, J)$ is equivalent to $H$ being the sections of an
**optimal erasure code** in the following sense:

1. **Redundancy.** The restriction maps $H(f): H(t) \to H(t')$ for $t' \leq t$ encode
   $H(t)$ redundantly in the sub-histories. Any covering family for $t$ provides a complete
   encoding.

2. **Recovery threshold.** The minimum covering family size — the minimum number of
   sub-histories needed to recover a global section — equals the **combinatorial width**
   of the commutation topology $J$: the smallest $k$ such that every $t$ has a cover
   of cardinality $\leq k$.

3. **Relational distance.** Define the **relational distance** between two histories
   $t, t'$ as the minimum number of steps in the prefix order separating them. The
   maximum erasure the code can tolerate (the number of local sections that can be
   "lost") is bounded by the relational distance between the surviving sections.

#### What Is Provable {#sheaf-erasure-provable}

The following can likely be made precise:

- **Reconstruction theorem.** For a sheaf $H$ on $(T, J)$ and a covering family
  $\{f_i: t_i \to t\}$, a global section $a \in H(t)$ is uniquely recoverable from
  the restrictions $\{H(f_i)(a)\}$. This is the sheaf condition itself — the conjecture
  adds that this recovery is **optimal** in the sense that no strictly smaller covering
  family suffices.

- **Failure mode.** If a subset $\{H(f_i)(a)\}_{i \in S}$ for $S$ a non-covering
  family is given, the reconstruction problem has either zero or multiple solutions
  (depending on whether the data is consistent). The non-covering condition is
  equivalent to the code being below its recovery threshold.

#### Significance {#sheaf-erasure-significance}

If the conjecture holds, the commutation topology $J$ on the history site is not an
arbitrary technical device but the **optimal error-correction structure** for the
relational data encoded in $H$. The commutation covers — the physical content of $J$
— are the minimum sets of local observations needed to certify a global relational
proposition.

In the physical correspondence: the Axiom of Locality (§locality) is the statement that
the universe runs an optimal erasure code on its relational data, and the Planck scale
(§resolution-floor) is the recovery threshold below which global
reconstruction fails.

**Status.** Stub. The analogy with erasure codes is precise at the level of the sheaf
condition but the optimality claim requires a definition of "relational distance" and
a proof that $J$ is the maximal topology achieving the given recovery threshold.
