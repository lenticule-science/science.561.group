---

introduces: function
description: "Combines two boolean-element channels at the same subject into their conjunction. Realizes Boolean ∧ via the fusion morphism (⊙ on the {t, f} substructure of the bilattice)."
defines: boolean-and
realizes: meet
operates-on: boolean-element
returns-to: boolean-element
arity: 2
references: ../terms/boolean-algebra.md
fusion-left: boolean-element
fusion-right: boolean-element
fusion-target: boolean-element
date-created: 2026-04-11
type: term

---

`boolean-and` combines two [boolean-element](../terms/boolean-algebra.md) channels that share a subject into their conjunction. It is the operative realization of $\wedge$ on the [boolean algebra](../terms/boolean-algebra.md) defined in `terms/`.

## Operation

When two distinct boolean-element channels arrive at the same subject — for example, `(today, boolean-element, ⟨today, rain, true⟩)` and `(today, boolean-element, ⟨today, snow, true⟩)` — the fusion morphism declared by this function pairs them and derives a third boolean-element channel at the same subject. The new channel's structured object encodes the unordered pair of source SPOs; its value is $\odot$ applied to the source values.

## Why fusion

By Theorem 1 of [the adjoint structure of predication paper](../../documents/articles/teaching-articles/explanations/from-lattices-to-residuated-lattices.md), $\odot$ on the bilattice $\mathbf{2} \otimes \mathbf{2}$ is the Lambek product on the twist construction. Restricted to the $\{t, f\}$ subset of values, $\odot$ realizes classical conjunction:

$$
\begin{array}{c|cc}
\odot & t & f \\ \hline
t & t & f \\
f & f & f
\end{array}
$$

This is the truth table of Boolean AND. Composition ($\wedge_k$) does not match: $\wedge_k(t, f) = \bot$ rather than $f$, because composition computes knowledge meet rather than truth meet. Fusion is the correct morphism class for Boolean conjunction; this function declares it.

## Output structure

The derived claim has subject $X$ (the shared subject of the inputs), predicate `boolean-element` (the same fiber as the inputs), and a structured-pair object encoding both source SPOs sorted canonically. The value is $\odot$ of the source values.

The structured object preserves contribution: a downstream query that reads this claim's object can drill into either source channel and recover the prior derivation, recursively, all the way back to the original message claims. The HOW of the AND is the structure of the object slot.
