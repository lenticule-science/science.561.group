---
type: definition
class: type-former
status: current
depends-on: [inductive-type, pi-type]
symbol: \mathrm{Id}_A(a, b)
---

# Identity type

The **identity type** $\mathrm{Id}_A(a, b)$ (also written $a =_A b$) is the type of *proofs of equality* between two terms $a, b$ of type $A$. It is the simplest nontrivial dependent [inductive-type](inductive-type.md): one constructor $\mathrm{refl}_a : \mathrm{Id}_A(a, a)$ generates everything.

## Structure

- **Formation.** From $\Gamma \vdash A : \mathrm{Type}$ and $\Gamma \vdash a, b : A$, form $\Gamma \vdash \mathrm{Id}_A(a, b) : \mathrm{Type}$.
- **Introduction.** $\Gamma \vdash a : A \;\Rightarrow\; \Gamma \vdash \mathrm{refl}_a : \mathrm{Id}_A(a, a)$.
- **Elimination** (path induction, J). To define a function on $\mathrm{Id}_A(a, b)$ for arbitrary $a, b$, it suffices to define it on $\mathrm{refl}_a$ for arbitrary $a$.

The identity type is *intensional* in MLTT: distinct proofs of the same equation are themselves distinguishable terms. *Extensional* type theories collapse this by adding a reflection rule.

## What this is not

The identity type is *not* judgmental equality $\equiv$ — the latter is a meta-level equality of terms (decidable by the type checker), the former is an internal type whose inhabitation expresses the equality as a proposition. The identity type is *not* trivial in [homotopy type theory](../theorems/univalence-axiom.md): in HoTT, $\mathrm{Id}_A(a, b)$ has higher structure (proofs of equality have proofs of equality), and the [univalence-axiom](../theorems/univalence-axiom.md) gives this structure its full meaning.

## Position

The identity type is the type-theoretic answer to *what is an equality*. It is what makes [dependent-type-theory](dependent-type-theory.md) able to state and prove theorems whose conclusions are equations between terms. The choice of how to treat it is the central design decision of any concrete dependent type theory — see [questions/cubical-vs-book-hott](questions/cubical-vs-book-hott.md). Reference: [Martin-Löf 1984](references/martin-lof1984.md), [Univalent Foundations Program 2013](references/univalent-foundations2013.md) §1.12.
