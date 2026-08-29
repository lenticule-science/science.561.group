---

name: idempotence
description: "The nucleus property $j(j(a)) = j(a)$: applying the nucleus twice gives nothing new."
defines: Idempotence
---

### Definition — Idempotence {#idempotence}

A map $j : A \to A$ on a Heyting algebra $A$ is **idempotent** if

$$
j(j(a)) = j(a) \quad \text{for all } a \in A.
$$

Idempotence means that once $j$ has been applied, applying it again changes nothing. The image of $j$ is already closed under $j$: every element of $\mathrm{Im}(j)$ is a fixed point. This is equivalent to saying $\mathrm{Im}(j) = \mathrm{Fix}(j)$ — the image and the fixed-point set coincide.

Together with extensiveness (§extensiveness), idempotence means $j$ is a **retraction** of $A$ onto $\mathrm{Fix}(j)$: it maps every element to the smallest fixed point above it. The fixed-point set $\mathrm{Fix}(j)$ is then a reflective sub-poset of $A$.

Idempotence is one of the three conditions that together define a nucleus (§nucleus); the other two are extensiveness (§extensiveness) and meet-preservation (§meet-preservation).
