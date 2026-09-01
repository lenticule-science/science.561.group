---
id: stability
name: Stability
description: "Stability"
---

### Axiom — Stability {#stability}

Fixed propositions are those already stable under both nuclei; fiberwise fixed elements
$H_t^\ast$ assemble into a **subsheaf** of $H$ — not merely a subpresheaf.

Define the presheaf $H^\ast : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ by
$H^\ast(t) := H_t^\ast$ with restriction $H^\ast(f) := H(f)\big\vert_{H_{t'}^\ast}$.
This axiom requires:

**Sheaf Property of Fixed Fibers.** For every $t$ and every covering family $\{u_i :
t_i \to t\} \in J(t)$:

1. **Locality for fixed elements.** If $a, b \in H_t^\ast$ satisfy $H^\ast(u_i)(a) =
   H^\ast(u_i)(b)$ for all $i$, then $a = b$.

2. **Gluing of fixed elements.** If $(a_i)_{i \in I}$ is a compatible family with
   $a_i \in H_{t_i}^\ast$, then there exists a unique $a \in H_t^\ast$ such that
   $H^\ast(u_i)(a) = a_i$ for all $i$.

**Closure Under Gluing.** If a compatible family of fixed local sections $(a_i)$, each
$a_i \in H_{t_i}^\ast$, glues in the full sheaf $H$ to a section $a \in H_t$, then in
fact $a \in H_t^\ast$. Gluing fixed locals via the ambient sheaf $H$ produces a fixed
global, not merely a generic global section.

> **Remark — Interpretation.** {#remark-stability-interpretation} The Axiom of Stability carves out
> a "stable stratum" across the entire structure: those propositions fixed by both the
> saturation nucleus and the transfer nucleus. Fiberwise, they are fully saturated
> propositions; globally, they form a sheaf $H^\ast$, so stability is a local-to-global
> notion. Later, $H^\ast$ will be used to define an internal locale — the space of fully
> stable configurations of $R$ (§def-invariant-locale).
