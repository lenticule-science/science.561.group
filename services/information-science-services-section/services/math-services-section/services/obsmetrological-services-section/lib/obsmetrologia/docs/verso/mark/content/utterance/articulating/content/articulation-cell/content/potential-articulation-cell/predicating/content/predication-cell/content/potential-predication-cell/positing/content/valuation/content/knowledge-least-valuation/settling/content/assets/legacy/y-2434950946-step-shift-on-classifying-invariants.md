---
kind: example
status: draft
depends-on: [step-shift-morphism, step-n-cohomological-rank-theorem, fibonacci-classifying-invariant, padovan-classifying-invariant, fibonacci-to-padovan-step-shift]
instantiates: [step-shift-morphism, step-n-cohomological-rank-theorem]
lineage: 5
type: example
---

# Step-shift action on classifying invariants

How does the [step-shift morphism](../morphisms/step-shift-morphism.md) act on the [step-$n$ classifying invariant](../objects/step-n-classifying-invariant.md)? Cross-step instance demonstrating the morphism's derivative on cohomology.

## The derivative

For a step-$n$ rule $\mathcal{S}$ with classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(\mathcal{S}) \in \mathbb{Z}^n$, the step-shifted rule $\sigma_n^{n+1}(\mathcal{S})$ has classifying invariant $\mathbb{Z}^{n+1}$. The step-shift induces a linear map:

$$d\sigma_n^{n+1} : \mathbb{Z}^n \to \mathbb{Z}^{n+1}.$$

For the canonical step-shift (with extension vectors $\mathbf{c} = (1, 0, \ldots, 0)^T$, $\mathbf{r} = (1, 0, \ldots, 0)$), the derivative embeds $\mathbb{Z}^n$ as a sub-lattice of $\mathbb{Z}^{n+1}$:

$$d\sigma_n^{n+1}(\mathbf{e}_i) \;=\; \mathbf{e}_i \in \mathbb{Z}^{n+1} \text{ for } i = 1, \ldots, n.$$

The new generator $\mathbf{e}_{n+1} \in \mathbb{Z}^{n+1}$ corresponds to the new substitution-letter introduced by the step-shift; it's *not* in the image of $d\sigma_n^{n+1}$.

## Concrete: Fibonacci → step-3

Fibonacci's classifying invariant: $\mathbb{Z}^2$ with generators $e_a, e_b$.

After step-shift to a step-3 rule (per [fibonacci-to-padovan-step-shift](fibonacci-to-padovan-step-shift.md)): $\mathbb{Z}^3$ with generators $e_a, e_b, e_c$.

The derivative $d\sigma_2^3 : \mathbb{Z}^2 \to \mathbb{Z}^3$ sends $e_a \mapsto e_a, e_b \mapsto e_b$. The new generator $e_c$ is added.

## Action by substitution matrix

The substitution matrix $M$ acts on the classifying invariant. After step-shift, the extended matrix $M' = \sigma(M)$ acts on $\mathbb{Z}^{n+1}$. The derivative $d\sigma$ is *equivariant* with respect to the matrix actions: $d\sigma \circ M = M' \circ d\sigma$.

## What this exhibits

**The step-shift's derivative is a structural embedding of cohomology.** Each iteration of the RG flow adds one rank to the classifying invariant, with the previous invariant embedded as a sub-lattice. This makes the cohomological rank growth rate exactly 1 per step (the [critical exponent at the RG fixed point](../../aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md)).

## Position in Lineage 5

Cross-step example exhibiting the step-shift's action on classifying invariants. Together with [fibonacci-to-padovan-step-shift](fibonacci-to-padovan-step-shift.md), demonstrates the structural mechanism by which the RG flow operates at the cohomological level.
