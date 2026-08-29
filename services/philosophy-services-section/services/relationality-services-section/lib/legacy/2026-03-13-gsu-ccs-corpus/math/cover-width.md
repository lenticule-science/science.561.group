---
id: cover-width
name: CoverWidth
description: "Object: the cover width w(t) of a history t — the number of pieces in the finest commutation cover of t, measuring the maximal concurrency of the history."
defines: CoverWidth
---

### Definition — Cover Width {#cover-width}

The **cover width** of a history $t \in \mathbb{M}(\Sigma,I)$ is
$$
w(t) \;:=\; \max\bigl\{n \;\big|\; \exists \text{ commutation cover of } t \text{ with } n \text{ pieces}\bigr\},
$$
the number of pieces in the finest commutation cover of $t$ — the greatest number of
mutually commuting sub-histories into which $t$ decomposes (§commutation-topology).

#### Constitutive Data {#cover-width-data}

A **commutation cover** of $t$ with $n$ pieces is a commutation partition
$t = t^{(1)} \star \cdots \star t^{(n)}$ in which the step-sets $\mathrm{steps}(t^{(i)})$
are pairwise disjoint and every step in $t^{(i)}$ commutes with every step in $t^{(j)}$
for $i \neq j$ (§commutation-topology). The finest such partition maximizes $n$; its
cardinality is $w(t)$.

#### Boundary Cases {#cover-width-boundary}

- $w(e) = 1$ — the empty history has the trivial cover.
- $w(t) = 1$ for any **totally ordered history** (one in which all steps are mutually
  dependent under $\sim I$, i.e., $|\mathrm{steps}(t)| = 1$ or no two steps commute):
  the history admits no non-trivial commutation decomposition.
- $w(t) = |\mathrm{steps}(t)|$ for a **completely commutative history**: every pair of
  steps commutes, so the finest cover is the individual steps.

#### Role in This Theory {#cover-width-role}

Cover width is a measure of **concurrent content**: a history with high $w(t)$ carries
much simultaneous, order-independent structure; a history with $w(t) = 1$ is fully
sequential. It appears in:
- Cosmic void geometry (§cosmic-void), where low cover width histories form the
  relational vacuum;
- Sheaf erasure codes (§sheaf-erasure-code), where $w(t)$ controls the redundancy
  of the sheaf condition.
