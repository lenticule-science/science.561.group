---
type: definition
class: substrate-region
realizes: [predication-fiber]
depends-on: [predication-substrate, identity-by-relations, substrate-value-domain]
see-also: [predication-graph-store, closure-rule-application, traversal]
---

# Fiber

The substrate-region structural definition of a [predication-fiber](teaching/explanations/predication-fiber.md): the bundle of predications local to an entity, addressed by entity-and-selection, not stored as a separate structure but recoverable by traversal. Where the concept names the role, this object specifies what a fiber *is* operationally — what an operator addresses when it asks for "the fiber at this entity," what content the fiber carries, what algebraic structure the fiber inherits from the substrate.

## Structural composition

A fiber is addressed by a *selection* over the [predication-graph store](predication-graph-store.md):

- **Anchor entity.** The entity at which the fiber is addressed. The fiber is *the* fiber at that entity under the chosen selection.
- **Selection criterion.** One of:
  - *Full*: every predication the entity participates in (subject, object, or witness role).
  - *Subject-fiber*: predications where the entity is the subject.
  - *Object-fiber*: predications where the entity is the object.
  - *Predicate-fiber*: predications carrying a chosen predicate, regardless of role.
  - *Mixed*: a Boolean composition of the above.
- **Scope bound.** The [scope](scope-record.md) within which the fiber is computed. Predications outside the scope are excluded from the fiber, even when they would otherwise match the selection.

The fiber's *content*, given an anchor and a selection, is the result of the substrate's [traversal](../morphisms/traversal.md) under those criteria. The result is a finite set of predication cells, each carrying a value in the [substrate's value-domain](teaching/explanations/substrate-value-domain.md) — equivalently, a [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) restricted to the selected sub-support.

## Algebraic structure

A fiber inherits the algebraic structure of the substrate's [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): pointwise [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) on the entity-pair index, with the substrate's [knowledge order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) and [truth order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/truth-order.md) operations lifting pointwise.

Two fibers compose by composing their predications' values predicate-wise:

- *Knowledge-meet* of two fibers: the cellwise [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) meet — the strongest evidence both fibers agree on.
- *Knowledge-join* of two fibers: the cellwise knowledge-order join — the union of evidence; per [coherence-glue](../morphisms/coherence-glue.md), this is what the substrate's join does when consolidating two fibers' overlapping content.
- *Extend* of two fibers ([twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)): the cellwise $\odot$, used when one fiber's content is composed with a closure rule's premise.
- *Restrict* of two fibers ([twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md)): the cellwise $\Rightarrow$, used when one fiber's content is tested against a derived conclusion.

## Invariants

- **Bounded width.** The fiber's width — the count of predication cells it contains — is finite for any anchor with a finite participating-predication count. Per [wavefront](teaching/explanations/wavefront.md), the substrate's working memory scales with active fiber width, not graph size.
- **Recoverable, not stored.** The fiber is not a separate substrate structure; it is recoverable from the predication-graph store by traversal. Two operators asking for the same anchor-and-selection produce identical fiber content (at the same history).
- **Scope-respecting.** The fiber's content respects the cited scope: predications outside the scope are not visible, even when they otherwise satisfy the selection. This is what makes the substrate's locality discipline scope-aware.
- **History-indexed.** A fiber addressed at history $t$ is not the same as the same fiber at history $t' \neq t$; the substrate's [substrate-state](teaching/explanations/substrate-state.md) is indexed by history, and the fiber is the content at the chosen index.

## Operations

- *Read.* [Traversal](../morphisms/traversal.md) under the anchor-and-selection produces the fiber's content. Per [cost-discipline](teaching/explanations/cost-discipline.md), reading a fiber is free; the cost is bounded by the fiber's width.
- *Restrict to history.* Given a fiber and a prior history $t < t'$ (per [substrate-state](teaching/explanations/substrate-state.md)), apply the [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s restriction map to recover the fiber's content at $t$. Used in audit and replay.
- *Compose.* Combine two fibers' contents via the algebraic operations above. The substrate's [closure-rule application](../morphisms/closure-rule-application.md) routinely composes a rule-premise fiber with the rule-target fiber.
- *Diff.* Given two fibers (typically the same anchor at different histories, or two anchors at the same history), produce the cellwise difference — predications in one but not the other, or with different values. Used in audit visualization and federation reconciliation.

## Position in the substrate

The fiber is the substrate's *unit of locality*. Without it explicitly named, the substrate's locality discipline is implicit; with it, every operator declares which fiber(s) it reads, which it writes, and which it composes. Per [closure-rule](teaching/explanations/closure-rule.md), every closure rule's match-radius is a fiber-bound; per [wavefront](teaching/explanations/wavefront.md), the substrate's memory consumption scales with active fiber widths.

The pattern composes with [predication-graph store](predication-graph-store.md) (the substrate from which fibers are recovered), with [scope-record](scope-record.md) (which bounds fiber visibility), with [traversal](../morphisms/traversal.md) (the operator that recovers fiber content), and with [closure-rule-application](../morphisms/closure-rule-application.md) (which reads, composes, and writes fibers).
