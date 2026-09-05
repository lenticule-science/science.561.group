---
id: nuclear-quartet-theorem
name: NuclearQuartetTheorem
description: "Nuclear Quartet Theorem"
---

### Theorem — Nuclear Quartet Theorem {#nuclear-quartet-theorem}

**Statement.** Let $j_1, j_2$ be commuting nuclei on a Heyting algebra $A$
(i.e., $j_1 \circ j_2 = j_2 \circ j_1$). Then:

1. The composite $\pi := j_1 \circ j_2$ is a nucleus on $A$.
2. $\mathrm{Fix}(\pi) = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.
3. The quadruple $(A,\, \mathrm{Fix}(j_1),\, \mathrm{Fix}(j_2),\, \mathrm{Fix}(\pi))$
   is the complete list of canonical sub-algebras determined by $j_1$ and $j_2$, forming a
   commuting square of inclusions.

*Proof.* Extensivity of $\pi$: $a \leq j_2(a) \leq j_1(j_2(a)) = \pi(a)$. Meet-preservation:
$\pi(a \wedge b) = j_1(j_2(a \wedge b)) = j_1(j_2(a) \wedge j_2(b)) = j_1(j_2(a)) \wedge
j_1(j_2(b)) = \pi(a) \wedge \pi(b)$.

Idempotency is where commutativity is essential:
$$
\pi(\pi(a)) \;=\; j_1(j_2(j_1(j_2(a)))) \;=\; j_1(j_1(j_2(j_2(a)))) \;=\; j_1^2(j_2^2(a))
\;=\; j_1(j_2(a)) \;=\; \pi(a).
$$
The second equality uses $j_2 \circ j_1 = j_1 \circ j_2$ to swap the inner $j_2 j_1$.
Without commutativity, this swap fails and $\pi$ need not be idempotent.

For (2): if $j_1(a) = a$ and $j_2(a) = a$ then $\pi(a) = j_1(j_2(a)) = j_1(a) = a$.
Conversely, if $\pi(a) = a$: since $j_2$ is extensive $j_2(a) \geq a$, and since $j_1$
is extensive $j_1(j_2(a)) \geq j_2(a) \geq a$; but $j_1(j_2(a)) = a$, so all three are
equal and $j_2(a) = a$; then $j_1(a) = j_1(j_2(a)) = \pi(a) = a$. $\square$

---

#### The Nuclear Quartet is a Theorem {#nuclear-quartet-theorem-consequence}

The nuclear quartet ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)) is not a framework imposed on the construction —
it is the automatic, canonical output of any Heyting algebra equipped with two commuting
nuclei. The fiber doctrine (§fiber-doctrine) stipulates that $\sigma_t$ and
$\Delta_t$ commute; the nuclear quartet at each fiber follows as a theorem consequence.

**Why exactly four.** The four sub-algebras are all the canonical ones determinable from
$j_1$ and $j_2$: apply neither ($A$), apply $j_1$ alone ($\mathrm{Fix}(j_1)$), apply
$j_2$ alone ($\mathrm{Fix}(j_2)$), apply both ($\mathrm{Fix}(\pi)$). There is no fifth
option. The quartet is exhaustive.

**Why commutativity is the hinge.** Without commutativity, $\pi = j_1 \circ j_2$ is not
a nucleus and $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ is not canonically defined by a
single operator. The intersection exists as a set but lacks the reflection property that
makes it a canonical sub-algebra. Commutativity is exactly what promotes the intersection
from an ad hoc set to the fixed-point set of a nucleus.
