---
id: nuclear-language
description: "A Heyting-modal propositional calculus with two KZ nuclear operators whose equational theory encodes a commutative nuclear square — the abstract pattern shared by FiberNuclearLanguage, TowerNuclearLanguage, and HyperversalNuclearLanguage."
defines: NuclearLanguage
---

### Definition — Nuclear Language {#nuclear-language}

A **nuclear language** is a Heyting-modal propositional calculus with:

- a single propositional type $\mathsf{Prop}$;
- the standard Heyting connectives $\wedge, \vee, \Rightarrow, \mathsf{True}, \mathsf{False}$;
- two modal operators $\mathsf{Saturate}(-)$ and $\mathsf{Transfer}(-)$ at type
  $\mathsf{Prop} \to \mathsf{Prop}$;

subject to the **nucleus axioms** for each operator:

| Axiom | Saturate form | Transfer form |
|---|---|---|
| Extensive | $M \leq \mathsf{Saturate}(M)$ | $M \leq \mathsf{Transfer}(M)$ |
| Idempotent | $\mathsf{Saturate}(\mathsf{Saturate}(M)) = \mathsf{Saturate}(M)$ | $\mathsf{Transfer}(\mathsf{Transfer}(M)) = \mathsf{Transfer}(M)$ |
| Meet-preserving | $\mathsf{Saturate}(M \wedge N) = \mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)$ | $\mathsf{Transfer}(M \wedge N) = \mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)$ |
| Top-preserving | $\mathsf{Saturate}(\mathsf{True}) = \mathsf{True}$ | $\mathsf{Transfer}(\mathsf{True}) = \mathsf{True}$ |

and the **commutativity axiom**:
$$
\mathsf{Saturate}(\mathsf{Transfer}(M)) \;=\; \mathsf{Transfer}(\mathsf{Saturate}(M)).
$$

#### What Makes a Language Nuclear {#nuclear-language-what}

The nucleus axioms make each operator a KZ (lax idempotent) monad on the propositions:
each operator inflates propositions, is idempotent, and distributes over meets. Together,
the two operators realize a [commutative nuclear square](commutative-nuclear-square.md)
at the syntactic level: they play the role of two commuting nuclei $j_1, j_2$ on the
algebra of propositions, and the [nuclear quartet termset](nuclear-quartet-termset.md)
of any proposition $M$ — the set $\{M,\ \mathsf{Saturate}(M),\ \mathsf{Transfer}(M),\
\mathsf{Saturate}(\mathsf{Transfer}(M))\}$ — is the language-level instance of the
[nuclear quartet subalgebra](nuclear-quartet-subalgebra.md).

The commutativity axiom is what makes this a *nuclear* language rather than merely a
bimodal language: without it the two operators cannot be made to cohere into a
well-structured quartet.

#### Instances {#nuclear-language-instances}

Three nuclear languages appear in this theory:

| Language | Level | Interpreting algebra | Strong normalization |
|---|---|---|---|
| [FiberNuclearLanguage](fiber-nuclear-language.md) | 0 | $H_t$ at each history $t$ | Holds (R1–R19$'$) |
| [TowerNuclearLanguage](tower-nuclear-language.md) | $n$ | $H_t^{(n)}$ at each level-$n$ history | Holds at each level |
| [HyperversalNuclearLanguage](hyperversal-nuclear-language.md) | $\mathcal{H}$ (colimit) | $\mathcal{H}$ | Fails |

Each instance shares the same abstract nuclear language structure — nucleus axioms and
commutativity — but differs in which algebra interprets $\mathsf{Prop}$ and whether the
reduction system is strongly normalizing.

#### What a Nuclear Language Is Not {#nuclear-language-not}

A nuclear language is not a general-purpose $\lambda$-calculus. It has no function types,
no product types, no dependent types. It is strictly propositional: the only type is
$\mathsf{Prop}$, and the term formers are the Heyting connectives and the two nuclear
operators.

It is also not a general bimodal logic. The nucleus axioms are stronger than the standard
modal axioms: idempotency ($\mathsf{Saturate}(\mathsf{Saturate}(M)) = \mathsf{Saturate}(M)$)
and meet-preservation are not axioms of standard modal logic. A nuclear language is
specifically the internal language of a [commutative nuclear square](commutative-nuclear-square.md)
on a Heyting algebra.
