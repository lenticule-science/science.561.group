---
type: theorem
status: sketch
depends-on: [dispatch, capability-fiber-bundle, settling-monotonicity, twist-product-residuation, normative-operational-layering, capability-matching]
---

# Dispatch monotonicity in the knowledge order

For any fixed task $T$ and any agent $A$, additional capability or authority witnesses on $A$'s sections can only *increase or preserve* dispatch readiness in the knowledge order.

## Capability-layer monotonicity

Writing $\delta^C_\sigma(A, T)$ for the capability-layer readiness computed against capability section $\sigma$:

$$\sigma_A \leq_k \sigma_A' \;\implies\; \delta^C_{\sigma}(A, T) \;\leq_k\; \delta^C_{\sigma'}(A, T)$$

where $\sigma_A, \sigma_A'$ are the agent's capability sections at two stages with $\sigma_A \leq_k \sigma_A'$ pointwise.

**Sketch.** The capability-layer dispatch morphism is

$$\delta^C(A, T) \;=\; \bigwedge_{c \in C}^{(t)} \bigl(\rho_T(c) \Rightarrow \sigma_A(c)\bigr).$$

By [twist-product-residuation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md), the residual $x \Rightarrow z$ is monotone in $z$ in the knowledge order: $z \leq_k z' \implies (x \Rightarrow z) \leq_k (x \Rightarrow z')$.
Applied pointwise, $\sigma_A(c) \leq_k \sigma_A'(c)$ gives $(\rho_T(c) \Rightarrow \sigma_A(c)) \leq_k (\rho_T(c) \Rightarrow \sigma_A'(c))$.

The truth-order meet $\bigwedge^{(t)}$ is monotone in the knowledge order per [bilattice-homomorphism-naturality](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/bilattice-homomorphism-naturality.md).
Therefore $\delta^C_\sigma(A, T) \leq_k \delta^C_{\sigma'}(A, T)$. $\square$

## Authority-layer monotonicity

The authority-layer dispatch readiness $\delta^N(A, T) = \bigwedge_X^{(t)} (\rho_T^N(X) \Rightarrow \sigma_A^N(X))$ is likewise monotone in the knowledge order.
Writing $\delta^N_{\sigma^N}(A, T)$ for the authority-layer readiness computed against authority section $\sigma^N$:

$$\sigma_A^N \leq_k \sigma_A^{N\prime} \;\implies\; \delta^N_{\sigma^N}(A, T) \;\leq_k\; \delta^N_{\sigma^{N\prime}}(A, T)$$

**Sketch.** Identical to the capability-layer proof, with $\sigma_A^N$ in place of $\sigma_A$, $\rho_T^N$ in place of $\rho_T$, and the authority index $\mathcal{X}$ in place of $C$.
The twist-product residuation and bilattice-homomorphism-naturality arguments apply identically. $\square$

The authority-layer result says: recording new authority evidence (a delegation increment, an installation witness, a capability-grant record) cannot retract a normative dispatch authorization in the knowledge sense.
Authority records accumulate in the same way capability records do.

## Combined monotonicity

Combined readiness $\delta(A, T) = \delta^C(A, T) \wedge_t \delta^N(A, T)$ is monotone in the knowledge order in both dimensions jointly:

$$(\sigma_A \leq_k \sigma_A') \;\wedge\; (\sigma_A^N \leq_k \sigma_A^{N\prime}) \;\implies\; \delta(A, T) \;\leq_k\; \delta'(A, T)$$

**Sketch.** The truth-order meet $\wedge_t$ is monotone in the knowledge order in each argument: $(x \wedge_t y) \leq_k (x' \wedge_t y')$ whenever $x \leq_k x'$ and $y \leq_k y'$.
By capability-layer and authority-layer monotonicity independently, both components grow in $\leq_k$ as their evidence sections grow.
The combined readiness inherits the monotonicity. $\square$

## Operational content

The theorem says: *recording new capability or authority evidence cannot retract a dispatch decision in the knowledge sense*.
In particular:

- A $\bot$-readiness can become $\mathbf{t}$, $\mathbf{f}$, or $\top$ as evidence accrues on either dimension, but cannot return to $\bot$.
- A $\mathbf{t}$-readiness can become $\top$ if a contradicting witness arrives (on capability or authority), but cannot become $\bot$ or $\mathbf{f}$ silently.
- A $\mathbf{f}$-readiness can become $\top$ if a positive witness arrives contradicting the negative.

The substrate-algebraic content matches the operational intuition that capability and authority records *accumulate* rather than *overwrite* — and the predicated-work theory makes both instances of [settling-monotonicity](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), not special properties of dispatch.

## Caveat — not monotone in the truth order

Dispatch is *not* monotone in $\leq_t$ in either dimension.
A purely positive capability witness ($\sigma_A(c)$ from $\bot$ to $\mathbf{t}$) increases readiness in $\leq_t$; a purely negative witness ($\sigma_A(c)$ from $\bot$ to $\mathbf{f}$) decreases it.
Similarly for authority witnesses: an installation increment increases authority-layer readiness in $\leq_t$; a revocation increment decreases it.
Monotonicity holds only in the knowledge order, where both kinds of witness count as "more information about the agent's status."

## Relationship to the capability-availability projection

By [project-fiber-to-capability](../morphisms/project-fiber-to-capability.md), the community-level capability-availability fiber $\pi^\exists \sigma$ inherits monotonicity from per-agent monotonicity: if any agent's capability section grows in $\leq_k$, the community-level projection can only increase.
The same holds for the authority-availability projection $\pi^\exists_{\mathrm{auth}}$.
Dispatch monotonicity for individual agents is therefore a special case of the projection's monotonicity applied to a singleton set.
