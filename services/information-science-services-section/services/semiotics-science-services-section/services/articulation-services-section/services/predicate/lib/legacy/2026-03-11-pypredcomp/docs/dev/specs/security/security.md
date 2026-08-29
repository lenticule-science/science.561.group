---
title: "Security"
description: "The OS's security model: capability fibers via $\\Rightarrow$, signing/witnessing, persona/personnel separation, federation trust, sandbox/fuel."
kind: index
---

# Security

The OS uses **capability discipline**, not ACLs.
Every authorization is a capability fiber; the substrate's $\Rightarrow$ operator IS the capability check.

## Specs (to be written at v0.2)

- `user-as-boundary.md` — **entry point.** A user is a boundary entity that projects four fibers (auth, authz, attention, history); personnel/office/persona-agent are projections of the boundary, not independent records.
  The boundary model grounds every other security spec.
- `capability-model.md` — capabilities as substrate cells; non-amplification by construction; capability fiber composition via $\Rightarrow$.
- `signing-and-witnessing.md` — Ed25519 signatures on every authoritative action; witness-chain Merkle structure; signed events.
- `persona-and-personnel.md` — the personnel, office, and persona-agent projection operators; capability composition and persona-quotient privacy expressed through the boundary model.
- `federation-trust.md` — peer public keys; trust-graph closure rules; capability flow across federation respects sovereignty.
- `sandbox-and-fuel.md` — closure-fuel + memory ceiling + concurrency cap; per-session resource accounting.
- `tool-risk-scoring.md` — every tool call's `audit-log` cell carries a numeric risk score and four-band classification (`low`/`medium`/`high`/`critical`); scored at emit time against a pinned `risk-profile` cell; closure rules subscribe to `high` (surface) and `critical` (block-pending-confirmation) bands.
  Risk is observability; capability discipline is authorization.
  Per [decisions/tool-calls-are-risk-scored-at-log-time.md](../../decisions/tool-calls-are-risk-scored-at-log-time.md).

## Theory grounding

Security implements:

- `predicated-computing/concepts/signature` — signature primitives.
- `predicated-computing/morphisms/verify-signature` — verification at receive time.
- `predicated-computing/concepts/encryption` — encryption-region cells.
- `predicated-computing/objects/witness` — Merkle-chain audit structure.
- `agential-orchestration-platform/concepts/governance` — authority structure.
- `agential-orchestration-platform/concepts/authorization` — authorization as substrate operation.
- `agential-orchestration-platform/concepts/privilege`, `power` — capability grading per formality-layer.
- `agential-orchestration-platform/concepts/scope`, `office` — namespace/authority boundary.
- `agential-orchestration-platform/concepts/personnel-vs-office` — separation discipline.
- `agential-orchestration-platform/concepts/formality-layer` — F0 (syntax) through F6 (governance).
- `agential-orchestration-platform/theorems/governance-as-modal-restriction` — load-bearing theorem.
- `agential-orchestration-platform/theorems/dispatch-composes-authorization` — composition commutes.
- `functional-runtime-platform/concepts/capability` — capability primitive.
- `functional-runtime-platform/concepts/effect` — declared side-effect.
- `functional-runtime-platform/theorems/capability-non-amplification` — load-bearing theorem.
- `interactive-application-platform/concepts/authentication-method` — auth methods.
- `interactive-application-platform/morphisms/authenticate-user` — authentication primitive.
- `interactive-application-platform/theorems/account-uniqueness-and-attribution` — one account per person.

## Conformance

Security passes:

1. An unauthorized respond is rejected with `PCA_SCOPE_INSUFFICIENT`.
2. A signed event from an unknown peer is rejected with `PCF_PEER_UNKNOWN`.
3. Capability passing does not amplify: a delegated capability cannot grant authority beyond the delegator's.
4. Persona/personnel separation: a persona projection cannot impersonate a personnel projection and vice versa; the persona projection's quotient property hides the operating boundary from downstream consumers.
5. Sandbox enforcement: a session exceeding its fuel budget is terminated with `PCR_FUEL_EXCEEDED`.

## Plan 9 / Unix analogue

| Unix concept | Security analogue |
|---|---|
| User/group/permissions (rwx) | Capability fiber via $\Rightarrow$ |
| `chmod` | Update a capability cell |
| `chown` | Update an `owner` cell |
| `sudo` | Capability escalation via signed delegation |
| SSH | Capability-token over WebSocket |
| TLS / SSL | Encryption-region cells |
| `passwd` | Update authentication-method record |
| factotum (Plan 9) | Capability authority cells per personnel |

The substrate's capability discipline is structurally stronger than Unix permissions: $\Rightarrow$ enforces non-amplification at the algebra level.
Unix's `setuid` permits amplification by construction; the substrate's algebra forbids it.
