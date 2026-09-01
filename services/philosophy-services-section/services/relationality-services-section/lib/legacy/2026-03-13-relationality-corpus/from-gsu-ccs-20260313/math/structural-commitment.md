---

name: structural-commitment
description: "a structural commitment over a covering family is a globally coherent section chosen to resolve a locally inconsistent mode, permanently constraining future sorting decisions over that family."
---

### Definition — Structural Commitment {#structural-commitment}

A **structural commitment** over a covering family $\{U_i \to U\}$ in $(T,J)$ is a
globally coherent section $s \in \mathcal{F}(U)$ chosen to resolve a locally inconsistent
mode — a collection $\{s_i \in \mathcal{F}(U_i)\}$ that agrees on overlaps but has no
global section lifting it until the commitment is made.

The **structural commitment cost** of making such a choice is the loss of local degrees
of freedom over the covering family: after the commitment, every future sorting decision
about objects restricted to the $U_i$ must be consistent with the chosen global section $s$.
The choice is irreversible.

The structural commitment cost of a nonzero class $[e] \in H^1(T,J;\,E_0)$
(§cohomological-tunneling) is the cost of resolving the global inconsistency that class
witnesses. Whether this cost equals $\dim H^1$ at each depth, and whether total finite cost
is equivalent to tower convergence, are the content of the Structural Commitment Conjecture
(§structural-commitment-conjecture).
