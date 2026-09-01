---
type: theorem
status: draft
depends-on: [refactor-as-invisible-automorphism, invisible-automorphism-subgroup]
---

# Refactorings closed under composition

A direct corollary of [refactor-as-invisible-automorphism](refactor-as-invisible-automorphism.md): the composition of two refactorings under the same witness language $W$ is again a refactoring under $W$.

## Statement

For any codebase settling $v^{\mathrm{code}}$ and witness language $W$, the set of refactorings under $W$ — equivalently, the subgroup $N_W(v^{\mathrm{code}}) \trianglelefteq \mathrm{Aut}^\simeq(v^{\mathrm{code}})$ — is closed under the group operation.

**Theorem.** *Let $\phi_1, \phi_2 \in N_W(v^{\mathrm{code}})$. Then $\phi_2 \circ \phi_1 \in N_W(v^{\mathrm{code}})$. Moreover, if $\phi \in N_W(v^{\mathrm{code}})$, then $\phi^{-1} \in N_W(v^{\mathrm{code}})$.*

## Sketch

$N_W(v^{\mathrm{code}})$ is, by [refactor-as-invisible-automorphism](refactor-as-invisible-automorphism.md), the kernel of a group homomorphism $\mathrm{Aut}^\simeq(v^{\mathrm{code}}) \to \mathrm{Aut}(\mathcal{F}^{\mathrm{code}}_W)$. Kernels of group homomorphisms are subgroups. $\square$

## What this proves about disciplinary practice

**(a) Refactorings compose without losing structure-preservation.** A sequence of refactorings under $W$ is a refactoring under $W$, regardless of length. This formally justifies the practice of long refactoring sequences (Kerievsky, Mens & Tourwé): no length-bound is imposed by the substrate algebra.

**(b) Refactorings are reversible.** Every refactoring has an inverse refactoring. Rename has rename-back; extract has inline; move has move-back. This is the substrate-algebraic content of the disciplinary intuition that "you can always undo a refactoring."

**(c) Refactorings form a group, not a monoid.** The fact that the operation is group-valued, not just monoid-valued, is what makes catalog-based reasoning sound: a partial sequence can be reasoned about by its inverses, and equivalences between catalog operations (e.g., extract-then-inline = identity) are group identities.

## Caveat — same $W$

The theorem is parameterized by a fixed $W$. If the witness language *changes* during a refactoring sequence — e.g., new tests are added between steps — the steps before and after are refactorings under different $W$, and the composition crosses witness-language boundaries. The composition is then in $N_{W_{\mathrm{old}}} \cap N_{W_{\mathrm{new}}}$, which may be smaller than either.

This is the substrate-algebraic content of the disciplinary practice of *not changing witnesses mid-refactor*: maintaining a fixed $W$ across the sequence is required for the closure-under-composition guarantee to hold.

## Where used

- [refactor-graph](teaching/explanations/refactor-graph.md) — composition is the multiplication in the Cayley graph.
- [composing-refactorings-safely](../../../../../../../software-engineering/theories/software-development/theories/software-refactoring/questions/composing-refactorings-safely.md) — the answer to that question, modulo the witness-language caveat.
