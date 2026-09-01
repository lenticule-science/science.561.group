---
id: hyperverse-new-modes
name: HyperverseNewModes
description: "Object: the hyperverse-new-modes sheaf at tower step k — the relative stable-mode data of the pair (R^(k+1), R^(k)), measuring stable propositions about universe-objects first appearing at tower level k+1."
---

### Definition — The Hyperverse-New-Modes Sheaf {#hyperverse-new-modes}

At hyperverse tower step $k$, the **hyperverse-new-modes sheaf** is the cokernel of the
restriction map induced by the tower inclusion $\iota_k: R^{(k)} \hookrightarrow R^{(k+1)}$:
$$
\widetilde{N}_k \;:=\; E_0^{(k+1)} \big/ (\iota_k)_*\, (\iota_k)^*\, E_0^{(k+1)},
$$
a sheaf on $R^{(k+1)}$.

#### Construction {#hyperverse-new-modes-construction}

The stable mode sheaf $E_0^{(k+1)}$ on $R^{(k+1)}$ assigns to each universe-object
$\mathbf{U} \in \mathbf{RU}^{(k)}$ the fixed fiber $H_\mathbf{U}^{(k)*}$ (§tower-fiber-seeding).
The inclusion $\iota_k: R^{(k)} \hookrightarrow R^{(k+1)}$ has:
- Inverse image $(\iota_k)^*$: pulls $E_0^{(k+1)}$ back to a sheaf on $R^{(k)}$
- Direct image $(\iota_k)_*$: pushes it forward to a subsheaf of $E_0^{(k+1)}$

The subsheaf $(\iota_k)_* (\iota_k)^* E_0^{(k+1)}$ is the part of $E_0^{(k+1)}$ that
"already existed" at level $k$ — the stable modes visible from $R^{(k)}$. The quotient
$\widetilde{N}_k$ is the genuinely new stable content at level $k+1$.

This gives a short exact sequence on $R^{(k+1)}$:
$$
0 \;\to\; (\iota_k)_*\, (\iota_k)^*\, E_0^{(k+1)}
\;\to\; E_0^{(k+1)}
\;\to\; \widetilde{N}_k
\;\to\; 0.
$$

#### Level Contrast {#hyperverse-new-modes-contrast}

The depth-filtration analog is §depth-new-modes: there both sheaves live on the same
base site $(T,J)$ and the step is within a single universe. Here the step crosses
universe-levels, and the two sheaves live on different toposes ($R^{(k)}$ and $R^{(k+1)}$).
The comparison requires the geometric morphism $\iota_k$, not just a quotient on a fixed site.

At the universe level, fibers over a FIXED universe-object $\mathbf{U}$ CONTRACT via
tower fiber seeding (§tower-fiber-seeding): $H_\mathbf{U}^{(k+1)} = H_\mathbf{U}^{(k)*}
\subseteq H_\mathbf{U}^{(k)}$. The new-modes sheaf $\widetilde{N}_k$ captures the
new stable content from NEW universe-objects appearing at level $k+1$ — not from growth
of existing fibers.
