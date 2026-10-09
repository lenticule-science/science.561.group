---
type: theorem
class: engineering-claim
status: proved
depends-on: [authentication-flow, session-establishment, account, modal-necessity-operator, bilattice-accessibility-relation, governance-as-modal-restriction, signature-binds-witness-to-identity, capability-non-amplification]
see-also: [governance-decision-modal-decidability, trust-boundary-modal-validity]
---

# A user session is the modal restriction of the account's capability fiber along the authentication accessibility cell

**Claim.** For any successful [authentication-flow](teaching/explanations/authentication-flow.md) producing a [session](teaching/explanations/session-establishment.md) for account $a$ via authentication-method $m$ on user-agent $u$, the session's effective capability is

$$\mathrm{session\_capability}(a, m, u) \;=\; (\Box_R u_a)_{w_u} \;=\; \bigwedge_t \{R(w_a, w_u) \to u_a\}$$

where:
- $u_a$ is the account's underlying capability fiber (per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md))
- $R$ is the substrate's [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md)
- $w_a$ is the world of the account
- $w_u$ is the world of the authenticated user-agent
- $R(w_a, w_u) \in \mathbf{L}^\bowtie$ is the accessibility cell whose grade reflects the authentication method's strength

The session's effective capability is therefore *bounded above* (in the [knowledge order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md)) by the account's capability — a session can never exceed the account's authority. Per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), this non-amplification property is structural, not enforced.

## Why this holds

Per [authentication-flow](teaching/explanations/authentication-flow.md), a successful authentication produces a verified signature binding the user-agent's identity-key to the account. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the verified signature establishes that the user-agent is *the account's authorized representative* — a verified accessibility from the account's world to the user-agent's world.

In the substrate's bilattice accessibility relation $R$, this corresponds to:

- *Before authentication*: $R(w_a, w_u) = \bot$ (uninformed — substrate has no record of the user-agent).
- *During authentication*: the substrate verifies the signature; the accessibility cell transitions to a value reflecting the authentication-method strength.
- *After authentication*: $R(w_a, w_u) = \mathbf{t}$ for strong methods (public-key, MFA), a graded $\mathbf{t}$ for medium methods (password), or a stronger or weaker grade for other methods.

Per [modal-necessity-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md), the modal necessity $\Box_R$ on the account's capability fiber $u_a$ at the user-agent's world $w_u$ is exactly the substrate's "what can this user-agent do as the account":

$$(\Box_R u_a)_{w_u} = \bigwedge_t \{R(w_a, w_u) \to u_a\}$$

The strong implication $\to$ on the bilattice (per [twist-product-right-residual](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md)) ensures:

- If $R(w_a, w_u) = \mathbf{t}$ (full accessibility), the session's capability equals the account's: $(\Box_R u_a)_{w_u} = u_a$.
- If $R(w_a, w_u) = \bot$ (uninformed), the implication collapses unless $u_a$ is itself $\mathbf{t}$ — most cells become uninformed for the session, restricting capability.
- If $R(w_a, w_u) = \mathbf{f}$ (denied access), the implication only holds for $u_a = \mathbf{f}$ cells — the session is admitted only on inadmissibility-claims, effectively no capability.

Per [modal-necessity-basic-properties](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md), $\Box_R$ preserves $\wedge_t$, preserves $\mathbf{t}$, and is monotone — so the session's capability is structurally bounded above by the account's, never strictly higher.

## Engineering consequence

- **No session privilege escalation.** Per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), a session cannot exercise more authority than the account holds. The bound is structural to $\Box_R$, not enforced by an authorization layer the substrate must police.
- **Authentication-strength corresponds to accessibility-grade.** A weaker authentication method (password) produces a lower accessibility-grade than a stronger one (hardware-token public-key). Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), the bilattice supports graded accessibility — the substrate represents authentication strength directly in $R$.
- **Step-up authentication is accessibility-cell strengthening.** When a session needs higher capability for a sensitive operation, the step-up authentication-flow (per [authentication-flow](teaching/explanations/authentication-flow.md)) strengthens $R(w_a, w_u)$. The session's $\Box_R$ value at the strengthened cell admits operations that were previously bounded out.
- **Session revocation is accessibility-cell collapse.** Per [session-establishment](teaching/explanations/session-establishment.md), revocation moves $R(w_a, w_u)$ to $\mathbf{f}$. Per the modal evaluation, the session's capability collapses immediately on the next $\Box_R$ check.
- **Cross-device session independence.** Different user-agents authenticating to the same account get distinct accessibility cells $R(w_a, w_{u_1}), R(w_a, w_{u_2})$. Their session capabilities are computed independently; per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), per-device revocation doesn't affect other devices.
- **Authorization decision is decidable.** Per [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md), every authorization check on the session is a $\Box_R$ evaluation that terminates in PSPACE.

## What the theorem rules out

- **Sessions exceeding account authority.** A session that exercises capability the account doesn't hold is not implementing $\Box_R$ — it's bypassing the modal restriction. Per [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md), the substrate refuses such sessions.
- **Sessions surviving account revocation.** If the account's identity-record is revoked, $u_a$ collapses (the underlying capability fiber loses its authority basis); per the theorem, all sessions' capabilities collapse via the modal evaluation.
- **Sessions ignoring authentication-method strength.** A "session" treating all authentication methods as equally strong fails to use the bilattice's accessibility-grading. Per [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md), grading is structural; collapsing it loses substrate information.
- **Sessions without modal evaluation.** A "session capability" computed by ad-hoc rule (e.g., "if user is admin, allow everything") is not a $\Box_R$ evaluation — it doesn't compose with the substrate's other modal disciplines (governance, federation, capability-passing).

## What the theorem requires

- The substrate's bilattice accessibility relation $R$ is recorded as substrate content (per [self-representation](../../teaching/explanations/self-representation.md)).
- The authentication-flow produces a verifiable signature (per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md)).
- The substrate implements $\Box_R$ per [modal-necessity-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md).
- The session-establishment discipline correctly admits the session and capability cells per [session-establishment](teaching/explanations/session-establishment.md).

## Position

This theorem grounds the substrate's user-session discipline in the predication-categories' modal apparatus. Together with [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (governance is modal restriction on the agent's fiber), [capability-non-amplification](../../functional-runtime-platform/theorems/capability-non-amplification.md) (call-graph non-amplification), [trust-boundary-modal-validity](../../../theorems/trust-boundary-modal-validity.md) (boundary admission is modal validity), and [governance-decision-modal-decidability](../../../theorems/governance-decision-modal-decidability.md) (decisions are decidable), it completes the substrate's modal-authorization picture. Authentication, session, governance, federation trust, and capability passing are all $\Box_R$ evaluations on the same bilattice accessibility relation — the substrate's authorization discipline is structurally one phenomenon at five engineering surfaces.
