---
type: morphism
class: composition
status: draft
symbol: "\\mathrm{corr}"
depends-on: [jural-relation, predicate-converse, predicate-specialization]
---

# Correlate-of

The morphism that pairs a [jural relation](../objects/jural-relation.md) $R$ with its Hohfeldian correlative $R'$. Composed of:

1. A [predicate-converse](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) acting on the (active-holder, passive-party) pair: the swap that exchanges the two agents' positions.
2. A [predicate-specialization](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) on the `kind` predicate that maps `power` ↦ `liability`, `duty` ↦ `claim/right`, `privilege` ↦ `no-right`, `immunity` ↦ `disability`.

## Definition

Let $R$ be a jural relation with $\langle R, \texttt{kind}, k\rangle$, $\langle R, \texttt{active-holder}, A\rangle$, $\langle R, \texttt{passive-party}, B\rangle$, $\langle R, \texttt{scope-action}, X\rangle$, all at value $\mathbf{t}$. The correlate $\mathrm{corr}(R) = R'$ is the jural relation whose constituent cells are:

- $\langle R', \texttt{kind}, \kappa(k)\rangle$ at $\mathbf{t}$, where $\kappa$ is the kind-rename $\{power \mapsto liability,\ duty \mapsto claim,\ privilege \mapsto no\text{-}right,\ immunity \mapsto disability\}$.
- $\langle R', \texttt{active-holder}, B\rangle$ at $\mathbf{t}$ — the former passive-party becomes the active-holder of the correlative.
- $\langle R', \texttt{passive-party}, A\rangle$ at $\mathbf{t}$ — the former active-holder becomes the passive-party of the correlative.
- $\langle R', \texttt{scope-action}, X\rangle$ at $\mathbf{t}$ — same scope-action.
- $\langle R, \texttt{correlate-of}, R'\rangle$ and $\langle R', \texttt{correlate-of}, R\rangle$ at $\mathbf{t}$ — the linkage.

## Realization as a closure rule

The correlate-of morphism is realized in $\mathcal{S}_{\mathrm{op}}$ as a closure rule:

$$\langle R, \texttt{kind}, k\rangle = \mathbf{t} \,\wedge\, \langle R, \texttt{active-holder}, A\rangle = \mathbf{t} \,\wedge\, \langle R, \texttt{passive-party}, B\rangle = \mathbf{t} \,\wedge\, \langle R, \texttt{scope-action}, X\rangle = \mathbf{t}$$

implies the existence of $R' \in E_{\mathrm{op}}$ (or its identification with an existing entity) such that the four constituent cells of $R'$ above carry $\mathbf{t}$.

The rule is bidirectional: asserting a power on $R$ asserts the liability on $R'$; asserting a duty on $R$ asserts the claim/right on $R'$. The closure rule fires once on each side.

## Self-adjointness

By the [predicate-converse quantifier-adjoints theorem](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-converse-quantifier-adjoints.md), the active-side and passive-side bilattice algebras carry identical information: $\exists_f^k = f^* = \forall_f^k$ and $\exists_f^t = f^* = \forall_f^t$. This means the existence of $R'$ as the correlate of $R$ is not adding new information to the substrate — it is making the *passive-side view* of the same jural fact substrate-readable.

In particular: the correlative is not a separate jural relation that *must be independently witnessed*. A single witness asserting the active-side $R$ — the increment cell $\langle R, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$ at stage $\tau$ — drives the correlative-existence closure rule to populate $R'$'s cells at the same stage's closure. The passive-side $R'$ is computed, not separately witnessed.

## What the correlate-of *forbids*

The morphism's involutivity ($\mathrm{corr}(\mathrm{corr}(R)) = R$, up to identification) forbids one-sided jural relations. A power without a corresponding liability — a relation that grants $A$ ability without placing any specific $B$ in the position of being subject to it — is not admissible. The closure rule's firing forces every power to have a passive-party; the work-vocabulary's [authority](../../../../../../../../../../../humanities/theories/sociology/theories/work/terms/dispatch.md) commitment to identifying the dispatchee aligns with this constraint.

## Position in the program

The correlate-of morphism is the structural answer to the open question of how Hohfeldian correlatives encode in SPO: *as a fixed composition of two of the four predicate-category generators, applied to jural-relation entities*. The active/passive pair is one *fact*, not two; the substrate represents both views by carrying both jural-relation entities, with the correlate-of closure rule maintaining their consistency.
