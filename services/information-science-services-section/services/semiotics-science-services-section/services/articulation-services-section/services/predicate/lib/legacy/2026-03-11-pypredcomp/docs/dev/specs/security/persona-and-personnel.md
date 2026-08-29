---
title: "Persona and personnel"
description: "Personnel, office, and persona-agent are projections of the boundary entity (per user-as-boundary.md). One bulk, many projections; persona-agent projections are quotients that do not leak the operating boundary."
kind: spec
status: normative
version: "0.2"
---

# Persona and personnel

The substrate distinguishes three operator classes — **personnel**, **offices**, and **persona-agents** — but these are not three independent record kinds.
Each is a *projection* of a boundary entity at a particular surface, per [user-as-boundary.md](user-as-boundary.md).
Capability discipline, audit, and federation honour the projection boundaries.

This spec specifies the three projection operators, the records they exhibit at each surface, and the disciplines that the projection algebra enforces.
It rebases the previous flat-record framing onto the boundary model without weakening any guarantee.

Per [decisions/persona-and-personnel-distinct.md](../../decisions/persona-and-personnel-distinct.md) and [decisions/identity-is-boundary-projection.md](../../decisions/identity-is-boundary-projection.md).

## Grounded in

- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — projection composition at session-open (§5) is $\Box_R$ on the boundary's projection-restricted authz fiber; the persona-projection quotient property (§6) is the per-surface specialization that prevents privacy leakage by a $\Box_R$-decidable read of the projection sub-region.
  Per [decisions/authorization-is-modal-restriction.md](../../decisions/authorization-is-modal-restriction.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Personnel projection

The **personnel** projection exposes a boundary at the legal/social surface.
It is the projection used for personal work and for legal/social accountability.
The slug `personnel:emsenn` resolves to `boundary:emsenn` under the personnel projection operator.

A personnel-projected view of the boundary surfaces:

```json
{
  "kind": "personnel-projection",
  "boundary": "boundary:emsenn",
  "slug": "personnel:emsenn",
  "name": "Morgan Sennhauser",
  "email": "morgan.sennhauser@gmail.com",
  "public-key": "<base64>",
  "joined-at-ord": 0
}
```

Operationally:

- **Auth fiber.** The personnel projection consults the boundary's `(boundary:B, auth-method, ed25519:<pubkey>)` cells with the personnel surface tag; the corresponding private key is held by the bulk.
- **Authz fiber.** The personnel projection's authz fiber is the boundary's authz fiber with no acting-as composition (full authority over the boundary's own substrate region; constrained by office composition for cross-region work).
- **Sign-as.** Events authored under the personnel projection are signed by the boundary's personnel-surface key.
- **Membership.** Personnel-projected boundaries can be ship members, peer-confederacy members, partners.
  Visibility/scope per substrate predicates.

A boundary with a personnel projection MUST carry at least one `(boundary:B, auth-method, ...)
` cell tagged for the personnel surface.
Personnel records that do not resolve to a boundary are rejected with `PCB_BOUNDARY_NOT_FOUND`.

## 2. Office projection

The **office** projection composes a boundary with an office's own grants.
An office is a substrate entity (a fuzzy cell with members) whose authz fiber is added to the boundary's authz fiber when the boundary acts under the office.

Office records remain first-class substrate entities; they are not projections of any single boundary, because they have their own existence (they may be vacant; their grants stand even when no boundary occupies them).

```json
{
  "kind": "office",
  "id": "<sha256>",
  "slug": "office:planner",
  "name": "Planner",
  "duties": ["task-routing", "milestone-tracking", "campaign-orchestration"],
  "members": ["boundary:emsenn"],
  "formality-layer": "F2",
  "capability-grants": [
    {"predicate": "respond", "target-pattern": "task:*"},
    {"predicate": "set", "target-pattern": "milestone:*"}
  ]
}
```

The office projection operator `office(boundary:B, office:R)` returns a fiber iff `(boundary:B, holds-office, office:R) = t`.
The session's authz fiber is then `boundary-authz ⊙ office-authz`, bounded by $\Rightarrow$ at session-open per [user-as-boundary.md](user-as-boundary.md) §4.

Operationally:

- **Fuzzy cells.** Members may have varying degrees of incumbency (per agential-orchestration-platform's office concept).
  The `members` predicate is a fiber.
- **Capability composition.** A session opened "as office:planner" inherits the office's capability grants composed with the boundary's, never amplifying.
- **Duties.** Expressed as substrate predicates; referenced by closure rules ("dispatch to whichever office holds duty X").
- **Multi-office occupation.** A boundary may hold multiple offices simultaneously; each office projection is a distinct surface.
- **Vacancy.** An office may be vacant; capability grants to a vacant office are dormant.

## 3. Persona-agent projection

The **persona-agent** projection rebases a boundary onto a persona's own keypair.
The persona-agent is itself a substrate entity (a content commitment by the captain — Cassia Lorne, Calder Underhill, Josh Blevins — distinct from any personnel-projected boundary).

```json
{
  "kind": "persona-agent",
  "id": "<sha256>",
  "slug": "persona:cassia-lorne",
  "name": "Cassia Lorne",
  "operated-by": ["boundary:emsenn"],
  "public-key": "<base64>",
  "publication-channels": ["activitypub:cassia.561.local", "matrix:@cassia:561.local"],
  "voice-style": "<reference-cell>",
  "active": "True"
}
```

The persona projection operator `persona(boundary:B, persona:P)` returns a fiber iff `(boundary:B, operates-persona, persona:P) = t`.
Crucially, the projection is a **quotient**: when a session is opened under the persona projection, every authored event is signed by the persona's keypair (not the operating boundary's), and downstream consumers see the persona's surface only.

Operationally:

- **Distinct keypair.** Persona-agents have their own Ed25519 keypair; events are signed at the persona's surface, not the operating boundary's.
- **`operated-by` is one-way.** The cell `(persona:P, operated-by, boundary:B)` lives in the substrate but is reachable only from the operating-boundary's sub-fiber.
  The persona projection's image does not include `operated-by`-reverse cells.
  Reading the operating boundary from the persona surface requires the `privileged-cross-projection` capability or returns `PCB_PRIVACY_PROJECTION_VIOLATION`.
- **Publication.** Persona-published cells federate as `(cell:..., authored-by, persona:P)`; ActivityPub envelopes carry the persona's signature only.
- **Multi-operator.** A persona may be operated by multiple boundaries (e.g., a shared editorial persona).
  The quotient property holds: downstream consumers cannot distinguish which boundary authored a given persona-event without privileged access.
- **Cannot impersonate.** A persona-projected session cannot author events under a personnel or office projection; capability discipline enforces by $\Rightarrow$.
- **Cannot be impersonated.** A boundary not in the persona's `operated-by` cannot project under the persona; session-open returns `PCB_PROJECTION_NOT_AUTHORISED`.

## 4. Why three projections (rebased)

The three projections aren't decorative — each captures a different surface at which the bulk relates to the system:

- **Personnel** is the legal/social surface.
  Real names, real keys, real legal/social accountability tied to the bulk.
- **Office** is the functional surface.
  Roles exist regardless of the boundary occupying them; capability flows through office structure, composed with the boundary's authz fiber.
- **Persona-agent** is the publication surface.
  Cassia Lorne's substack is by Cassia Lorne; the substrate honours this; federation honours this; readers who follow Cassia follow the persona surface, not the operating boundary.

This matters for:

- **Federation.** Peers see persona signatures, not personnel signatures, on persona-published content.
  The persona projection is a quotient over the operating boundary.
- **Audit.** A change attributed to `office:planner` tells you the office surface; the boundary that acted in that office is one projection step deeper, reachable through the personnel-projected `holds-office` cell.
- **Capability flow.** Granting authority to an office grants it to whichever boundary occupies the office (composed with the boundary's authz fiber); granting to a personnel projection grants directly to the boundary.
- **Persona publication.** A persona's substack/publication is by the persona projection, not by the operating boundary; readership is to the persona surface.

## 5. Session attribution

A session is opened by a boundary acting through some projection.
The session-record carries:

| Field | Meaning |
|---|---|
| `boundary` | The opening boundary slug. |
| `acting-as` | The projection surface (`personnel`, `office:R`, `persona:P`). Empty acting-as ≡ personnel projection. |

Concrete cases:

- **Personnel work.** `session.boundary = boundary:emsenn`, `session.acting-as = personnel`.
  The personnel projection's auth and authz fibers are loaded.
- **Office-bound work.** `session.boundary = boundary:emsenn`, `session.acting-as = office:planner`.
  The personnel projection composes with the office projection; authz = `boundary-authz ⊙ office-authz`.
- **Persona authoring.** `session.boundary = boundary:emsenn`, `session.acting-as = persona:cassia-lorne`.
  The persona projection rebases auth to the persona's keypair; downstream consumers see persona-only.

The session's effective authz fiber is the composition; the substrate's $\Rightarrow$ then bounds the session's effect.
Per [process/session-as-process.md](../process/session-as-process.md) §8.

## 6. Disclosure discipline

Persona-agent content **does not** leak operating-boundary attribution.
This is structural via the projection quotient (per [user-as-boundary.md](user-as-boundary.md) §5):

- Persona-published cells have `(cell:..., authored-by, persona:P)` only; the operating boundary is in the boundary's sub-fiber, not on the cell.
- Federation peers see persona signatures, not boundary signatures.
- An external observer cannot reconstruct which boundary operates a persona without the `privileged-cross-projection` capability.
- Multiple boundaries operating one persona project to indistinguishable persona-cells (the projection is a quotient).

The same discipline runs in the other direction: a boundary's office projection does not leak its other office memberships unless explicitly composed; a boundary's personnel projection does not leak its operated personas unless explicitly composed.

## 7. Office vacancy and rotation

- An office may be vacant.
  Capabilities granted to a vacant office are dormant; the substrate doesn't fire rules requiring the office's authority until a boundary occupies it.
- Office occupation transitions are substrate events: `(boundary:B, holds-office, office:R, t)` and `(boundary:B, holds-office, office:R, f)`.
- Transition events are signed by an authority capable of office assignment (typically the captain or an explicitly-empowered office).
- A boundary may resign from an office; the projection composition updates within one heartbeat tick.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCA_PERSONA_IMPERSONATION` | Attempt to author a personnel-signed event from a persona projection's session, or vice versa. |
| `PCA_OFFICE_NOT_OCCUPIED` | A respond requires office authority; the office is vacant. |
| `PCA_OFFICE_MEMBER_INVALID` | An office's `members` cell references an entity that doesn't resolve to a boundary. |
| `PCA_PERSONA_OPERATED_BY_INVALID` | A persona-agent's `operated-by` doesn't resolve to a boundary. |
| `PCB_PROJECTION_NOT_AUTHORISED` | Attempt to open a session under a projection the boundary doesn't carry (e.g., `acting-as: persona:cassia-lorne` without `operates-persona`). |
| `PCB_PRIVACY_PROJECTION_VIOLATION` | Attempt to read the operating boundary from a persona projection without `privileged-cross-projection`. |

## 9. Implementation

### Python (v0.2+)

- Personnel, Office, Persona-Agent are pydantic projection-view models built from a `Boundary` plus the projection operator's surface tag.
- Capability fiber composition uses the same algebra as cell composition: $\odot$-merge across the boundary + office + persona authz sub-fibers.
- Session attribution is a session-record predicate (`session.boundary`, `session.acting-as`); the projected authz fiber is cached at session-open.
- The privacy projection (§6) is enforced at projection-read time by $\Rightarrow$, not by a separate filter layer.

### Rust (v0.2+)

- The above with serde-derived structs and trait-implemented projection operators on `Boundary`.

## 10. Conformance

Persona/personnel discipline passes:

1. **Distinct surfaces.** Personnel-projection keys ≠ office authority ≠ persona-projection keys.
  A signature against the wrong surface key is rejected with `PCA_PERSONA_IMPERSONATION`.
2. **Composition.** A session opened by `boundary:emsenn` acting-as `office:planner` has authz fiber = `boundary-authz ⊙ office-authz`.
  Test: assert known cells reachable / not reachable.
3. **Persona privacy.** Cells published under `persona:cassia-lorne` projection contain no operating-boundary attribution; reading the operating boundary from the persona surface requires `privileged-cross-projection` or returns `PCB_PRIVACY_PROJECTION_VIOLATION`.
4. **Office vacancy.** Capabilities granted to a vacant office are dormant; respond returns `PCA_OFFICE_NOT_OCCUPIED`.
5. **Projection-not-authorised.** Opening a session with `acting-as: persona:P` from a boundary lacking `operates-persona` returns `PCB_PROJECTION_NOT_AUTHORISED`.
6. **Cross-language equivalence.** Same boundary state + same session-open + same payload → same effective projection fibers and same dispatch outcome in Python and Rust.

## 11. Plan 9 / Unix analogue

| Unix concept | Persona/personnel projection analogue |
|---|---|
| User (UID) | Personnel projection of a boundary |
| Group (GID) | Office (with member predicates) |
| Multiple groups per user | Boundary holds multiple offices; each is a distinct projection |
| `setuid` | Forbidden — would amplify across projection composition; substrate forbids by $\Rightarrow$ |
| `sudo` | Office projection composition |
| Anonymous user | Persona projection over a `nobody`-equivalent boundary |
| Service account | Persona projection whose `operated-by` is an automation boundary |
| Pseudonymous publication | Persona projection's quotient property |
