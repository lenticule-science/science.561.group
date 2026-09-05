---
name: tower-nuclear-language

description: "The family of nuclear languages at each finite level of the hyperverse tower, one per level, each a nuclear language of the level-n fiber algebras; strong normalization holds at every finite level."
---

### Construction — Tower Nuclear Language {#tower-nuclear-language}

The **tower nuclear language** family is the sequence of [nuclear languages](nuclear-language.md)
$$
\text{level-}0,\quad \text{level-}1,\quad \text{level-}2,\quad \ldots
$$
one at each finite level of the [hyperverse tower](hyperverse-tower.md)
$R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow R^{(2)} \hookrightarrow \cdots$.

The level-zero instance is [FiberNuclearLanguage](fiber-nuclear-language.md). Each higher level-$n$ nuclear language
is the nuclear language of the fiber algebras of $R^{(n)}$.

#### Level-$n$ Nuclear Language {#tower-nuclear-language-level-n}

At each level $n \geq 0$, the relational universe $R^{(n)} = \mathbf{Sh}(T^{(n)}, J^{(n)})$
carries fiber Heyting algebras $H_t^{(n)}$ at each history $t \in T^{(n)}$, equipped
with saturation and transfer nuclei $\sigma_t^{(n)}$ and $\Delta_t^{(n)}$. The
level-$n$ nuclear language is the [nuclear language](nuclear-language.md)
of these fiber algebras:

- type $\mathsf{Prop}$ is interpreted in $H_t^{(n)}$;
- Saturate and Transfer realize $\sigma_t^{(n)}$ and $\Delta_t^{(n)}$;
- the nucleus axioms and commutativity hold at each level by the fiber doctrine
  conditions on $R^{(n)}$.

Each level-$n$ nuclear language is a distinct nuclear language — its equational theory
includes the full fiber equation system of $R^{(n)}$, which grows with $n$ as the
tower adds richer history structure. The commutativity theorem
(see [fiber-nuclear-language-commutativity](fiber-nuclear-language-commutativity.md))
must be verified separately at each level, or by a general argument covering the whole
tower.

#### Strong Normalization at Finite Levels {#tower-nuclear-language-sn}

The reduction system R1–R19$'$ (see [reduction-system](reduction-system.md)) is defined
for the type structure of any nuclear language. At each finite level $n$, the system is
confluent and strongly normalizing: the termination measure
(see [nuclear-reduction-measure](nuclear-reduction-measure.md)) is level-independent —
it depends only on the term structure, not on the fiber equations of $R^{(n)}$.

Strong normalization fails at the colimit
[HyperversalNuclearLanguage](hyperversal-nuclear-language.md): the colimit
$\mathcal{H} = \varinjlim_n R^{(n)}$ is not a finite level, and the
measure-based argument does not extend to it.

#### The Colimit {#tower-nuclear-language-colimit}

The colimit of the tower nuclear language family is
[HyperversalNuclearLanguage](hyperversal-nuclear-language.md).
It is the nuclear language of $\mathcal{H}$ itself, with type $\mathsf{Univ}$
interpreted in the hyperverse algebra. The colimit is not a finite level of the tower;
it is a separate unit.
