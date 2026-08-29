---
title: "Authorization is one mechanism: modal restriction"
description: "Capability-model, federation-trust, persona-and-personnel session-open, governance authority, account auth, and agent self-queueing are six engineering surfaces of one substrate primitive — modal restriction $\\Box_R$ on the substrate's accessibility relation. The OS implements one $\\Box_R$ evaluator and parameterizes it per surface."
kind: decision
date: "2026-05-02"
status: committed
---

# Authorization is one mechanism: modal restriction

## What

Authorization across the OS — capability discipline, federation trust, persona/personnel session-open, governance authority, account authentication, and agent self-queueing — is a *single* substrate primitive applied at six surfaces.
The primitive is the modal necessity operator $\Box_R$ acting on the substrate's predication fiber-algebras, where $R$ is the substrate's *one* bilattice accessibility relation indexed by world-pair type per surface.

Concretely, the OS implements one $\Box_R$ evaluator.
Each authorization surface — capability check, federation receive, session-open under a projection, governance vote tally, login, agent dispatch — calls that evaluator with the surface-appropriate sub-region of $R$ and the surface-appropriate fiber-algebra.
The structural properties (non-amplification, decidability, monotonicity, $\wedge_t$-preservation) hold uniformly across all six surfaces because they are properties of $\Box_R$ as a mathematical operator, not facts re-derived per subsystem.

The substrate's $\Rightarrow$ operator (per [decisions/capability-not-acl.md](capability-not-acl.md)) is the surface form of $\Box_R$ at the call-graph fiber.
Federation peer admission per [specs/security/federation-trust.md](../specs/security/federation-trust.md) is the same operator at the federation accessibility sub-region.
Session-open under a projection per [specs/security/persona-and-personnel.md](../specs/security/persona-and-personnel.md) §5 is $\Box_R$ on the boundary's projection-restricted authz fiber.
The composed authorization end-to-end (a user authenticates → opens a session → calls a federated peer → into a governed region) is a chain of $\Box_R$ applications, non-amplifying by construction per `predicated-computing/theories/functional-runtime-platform/theorems/capability-non-amplification`.

Per [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md).
The six grounding theorems (`agential-orchestration-platform/theorems/governance-as-modal-restriction`, `predicated-computing/theorems/trust-boundary-modal-validity`, `predicated-computing/theorems/federation-trust-bilattice-graded`, `predicated-computing/theories/functional-runtime-platform/theorems/capability-non-amplification`, `predicated-computing/theorems/authentication-as-modal-restriction`, `predicated-computing/theorems/agent-self-queueing-bounded-by-modal-restriction`) each provide one surface; the unification theorem proves they are *structurally one phenomenon*.

## Why

The OS would otherwise carry six authorization implementations — an ACL-or-capability check, a federation peer-trust check, a session projection check, a governance-vote-authority check, a login check, an agent-queue-budget check — each maintained independently, each prone to drifting from the others.
Per the unification theorem, a substrate that implements $\Box_R$ once *gets all six surfaces* by parameterization.
Implementations don't write six checkers; they write one and configure it.
The algebra carries the discipline.

This rebases [capability-not-acl.md](capability-not-acl.md), [federation-by-construction.md](federation-by-construction.md), and [identity-is-boundary-projection.md](identity-is-boundary-projection.md) onto a common foundation without weakening any of them: capability fiber composition via $\Rightarrow$, federation envelope admission, and projection composition at session-open are now three calls to one evaluator.
The composition law (a federated session opened under a persona projection authorising a call into a governed region) is a four-step $\Box_R$ chain whose end-to-end bound is the weakest grade in the chain — non-amplification end-to-end, by the same theorem that gives non-amplification per surface.

The decidability claim matters for v0.2.
Per `predicated-computing/theorems/governance-decision-modal-decidability`, $\Box_R$ evaluation terminates in PSPACE.
Composed chains of fixed length are also PSPACE-decidable. v0.2's authorization budget can therefore be reasoned about uniformly: the engine's per-respond fuel envelope (per [decisions/cost-is-lawvere-quantale.md](cost-is-lawvere-quantale.md)) bounds the chain length, and chain length bounds total authorization cost.

The captain has been clear across the archive that "we have better math than anyone else who has built an OS."
This decision turns one of those math results into the v0.2 architecture: authorization is not six subsystems with parallel disciplines, it is one substrate primitive at six surfaces.
The implementation simplification is structural.

Source: `predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive` (proved); the six per-surface grounding theorems cited in §1 of that theorem; archive notes on capability discipline (`capability-not-acl`, `federation-by-construction`, `identity-is-boundary-projection`).

## What it rules out

- **Per-surface authorization implementations.** v0.2 must not ship a federation-trust checker that is a different code path from the capability checker, nor a session-projection check that is a different code path from the federation-trust check.
  Per the theorem, all are $\Box_R$ at different sub-regions of one $R$.
- **Authorization that bypasses $\Box_R$.** A "fast path" (e.g. "localhost is always authorised", "the captain personnel is always authorised", "loopback federation skips signature check") breaks the structural discipline.
  Bypasses are non-conformant.
- **Inconsistent authorization decisions across surfaces.** If governance authorises an action but the trust-boundary doesn't admit the actor, or federation trusts a peer but the session-projection check rejects, the substrate's discipline is to surface the conflict as a $\top$-cell in the inconsistency sheaf per [`audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md), not to silently resolve.
- **Authorization caches that ignore $R$ updates.** Per `predicated-computing/theorems/cache-coherence-via-functorial-projection`, authorization caches are content-addressed by the relevant sub-region of $R$; $R$-changes propagate cohomologically.
- **A "policy server" external to the substrate.** Authorization decisions live in the substrate's algebra; an external policy engine is a non-substrate authority, contradicting [self-representation-everywhere.md](self-representation-everywhere.md).

## What it does not constrain

- The specific accessibility-relation predicates per surface.
  (Defined per surface spec: capability grants in [specs/security/capability-model.md](../specs/security/capability-model.md), peer trust grants in [specs/security/federation-trust.md](../specs/security/federation-trust.md), `holds-office` / `operates-persona` projection-authorisation predicates in [specs/security/persona-and-personnel.md](../specs/security/persona-and-personnel.md).)
- The wire encoding of authorization witnesses.
  (Per [signing-and-witnessing.md](../specs/security/signing-and-witnessing.md); each $\Box_R$ evaluation produces a witness on the same chain.)
- Whether to expose Unix-style authorization shims (`chmod`, `setuid`-equivalent) for compatibility.
  The OS may project to such surfaces for tooling; the underlying discipline remains $\Box_R$.
- The decidability bound's tightness.
  PSPACE is the worst-case theoretical bound; in practice $\Box_R$ chains in v0.2 are short and constant-time per surface.
- How additional projection surfaces (a future `peer-boundary` projection, a `service-account` projection) are added.
  Adding a surface is parameterising the same $\Box_R$ evaluator with a new sub-region of $R$; not a structural change.
