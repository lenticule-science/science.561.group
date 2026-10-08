---
type: definition
class: substrate-entity
realizes: [mode]
depends-on: [mode, authorization]
see-also: [view-record, mode-transition]
title: Mode record
description: "A mode record is the substrate-entity formal definition of a mode: the predication-graph entity declaring a particular interaction-phase constraint on an agent's view."
---

# Mode record

A **mode record** is the substrate-entity formal definition of a [mode](teaching/explanations/mode.md): the predication-graph entity declaring a particular interaction-phase constraint on an [agent](teaching/explanations/agent.md)'s [view](../../scope/view/view.md).
A mode record specifies *which authorizations are active* during the mode, how the mode is entered, and how it is exited.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary (e.g., "planning mode: read-only access to substrate, no mutations admitted").
- **`active-powers`** — references to [power-records](../../governance/power/power-record/power-record.md) (or power references) admissible during the mode.
  Powers not in this list are *suppressed* during the mode, regardless of the agent's general authorization.
- **`active-duties`** — references to [duty](teaching/explanations/duty.md) entities active during the mode.
  Modes may impose additional duties (a debugging mode might add a duty to record-rationale) or may suppress duties (a read-only mode suppresses write-related duties because no writes happen).
- **`entry-conditions`** — predications declaring what must be true to enter the mode: which other modes the agent must be in, which authorization the agent must hold, which substrate state must obtain.
- **`exit-conditions`** — predications declaring when the mode may be exited: completion of work-types, agent-issued exit, time elapsed, governance-issued forced-exit.
- **`mutually-exclusive`** — references to other mode records that cannot be active simultaneously.
  The substrate's coherence rules consult this on [mode-transition](../mode-transition/mode-transition.md).
- **`required-witness`** — declaration of the witness format mode entry/exit produces.
- **`scope`** — references to the scopes within which the mode is admissible.
- **`closure-kind`** — `mode`.

## Invariants

- **Active-powers is a subset.** The mode's active-powers must be a subset of the agent's general authorization (or the office's, etc.).
  A mode cannot grant authorizations the agent does not already hold; it can only narrow.
- **Entry/exit conditions checkable.** The conditions are substrate-checkable predications; out-of-band conditions are violations.
- **Mutually-exclusive declared.** Mode pairs that cannot be simultaneously active are explicitly declared; the substrate's validation flags any active-mode pair lacking a mutual-exclusion declaration.
- **Substrate-resident.** The mode record is itself substrate content; a mode that lives only in runtime state is out-of-band.

## Operations

- *Enter.* Per [mode-transition](../mode-transition/mode-transition.md), the mode is entered by setting the agent's session active-mode predication to this mode's id.
  The mode's active-powers are now the upper bound on the agent's effective authorization for the duration.
- *Exit.* The mode is exited by retracting the active-mode predication (or replacing it with another mode's id).
  The agent's effective authorization returns to the general-without-mode level (or to the new mode's bounds).
- *Edit.* Editing a mode record (changing active-powers, entry/exit conditions) produces a new version.
  Active sessions in the mode at the time of edit may continue under the previous version (depending on substrate policy) or be re-entered into the new version (governance-decided).

## Position in the platform

Mode records are the platform's *phased-authorization unit*.
They let the platform express that a single agent's authority varies across phases of a session — planning, editing, committing — without proliferating session-types or agent-types.
Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), modes are themselves substrate entities; adding a new mode is editing the substrate, not modifying the runtime.

Common platform modes:

- **Plan mode.** Mutations suppressed; agent can read, query, propose.
  Entered when planning a multi-step operation; exited when the plan is committed for execution.
- **Edit mode.** Specific mutations active (typically scoped to a particular target entity); other operations narrowed.
- **Read-only mode.** All mutations suppressed; only [traversal](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) and analysis admissible.
  Used for safe inspection.
- **Debug mode.** Additional powers active (substrate-introspection access) and additional duties (record full witness chain).
- **Emergency mode.** Some duties suspended (faster decision flow), additional escalation paths active.
  Usable only when triggered by governance.
