---
name: heyting-closure-of-movement-i
type: theorem
status: sketch
depends-on: [differentiate, includes-excludes, together-either, induces, negate]
---

The closure of Movement I — the operations forced by Differentiate together with Together, Either, Induces, and Negate — is a complete Heyting algebra on the field of recognition.

## Statement

Let $\text{Rel}$ be the totality of acts of Differentiate, equipped with the predicate `Includes : Rel × Rel -> Bool` and the binary operators $\land$ (Together), $\lor$ (Either), $\Rightarrow$ (Induces), $\neg$ (Negate), with constants $\bot$ (Relationlessness) and $\top$ (Relation = Differentiate(Relationlessness, Relationlessness)).

Then $(\text{Rel}, \text{Includes}, \land, \lor, \Rightarrow, \neg, \top, \bot)$ is a complete Heyting algebra.

## Proof sketch

The order-theoretic content:

- **Reflexivity, transitivity** of `Includes` follow from Lemma 1 of the [formal-axioms layer](../teaching/explanations/formal-axioms-layer.md).
- **Antisymmetry up to extensional equivalence** follows from the closure construction $c(A) = \{y : \exists x \in A, y = x \lor y = \neg x\}$: $\text{Fix}(c)$ is a partial order under $\subseteq$.

The lattice content:

- **$\land, \lor$** are characterized by the universal properties of meet and join in $(\text{Fix}(c), \subseteq)$.

The Heyting content:

- **$\Rightarrow$** is the residual implication characterized by the residuation law: $\text{Includes}(a \land b, c) \iff \text{Includes}(a, b \Rightarrow c)$ (Axiom 3 of the formal-axioms layer).
- **$\neg a := a \Rightarrow \bot$** is the De Morgan negation; double negation $\neg\neg$ is a closure operator (intuitionistic: $a \leq \neg\neg a$, with strict inequality possible).

The completeness:

- The closure operator $c$ is monotone, inflationary, idempotent, so $\text{Fix}(c)$ is closed under arbitrary intersections; arbitrary joins exist as $c$ of the union. Therefore $(\text{Rel}, \subseteq)$ is a complete lattice.

Distributivity follows from the residuation law (a standard order-theory result: a residuated lattice with a top element is distributive).

## Why it matters

This is the bridge from the *act-algebra* to the *standard mathematics*. Once Movement I has closed into a complete Heyting algebra, every theorem of Heyting-algebra theory transports into the relational calculus. The KZ-comonadic Flow of Movement III lives on this Heyting algebra; the cohesive quadruple of Movement IV is realized in a presheaf model over it; the conservation laws of Movement V are stated in terms of its observables.

Without this theorem, Movements II–V have no formal substrate; they are claims about an unspecified algebraic object. With it, they are claims about a complete Heyting algebra, and every downstream theorem inherits Heyting-algebra-theoretic infrastructure.

## Status

Sketch. The pieces of the argument are in the source dump (`from-sloppyresearch/.../foundations-of-relation/`), but assembling them into a single tight proof is incomplete. Promotion to $\text{status: draft}$ requires writing out the closure-construction lemma rigorously and verifying the residuation law against the constructive Differentiate semantics.
