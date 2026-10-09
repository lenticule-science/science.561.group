---
type: concept
class: authority-discipline
depends-on: [capability, function, effect, modal-necessity-operator, bilattice-accessibility-relation, world-set, predication-fiber-algebra, twist-product-fusion]
see-also: [capability-non-amplification, governance-as-modal-restriction]
---

# Capability passing

The discipline of *passing capabilities explicitly between caller and callee*. In the substrate's hyperdoctrine setting, this is not "no ambient authority" as a mere stylistic preference — it is the substrate's structural insistence that *every function call along the call-graph is an edge in a [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md)*, and the callee's available capability is the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ applied to the caller's capability fiber along that edge.

## Hyperdoctrinal structure

A function call from caller $f$ at world $w_f$ to callee $g$ at world $w_g$ is an edge $R(w_f, w_g) \in \mathbf{L}^\bowtie$ in the call-graph's accessibility relation. The capability available to $g$ at $w_g$ is

$$\mathrm{available}_g(p)(s, o) \;=\; (\Box_R u_f)_{w_g}(s, o) \;=\; \bigwedge_t \{R(w_f, w_g) \to u_f(s, o) : w_f \in \mathrm{callers}(g)\}$$

where $u_f$ is the caller's capability fiber over predicate $p$. The [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) is the substrate-side mechanism: a callee receives only the [knowledge-meet](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) of what every caller is willing to admit through the call-edge.

Per [capability-non-amplification](../theorems/capability-non-amplification.md), $\Box_R$ on a non-trivial accessibility never produces a value strictly higher in the knowledge order than the caller's — the callee cannot *amplify* the caller's capability, only inherit a restriction of it. This is the substrate-level form of "no privilege escalation through call-chain composition."

## What the discipline does at the call site

- **The call-edge is recorded.** Each call materializes an accessibility cell $R(w_f, w_g)$ in the substrate. Per [self-representation](../../teaching/explanations/self-representation.md), the call-graph is substrate content; per [witness](../../../objects/witness.md), the call event is auditable.
- **The capability is fused, not copied.** Per [twist-product-fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$, when a caller restricts a capability for a callee, the restriction *fuses* with the caller's capability — the callee receives a derivative whose authority is bounded above (in the knowledge order) by the caller's authority. There is no way to fuse upward.
- **No ambient lookup.** The callee's $\Box_R$ does not read any state outside the caller-edges. Functions cannot "find" a capability environmentally; absent an inbound edge with a non-$\bot$ accessibility cell on the relevant predicate, the callee's available capability for that predicate is $\bot$.
- **Revocation collapses the edge.** Revoking a capability at the caller is editing the accessibility cell $R(w_f, w_g)$ — typically to $\mathbf{f}$. The next $\Box_R$ computation reflects this; no in-flight callee can use the revoked capability past its next $\Box_R$ check.

## Why this is the right grounding

A naive view: "capability passing" is just a function-parameter discipline. But that view doesn't explain *why* delegation must reduce capability rather than preserve or enlarge it. The substrate's answer: delegation is a $\Box_R$ application, and per the modal-necessity basic properties (per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md)), $\Box_R$ preserves $\wedge_t$, preserves $\mathbf{t}$, and preserves implication structure — but never produces a strictly-higher value than what the accessibility relation admits. Capability non-amplification is structural to the modal operator, not an extra check.

Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), the same modal apparatus governs an agent's authorization across governance contexts. Function calls and governance authority are *the same modal calculus on different accessibility relations* — call-graph $R$ for the runtime, governance graph $R$ for the platform. Both are bilattice-valued, both are substrate-recorded, both are computable as $\Box_R$ traversals.

## Engineering consequences

- **Effect-typing.** Per [effect](effect.md), a function's effect type declares which predicates it reads/writes. The call-site type-check verifies the caller passes capabilities (accessibility-cell admissions) sufficient for the callee's declared effect.
- **Fine-grained delegation.** A caller can fuse a restricted capability via $\odot$ before passing — e.g., "write to this specific cell" rather than "write to anything writable." The delegate receives the fused capability, which is structurally bounded.
- **Decidable authorization.** Per [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md), the modal calculus is decidable; runtime can evaluate $\Box_R$ at every call without nontermination risk.
- **Federation-stable.** A capability passed across a federation edge composes the call-graph $\Box_R$ with the federation $\Box_R$. Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the composition is well-defined in the modal calculus.

## What the discipline rules out

- **Ambient authority.** A function that "just calls the file system" reads from outside any caller-edge — there is no substrate-recorded accessibility cell admitting this. The substrate refuses; the function must take the file-system capability as a parameter.
- **Privilege amplification.** Per [capability-non-amplification](../theorems/capability-non-amplification.md), no call-graph traversal can produce a callee capability strictly higher in the knowledge order than the caller's. A runtime that allowed amplification would not be implementing $\Box_R$.
- **Untracked delegation.** Capability flow that doesn't go through substrate-recorded call-edges is not auditable. The substrate refuses such flow; per [witness](../../../objects/witness.md), every capability transfer materializes a witness.
