---

title: "Fragments and Fusion"
  - "Fragments and Fusion"
date-created: 2025-12-31
keywords:
  - mathematical-universe
teaches:
  - "Fragments and Fusion"
cites:
  - "A Lattice-Theoretical Fixpoint Theorem and Its Applications"
---

## What this lesson covers

How the [semiotic universe](../semiotic-universe.md) achieves coherence between its syntax and semantics. Fragments are finite substructures that enable local reasoning; fusion is the closure process that identifies syntactic operators agreeing on all fragments and names new operators for behaviors already present in the system. The three [closure operators](../../../../concepts/closure-operator/index.md) — semantic, syntactic, and fusion — compose into a global operator whose [least fixed point](../../../../concepts/fixed-point/index.md) defines the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe itself.

## Prerequisites

[The Semantic Domain](./semantic-ambient.md) and [Syntactic Operators](./syntax-operators.md). This lesson uses concepts from both.

---

## Fragments

A fragment is a finite piece of the semantic domain that is self-contained with respect to all the structure we care about. Formally, a subset $F \subseteq H$ is a **modal–temporal subalgebra** if it is closed under:

1. The [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations: $\wedge$, $\vee$, $\Rightarrow$, $\bot$, $\top$.
2. The modality $j$.
3. The trace $G$.

A **fragment** is a finitely generated modal–temporal subalgebra: there exists a finite set $S \subseteq F$ such that $F$ is the smallest modal–temporal subalgebra containing $S$. The set of all fragments is denoted $\mathcal{F}(H)$.

Fragments serve the same purpose that compact objects serve in algebraic theories: they allow global properties to be checked locally. If two operators agree on every fragment, they agree everywhere that matters. If an equality holds on a fragment and is preserved by all the structure's operations, it holds on every fragment reachable from the first.

## Fragment-preserving operators

An operator $f : H^n \to H$ is **fragment-preserving** if $f(F^n) \subseteq F$ for every fragment $F \in \mathcal{F}(H)$. That is, applying the operator to elements of a fragment produces elements still in that fragment. Fragment-preserving operators do not break locality — they keep finite substructures closed.

This is one of the seven conditions imposed on the interpretation of syntactic operators (condition 6 in [Syntactic Operators](./syntax-operators.md)). It is not derived from the other conditions but imposed directly: the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe requires that every syntactic operation respect the fragment structure.

## Fragmentwise equality

Two fragment-preserving operators $f, g : H^n \to H$ are **fragmentwise equal on $F$**, written $f \equiv_F g$, if they agree on all inputs from $F$:

$$
f(a_1, \ldots, a_n) = g(a_1, \ldots, a_n) \quad \text{for all } a_i \in F.
$$

A family of fragment-preserving operators is **hereditarily extensional** if fragmentwise equality propagates: whenever $f \equiv_F g$ on some fragment $F$, the equality persists on every fragment $F'$ obtained from $F$ by applying [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations, $j$, $G$, or any operator in the family. Equalities, once established locally, cannot be broken by further construction.

This hereditary extensionality condition is the seventh requirement on the interpretation (condition 7 in [Syntactic Operators](./syntax-operators.md)). It ensures that fragmentwise reasoning is stable — a local observation about operator behavior remains valid as the structure grows.

## Fusion

Fusion is the process that enforces coherence between syntax and semantics. It does two things:

**Quotienting by fragmentwise congruence.** Given a partial [semiotic](../../../../../linguistics/topics/semiotics/index.md) structure $X = (H_X, \mathrm{Op}_X)$ — a set of semantic objects and a set of syntactic operators — fusion identifies operators that agree on every fragment within $H_X$. If two syntactic operators $f$ and $g$ produce the same results on every finite substructure, they are treated as the same operator. The congruence relation $\sim_X$ formalizes this: $f \sim_X g$ when $\llbracket f \rrbracket \equiv_F \llbracket g \rrbracket$ for every fragment $F \subseteq H_X$, hereditarily.

**Naming existing behaviors.** If a function $h : H^n \to H$ is already present in the semantic domain — monotone, join-continuous, fragment-preserving, compatible with $j$ and $G$ — but has no syntactic name, fusion introduces one. A new operator [symbol](../../../../../linguistics/topics/semiotics/terms/symbol.md) $f_h$ is added with $\llbracket f_h \rrbracket = h$. This does not expand what the system can compute; it expands what the system can say. Every admissible semantic behavior gets a syntactic representative.

The fusion operator $\mathcal{S}_{\mathrm{fus}}$ leaves the semantic objects unchanged and saturates the operator set:

$$
\mathcal{S}_{\mathrm{fus}}(H_X, \mathrm{Op}_X) = (H_X, \mathrm{Op}_X^{\mathrm{fus}}).
$$

This operator is **monotone** (enlarging inputs enlarges outputs), **inflationary** ($X \leq \mathcal{S}_{\mathrm{fus}}(X)$), and **idempotent** (applying it twice gives the same result as applying it once). In other words, fusion is a [closure operator](../../../../concepts/closure-operator/index.md) on the [lattice](../../../posets/terms/lattice.md) of partial [semiotic](../../../../../linguistics/topics/semiotics/index.md) structures.

Idempotence is the key [property](../../../../../../../humanities/domains/sociology/terms/property.md). Once the operator set is fusion-saturated — all fragmentwise identifications made, all admissible behaviors named — doing it again produces nothing new. The [fixed points](../../../../concepts/fixed-point/index.md) of $\mathcal{S}_{\mathrm{fus}}$ are the **fusion-saturated structures**.

## Fusion as a reflection

Fusion is more than just a closure: it is a **reflector** into the subcategory of fusion-saturated structures. The set of all fusion-saturated structures $\mathcal{U}_{\mathrm{fus}}$ forms a reflective subcategory of the [lattice](../../../posets/terms/lattice.md) of partial [semiotic](../../../../../linguistics/topics/semiotics/index.md) structures $\mathcal{U}$, and $\mathcal{S}_{\mathrm{fus}}$ is the left adjoint to the inclusion:

$$
\mathcal{S}_{\mathrm{fus}}(X) \leq Y \quad \text{if and only if} \quad X \leq Y
$$

for every fusion-saturated $Y$. This is a standard fact about [closure operators](../../../posets/curricula/closure-operators.md) on complete [lattices](../../../posets/terms/lattice.md) [@tarski_LatticeTheoreticalFixpointTheorem_1955], but it has a specific meaning here: any partial structure can be "freely" completed to a fusion-saturated one, and the result is the smallest fusion-saturated structure containing the original.

## The three [closure operators](../../../../concepts/closure-operator/index.md)

The [semiotic universe](../index.md) is constructed by iterating three [closure operators](../../../../concepts/closure-operator/index.md) on the [lattice](../../../posets/terms/lattice.md) $\mathcal{U} = \mathcal{P}(H) \times \mathcal{P}(\mathrm{Op}^{\mathrm{def}})$ of partial [semiotic structures](../terms/semiotic-structure.md):

**Semantic closure** $\mathcal{S}_{\mathrm{sem}}$: expands the set of semantic objects. Starting from $H_X$, it closes under: the interpretations of all operators in $\mathrm{Op}_X$, all [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations, the modality $j$, the trace $G$, and the least and greatest [fixed points](../../../../concepts/fixed-point/index.md) of admissible semantic endomorphisms. The operator set stays the same.

$$
\mathcal{S}_{\mathrm{sem}}(H_X, \mathrm{Op}_X) = (H_X', \mathrm{Op}_X)
$$

**Syntactic closure** $\mathcal{S}_{\mathrm{syn}}$: expands the set of operators. Starting from $\mathrm{Op}_X$, it closes under: lambda-definability, composition, fixed-point constructs with admissible interpretations, and — critically — finitary justification. An operator $f$ is included if there exists some fragment $F \subseteq H_X$ and some existing operator $g \in \mathrm{Op}_X$ such that $\llbracket f \rrbracket \equiv_F \llbracket g \rrbracket$ hereditarily. This is the compactness condition: syntactic closure is driven by finite evidence. The semantic objects stay the same.

$$
\mathcal{S}_{\mathrm{syn}}(H_X, \mathrm{Op}_X) = (H_X, \mathrm{Op}_X')
$$

**Fusion** $\mathcal{S}_{\mathrm{fus}}$: as described above — quotients operators by fragmentwise congruence and names admissible behaviors.

The **global [semiotic](../../../../../linguistics/topics/semiotics/index.md) closure** is their composition:

$$
\mathcal{S} = \mathcal{S}_{\mathrm{fus}} \circ \mathcal{S}_{\mathrm{syn}} \circ \mathcal{S}_{\mathrm{sem}}.
$$

Each of the three is monotone and inflationary, so their composition is too. And since $\mathcal{U}$ is a complete [lattice](../../../posets/terms/lattice.md), the [Knaster–Tarski fixed-point theorem](knaster–tarski-fixed-point-theorem.md) guarantees that $\mathcal{S}$ has a [least fixed point](../../../../concepts/fixed-point/index.md) [@tarski_LatticeTheoreticalFixpointTheorem_1955].

## The [least fixed point](../../../../concepts/fixed-point/index.md)

The [semiotic universe](../index.md) is this [least fixed point](../../../../concepts/fixed-point/index.md):

$$
\mathcal{U}_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}} = X^\star = (H_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}}, \mathrm{Op}_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}}).
$$

