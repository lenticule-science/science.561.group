---
type: question
status: open
explores: [dispatch, capability-fiber-bundle, operations-settling, dispatch-readiness]
---

# What does dispatch look like with quantale-enriched capability values?

PredWork's [dispatch morphism](../morphisms/dispatch.md) operates on the four-bilattice: a capability match is either $\mathbf{t}$ (match), $\mathbf{f}$ (mismatch), $\bot$ (not yet determined), or $\top$ (contested).
Real dispatch decisions often involve graded match information: an agent may be "competent but slow" (cost dimension), "available but uncertain" (confidence dimension), "fast but expensive" (multiple quality dimensions simultaneously).
A quantale-enriched dispatch would admit these graded matches without losing the substrate's convergence guarantees.

A bridge question to [the math program's quantale-enriched-dispatch question](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/quantale-enriched-dispatch.md).
That question asks the math-level extension; this question holds the PredWork-side framing.

## What quantale enrichment would add to dispatch

The current dispatch mechanism uses [twist-product-fusion](../morphisms/dispatch.md) $\odot$ to combine the task's required-capability section with the agent's offered-capability section, using the truth-order $\leq_t$ to rank matches.
The four-bilattice case:

- $\mathbf{t} \odot \mathbf{t} = \mathbf{t}$: agent has required capability — full match.
- $\bot \odot \mathbf{t} = \bot$: capability not yet confirmed — match uncertain.
- $\mathbf{f} \odot \mathbf{t} = \mathbf{f}$: agent explicitly lacks capability — mismatch.
- $\top \odot \mathbf{t} = \top$: capability contested — requires adjudication.

In a quantale-enriched setting, the four-bilattice $\mathbf{FOUR}$ is replaced by a richer quantale $Q$.
The capability section values are not binary (yes/no) but carry graded information.
Three concrete quantale choices:

- **Cost quantale** $Q = ([0, \infty], +, \min)$: capability value is the cost of exercising it; match-quality is measured by total cost; dispatch selects the minimum-cost match.
- **Confidence quantale** $Q = ([0, 1], \times, +)$: capability value is the probability of successful exercise; match-quality is probability of task completion; dispatch selects the highest-confidence match.
- **Latency quantale** $Q = ([0, T_{\max}], +, \min)$: capability value is the expected time to complete; dispatch selects the fastest match.

Each quantale gives a different ordering of agents by fitness for the task, enriching the binary dispatch decision into a ranked selection.

## Sub-questions

### (a) What is the q-enriched analog of twist-product-fusion for dispatch?

The bilattice's twist-product-fusion $\odot$ has a specific algebraic shape — it combines work-required with agent-offered via the bilattice's product.
For a quantale $Q$, the analog is the quantale's tensor $\otimes_Q$: combining the task's required-capability $Q$-value with the agent's offered-capability $Q$-value.
The dispatch morphism becomes: $\delta^Q(A, T) = \bigotimes_{c \in \text{caps}} (r_T(c) \Rightarrow_Q \sigma_A(c))$ where $\Rightarrow_Q$ is the quantale's internal-hom (residuation).

### (b) Does dispatch-monotonicity extend to the quantale case?

[Dispatch-monotonicity](../theorems/dispatch-monotonicity.md) states that additional capability witnesses can only increase dispatch readiness in the knowledge order.
In the quantale case: does "more evidence about capability" (more $Q$-valued witnessing increments) monotonically improve the $Q$-valued match score?
This requires the $Q$-valued witnessing morphism to be monotone in $Q$'s order — which holds for most work-relevant quantales (cost, confidence, latency all have natural monotone witnessing).

### (c) Does the four-bilattice case appear as a restriction?

The four-bilattice $\mathbf{FOUR}$ is the Boolean quantale with the two-element lattice structure.
The quantale-enriched dispatch should reduce to the existing dispatch when $Q = \mathbf{FOUR}$.
Verifying this reduction ensures the q-enriched theory is a conservative extension, not a replacement.

### (d) Multi-dimensional dispatch: product quantales

A task may require multi-dimensional matching: a writing agent who is both fast (latency dimension) and experienced (confidence dimension).
The product quantale $Q_1 \times Q_2$ (latency × confidence) gives a two-dimensional capability value.
Dispatch on a product quantale selects on both dimensions simultaneously — a Pareto-optimal selection problem.
Does the [dispatch-readiness-regime-is-strict theorem](../theorems/dispatch-readiness-regime-is-strict.md) extend?
For a product quantale, the regime classification must handle the product order, which may not have the same strict-regime properties as the factor quantales individually.

### (e) Connection to stochastic dispatch

The [capacity-as-stochastic-settling question](capacity-as-stochastic-settling.md) asks whether agent capacity can be formalized as a stochastic settling.
The probability semiring is a quantale ($Q = ([0, 1], \times, +)$).
Dispatch on the probability quantale is stochastic dispatch: an agent's capability section carries probabilities, and the dispatch match-quality is the probability of successful task completion.
The two questions — quantale-enriched dispatch and stochastic capacity — converge at this quantale specialization.
