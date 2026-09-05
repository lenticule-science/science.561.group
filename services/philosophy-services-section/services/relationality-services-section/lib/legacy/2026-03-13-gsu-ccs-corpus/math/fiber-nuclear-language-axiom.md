---
id: fiber-nuclear-language-axiom
description: "The axiom that at each history t the fiber nuclear language is interpreted in the proposition fiber H_t — terms denote propositions and Saturate and Transfer realize the saturation and transfer nuclei."
---

### Axiom — Fiber Nuclear Language Interpretation {#fiber-nuclear-language-axiom}

For each history $t \in \mathrm{Ob}(T)$, the [fiber nuclear language](fiber-nuclear-language.md)
FiberNuclearLanguage is interpreted in the fiber $H_t$. What this axiom asserts is that such
an interpretation exists and is compatible with the presheaf structure of $H$.

#### Types and Judgments {#fiber-nuclear-language-axiom-types}

FiberNuclearLanguage has a single type: $\mathsf{Prop}$, interpreted in $H_t$.
There are no function types or product types; function-type notation used elsewhere
in this paper is metalinguistic (morphisms of sets or algebras in the meta-language),
not FiberNuclearLanguage terms.

Typing judgments have the form
$$
x_1 : \mathsf{Prop}, \ldots, x_n : \mathsf{Prop} \;\vdash_t\; M : \mathsf{Prop},
$$
where the context lists propositional variables and $M$ is a Heyting-nuclear formula.
Closed judgments (empty context) are written $\vdash_t M : \mathsf{Prop}$. The
interpretation of an open judgment at $t$ is a function $H_t^n \to H_t$; of a closed
judgment, an element of $H_t$.

#### Interpretation {#fiber-nuclear-language-axiom-interpretation}

For each closed judgment $\vdash_t M : \mathsf{Prop}$ there is an interpretation
$$
\llbracket M \rrbracket_t \in H_t
$$
defined inductively: propositional variables map to their assigned elements of $H_t$;
the connectives $\wedge, \vee, \Rightarrow_t, \top, \bot$ map to the Heyting algebra
operations; $\mathsf{Saturate}(M)$ maps to $\sigma_t(\llbracket M \rrbracket_t)$; and
$\mathsf{Transfer}(M)$ maps to $\Delta_t(\llbracket M \rrbracket_t)$.

At the global level, a closed term $\vdash M : \mathsf{Prop}$ gives a natural family
of elements $\llbracket M \rrbracket_t \in H_t$ that assembles (via
[universe-soundness](universe-soundness.md)) to a global section
$\llbracket M \rrbracket \in \Gamma(H)$.

#### Term Formers {#fiber-nuclear-language-axiom-term-formers}

At type $\mathsf{Prop}$, FiberNuclearLanguage has term constructors:

- binary: $M \wedge N$, $M \vee N$, $M \Rightarrow_t N$,
- constants: $\mathsf{True}$, $\mathsf{False}$,
- nuclear: $\mathsf{Saturate}(M)$, $\mathsf{Transfer}(M)$,

whose semantics at history $t$ are $\wedge_t, \vee_t, \Rightarrow_t, \top_t, \bot_t,
\sigma_t, \Delta_t$ respectively. The nuclear operators are defined in
[fiber-nuclear-language](fiber-nuclear-language.md).

#### Reindexing and Functoriality {#fiber-nuclear-language-axiom-reindexing}

For every morphism $f : t \to t'$ in $T$, reindexing of terms along $f$ corresponds
to applying the reindexing map $H(f)$ to their semantics; for all constructors listed
above, reindexing commutes with interpretation. This makes FiberNuclearLanguage compatible
with the presheaf structure of $H$ (see [reindexing](reindexing.md)).

#### Remark — First Encounter {#fiber-nuclear-language-axiom-first-encounter}

The fiber nuclear language FiberNuclearLanguage is the first instance of the
[tower nuclear language](tower-nuclear-language.md) family, one per level of the
hyperverse tower. The subscript "0" marks it as the level-zero nuclear language:
propositions about histories in the base relational universe $R$. At each higher tower
level $n$, there is an analogous level-$n$ nuclear language
whose base type is a universe rather than a proposition. The colimit of this family is
[HyperversalNuclearLanguage](hyperversal-nuclear-language.md).
This family structure is not yet in scope — it becomes apparent only once the hyperverse
tower is constructed. Here we are simply at level zero.
