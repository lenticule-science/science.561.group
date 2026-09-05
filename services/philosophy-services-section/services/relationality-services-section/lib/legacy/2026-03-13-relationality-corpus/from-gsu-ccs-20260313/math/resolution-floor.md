---

name: resolution-floor
description: "Resolution Floor and Sub-Planck Structure"
---

### Conjecture — Resolution Floor and Sub-Planck Structure {#resolution-floor}

*This file bridges the depth filtration tower to the observed Planck-scale structure of
spacetime. All mathematical claims are in §depth-filtration and §locality.*

#### The Mathematical Structure {#res-floor-math}

From §depth-filtration: the Relational Universe $R$ is the colimit of the tower
$$
R_0 \hookrightarrow R_1 \hookrightarrow R_2 \hookrightarrow \cdots \to R.
$$
Each $R_n$ is a sheaf topos on the depth-$n$ truncation of the history site $(T_n, J_n)$.
A proposition $a \in H$ lies in $R_n$ if and only if it can be expressed using histories of
depth $\leq n$.

Below depth $n$, there are no well-formed propositions: the topology $J_n$ has no
covers finer than depth-$n$ commutation covers. Attempting to "see inside" a depth-$n$
atom produces data that is not gluable — the sheaf condition $H(U) \cong \varprojlim H(U_i)$
fails because the covering family $\{U_i\}$ does not exist at depth $< n$.

#### The Conjectural Correspondence {#res-floor-correspondence}

**Bridge conjecture.** The depth cutoff $n$ corresponds to the Planck-scale resolution
floor in physical spacetime. The Planck length $\ell_P$ is not a geometric minimum but
a **relational minimum**: the smallest history depth at which a proposition can be locally
consistent.

Below the Planck scale, measurement attempts produce **algebraic noise**: outputs that
exist as sections over individual open sets but cannot be glued to a global section.
These are not "smaller particles" but **un-gluable data packets** — local sections in
$H(U_i)$ with no consistent restriction to the overlap $U_i \cap U_j$.

The depth tower thus predicts: as physical resolution approaches $\ell_P$, the apparent
locality of measurement outcomes breaks down, not because the geometry becomes singular,
but because the relational depth of the probe exceeds the depth of the site.

#### Predictions {#res-floor-predictions}

1. **Discreteness without particles.** There is no "smallest particle" at the Planck
   scale — there are only depth-floor propositions that look particle-like because they
   are the atoms of $R_n$ for the relevant $n$.

2. **Gluing failures as "quantum foam".** The observed foam-like structure of spacetime
   at sub-Planck scales (if ever accessible) is predicted to be topological: individual
   local measurements are internally consistent but globally incoherent due to $J$-gluing
   failure.

3. **No new structure below depth $n$.** The relational structure at depth $n$ is complete: $R_n$ is a
   topos with all the algebraic structure of $R$. "Going deeper" does not reveal new
   dynamics — it only resolves propositions that were already expressible at depth $n$
   into finer constituents that recombine to the same depth-$n$ output.

**Falsification.** If sub-Planck experiments (if ever feasible) reveal consistently
gluable structure — smooth outcomes with well-defined restriction maps — rather than
stochastic gluing failure, the depth-floor identification fails. The mathematical depth
tower is not falsified; only its identification with the Planck scale is.
