---
type: concept
class: authority-token
depends-on:
  - authorization
  - modal-necessity-operator
  - bilattice-accessibility-relation
  - knowledge-order
  - predication-fiber-algebra
see-also:
  - effect
  - capability-passing
  - capability-non-amplification
  - governance-as-modal-restriction
  - exercise-capability
---

# Capability

An *unforgeable token of authority* granting its holder the ability to perform a specific operation on a specific resource. Capabilities are the substrate's mechanism for *fine-grained, transferable, revocable authority* — a more flexible alternative to ambient role-based authorization.

Per [capability-non-amplification](../theorems/capability-non-amplification.md) (proved), capabilities are the substrate-side instance of the call-graph [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md): each call is an edge in $R$, and the callee's available capability is the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) applied to the caller's:

$$\mathrm{available}_g(p) \;=\; \Box_R u_f \;=\; \bigwedge_t \{R(w_f, w_g) \to u_f\}$$

evaluated along all caller edges. Per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), the strong implication $R(w_f, w_g) \to u_f$ is monotone in $u_f$: a smaller caller-capability gives a smaller callee-capability, and there is no choice of $R(w_f, w_g)$ that produces a callee-capability strictly higher in the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) than $u_f$. *Capability non-amplification is structural to the modal operator*, not an extra check the runtime adds. Holding a capability for operation $o$ on resource $r$ at context $w$ is what makes $\Box_R(o\text{-on-}r) \neq \mathbf{f}$ at $w$; absent the capability, the call's modal-necessity check at the operation's required cell collapses.

## Structural fields

- **Operation ↔ predicate coordinate.** What the capability authorizes — `read`, `write`, `invoke`, `delegate`. Structurally the operation is a predicate in the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md); a capability is a value at the (operation, resource) cell.
- **Resource ↔ subject coordinate.** Which substrate entity (or scope, or sublocale) the capability applies to. Together with the operation, the resource indexes the cell in the predication fiber the capability values.
- **Holder ↔ accessibility-edge endpoint.** Currently held by which agent, account, or function-invocation context. Structurally the holder is the world coordinate $w_g$ at which the capability's $\Box_R$ is evaluated; per [exercise-capability](../morphisms/exercise-capability.md), only the current holder's exercise verifies against the substrate's accessibility cells.
- **Provenance ↔ accessibility-edge chain.** How the capability was obtained: granted by an authority, derived from another capability, born with the holder. Per [capability-record](../objects/capability-record.md)'s `provenance` field and the theorem's Part 2, capabilities derived by delegation are exactly $\Box_R$ along the delegation edge — bounded above (in knowledge order) by the parent.
- **Revocation status ↔ accessibility-cell value.** Whether the capability has been revoked. Revocation is the substrate-edit that sets the corresponding accessibility cell to $\mathbf{f}$ from the holder's world.

## Capability-based vs. role-based authorization

The contrast is structural — two different shapes of accessibility relation:

