---
id: beck-chevalley-tower
name: BeckChevalleyTower
description: "The Beck–Chevalley Tower"
---

### Construction — The Beck–Chevalley Tower {#beck-chevalley-tower}

The Beck–Chevalley conditions control whether base-change geometric morphisms commute with
the nucleus operations. Section §level-stability established that $\sigma$-BC holds
strictly at every finite depth level, while $\Delta$-BC has a gap at frontier histories. This
section resolves the gap: both conditions hold in the colimit $R = \mathbf{Sh}(T,J)$.

#### Definition — Δ-Defect at Depth $n$ {#def-delta-defect}

For each depth-inclusion $f_n : R_n \to R_{n+1}$, the **$\Delta$-defect at depth $n$** is the
sub-sheaf of $H|_{R_n}$ on which the Beck–Chevalley square commutes:
$$
\mathrm{Def}_n \;:=\; \mathrm{Eq}\!\bigl(\,f_n^* \circ \Delta_{n+1},\;\, \Delta_n \circ f_n^*\,\bigr)
\;\hookrightarrow\; H|_{R_n}.
$$
A history $t \in T^{(n)}$ is in the support of $\mathrm{Def}_n$ iff $\Delta$-BC holds at $t$;
the complement is where BC fails.

#### Proposition — Support of the Δ-Defect {#prop-defect-support}

For each $n \geq 0$:

1. **Interior histories** (depth $< n$). All one-step extensions $s \star t$ (with $s \perp t$ a
   single step) have depth $\mathrm{depth}(t)+1 \leq n$, so they lie in $T^{(n)}$. Both
   $\Delta_{n,t}$ and $\Delta_{n+1,t}$ are computed over the same extension set; they coincide.
   Thus $(\mathrm{Def}_n)_t = H_t$.

2. **Frontier histories** (depth $= n$). One-step extensions of $t$ have depth $n+1$, lying in
   $T^{(n+1)} \setminus T^{(n)}$. Within $T^{(n)}$ there are no such extensions, so
   $\Delta_{n,t} = \mathrm{id}_{H_t}$. In $T^{(n+1)}$ the extensions become available and
   $\Delta_{n+1,t}$ is the intersection of restriction images from those extensions
   (§fiber-doctrine): a proper nucleus. The equalizer is exactly the fixed-point set:
   $(\mathrm{Def}_n)_t = \mathrm{Fix}(\Delta_{n+1,t}) = H_t^{*,\Delta}$.

The $\Delta$-defect is concentrated on frontier histories; interior histories contribute nothing.

#### Proposition — Defect Mobility {#prop-defect-mobility}

Every frontier history at depth $n$ is interior at depth $n+1$.

*Proof.* A frontier history $t$ has $\mathrm{depth}(t) = n$. Its one-step extensions have depth
$n+1 \leq n+1$, so all lie in $T^{(n+1)}$. Hence $t$ has all its one-step extensions available
in $T^{(n+1)}$: it is interior at depth $n+1$. $\checkmark$

**Consequence.** By Proposition~\ref{prop-defect-support}(1), $(\mathrm{Def}_{n+1})_t = H_t$
for any $t$ that was frontier at depth $n$. The BC failure is resolved one level later.

#### Theorem — Δ-BC in the Colimit {#thm-delta-bc-colimit}

In the colimit $R = \mathbf{Sh}(T,J) = \varinjlim_n R_n$, the Beck–Chevalley square for
$\Delta$ holds at every history: for the canonical geometric morphisms $\iota_n : R_n \to R$,
$$
\iota_n^* \circ \Delta \;\cong\; \Delta_n \circ \iota_n^*.
$$

*Proof.* Let $t \in T$ with $d := \mathrm{depth}(t)$. Then $t \in T^{(d)}$ and $t$ is a
frontier history of $T^{(d)}$. By defect mobility, $t$ is interior in $T^{(m)}$ for all $m > d$.
By Proposition~\ref{prop-defect-support}(1), $(\mathrm{Def}_m)_t = H_t$ for all $m > d$:
$\Delta$-BC holds at $t$ in every $R_m$ with $m > d$.

In $R = \mathbf{Sh}(T,J)$, the nucleus $\Delta_t$ uses all extensions of $t$ in $T$. For any
specific $a \in H_t$, the computation of $\Delta_t(a)$ involves only finitely many extensions
(since $H_t$ is finite), all of which lie in $T^{(d')}$ for some $d' < \infty$. Taking $m >
\max(d, d')$, $\Delta_{m,t} = \Delta_t$, and $\Delta$-BC holds at $t$ in $R_m$. Since
$R = \varinjlim R_m$, it holds in $R$ as well. Since $t$ was arbitrary, $\Delta$-BC holds
everywhere in $R$. $\square$

#### Summary — BC Conditions in the Tower {#summary-bc}

| Condition | Finite level $R_n$ | Colimit $R$ |
|---|---|---|
| $\sigma$-BC | Holds (§level-stability: $T^{(n)}$ downward-closed) | Holds |
| $\Delta$-BC | Fails at frontier histories | Holds (defect-mobility theorem above) |

The colimit $R = \mathbf{Sh}(T,J)$ satisfies both BC conditions. The depth tower
$R_0 \to R_1 \to \cdots \to R$ is fully coherent: BC conditions hold in the limit even
though $\Delta$-BC fails at every finite stage.

#### Remark — The Hyperverse Tower {#remark-bc-meta}

The hyperverse tower $R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots \hookrightarrow \mathcal{H}$
(§hyperverse-tower) satisfies the same pattern. The role of "histories" is played by relational
universes; the role of "frontier histories at depth $n$" is played by universes first appearing at
level $n$ of the hyperverse tower. By the same defect-mobility argument: each such universe
gains "extensions" (relational universes that observe it) at level $n+1$, so Δ-BC at the
meta-level holds in $\mathcal{H} = \varinjlim_n R^{(n)}$. The coherence of $\mathcal{H}$ as a
colimit of Grothendieck toposes (needed for §hyperverse-fixed-point) follows.
