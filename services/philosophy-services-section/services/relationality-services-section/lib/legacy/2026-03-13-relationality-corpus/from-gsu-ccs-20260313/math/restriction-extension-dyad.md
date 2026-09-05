---

name: restriction-extension-dyad
description: "The fiber-level dyad between Fix(σ_t) and Fix(Δ_t): restriction-stable propositions determined by outgoing restriction maps, and extension-stable propositions witnessed by all one-step extensions."

---

### Definition — The Restriction–Extension Dyad {#restriction-extension-dyad}

The **restriction–extension dyad** is the complementary pair of sub-algebras of $H_t$
produced by the two nuclei $\sigma_t$ and $\Delta_t$:

| | Sub-algebra | Nucleus | Character |
|--|-------------|---------|-----------|
| | $\mathrm{Fix}(\sigma_t)$ | $\sigma_t$ | Restriction-stable: determined by outgoing restriction maps |
| | $\mathrm{Fix}(\Delta_t)$ | $\Delta_t$ | Extension-stable: witnessed by all one-step extensions |

These are the two poles of the nuclear square at the fiber level ([CommutativeNuclearSquare](commutative-nuclear-square.md)).
Their intersection is the doubly-fixed sub-algebra:

$$
H_t^* \;=\; \mathrm{Fix}(\sigma_t) \;\cap\; \mathrm{Fix}(\Delta_t).
$$

#### The Two Poles {#restriction-extension-dyad-poles}

**Restriction-stable propositions** ($\mathrm{Fix}(\sigma_t)$, §restriction): an element
$a \in H_t$ is restriction-stable when it is already as large as its image under every
outgoing restriction map $H(f) : H_t \to H_{t_0}$ (for $t_0 < t$) forces it to be.
No larger element has the same restriction profile. The restriction maps to shorter
histories fully determine $a$.

**Extension-stable propositions** ($\mathrm{Fix}(\Delta_t)$, §extension): an element
$a \in H_t$ is extension-stable when it is already the smallest element present in
every one-step extension — already in the image of every restriction map
$H(i_{s,t}) : H_{t \star \mathrm{gen}(s)} \to H_t$ from longer fibers. The incoming
images from all one-step extensions fully determine $a$.

#### The Dyad Is Derived, Not Axiomatic {#restriction-extension-dyad-derived}

The restriction–extension dyad is not an axiom. It is the structure the fiber nuclear
square produces: given $\sigma_t$ and $\Delta_t$ as commuting nuclei on $H_t$, the
two fixed-point sub-algebras arise automatically. The dyad is the internal name for
what the saturation–transfer dyad (§saturation-transfer-dyad) looks like when read
through the lens of restriction maps and extension morphisms — the same structure,
named from the perspective of the history category $T$ rather than from the perspective
of the nuclei.