- **Role-based (RBAC) ↔ ambient-fiber accessibility.** "Agent has role admin → admin can write to resource $r$." Authority is *ambient* — anyone with the role can do anything the role allows. Structurally the accessibility relation has $R(w, w') = \mathbf{t}$ for *all* worlds $w$ in the role-fiber, regardless of holding any specific token; the modal restriction reduces to a role-membership check.
- **Capability-based (CapBAC) ↔ token-edge accessibility.** "Agent holds capability `write:r` → agent can perform `write` on `r`." Authority is *referenced* — having the capability is the proof, the capability can be passed to other holders, the capability can be revoked. Structurally the accessibility cell $R(w, w_{\text{op}})$ is keyed on the *holder-edge* of a specific token, and the cell's value is what the modal operator restricts.

CapBAC composes well with [effect](effect.md) systems: a function with effect `Write[r]` requires the caller to pass a `write:r` capability. Per [capability-passing](capability-passing.md), the substrate's call-conventions make capability-passing explicit — exactly because the accessibility relation needs the holder-edge present at each call edge to compute the callee's $\Box_R$.

## Engineering invariants

- **Principle of least authority.** Per the theorem's first engineering consequence, a function receives only the capabilities it needs; if it tries to do more, the substrate refuses — the modal operator at the unauthorized cell is $\mathbf{f}$.
- **No ambient authority.** Per the theorem's Part 1, the substrate's runtime has no ambient capability environment a function can read from outside its parameters. Functions cannot "just call the file system" — they can only use capabilities admitted by an inbound accessibility cell. A runtime that admits ambient reads breaks the modal restriction.
- **Delegation preserves authority bounds.** Per the theorem's Part 2, capabilities derived by delegation are bounded above by the parent in the knowledge order. A capability `write:file-X` cannot be delegated to produce `write:file-Y`; delegation is the modal $\Box_R$ along the delegation edge, monotone in the parent's value.
- **Authority is modal.** Per the theorem's Part 3 and [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (status: sketch), authority composes via the modal accessibility relation. A function attempting an operation without an admissible $\Box_R$ value fails the modal check; per [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md), the check terminates in PSPACE.
- **Holder-verified exercise.** Per the theorem's Part 4 and [capability-record](../objects/capability-record.md), only the current holder can exercise. A function holding only $\{c_1, \ldots, c_n\}$ cannot exercise some other capability $c'$ — exercise checks the holder against the substrate's recorded accessibility cells.
- **Audit-friendly.** Per the theorem's second engineering consequence and [witness](../../../objects/witness.md), the capabilities a function exercises are recorded; auditors can verify functions only used what was passed.
- **Federation-safe.** Per the theorem's third engineering consequence, cross-substrate capability passing inherits these properties; a function on a peer substrate cannot exceed what its caller's capabilities admit.
- **Self-representable.** Per [self-representation](../../teaching/explanations/self-representation.md), capabilities are substrate content. Capability grants, transfers, and revocations are substrate operations producing witnesses. Per [witness](../../../objects/witness.md), an auditor can trace which capabilities were exercised when, by whom.

## Composition with governance

Capabilities and governance are two surfaces on the same modal apparatus. Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (status: sketch), governance is the modal-necessity restriction on the agent's capability fiber along the *governance graph*. Per the present theorem, capability-passing is the modal-necessity restriction on the same fiber along the *call graph*. The two accessibility relations compose: an agent's authority at a call site is the meet $\Box_{R_{\text{gov}}} u_a \wedge_t \Box_{R_{\text{call}}} u_a$ — restricted both by the governance graph's authority constraints and by the call graph's capability-passing constraints. Neither restriction can be bypassed by the other; both must admit the operation.

## What the discipline refuses

- **Ambient-environment capability reads.** Per the theorem's first rule-out, a function that reads ambient capabilities from the runtime's environment instead of its parameters violates Part 1. The substrate's response is to refuse the function's invocation if its declared effect signature does not match the inbound capabilities.
- **Amplifying delegation.** Per the theorem's second rule-out, a capability-derivation rule that produces a capability with broader authority than its parent violates Part 2. The substrate's modal operator is monotone in the parent's value; no derivation rule can produce a value higher in the knowledge order.
- **Unverified capability requirements.** Per the theorem's third rule-out, a runtime that allows function calls without verifying capability requirements violates the substrate's modal-restriction discipline. Each call must compute the modal restriction at the call edge before admitting the callee.
- **Unrecorded exercise.** A capability exercise that does not produce a witness breaks audit-replayability: an auditor cannot reconstruct which capabilities the function actually used. Per [witness](../../../objects/witness.md), every exercise produces a witness keyed on `(holder, capability-record-hash, operation, resource, tick)`.

## Position in the platform

Capability is the functional-runtime platform's *fine-grained authority surface*: the substrate's representation of who may perform which operation on which resource, transferable along the call graph and verifiable at every call edge. Together with [capability-passing](capability-passing.md) (the call-convention surfacing capabilities at call edges), [effect](effect.md) (the graded specification of which capabilities a function requires), [exercise-capability](../morphisms/exercise-capability.md) (the operation that consumes a capability to perform its authorized action), [governance](../../agential-orchestration-platform/concepts/governance.md) (the cross-call authority restriction), and the modal-necessity operator (the underlying math), capability completes the platform's account of authority's path from grant to exercise. The substrate-side observable of every operation is one or more capability witnesses; the structural guarantee is that no operation is admitted whose required modal-necessity value at the call site is $\mathbf{f}$.
