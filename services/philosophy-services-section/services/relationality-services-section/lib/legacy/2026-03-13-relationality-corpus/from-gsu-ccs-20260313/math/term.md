---

name: term
description: "A term is a well-formed expression of type Prop in FiberNuclearLanguage: the syntactic material of the fiber nuclear language, denoting an element of a fiber algebra at a given history."
defines: Term
---

### Definition — Term {#term}

A **term** is a well-formed expression of type $\mathsf{Prop}$ in the fiber nuclear language
FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)), relative to a context $\Gamma$ and a history $t$.
The typing judgment is written $\Gamma \vdash_t M : \mathsf{Prop}$.

Terms are generated inductively:

1. **Variables.** If $x : \mathsf{Prop} \in \Gamma$, then $\Gamma \vdash_t x : \mathsf{Prop}$.
2. **Constants.** $\mathsf{True}$ and $\mathsf{False}$.
3. **Heyting connectives.** From $M, N : \mathsf{Prop}$: the conjunction $M \wedge N$,
   the disjunction $M \vee N$, and the Heyting implication $M \Rightarrow_t N$.
4. **Nuclear term formers.** From $M : \mathsf{Prop}$: the saturation $\mathsf{Saturate}(M)$
   and the transfer $\mathsf{Transfer}(M)$.

Two terms are **equal** if they are provably equivalent under the equational theory —
the Heyting algebra laws together with the nucleus axioms for $\mathsf{Saturate}$ and
$\mathsf{Transfer}$ (extensivity, idempotence, meet-preservation, commutativity).

#### Denotation {#term-denotation}

At each history $t$, a term $M$ denotes an element $\llbracket M \rrbracket_t \in H_t$:
$$
\llbracket \mathsf{Saturate}(M) \rrbracket_t = \sigma_t(\llbracket M \rrbracket_t),
\qquad
\llbracket \mathsf{Transfer}(M) \rrbracket_t = \Delta_t(\llbracket M \rrbracket_t),
$$
with the Heyting connectives interpreted by the corresponding operations in $H_t$.
Equal terms denote the same element: denotation factors through the equational theory.

The equivalence classes of closed terms under the equational theory at $t$ form the
**syntactic fiber** $H_t^{\mathrm{syn}}$ — the Lindenbaum–Tarski algebra at $t$.
The universal property of the syntactic relational universe (§syntactic-relational-universe)
says that the syntactic fibers $H_t^{\mathrm{syn}}$ constitute the initial model of FiberNuclearLanguage:
every other fiber algebra receives a unique interpretation map from $H_t^{\mathrm{syn}}$.

#### Canonical Terms {#term-canonical}

Every term reduces to a unique **canonical form** under the reduction system
(§reduction-system, §normalization): the normal form under the complete reduction
system R1–R19'. Canonical forms are the unique representatives of their equivalence
classes. They are not in general fixed by both nuclei — canonical form is a syntactic
condition, not a semantic stability condition.
