---
type: theorem
class: engineering-claim
status: proved
depends-on: [trust-boundary, modal-necessity-operator, bilattice-accessibility-relation, world-set, modal-necessity-basic-properties, signature-binds-witness-to-identity]
see-also: [federation-trust-bilattice-graded, governance-decision-modal-decidability]
---

# Trust-boundary admission is modal validity

**Claim.** For any [trust boundary](teaching/explanations/trust-boundary.md) with interior $W_\mathrm{in} \subseteq W$, exterior $W_\mathrm{ex} = W \setminus W_\mathrm{in}$, and [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R: W \times W \to \mathbf{L}^\bowtie$, the substrate admits a content-cell $u$ originating at $w_\mathrm{ex} \in W_\mathrm{ex}$ to participate in computations at $w_\mathrm{in} \in W_\mathrm{in}$ exactly when

$$(\Box_R u)_{w_\mathrm{in}} \;=\; \bigwedge_t \{R(w_\mathrm{ex}, w_\mathrm{in}) \to u_{w_\mathrm{ex}}\} \;\in\; \{\mathbf{t}, \top\}$$

— i.e., when the [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ evaluates to a *truth-positive* value (told-true, possibly with concurrent told-false noise) at the destination world. Admission with value $\bot$ (uninformed accessibility) or $\mathbf{f}$ (told-inadmissible) is refused.

This is the substrate-level instance of *modal validity at the destination world* — the boundary check is decidable as a modal-formula validity question on the substrate's accessibility relation.

## Why this holds

Per [modal-necessity-basic-properties](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$ preserves $\wedge_t$, preserves the constant $\mathbf{t}$, and preserves the strong implication structure. Therefore:

- If $R(w_\mathrm{ex}, w_\mathrm{in}) = \mathbf{t}$ on the relevant cells, then $(\Box_R u)_{w_\mathrm{in}} = u_{w_\mathrm{ex}}$ on those cells — full admission, value preserved.
- If $R(w_\mathrm{ex}, w_\mathrm{in}) = \mathbf{f}$, the strong implication $\mathbf{f} \to u$ collapses to a truth-positive value only when $u$ is itself $\mathbf{f}$ on the relevant cells — admission only of the inadmissibility itself, not of the cell's content.
- If $R(w_\mathrm{ex}, w_\mathrm{in}) = \bot$ (accessibility unknown), the strong implication $\bot \to u$ stays at $\bot$ unless $u$ is already $\mathbf{t}$ — refusing admission of unknown content.
- If $R(w_\mathrm{ex}, w_\mathrm{in}) = \top$ (admission contested), the boundary surfaces a contradictory admission state for governance to reconcile — admission proceeds with the $\top$-tagged value, audit-flagged per [witness](../objects/witness.md).

Per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), the substrate's cryptographic discipline is what makes the accessibility cells $R(w_\mathrm{ex}, w_\mathrm{in})$ structurally enforceable: a peer cannot move the cell from $\bot$ to $\mathbf{t}$ without producing a signature-witness that binds the admission to a verified identity-key.

## Engineering consequence

- **Boundary checks are computations, not enforcement layers.** The check is a $\Box_R$ traversal over substrate content; per [self-representation](teaching/explanations/self-representation.md), nothing about it is opaque or external.
- **Bilattice-graded admission is auditable.** Per [witness](../objects/witness.md), each $\Box_R$ evaluation records the accessibility cells consulted and the values they yielded — auditors can trace why a particular boundary admission succeeded or refused.
- **No "trusted code path."** There is no region of substrate code that bypasses the $\Box_R$ check; the check is structural to admission. Compare [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md) for the call-graph form of the same property.
- **Decidable.** Per [governance-decision-modal-decidability](governance-decision-modal-decidability.md), the modal calculus has the finite model property and is decidable — the boundary check terminates in PSPACE for local consequence.

## What the theorem rules out

- **Ambient admission.** A trust boundary that admits content without an inbound accessibility cell is not implementing $\Box_R$. The substrate refuses; admission requires the cell to exist and be evaluated.
- **Boolean collapse.** A boundary that treats $\bot$ as $\mathbf{f}$ (closed-world denial) or $\mathbf{t}$ (open-world admission) is not implementing the bilattice-graded modal operator — it is implementing one of two Boolean approximations and discarding the substrate's distinction between "uninformed" and "told." Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federations need the four-valued distinction.
- **Cross-substrate disagreement.** Per [modal-finite-model-property](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-finite-model-property.md), the modal calculus's decidability lifts via [twist-modal-translation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-modal-translation.md) to classical bimodal logic — federation peers running the same boundary check on the same accessibility cells reach the same admission decision.

## What the theorem requires

- The trust boundary's accessibility relation $R$ is recorded as substrate content (per [self-representation](teaching/explanations/self-representation.md)).
- The substrate implements $\Box_R$ as defined in [modal-necessity-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md).
- Accessibility cells are bilattice-valued, not Boolean.
- The world set $W$ is finite (or the modal calculus is decidably parameterized over it) — per [modal-finite-model-property](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-finite-model-property.md), this is sufficient for decidability.

## Position

Together with [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) and [governance-decision-modal-decidability](governance-decision-modal-decidability.md), this theorem grounds the substrate's boundary-enforcement in the modal calculus on the predication fiber algebra. Trust enforcement is not a perimeter discipline — it is a $\Box_R$ computation on substrate content.
