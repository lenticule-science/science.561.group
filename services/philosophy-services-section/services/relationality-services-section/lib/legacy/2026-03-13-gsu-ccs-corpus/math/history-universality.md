---
id: history-universality
name: HistoryUniversality
description: "The free history monoid M(Σ,I) is the initial history system over (Σ,I): corollaries and structural remarks on the universal property proved in §history-monoid."

---

### Theorem — Free Generation and the Universal Property of the History Category {#history-universality}

The universal property of $\mathbb{M}(\Sigma, I)$ as the initial abstract history system over
$(\Sigma, I)$ is stated and proved in §history-monoid. This unit records the corollaries and
structural remarks that follow from that universal property.

#### Corollary — Prefix Order from the Monoid Structure {#cor-prefix-order}

For any unit-free left-cancellative monoid $(M, \star, e)$, the **prefix relation** $m \leq m'$
defined by $\exists u : m' = m \star u$ is a partial order on $M$, making it a thin category
$T_M$ with $\hom_{T_M}(m, m') = \{*\}$ iff $m \leq m'$ else $\emptyset$.

*Proof.* Reflexivity: $m \star e = m$. Antisymmetry: if $m \leq m'$ and $m' \leq m$ then
$m' = m \star u$ and $m = m' \star v$, giving $m = m \star u \star v$; cancellation forces
$u \star v = e$, and the unit-free condition gives $u = v = e$, hence $m = m'$.
Transitivity: immediate from concatenation.

$\mathbb{M}(\Sigma, I)$ is left-cancellative (it is a quotient of the free monoid, which is
cancellative, by a congruence that preserves cancellation) and unit-free. The prefix order of
§history is exactly the prefix relation of this corollary. $\square$

Every abstract history system therefore gives a thin monoidal category $T_M$ on which the full
sheaf-theoretic construction of the relational universe can be carried out.

#### Corollary — Examples as Truncated Free Monoids {#cor-examples-as-free}

Each history category used in the examples is a **truncation** of a free history monoid. For instance, a one-step monoid of depth $\leq 1$ is $\mathbb{M}(\{a\}, \emptyset)_{\leq 1}$; a two-step fully-commuting monoid of depth $\leq 3$ is $\mathbb{M}(\{h,v\}, \{(h,v)\})_{\leq 3}$. Here $\mathbb{M}(\Sigma, I)_{\leq n}$ denotes the sub-poset of histories of length at most $n$,
which is itself an abstract history system (on the nose if one restricts to steps producing
only short histories). The universal property gives, for each example, a canonical morphism from
the full $\mathbb{M}(\Sigma, I)$ into the example's history structure, exhibiting the example
as the quotient that truncates depth.

#### Remark — What the Paper Uses from $\mathbb{M}(\Sigma, I)$ {#remark-what-paper-uses}

The relational universe construction $R = \mathbf{Sh}(T, J)$ requires only that $T$ is a
thin category and $J$ is a Grothendieck topology. The specific monoid structure of
$\mathbb{M}(\Sigma, I)$ enters at three distinct points:

1. **Dynamics** (§history-convolution, §directed-comonad): history convolution $\circledast$ and
   the directed comonad $G_s$ use the monoidal product $\star$ on $T$. These constructions go
   through for any abstract history system.

2. **Finiteness** (§aperiodicity): the local finiteness of extensions — finitely many
   immediate successors of any history — requires that $\Sigma$ is finite, i.e., that the monoid
   is **finitely generated**. This is the one property the abstract history system must inherit
   from $\mathbb{M}(\Sigma, I)$ to recover the aperiodicity theorem.

3. **Normal forms** (§history-normalization): the lexicographic normal form $\mathrm{NF}(w)$
   is specific to the step-sequence presentation of $\mathbb{M}(\Sigma, I)$. It is used
   only for concreteness; no sheaf-theoretic result depends on the choice of normal form.

A relational universe over any **finitely generated** abstract history system therefore satisfies
all structural and dynamic results of the paper. The step-sequence presentation is the canonical
form of the *free* finitely generated history monoid.

#### Remark — Free Generation at Three Levels {#remark-three-levels}

The same pattern — *generators with relations, free algebra, canonical normal form* — recurs
at three levels of the paper:

| Level | Generators | Relations | Free object | Normal form |
|---|---|---|---|---|
| History | Steps $\Sigma$ | Independence $I$ | $\mathbb{M}(\Sigma, I)$ | $\mathrm{NF}(w)$ |
| Formula | Propositional variables | Heyting-modal laws | FiberNuclearLanguage | Canonical $\mathsf{Prop}$-terms (§normalization) |
| Universe | Atomic shapes $y(t)$, $H$ | Axioms of §history-and-fiber-algebra–§sheaf-construction | $R_{\mathrm{syn}}$ | Semantic normalizer (§universe-normalization) |

At each level, the free object is **initial** among all models satisfying the relations: this
is the universal property of $\mathbb{M}(\Sigma, I)$ (this unit), the initiality of $R$ among
relational universe models (§initiality), and the completeness of FiberNuclearLanguage with
respect to fiber semantics (§completeness). The three initiality results are structurally
parallel; they hold at different categorical levels but are instances of the same abstract
phenomenon.
