---
type: definition
class: substrate-entity
realizes: [privilege]
depends-on: [privilege, duty-record]
see-also: [power-record, immunity-record]
title: Privilege record
description: "A privilege record is the substrate-entity formal definition of a privilege: the predication-graph entity declaring that an exercise of a power by the cited target is exempt from a normally-attached duty."
---

# Privilege record

A **privilege record** is the substrate-entity formal definition of a [privilege](teaching/explanations/privilege.md): the predication-graph entity declaring that an exercise of a [power](teaching/explanations/power.md) by the cited target is exempt from a normally-attached [duty](teaching/explanations/duty.md).

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary (e.g., "editor's interpretive-focus privilege exempts source-attribution duty for editorial commentary").
- **`exempts-duty`** — reference to the [duty-record](../../../office/duty/duty-record/duty-record.md) the privilege exempts.
  A privilege without a cited duty is meaningless; the privilege relaxes a specific obligation.
- **`for-power`** — optional reference to the [power-record](../../power/power-record/power-record.md) whose exercise the privilege applies to.
  When absent, the privilege exempts the cited duty for all of the target's powers.
- **`for-target`** — references to the entities the privilege applies to: agents, offices, agent communities.
  The privilege is target-specific.
- **`scope`** — references to the scopes within which the privilege applies.
  A privilege in scope $\sigma_1$ does not transfer to $\sigma_2$ unless explicitly declared.
- **`conditions`** — optional further constraints: only during particular [modes](mode-record.md), only on particular kinds of targets, only when prerequisite predications are present.
- **`grantable-by` / `revokable-by`** — like powers and duties, governance discipline applies.
- **`closure-kind`** — `privilege`.

## Invariants

- **Exempted duty exists.** The cited duty is a substrate-resident [duty-record](../../../office/duty/duty-record/duty-record.md); a privilege exempting an undefined duty is a violation.
- **Target authorization-coherent.** The cited target is an entity (agent, office, community) the substrate's authorization machinery recognizes.
  A privilege for an undefined target is rejected.
- **Subset of duty's applicability.** The privilege's conditions cannot be broader than the duty's applicability — a privilege cannot exempt a duty in scopes the duty does not apply to in the first place.
- **Substrate-resident.** Per self-representation, the privilege record is substrate content.

## Operations

- *Grant.* Per the privilege's grantable-by, an authorized entity inserts a privilege predication on the target.
  The grant produces a witness; the target's effective duties on the next operation reflect the exemption.
- *Apply.* When the duty's substrate-checking closure rule fires for the target, it consults the target's privilege predications: if a matching privilege is found, the duty is skipped for this target's exercise.
- *Revoke.* Per [revoke](../../revoke/revoke.md), the privilege predication is retracted; the target's duty obligation is restored.

## Position in the platform

Privilege records are the substrate-recorded *carve-outs* in the platform's duty system.
Without privileges, duties are universal across the actors they apply to; with privileges, the platform supports nuanced authorization where particular roles operate under different obligations.

The pattern is what makes role-specific exemptions expressible as substrate content: a "research lead's privilege of choosing interpretive focus" is a privilege-record citing the source-attribution duty as exempted, the research-lead office as the for-target, the research scope as the scope, and the interpretive-focus condition as the qualifier.
