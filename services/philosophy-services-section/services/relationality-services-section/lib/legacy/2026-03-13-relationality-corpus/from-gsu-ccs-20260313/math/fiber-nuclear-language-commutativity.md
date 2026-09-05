---
name: fiber-nuclear-language-commutativity

description: "Saturate∘Transfer = Transfer∘Saturate holds in FiberNuclearLanguage as a provable consequence of the reduction system — syntactic justification for the fiber nucleus commutation axiom, grounding a future derivation from syntactic model completeness."
---

### Theorem — Commutativity in FiberNuclearLanguage {#fiber-nuclear-language-commutativity}

This unit contains two distinct claims that must not be conflated.

#### The Syntactic Theorem {#fiber-nuclear-language-commutativity-syntactic}

**Theorem (syntactic).** In [FiberNuclearLanguage](fiber-nuclear-language.md), for every
closed term $a$, $\mathsf{Saturate}(\mathsf{Transfer}(a))$ and $\mathsf{Transfer}(\mathsf{Saturate}(a))$
reduce to the **same normal form** under R1–R19$'$ (see [reduction-system](reduction-system.md)).
That is, they are provably equal in the equational theory of FiberNuclearLanguage without
invoking any history-specific context equations and without the fiber nucleus commutation axiom
(see [fiber-nucleus-commutation-axiom](fiber-nucleus-commutation-axiom.md)).

*Proof route.* The reduction system R1–R19$'$ is confluent and strongly normalizing.
Two terms are equal in the FiberNuclearLanguage equational theory iff they share a common
reduct under R1–R19$'$. It therefore suffices to show the critical pair
$\langle\mathsf{Saturate}(\mathsf{Transfer}(a)),\, \mathsf{Transfer}(\mathsf{Saturate}(a))\rangle$
is **joinable** — a finite check against the reduction rules governing Saturate and Transfer.
This check is entirely internal to the syntactic calculus; it does not depend on the
abstract fiber doctrine.

**Status — closed.** The critical pair
$\langle\mathsf{Saturate}(\mathsf{Transfer}(a)),\,\mathsf{Transfer}(\mathsf{Saturate}(a))\rangle$
is joinable: R7 reduces $\mathsf{Saturate}(\mathsf{Transfer}(a))$ directly to
$\mathsf{Transfer}(\mathsf{Saturate}(a))$, and $\mathsf{Transfer}(\mathsf{Saturate}(a))$
is in R7-normal form. The full system R1–R19$'$ has no remaining unresolved critical
pairs (see [reduction-system](reduction-system.md), final paragraph), so the system is
confluent and the equality holds in the equational theory.

**Scope of this result.** R7 is sound given the fiber nucleus commutation axiom
(see [fiber-nucleus-commutation-axiom](fiber-nucleus-commutation-axiom.md)). The syntactic theorem confirms that
FiberNuclearLanguage-with-R7 is confluent — the rule does not create new critical pairs. It
does not show R7 derivable without the axiom; that is the non-circularity constraint on
the future completeness argument (see [#fiber-nuclear-language-commutativity-relation](#fiber-nuclear-language-commutativity-relation)).

#### The Semantic Corollary {#fiber-nuclear-language-commutativity-semantic}

**Corollary (semantic).** In the syntactic relational universe
(see [syntactic-relational-universe](syntactic-relational-universe.md)), the fiber
algebra $H_t^{\mathrm{syn}}$ at each history $t$ satisfies
$$
\sigma_t^{\mathrm{syn}}(\Delta_t^{\mathrm{syn}}(a)) \;=\; \Delta_t^{\mathrm{syn}}(\sigma_t^{\mathrm{syn}}(a))
\quad\text{for all } a \in H_t^{\mathrm{syn}},
$$
where $\sigma_t^{\mathrm{syn}} = \llbracket\mathsf{Saturate}\rrbracket_t$ and
$\Delta_t^{\mathrm{syn}} = \llbracket\mathsf{Transfer}\rrbracket_t$ are the
interpretations of the FiberNuclearLanguage operators in the syntactic model.

*Proof.* The syntactic theorem above gives
$\llbracket\mathsf{Saturate}(\mathsf{Transfer}(a))\rrbracket_t
= \llbracket\mathsf{Transfer}(\mathsf{Saturate}(a))\rrbracket_t$ in $H_t^{\mathrm{syn}}$:
the interpretation map sends equal terms to the same element, and context equations at $t$
can only identify further terms, never distinguish ones already equal in the calculus.

Note that $H_t^{\mathrm{syn}}$ is the fiber of the **syntactic relational universe**,
not an abstract fiber algebra $H_t$ satisfying the axioms in the abstract. In the
abstract theory, $H_t$ denotes any nuclear Heyting algebra satisfying the fiber
doctrine axioms; $\sigma_t$ and $\Delta_t$ are abstract operations. The corollary
addresses specifically $H_t^{\mathrm{syn}}$ — the Lindenbaum–Tarski algebra of
FiberNuclearLanguage at $t$ — and is not a statement about abstract fiber algebras in general.

#### The Tower Caveat {#fiber-nuclear-language-commutativity-tower}

The syntactic theorem addresses FiberNuclearLanguage, the level-0 nuclear language
(see [fiber-nuclear-language-axiom](fiber-nuclear-language-axiom.md)). At each higher
tower level $n$, the relevant language is the level-$n$ nuclear language
(see [tower-nuclear-language](tower-nuclear-language.md)), which carries a richer
equational theory and different reduction rules. The commutativity theorem would need
to be verified separately for each level-$n$ nuclear language, or a general argument
given that covers the whole tower. The fiber nucleus commutation axiom holds at every tower
level; this theorem currently justifies it only at level 0.

#### Relation to the Abstract Axiom {#fiber-nuclear-language-commutativity-relation}

- The **axiom** (see [fiber-nucleus-commutation-axiom](fiber-nucleus-commutation-axiom.md)) is needed immediately:
  the fiber doctrine requires it to define $\pi_t = \sigma_t \circ \Delta_t$ as a nucleus
  and to guarantee $H_t^\ast = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. It
  is imposed without derivation.

- The **theorem** (this unit) justifies the axiom: the canonical syntactic model
  satisfies commutativity as a consequence of the reduction rules, not by assumption.
  The axiom is not arbitrary — it expresses a genuine property of FiberNuclearLanguage.

- The **future derivation**: if syntactic model completeness is established —
  showing that every abstract structure satisfying the fiber axioms *without*
  commutativity embeds faithfully into FiberNuclearLanguage — then the abstract
  commutativity axiom becomes a theorem. This derivation must be non-circular:
  the completeness proof must not use commutativity anywhere. That is a
  significant open task (the non-circularity constraint of this relation section).
