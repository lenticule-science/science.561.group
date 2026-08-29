---
id: order
name: Order
description: "The prefix extension partial order on histories: t ≤ t' iff t' = t ★ u for some u, making T a thin category."
defines: Order
---

### Definition — Prefix Ordering {#order}

The **prefix ordering** is the partial order on histories:
$$
t \;\leq\; t' \quad\Longleftrightarrow\quad \exists\, u \in \mathrm{Ob}(T)\; :\; t' = t \star u.
$$
This makes $T$ a **thin category** — a poset viewed as a category — where the
unique morphism $t \to t'$ exists precisely when $t \leq t'$.

**The ordering and concatenation.** The relation $t \leq t \star u$ is exactly
the content of the ordering: every concatenation $\star$ produces a prefix
extension. The ordering records the structure that concatenation (§concatenating)
produces.

**Presheaves are contravariant over the ordering.** Every sheaf and presheaf
on $T$ is a contravariant functor $F : T^{\mathrm{op}} \to \mathbf{Set}$:
a morphism $t \leq t'$ induces a restriction map $F(t') \to F(t)$ going
backwards. The ordering is the structural input for all sheaf-theoretic
constructions in $R$.
