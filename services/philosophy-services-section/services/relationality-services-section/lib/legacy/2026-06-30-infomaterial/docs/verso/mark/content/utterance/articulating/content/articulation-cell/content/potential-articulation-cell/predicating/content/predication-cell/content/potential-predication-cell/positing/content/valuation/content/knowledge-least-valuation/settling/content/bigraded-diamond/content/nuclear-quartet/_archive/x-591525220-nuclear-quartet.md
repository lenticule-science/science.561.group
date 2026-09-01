---

title: "Nuclear Quartet"
description: "The four canonical sub-algebras of a Heyting algebra determined by two commuting nuclei — the free carrier, two individual fixed-point algebras, and the joint fixed point — forming an exhaustive commuting square of inclusions."
date-created: 2026-04-05
requires:
  - nucleus
  - nuclear-dyad
  - heyting-algebra
  - commutativity
---

The **nuclear quartet** is the set of four canonical sub-algebras determined by two commuting [nuclei](./nucleus.md) $j_1, j_2$ on a [Heyting algebra](../../logic/objects/heyting-algebra.md) $A$. When $j_1 \circ j_2 = j_2 \circ j_1$, the composite $\pi := j_1 \circ j_2$ is itself a nucleus, and the four sub-algebras are:

$$
\bigl(\,A,\;\; \mathrm{Fix}(j_1),\;\; \mathrm{Fix}(j_2),\;\; A^*\,\bigr)
$$

where $A^* = \mathrm{Fix}(\pi) = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.

## The four corners

| Sub-algebra | Status | Description |
|-------------|--------|-------------|
| $A$ | Free carrier | Neither nucleus has acted — the full Heyting algebra |
| $\mathrm{Fix}(j_1)$ | $j_1$-stable | All $j_1$-closure has been applied; $j_2$ may still have work |
| $\mathrm{Fix}(j_2)$ | $j_2$-stable | All $j_2$-closure has been applied; $j_1$ may still have work |
| $A^*$ | Doubly stable | Both nuclei act as identity — nothing left to close |

Each inclusion is strict when the algebra is non-trivial: $A^* \subsetneq \mathrm{Fix}(j_1) \subsetneq A$ and $A^* \subsetneq \mathrm{Fix}(j_2) \subsetneq A$ in general.

## Why exactly four

The four sub-algebras exhaust all canonical options: apply neither nucleus ($A$), apply $j_1$ alone ($\mathrm{Fix}(j_1)$), apply $j_2$ alone ($\mathrm{Fix}(j_2)$), apply both ($A^*$). There is no fifth option. The quartet is exhaustive.

## Why commutativity is the hinge

Without [commutativity](teaching/explanations/commutativity.md), $\pi = j_1 \circ j_2$ is not a nucleus — it may fail [idempotence](teaching/explanations/idempotence.md) or meet-preservation. The intersection $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ exists as a set but lacks the reflection property that makes it a canonical sub-algebra. Commutativity promotes the intersection from an ad hoc set to the fixed-point set of a nucleus. This is the content of the Nuclear Quartet Theorem: given two commuting nuclei, the composite is automatically a nucleus, and $\mathrm{Fix}(\pi) = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.

## The commuting square

The four corners form a commuting square of inclusions and nucleus maps:

$$
\begin{array}{ccc}
A & \xrightarrow{j_1} & \mathrm{Fix}(j_1) \\
j_2 \downarrow & & \downarrow j_2|_{\mathrm{Fix}(j_1)} \\
\mathrm{Fix}(j_2) & \xrightarrow{j_1|_{\mathrm{Fix}(j_2)}} & A^*
\end{array}
$$

Two paths from $A$ to $A^*$: the top-right path $A \xrightarrow{j_1} \mathrm{Fix}(j_1) \xrightarrow{j_2|} A^*$ and the left-bottom path $A \xrightarrow{j_2} \mathrm{Fix}(j_2) \xrightarrow{j_1|} A^*$. Both equal $\pi = j_1 \circ j_2 = j_2 \circ j_1$: commutativity is exactly the statement that the two paths agree.
