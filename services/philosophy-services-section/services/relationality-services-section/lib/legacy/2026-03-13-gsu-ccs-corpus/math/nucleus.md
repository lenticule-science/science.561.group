---
id: nucleus
name: Nucleus
description: "A nucleus on a Heyting algebra is an extensive, idempotent, meet-preserving endomorphism; its fixed points form a sub-Heyting-algebra."
defines: Nucleus
---

### Definition — The Nucleus {#nucleus}

A **nucleus** on a Heyting algebra $A$ is a map $j : A \to A$ satisfying:

1. **Extensivity:** $a \leq j(a)$ for all $a \in A$.
2. **Idempotence:** $j(j(a)) = j(a)$ for all $a \in A$.
3. **Meet-preservation:** $j(a \wedge b) = j(a) \wedge j(b)$ for all $a, b \in A$.

These three conditions together make $j$ a **lax idempotent monad** (KZ monad) on the poset $A$.

#### The Fixed-Point Sub-Algebra {#nucleus-fixed-points}

The **fixed-point set** of a nucleus $j$ is
$$
\mathrm{Fix}(j) \;:=\; \{a \in A : j(a) = a\}.
$$

$\mathrm{Fix}(j)$ is a sub-Heyting-algebra of $A$: it is closed under $\wedge$, $\vee$, $\Rightarrow$, $\bot$, and $\top$. The inclusion $\mathrm{Fix}(j) \hookrightarrow A$ has a left adjoint given by $j$ itself — $j$ is the reflection of $A$ onto $\mathrm{Fix}(j)$.

#### Why Not a General Endomorphism {#nucleus-why}

The three conditions are not arbitrary. Extensivity means $j$ can only move propositions upward — it closes them, never weakens them. Idempotence means applying $j$ twice gives nothing new — one closure is enough. Meet-preservation means $j$ respects the logical structure: it commutes with conjunction.

Together they characterize exactly the maps that arise as **closure operators** in lattice theory and as **sheafification operators** in topos theory. In the Relational Universe, the two nuclei $\sigma_t$ and $\Delta_t$ on each fiber $H_t$ are nuclei in this precise sense; their definitions are given in §saturation-transfer-dyad.

#### Commutativity {#nucleus-commutativity}

Two nuclei $j_1, j_2$ on the same algebra $A$ **commute** if $j_1 \circ j_2 = j_2 \circ j_1$.
When two nuclei commute, their composite is again a nucleus and their joint fixed-point set
$\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ equals the fixed-point set of the composite.
The full theorem — including why commutativity is the exact hinge condition — is in
§nuclear-quartet-theorem.
