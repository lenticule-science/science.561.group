---
type: theorem
class: engineering-claim
status: proved
depends-on: [governance-decision, governance-as-modal-restriction, modal-finite-model-property, modal-complexity-bounds, twist-modal-translation, world-set, bilattice-accessibility-relation]
see-also: [trust-boundary-modal-validity, federation-trust-bilattice-graded]
---

# Governance decisions are modally decidable

**Claim.** For any [governance-decision](theories/agential-orchestration-platform/morphisms/governance-decision.md) of the form "in context $w$, is action $\alpha$ permitted to agent $a$?", the substrate computes the answer as a modal-validity check $\Box_R u_a^\alpha)_w \in \{\mathbf{t}, \top\}$ — and this check is *decidable* in PSPACE for local consequence and EXPTIME for global consequence on the substrate's [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md).

## Why this holds

Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), the agent's authorized capability is the [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ applied to the agent's capability fiber along the governance graph $R$. A governance decision is therefore a modal-formula evaluation:

$$\mathrm{decide}(w, a, \alpha) \;:=\; \begin{cases} \mathbf{t} & \text{if } (\Box_R u_a^\alpha)_w \in \{\mathbf{t}, \top\} \\ \mathbf{f} & \text{otherwise}\end{cases}$$

Per [modal-finite-model-property](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-finite-model-property.md), the four-valued modal logic on $\mathbf{FOUR}^\bowtie$ has the finite model property and is decidable. Per [modal-complexity-bounds](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-complexity-bounds.md), local consequence is in PSPACE and global consequence is in EXPTIME.

The proof reduces via the [twist modal translation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-modal-translation.md) $\nu$: every governance modal formula on $\mathbf{FOUR}^\bowtie$ translates to a polynomial-size classical bimodal formula whose validity reduces to checking finite Kripke frames. The substrate's governance-decision implementation can therefore proceed by:

1. Expressing the decision as a modal formula $\phi$ on $R$.
2. Applying $\nu$ to obtain a classical bimodal $\phi^\nu$.
3. Running classical bimodal decision on $\phi^\nu$.
4. Reading off the four-valued result.

Per the finite-fiber-algebra corollary, when the [world set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) $W$ and entity set are finite and $\mathbf{L} = \mathbf{2}$, the bound specializes to polynomial-time enumeration over $\mathbf{FOUR}^{E \times E}$.

## Engineering consequence

- **Governance decisions terminate.** No governance configuration causes a decision to loop. The substrate can offer a wall-clock guarantee on decision latency.
- **Cross-substrate consistency.** Federation peers running the same decision against the same governance-graph fragment reach the same answer in the same complexity bound. Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), this is what makes federated governance reconciliation tractable.
- **Soul-violation-check is decidable modal validity.** Per [governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), [soul-violation-check](theories/agential-orchestration-platform/morphisms/soul-violation-check.md) is the validity of a particular modal formula — and per this theorem, the check terminates.
- **Conformance-testable.** Per [conformance-implies-substrate-properties](conformance-implies-substrate-properties.md), an auditor can present a sequence of governance decisions and verify each terminates within the complexity bound.

## What the theorem rules out

- **Non-decidable governance schemes.** A governance scheme whose decision procedure is not modally expressible (e.g., requires unbounded recursion through external state) cannot achieve substrate-level decidability. The substrate refuses such schemes; they must be lifted into the modal calculus to compose with the rest of governance.
- **Unbounded-context decisions.** A governance decision whose world-set is structurally infinite (continuous time, unbounded scopes) requires an infinite-fiber-algebra extension and may not retain the finite model property without further structural assumptions on $R$.
- **Approximation drift.** A substrate that approximates governance decisions (e.g., hash-based caching that may miss recent changes) is not running the modal-validity check; it is implementing a different computation. Per [self-representation](teaching/explanations/self-representation.md), the canonical governance decision is the substrate-content $\Box_R$ evaluation.

## What the theorem requires

- The governance graph $R$ is a finite [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) on a finite [world set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) (or admits the finite model property by other means).
- The substrate's [modal-necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) is implemented per the canonical definition.
- The value-domain is $\mathbf{FOUR}$ or a finite extension; richer value-domains require additional verification that the modal calculus retains decidability.

## Position

Together with [trust-boundary-modal-validity](trust-boundary-modal-validity.md) and [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), this theorem is the engineering payoff of the predication-categories' modal apparatus: every authorization-style decision the substrate makes — boundary admission, capability passing, governance, federation trust — is a $\Box_R$ evaluation, and *every* such evaluation terminates within a known complexity bound. The substrate's authorization discipline is structurally guaranteed-to-decide.
