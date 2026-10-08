---
type: theorem
class: engineering-claim
depends-on: [dispatch, authorization, twist-product-fusion, predication-fiber-algebra, four-bilattice, truth-order, knowledge-order, frobenius-for-fusion-fails]
see-also: [graded-dispatch-via-q-enriched-fusion, predicate-pushdown-via-frobenius]
title: Dispatch composes capability with authorization at the substrate level
description: Claim.
---

# Dispatch composes capability with authorization at the substrate level

**Claim.** When the [dispatch](teaching/explanations/dispatch.md) operator composes a work-item's required-capability fiber with a candidate agent's offered-capability fiber to produce a match-strength value, the same composition simultaneously incorporates the candidate's [authorization](../../governance/authorization/authorization.md) fiber.
An agent that *could* perform the work but is *not authorized* for it produces a strictly lower match-strength than an agent with the same capability and the required authorization.
The substrate does not need a separate authorization check; the composition's value-domain output expresses both capability-match and authorization-status in one step.

## Why this holds

The argument follows the substrate's value-domain structure directly.
Capability and authorization are both predications on the agent entity, valued in the substrate's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), and dispatch composes them via the bilattice's [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$.

**Part 1: Capability and authorization are predications on the agent entity.** Per [office](teaching/explanations/office.md) and [authorization](../../governance/authorization/authorization.md), both an agent's offered capabilities and the agent's authorization positions (powers, duties, privileges, immunities) are substrate predications on the agent entity.
They participate in the substrate's algebra as ordinary fiber values; there is no separate "authorization data structure" outside the substrate.

**Part 2: Dispatch composition is fiber-algebra fusion.** Per [dispatch](teaching/explanations/dispatch.md) and [dispatch-from-properties](../dispatch-from-properties/dispatch-from-properties.md), the dispatch operator computes match-strength by composing the work-item's required-capability fiber with the agent's offered-capability fiber using $\odot$.
The composition's result is a fiber over the work-item-and-agent pair whose value records the strength of the match.

**Part 3: Authorization predications enter the same composition.** When the work-item's required-capability fiber names an authorization (e.g., "this work requires the agent to hold the power to commit changes"), the predication enters the composition alongside the capability predications.
By the structure of $\odot$ on the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md):

- $\odot(\mathbf{t}, \mathbf{t}) = \mathbf{t}$ (matched and authorized)
- $\odot(\mathbf{t}, \bot) = \bot$ (capability matched, authorization unknown — no opinion)
- $\odot(\mathbf{t}, \mathbf{f}) = \mathbf{f}$ (capability matched, authorization explicitly denied — $\mathbf{f}$ is absorbing for $\odot$)

The match-strength reflects both dimensions in one value.

**Part 4: Ranking is order-respecting.** Per the substrate's [truth-order](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) $\leq_t$, $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$.
An agent producing $\mathbf{f}$ on a required authorization ranks below one producing $\bot$, which ranks below one producing $\mathbf{t}$.
Two agents with identical capability fibers but different authorization fibers rank in the order of their authorization values.
The dispatcher's selection is therefore authorization-respecting.

## Engineering consequence

The substrate's dispatch is single-pass: one $\odot$-composition produces a match-strength that incorporates both capability and authorization.
There is no two-stage dispatch (rank by capability, then filter by authorization), no separate authorization-check function, no procedural permission-system call.
The composition's structural shape encompasses both concerns.

Several engineering refinements follow:

- **Partial-authorization is first-class.** An agent with $\bot$ on a required authorization is not zero-ranked; it is ranked below an agent with $\mathbf{t}$ but above one with $\mathbf{f}$.
  The dispatcher may select the partial agent in a substrate where no fully-authorized agent is available, with the substrate recording the partial-authorization status in the dispatch witness.
  The substrate's response to "no fully-authorized agent" is determined by the substrate's policy, not by an opaque dispatcher fallback.
- **Authorization changes are immediate.** Per [scope-as-predication](../../teaching/explanations/scope-as-predication.md), authorization predications are substrate content.
  Adding a power to an agent's office, revoking a duty, granting a privilege — all are substrate edits, and the next dispatch composition produces a different match-strength.
  There is no deploy-and-restart cycle.
- **Audit covers both dimensions.** Per [witness](../../../objects/witness.md), the dispatch witness records the match-strength and its inputs (the work-item's required-capability fiber, the agent's offered-capability fiber, the agent's authorization fiber).
  Reconstructing why an agent was or was not selected is reading past substrate state.
- **Federation crosses cleanly.** When dispatch crosses a federation boundary, the receiving substrate composes the message's required-capability against the local agent's offered-capability and authorization.
  Per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), the composition is deterministic; both substrates agree on the match-strength.

## What the theorem rules out

A dispatch implementation that ranks by capability first and then filters by authorization (a two-stage dispatch with intermediate sets) does *not* produce the same result as the substrate's one-pass composition in general.
Specifically, when a work-item's required authorization is partially-known ($\bot$), the two-stage dispatch typically treats the authorization as either present (passes the filter) or absent (fails the filter), losing the substrate's $\bot$-as-no-opinion semantics.
The substrate's response is to compose in one pass; the two-stage shortcut is a violation of [read-discipline](../../teaching/explanations/read-discipline.md) (it branches on substrate content to gate the second stage).

## Why the optimizer cannot apply Frobenius-style pushdown to dispatch

Per [frobenius-for-fusion-fails](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/frobenius-for-fusion-fails.md), Frobenius reciprocity holds for $\wedge_k$ and $\wedge_t$ but **fails** for $\odot$ on three of the four [predicate-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) generator classes.
Concretely: a query of the form $\exists_f^\bullet (f^* \alpha \odot \phi)$ is *not* in general $\cong \alpha \odot \exists_f^\bullet \phi$ when $\bullet = \odot$.
Per [predicate-pushdown-via-frobenius](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/predicate-pushdown-via-frobenius.md), the substrate's query planner explicitly refrains from applying pushdown to dispatch-style queries — the rewrite is unsound for $\odot$.
Engineering implication: dispatch's authorization composition is a one-pass $\odot$ at the dispatch site; it cannot be reordered through quantifiers by the optimizer.

## What the theorem requires

- The substrate's value-domain is a [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) admitting $\odot$ ([twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)) with $\mathbf{f}$-absorbing structure.
- Both capability and authorization predications participate in the same fiber-composition operator.
- The dispatcher's ranking respects the substrate's truth-order $\leq_t$.
