---
type: question
class: bridge
status: open
date-created: 2026-05-01
explores: [twist-product-fusion, predication-fiber-algebra, q-enriched-sheaf-tensor, quantale-enriched-sheaf]
---

# How does dispatch generalize to quantale-enriched value-domains?

The engineering theory's [dispatch-composes-authorization](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md) and [dispatch-as-closure-rule-system](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/dispatch-as-closure-rule-system.md) characterize dispatch over the bilattice fiber algebra (currently the four-bilattice case).
The substrate's dispatch composition uses [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ to combine work-required-capability with agent-offered-capability, with the truth-order $\leq_t$ ranking matches.

The math program's quantale-enriched material (active development per the agentic-swarm-theory study plan, references [quantale-enriched-sheaf](../objects/quantale-enriched-sheaf.md), [q-enriched-sheaf-tensor](../theorems/q-enriched-sheaf-tensor.md), etc.) generalizes the bilattice setting to richer value-domains where match-strength carries graded information (cost, latency, confidence, fuzzy-distance) rather than just the four-element bilattice values.

**The question:** What does dispatch look like when the value-domain is a quantale $Q$ rather than the bilattice $\mathbf{FOUR}$?
Specifically:

1. **What is the q-enriched analog of $\odot$?** The bilattice's twist-product fusion has a specific algebraic shape; the quantale's tensor product is its analog.
  How does the engineering's "compose work-required with agent-offered" lift?

2. **What is the q-enriched analog of the truth-order ranking?** In the bilattice, $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ orders dispatch outcomes.
  For a quantale, the natural ordering is the quantale's $\leq$; how does the dispatch's selection rule (pick highest $\leq_t$) generalize?

3. **What are the q-enriched analogs of the bilattice's special values $\bot, \mathbf{t}, \mathbf{f}, \top$?** The bilattice case admits partial-authorization ($\bot$), explicit-denial ($\mathbf{f}$), and contested ($\top$).
  What graded analogs does a quantale carry?

4. **Does [agent-community-consensus](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theorems/agent-community-consensus.md) generalize?** The current consensus theorem rests on [bilattice network-sheaf consensus](../theorems/bilattice-network-sheaf-consensus.md).
  Does the q-enriched cohomology framework give an analog for graded agent communities?

## Why this matters

The engineering theory currently restricts to the bilattice case.
Real agential systems often have richer match information: an agent may be "expensive but available" (a quantale with cost) or "fast but uncertain" (a quantale with confidence).
A quantale-enriched dispatch theorem would let the engineering admit these without losing the substrate's federation-convergence guarantees.

## Position in the program

Open.
The math program's quantale-enriched cohomology material (per [q-enriched-cohomology](../objects/q-enriched-cohomology.md) and adjacent theorems) is in flight; this question is a target for that work to land at the engineering layer.
