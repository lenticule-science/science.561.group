---

name: extension-possibility
description: "A step s is possible at history t when s★t ∈ T: the extension exists in the history category. Extension possibility is the structural fact that the prefix order places s★t above t."
---

### Definition — Extension Possibility {#extension-possibility}

A step $s \in \Sigma$ is **possible at history $t \in \mathrm{Ob}(T)$** when the
concatenation $s \star t$ is itself an object of the history category $T$:
$$
s \text{ is possible at } t \;\iff\; s \star t \in \mathrm{Ob}(T).
$$

When $s$ is possible at $t$, the prefix order (§order) places $s \star t$ above $t$:
$t \leq s \star t$. The extension $s \star t$ is a new history one step longer than $t$,
with its own fiber algebra $H_{s \star t}$ and restriction map
$H(i_{s,t}) : H_{s \star t} \to H_t$ (§reindexing).

When $s$ is not possible at $t$, $s \star t$ is absent from $T$: the history category
contains no object above $t$ in the direction of $s$.

A history $t$ is **terminal** when no step is possible at $t$: $t$ is a maximal element
of the prefix order (§order) with no objects above it in $T$. When $t$ is terminal,
$\Delta_t = \mathrm{id}$ (§transfer-nucleus): there are no perpendicular extensions
$s \perp t$ to intersect over, so every proposition is vacuously transfer-stable.
