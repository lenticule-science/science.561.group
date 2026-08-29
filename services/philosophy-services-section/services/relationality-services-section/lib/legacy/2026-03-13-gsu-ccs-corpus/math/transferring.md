---
id: transferring
name: Transferring
description: "The transferring operation Trans(M) in FiberNuclearLanguage — applying the transfer nucleus Δ_t to a proposition, lifting it to the smallest element already witnessed by all one-step extensions."
defines: Transferring
---

### Definition — Transferring {#transferring}

**Transferring** a proposition $M : \mathsf{Prop}$ applies the transfer
nucleus $\Delta_t$ (§transfer-nucleus) to it:
$$
\mathsf{Transfer}(M) \;:\; \mathsf{Prop},
\qquad
\llbracket \mathsf{Transfer}(M) \rrbracket_t \;:=\; \Delta_t\!\bigl(\llbracket M \rrbracket_t\bigr).
$$
$\mathsf{Transfer}$ is what $\Delta_t$ does to a proposition in FiberNuclearLanguage.
The nucleus $\Delta_t$ itself is named in §transfer-nucleus.

#### What Transferring Does {#transferring-action}

Transferring lifts $M$ to the **smallest proposition already witnessed by all one-step
extensions**: the result $\mathsf{Transfer}(M)$ is already present at every history $s \star t$
(for $s \perp t$) as a restriction, and is the least such element above $M$.

For each step $s \perp t$ with extension morphism $i_{s,t} : t \to s \star t$,
there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = \mathsf{Transfer}(M)$. The gap
$$
M \;\leq\; \mathsf{Transfer}(M)
$$
(strict when $M \notin \mathrm{Fix}(\Delta_t)$) is the space of propositional
**possibility** (§possible): what must be committed to in order for $M$ to be
extension-witnessed.

#### Reduction Rules {#transferring-reductions}

| Rule | Reduction | What it expresses |
|------|-----------|-------------------|
| R2 | $\mathsf{Transfer}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(M)$ | Transferring is idempotent |
| R4 | $\mathsf{Transfer}(M \wedge N) \to \mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)$ | Transferring distributes over $\wedge$ |
| R6 | $\mathsf{Transfer}(\mathsf{True}) \to \mathsf{True}$ | $\top_t$ is already transfer-stable |
| R7 | $\mathsf{Saturate}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(\mathsf{Saturate}(M))$ | Transferring commutes with saturating |

The full reduction system is §reduction-system.

#### Extension-Neutrality {#transferring-neutral}

Transferring is $\sigma$-neutral: $\mathsf{Transfer}(M)$ and $M$ have the same
restriction profile at every sub-history $t_0 < t$.
