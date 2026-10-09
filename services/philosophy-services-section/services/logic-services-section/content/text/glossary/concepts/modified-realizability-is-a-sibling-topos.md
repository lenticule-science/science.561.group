---
type: claim
status: proved
depends-on:
  - ../code/structures/eff.md
see-also:
  - ../questions/what-are-the-subtheories-of-computing.md
  - complexity-excludes-from-subtopos-lattice.md
  - arithmetical-hierarchy-excludes-from-subtopos-lattice.md
references:
  - Kreisel 1959
  - van Oosten 2002
  - Lee-van Oosten 2012
  - Hyland-Johnstone-Pitts 1980
title: Modified realizability is a sibling topos, not a subtopos
description: Modified realizability (Kreisel 1959) does not produce a subtopos of $\mathbf{Eff}$; it is a sibling topos arising from a distinct tripos over $\mathbf{Set}$.
---

# Modified realizability is a sibling topos, not a subtopos

## Statement

Modified realizability (Kreisel 1959) does not produce a subtopos of $\mathbf{Eff}$; it is a sibling topos arising from a distinct tripos over $\mathbf{Set}$. No Lawvere-Tierney nucleus on $\Omega_{\mathbf{Eff}}$ captures the modified realizability predicate structure.

## Proof

A Lawvere-Tierney nucleus $j: \Omega_{\mathbf{Eff}} \to \Omega_{\mathbf{Eff}}$ is a *closure operator* on the internal Heyting algebra $\Omega_{\mathbf{Eff}}$. It acts by closing each r.e. proposition $P$ upward to a "larger" one $j(P) \supseteq P$, satisfying:

- Idempotency: $j \circ j = j$
- Monotonicity: $j \geq \mathrm{id}$ (so $P \leq j(P)$)
- Meet-preservation: $j(P \wedge Q) = j(P) \wedge j(Q)$

Crucially, a nucleus operates *within the fixed Heyting structure* of $\Omega_{\mathbf{Eff}}$: the connectives $\Rightarrow$, $\forall$, $\wedge$, $\vee$ retain their standard realizability definitions (partial-function realizers for implication: a realizer for $P \Rightarrow Q$ is a partial recursive function mapping any realizer of $P$ to a realizer of $Q$). The nucleus only adjusts which propositions are "closed," not how the propositional connectives are defined.

Modified realizability changes the realizability clause for implication and universal quantification: in modified realizability, a realizer for $P \Rightarrow Q$ must be a *total* recursive function (not merely partial). This is not a closure of the standard implication within $\Omega_{\mathbf{Eff}}$. It is a redefinition of what counts as a realizer for $\Rightarrow$ before any closure is applied — it changes the *tripos*, not the nucleus on a fixed tripos.

A tripos (Hyland-Johnstone-Pitts 1980) is a Heyting-algebra-valued predicate structure over $\mathbf{Set}$ from which a topos is constructed by the tripos-to-topos exact completion. Standard realizability and modified realizability use the same base set $\omega$ but define the realizability relation for $\Rightarrow$ differently, producing two distinct triposes. Two distinct triposes generate two distinct toposes via the exact completion. The two toposes are related by a geometric morphism (the inclusion of total-function realizers into partial-function realizers gives a morphism of triposes, hence a geometric morphism of toposes), but neither is a subtopos of the other: for a subtopos, the geometric morphism must have a full faithful direct image, which requires that the larger topos's logic is derivable from the smaller's — but modified realizability validates Markov's principle and Independence of Premises, which standard realizability does not.

The Lee-van Oosten (2012) classification studies *nuclei on $\Omega_{\mathbf{Eff}}$* — actual closure operators on the fixed standard realizability Heyting algebra. Modified realizability does not appear in this classification because it is not a nucleus; it is a different starting point.

## Significance

This closes off the entire class of alternative realizability notions (modified, Lifschitz, q-realizability, ...) as candidates for intermediate subtoposes of $\mathbf{Eff}$. All such alternatives change the tripos; none produce a subtopos via a nucleus on the existing $\Omega_{\mathbf{Eff}}$.

Combined with the complexity exclusion and the arithmetical hierarchy exclusion, the candidate space for named intermediate subtoposes (nuclei strictly between $\mathrm{id}$ and $\neg\neg$) is now sharply bounded: complexity theory is excluded by Cartesian axioms; oracle computation is excluded because it extends rather than restricts; alternative realizability notions are excluded as tripos-changes. Whatever named computability-theoretic fragments appear as nuclei of $\mathbf{Eff}$ between $\mathrm{id}$ and $\neg\neg$ — if any do — are not among the standard alternative realizability notions.
