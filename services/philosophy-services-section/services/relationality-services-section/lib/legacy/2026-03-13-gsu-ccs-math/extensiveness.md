---

name: Extensiveness
description: "The nucleus property $a \leq j(a)$: every element is below its nucleus image."
---

### Definition — Extensiveness {#extensiveness}

A map $j : A \to A$ on a Heyting algebra $A$ is **extensive** if

$$
a \leq j(a) \quad \text{for all } a \in A.
$$

Extensiveness means $j$ can only move elements upward — it closes or strengthens, never weakens or deletes. A closure operator that moved elements downward would reduce information; extensiveness ensures that applying $j$ accumulates rather than discards.

In the Relational Universe, both $\sigma_t$ (saturation) and $\Delta_t$ (transfer) are extensive on each fiber $H_t$: every proposition is below its saturated version and below its transferred version. This is what makes them nuclei rather than arbitrary endomorphisms.

Extensiveness is one of the three conditions that together define a nucleus (§nucleus); the other two are idempotence (§idempotence) and meet-preservation (§meet-preservation).