At the [fixed point](../../../../concepts/fixed-point/index.md), every closure step has been exhausted:

- $H_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}}$ is closed under [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations, $j$, $G$, all interpreted operators, and [fixed points](../../../../concepts/fixed-point/index.md) of admissible endomorphisms — semantic closure adds nothing.
- $\mathrm{Op}_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}}$ is closed under lambda-definability, composition, fixed-point constructs, and finitary justification — syntactic closure adds nothing.
- $\mathrm{Op}_{\mathrm{[semiotic](../../../../../linguistics/topics/semiotics/index.md)}}$ is fusion-saturated — all fragmentwise identifications have been made, all admissible behaviors have names.

The construction proceeds from an initial base structure $X_0 = (H_0, \mathrm{Op}^{\mathrm{prim}})$ — a generating set for the [Heyting](../../../../../../../../../library/references/people/arend-heyting.md)–modal–comonadic structure and a set of primitive operators with valid interpretations — by iterating $\mathcal{S}$ until the [fixed point](../../../../concepts/fixed-point/index.md) is reached.

## What fusion provides

The interplay of the three closures produces a structure where syntax and semantics are in full agreement:

- Every syntactic combination has a determinate semantic meaning (by interpretation).
- Every semantic behavior that can be constructed from the available operations has a syntactic name (by fusion).
- Operators that compute the same function on every finite substructure are identified (by fragmentwise congruence).
- All of this is compatible with the modal structure ($j$), the trace structure ($G$), and the fragment structure (locality).

The final lesson — [The Semiotic Universe](./semantics-semiotics-bridge.md) — shows that this [fixed point](../../../../concepts/fixed-point/index.md) has a universal [property](../../../../../../../humanities/domains/sociology/terms/property.md): it is the initial object in a 2-category of [semiotic structures](../terms/semiotic-structure.md), making it the free modal–comonadic [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) structure with interpreted syntax.
