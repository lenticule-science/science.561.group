---
title: "Principal"
description: "Unified vocabulary for actors with capability fibers. system, personnel, office, persona-agent, peer, daemon, driver, session, agent. What they share; what distinguishes them; sender semantics."
kind: spec
status: normative
version: "0.2"
---

# Principal

A **principal** is anything that can be a sender or holder of capabilities.
Many specs use principals; this spec collects the vocabulary.

## 1. The principal kinds

| Slug pattern | Kind | Has private key? | Capability fiber held in | Lifetime |
|---|---|---|---|---|
| `system` | substrate kernel | node-key | $\Rightarrow$-vacuous (unrestricted) | substrate lifetime |
| `personnel:<slug>` | real person | personnel's keypair (offline) | personal cells | indefinite |
| `office:<slug>` | functional role | (uses incumbent's key) | office cells | indefinite |
| `persona:<slug>` | named authoring identity | persona's keypair | persona cells | indefinite |
| `peer:<node-id>` | federation peer | peer node's keypair | trust-graph cells | indefinite |
| `session:<id>` | execution context | (uses owning personnel's key) | composed at open | bounded |
| `daemon:<slug>` | long-running session | (uses configured key) | daemon's session fiber | indefinite |
| `driver:<slug>` | interfacer | driver's keypair | driver's capability declaration | while attached |
| `agent:<slug>` | agential entity | agent's keypair | agent record's capabilities | per session |

## 2. Capability fiber composition

Per [security/capability-model.md](../security/capability-model.md), every principal has a capability fiber.
When a principal acts (sends a respond), their fiber composes with the payload via $\Rightarrow$:

```
bounded-payload = principal.fiber ⇒ payload
```

For composite principals (session of personnel acting-as office), the fiber is composed:

```
session.fiber = personnel.fiber ⊙ office.fiber
session-respond.bounded-payload = session.fiber ⇒ payload
```

## 3. Sovereign vs. functional vs. transient

Three classes:

**Sovereign** principals represent authority structurally:

- `system` — the kernel; absolute authority within a substrate.
- `peer:<id>` — another sovereign substrate; bilateral trust.

Sovereigns have keys held by no individual personnel.
Their authority comes from substrate construction (system) or cryptographic federation (peer).

**Personal/functional** principals represent named entities:

- `personnel:<slug>` — a real person.
- `office:<slug>` — a functional role.
- `persona:<slug>` — a named identity (separate from personnel per [security/persona-and-personnel.md](../security/persona-and-personnel.md)).
- `agent:<slug>` — agential entity per agential-orchestration-platform.

These have substrate-cell records and (often) keypairs.
Personnel and personae have keys directly; offices use the incumbent's key.

**Transient** principals:

- `session:<id>` — a bounded-lifetime execution context that composes higher-level principals.
- `daemon:<slug>` — long-lived session marked `kind: daemon`.
- `driver:<slug>` — substrate-resident interfacer.

Transient principals have effective fibers computed from their configured composition; they don't persist authority beyond their lifetime.

## 4. Sender resolution

When a respond is invoked with `sender = X`:

1. Substrate verifies X is a known principal.
2. Substrate looks up X's capability fiber.
3. If the call originates externally (HTTP/MCP), substrate verifies the call's signature against X's public key (or a delegate's, per session tokens).
4. The bounded payload is computed.
5. Closure rules fire on the bounded payload.

If sender is omitted: defaults to `system` for kernel-internal calls, or rejected if external auth is required (per [deployment/production-config.md](../deployment/production-config.md)).

## 5. Principal records

Every non-system principal has an entity record (per [substrate-entity-records.md](substrate-entity-records.md)) with `kind` matching the table in §1.
Common additional predicates per kind in the relevant subsystem spec.

## 6. Cross-principal operations

When personnel A acts as office X, the substrate records:

```
session.personnel = personnel:A
session.acting-as = office:X
session.capability-fiber = personnel:A.fiber ⊙ office:X.fiber
```

The session's events are attributed to both: `(event, authored-by-personnel, personnel:A)` AND `(event, authored-as-office, office:X)`.
Audit can query either.

## 7. Persona privacy

Per persona-and-personnel discipline, persona-attributed events do NOT leak personnel attribution (the operating personnel is in session metadata only, not on the event).
External observers see persona signatures.

## 8. Federation

`peer:<node-id>` principals are federation peers.
Their authority is bounded by [security/federation-trust.md](../security/federation-trust.md).
Cross-peer events sign on the peer's node key; verify against the local trust-graph.

## 9. PredCat grounding

A principal's capability fiber is a **predication fiber** in the truth-bilattice over the principal's authority predicates.
Composition via $\odot$ extends authority (knowledge join); $\Rightarrow$ restricts (residual).
Non-amplification (per [functional-runtime-platform/theorems/capability-non-amplification](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/)) is forced by the algebra: $\Rightarrow$ cannot produce a value above $\le_t$ of its argument.

## 10. Cross-references

Principals appear in:

- [security/capability-model.md](../security/capability-model.md) — capability fibers, $\Rightarrow$ check.
- [security/persona-and-personnel.md](../security/persona-and-personnel.md) — personnel/office/persona distinctions.
- [security/federation-trust.md](../security/federation-trust.md) — peers.
- [process/session-as-process.md](../process/session-as-process.md) — sessions.
- [drivers/driver-model.md](../drivers/driver-model.md) — drivers.
- [admin/personnel-lifecycle.md](../admin/personnel-lifecycle.md) — lifecycle of personnel principals.

## 11. Conformance

Principals pass:

1. Every principal kind has a corresponding cell representation per §1.
2. Capability fibers compose correctly across personnel/office/persona/peer.
3. Persona-attribution doesn't leak personnel.
4. Transient principals have bounded lifetimes.
5. Sovereign principals' authority is structurally enforced.
