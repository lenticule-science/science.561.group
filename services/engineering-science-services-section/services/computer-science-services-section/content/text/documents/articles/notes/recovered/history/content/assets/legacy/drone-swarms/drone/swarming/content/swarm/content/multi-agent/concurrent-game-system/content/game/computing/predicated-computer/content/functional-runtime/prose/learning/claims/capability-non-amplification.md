---
type: theorem
class: engineering-claim
status: proved
depends-on: [capability, capability-passing, capability-record, exercise-capability, modal-necessity-operator, modal-necessity-basic-properties, bilattice-accessibility-relation]
see-also: [invoke-function, trust-boundary-modal-validity, governance-decision-modal-decidability]
---

# Capability invocation cannot amplify authority

**Claim.** A function invocation cannot exercise more authority than the capabilities passed to it. Structurally, the callee's available capability is the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ applied to the caller's capability fiber along the call-graph [accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) — and per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$ never produces a value strictly higher in the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) than the caller's. For any [function-record](../objects/function-record.md) $f$ invoked with capabilities $\{c_1, \ldots, c_n\}$, $f$'s execution can perform only the operations these capabilities authorize — no derivation, no escalation, no substitution can give $f$ access to operations not authorized by some $c_i$ (or a capability properly delegated from some $c_i$).

## Proof

The argument is the substrate-side instance of *modal restriction along the call-graph*. Per [capability-passing](teaching/explanations/capability-passing.md), each call is an edge in a [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R$ on the call-graph; the callee's available capability is

$$\mathrm{available}_g(p) \;=\; \Box_R u_f \;=\; \bigwedge_t \{R(w_f, w_g) \to u_f\}$$

evaluated along all caller edges. Per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$:

- preserves $\wedge_t$ — combining caller restrictions tightens, never loosens
- preserves $\mathbf{t}$ — full authority on a freely-accessible cell remains full authority
- preserves the strong implication — restrictions compose per the bilattice's $\to$

Critically, the strong implication $R(w_f, w_g) \to u_f$ is monotone in $u_f$: a smaller caller-capability gives a smaller callee-capability. There is no choice of $R(w_f, w_g)$ that produces a callee-capability strictly higher in the knowledge order than $u_f$. *Capability non-amplification is structural to the modal operator*, not an extra check the runtime must add.

The supporting parts:

**Part 1: No ambient authority.** Per [capability-passing](teaching/explanations/capability-passing.md), the substrate's runtime has no ambient capability environment a function can read from outside its parameters. Functions cannot "just call the file system" — they can only use capabilities admitted by an inbound accessibility cell.

**Part 2: Delegation preserves authority bounds.** Per [capability-record](../objects/capability-record.md)'s `provenance` field, capabilities derived by delegation are exactly $\Box_R$ along the delegation edge — bounded above (in knowledge order) by the parent. A capability `write:file-X` cannot be delegated to produce `write:file-Y` — the modal operator is monotone in the caller's authority.

**Part 3: Authority is modal.** Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), authority composes via the modal accessibility relation $R$. A function attempting an operation without an admissible $\Box_R$ value fails the modal check; per [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md), the check terminates in PSPACE.

**Part 4: [Exercise-capability](../morphisms/exercise-capability.md) verifies holder.** Per [capability-record](../objects/capability-record.md), only the current holder can exercise. A function holding only $\{c_1, \ldots, c_n\}$ cannot exercise some other capability $c'$ — exercise checks the holder against the substrate's recorded accessibility cells.

$\square$

## Engineering consequence

- **Principle of least authority.** A function receives only the capabilities it needs; if it tries to do more, the substrate refuses.
- **Audit-friendly.** Per [witness](../../../objects/witness.md), the capabilities a function exercises are recorded; auditors can verify functions only used what was passed.
- **Federation-safe.** Cross-substrate capability passing inherits these properties; a function on a peer substrate cannot exceed what its caller's capabilities admit.

## What the theorem rules out

- A function that reads ambient capabilities from the runtime's environment instead of its parameters — violates Part 1.
- A capability-derivation rule that produces a capability with broader authority than its parent — violates Part 2.
- A runtime that allows function calls without verifying capability requirements — violates the substrate's modal-restriction discipline.

## What the theorem requires

- The runtime enforces lexical capability-passing per [capability-passing](teaching/explanations/capability-passing.md).
- Per [capability-record](../objects/capability-record.md), capabilities have explicit holders and provenance chains.
- Per [exercise-capability](../morphisms/exercise-capability.md), capability use is mediated by substrate operations that verify holder and revocation status.
- Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), the substrate's modal discipline applies.
