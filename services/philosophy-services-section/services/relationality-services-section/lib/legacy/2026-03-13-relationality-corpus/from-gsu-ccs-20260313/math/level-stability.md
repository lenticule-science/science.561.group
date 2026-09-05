---

name: level-stability
description: "Level Stability"
---

### Theorem — Level Stability {#level-stability}

For each $n \geq 0$, the saturation nucleus $\sigma$ is stable under the depth-inclusion
geometric morphism $f_n : R_n \to R_{n+1}$: the canonical natural transformation
$$
f_n^\ast \circ \sigma_{n+1} \xrightarrow{\;\sim\;} \sigma_n \circ f_n^\ast
$$
is an isomorphism on $H|_{R_n}$. For the transfer nucleus $\Delta$, the analogous
Beck–Chevalley square holds for non-frontier histories but has a gap at the depth-$n$
boundary (see below).

**Proof.** *For $\sigma$:* The history category $T^{(n)}$ is **downward-closed** under the
prefix order: if $t \in T^{(n)}$ (depth $\leq n$) and $t_0 < t$, then $t_0$ has depth
$< n$, so $t_0 \in T^{(n)}$. The sub-histories used in the defining join
$$
\sigma_t(a) = \bigvee\bigl\{b \in H_t \;\big|\; \rho_{t_0}(b) \leq \rho_{t_0}(a)\;
\forall\, t_0 < t\bigr\}
$$
are identical whether computed in $T^{(n)}$ or $T^{(n+1)}$. The Beck–Chevalley square
for $\sigma$ commutes strictly. $\checkmark$

*For $\Delta$:* The transfer nucleus $\Delta_t$ is defined via one-step extensions
$s \star t$ with $s \perp t$ (§fiber-doctrine). For $t \in T^{(n)}$ of depth
exactly $n$, these extensions lie in $T^{(n+1)} \setminus T^{(n)}$. Consequently:

- $\Delta_{n+1}$ at a frontier history sees extensions at depth $n+1$;
- $\Delta_n$ at the same history has no within-level extensions, so
  $\mathrm{Fix}(\Delta_{n,t}) = H_t$ (no constraint) and $\Delta_n|_{\mathrm{frontier}} = \mathrm{id}$.

The square $f_n^\ast \circ \Delta_{n+1} \cong \Delta_n \circ f_n^\ast$ does **not** commute
strictly at frontier histories. Whether it holds in the colimit $R = \varinjlim_n R_n$, or
under sheafification, is deferred to §beck-chevalley-tower in §on-relational-hyperverse, where the Beck–Chevalley
conditions for the full hyperverse tower are examined.

**Summary.** $\sigma$-BC: established. $\Delta$-BC: established for histories of depth $< n$,
open at the depth-$n$ frontier.
