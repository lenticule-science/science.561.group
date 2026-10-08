---
type: definition
class: substrate-entity
realizes: [immunity]
depends-on: [immunity, duty-record]
see-also: [privilege-record, power-record]
title: Immunity record
description: "An immunity record is the substrate-entity formal definition of an immunity: the predication-graph entity declaring that the cited target cannot be required to perform a particular obligation, regardless of whether the target exercises…"
---

# Immunity record

An **immunity record** is the substrate-entity formal definition of an [immunity](teaching/explanations/immunity.md): the predication-graph entity declaring that the cited target *cannot be required to* perform a particular obligation, regardless of whether the target exercises any related power.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary (e.g., "guest-reader immunity from identification-disclosure duties").
- **`shields-from-duty`** — reference to the [duty-record](../../../office/duty/duty-record/duty-record.md) the immunity protects against.
  An immunity without a cited duty is meaningless.
- **`for-target`** — references to the entities (agents, offices, communities, kinds-of-entities) the immunity protects.
  Like privilege but unconstrained by power-exercise: the immunity applies whether or not the target is exercising any related power.
- **`scope`** — references to the scopes within which the immunity applies.
- **`source`** — reference to the substrate authority (a [governing soul](../../../agent/governing-soul/governing-soul.md) provision, a [governance-decision](../../governance-decision/governance-decision.md) record, a federation-handshake commitment) that granted the immunity.
  Immunities are not merely declared; they are granted by traceable authorities.
- **`conditions`** — optional further constraints.
- **`grantable-by` / `revokable-by`** — typically more constrained than for powers/duties; immunities protect against obligation, so revoking them affects the target's ongoing protection.
- **`closure-kind`** — `immunity`.

## Invariants

- **Shielded duty exists.** The cited duty is substrate-resident.
- **Source-traceable.** The granting authority is cited; immunities lacking cited sources are rejected per substrate audit discipline.
- **Stronger than privilege.** Where a [privilege](teaching/explanations/privilege.md) exempts a duty *when the privileged target exercises a related power*, an immunity exempts the duty *whether or not the target acts*.
  The substrate's check ordering is: immunity first, then privilege, then duty applicability.
- **Substrate-resident.** Per self-representation, immunity records are substrate content.

## Operations

- *Grant.* Per the immunity's grantable-by, an authorized entity inserts an immunity predication on the target.
  The grant produces a witness.
- *Apply.* When the duty's substrate-checking closure rule fires for the target, it first consults the target's immunity predications: if a matching immunity is found, the duty is *categorically* skipped for this target (regardless of the target's actions or power exercises).
- *Revoke.* Per [revoke](../../revoke/revoke.md), the immunity predication is retracted; the target's duty obligation may be restored.
  Per the immunity's source, revocation may require the original-granting authority's consent.

## Position in the platform

Immunity records are the substrate-recorded *protections from obligation*.
They are what lets the platform support: structurally-protected roles (governance overseers immune from operational duties), guest accounts (read-only-immune-from-identity-checks), federation participants (immune from local-only obligations), and emergency exemptions (governance-granted immunities during incident-response).

The discipline is what makes the platform's protection scheme auditable: every immunity has a source, every immunity has a target, every immunity cites its shielded duty.
An audit can answer "what immunities does this agent hold, granted by whom, citing what authority?" by substrate traversal.
