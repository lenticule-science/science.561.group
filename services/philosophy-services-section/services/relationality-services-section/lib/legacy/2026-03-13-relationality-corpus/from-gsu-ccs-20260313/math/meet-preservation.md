---

name: meet-preservation
description: "The nucleus property $j(a \wedge b) = j(a) \wedge j(b)$: the nucleus commutes with conjunction."
---

### Definition — Meet-Preservation {#meet-preservation}

A map $j : A \to A$ on a Heyting algebra $A$ is **meet-preserving** if

$$
j(a \wedge b) = j(a) \wedge j(b) \quad \text{for all } a, b \in A.
$$

Meet-preservation means $j$ respects the logical structure of $A$: it commutes with conjunction. The inequality $j(a \wedge b) \leq j(a) \wedge j(b)$ holds automatically from monotonicity (itself derivable from the other nucleus conditions): $a \wedge b \leq a$ gives $j(a \wedge b) \leq j(a)$, and similarly for $b$. The content of meet-preservation is the reverse direction, $j(a) \wedge j(b) \leq j(a \wedge b)$: the conjunction of the closures is no larger than the closure of the conjunction.

As a consequence, $\mathrm{Fix}(j)$ is closed under $\wedge$: if $j(a) = a$ and $j(b) = b$, then $j(a \wedge b) = j(a) \wedge j(b) = a \wedge b$. This is the algebraic foundation for why the fixed-point set of a nucleus is a sub-Heyting-algebra, not merely a sub-poset.

Meet-preservation is one of the three conditions that together define a nucleus (§nucleus); the other two are extensiveness (§extensiveness) and idempotence (§idempotence).
