---
name: modal-restriction
description: "The discipline that modes are sub-restrictions of an office's full capability fiber: within a session, an agent's active mode further constrains what it can do below what the office grants."
type: concept
class: framing
depends-on: [mode, scope-as-fiber, office-record]
see-also: [mode-record, transition-mode, check-authorization]
title: modal-restriction
---

# Modal restriction

The discipline that *modes are sub-restrictions of an office's full capability fiber*: within a session, an agent's active *mode* further constrains what it can do below what the office grants.
A mode does not add capabilities; it restricts them.
The agent in *plan mode* has fewer powers than the agent in *act mode*, even though both operate under the same office.
Mode transitions are substrate edits per [`transition-mode`](../code/transformers/transition-mode.md); the substrate's audit chain records every transition.

The framing is the convergent prior-art finding from Cline and Bussard: modes are *hard restrictions*, not advisory toggles.
In Cline's Plan/Act split, Plan-mode literally removes write tools from the agent's available toolset — the tools don't exist while Plan-mode is active.
In Bussard, flight-mode and repl-mode and ssh-mode each constrain the substrate's command set differently.
The pattern: a mode is *a different restriction over the same office*.

The discipline depends on [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md): the agent's effective scope is the composition of agent + office + mode contributions.
A mode contributes a `restricts` fiber that further narrows what the office grants.
Authorization decisions per [`check-authorization`](../code/transformers/check-authorization.md) read the effective scope; mode contributions show up in the result.

## What modes do

A mode SHALL contribute exactly two kinds of cells to scope composition:

- **Removals.** Predicates the mode removes from the agent's effective `writes` (and, less commonly, `reads`).
  The cells where the office's `writes` had `t` become $\bot$ (no opinion) after composition with the mode's `restricts: f` cells, OR they become $\top$ (contested between office's grant and mode's denial).
  The realization's authorization rules treat $\bot$/$\top$ on a `writes` cell as denial.
- **Substitutions.** A mode MAY *replace* a skill in the office's constructor set with a different skill.
  The substitution is encoded as a removal of the original skill's reference plus an addition of the substitute.
  Used for context-specific tool variants (an "interactive-mode-grep" vs. a "batch-mode-grep").

A mode SHALL NOT *add* powers the office did not grant.
Modes are restrictions; expansions require an office change (per [`transition-mode`](../code/transformers/transition-mode.md)'s discipline, mode transitions don't expand authorization).

## Mode-as-substrate-entity

Per [mode-record](../objects/mode-record.md), a mode is a substrate entity with its own [`Note`](../objects/note.md) and frontmatter predications.
Adding a mode to the substrate's mode catalog is creating a `ModeRecord` entity; modifying a mode's restrictions is editing predications; retiring a mode is retraction.
Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the substrate's mode vocabulary is queryable like any other substrate content.

A session's *active mode* is a predicate on the [`SessionRecord`](../objects/session-record.md): `active-mode: <mode-record-reference>`.
Mode transitions edit this predicate per [`transition-mode`](../code/transformers/transition-mode.md).
A session MAY have a default mode (set at `open-session`) and MAY transition modes during its active phase.

## Why mode-as-restriction (not as expansion)

The discipline that modes only restrict (never expand) is a substantive engineering commitment.
It rules out a class of authorization mistakes:

- **No mode-elevation attack.** An agent cannot acquire authorization it didn't have by transitioning to a higher-privilege mode.
  The substrate doesn't have higher-privilege modes; it has *more-restrictive* modes and the office's *full* mode (no restriction).
  Privilege expansion requires office change, which is a substrate edit involving a charter/governance authority.
- **No mode-confusion attack.** Two operators reading the substrate cannot disagree on the agent's authorization due to one knowing about a mode the other doesn't.
  The substrate carries the active mode; the substrate's read-discipline produces consistent reads.
- **Replay-coherent.** A past action's authorization can be verified against the substrate's recorded mode state at action-time.
  The mode is in the substrate; the substrate's audit chain records every mode transition.

## Composition with kit-assembly

Per [kit-assembly](../kit-assembly/kit-assembly.md), a session's working fiber at start is the composition of office + agent + mode + rule-system + active-skill-set.
The mode's contribution to the kit is its restriction fiber; the rest of the kit (constructors, observation-set, etc.) is bounded by what survives the restriction.

When a mode transitions during a session (per [`transition-mode`](../code/transformers/transition-mode.md)), the kit is *re-assembled*: the agent's working fiber is recomposed with the new mode's restrictions in place of the old.
Skills the new mode disallows become substrate-invisible to the agent for the duration of the new mode; skills the old mode disallowed but the new mode permits become available again.

## What modal restriction is not

- **Not a UI feature.** A "mode" in some systems is a UI-level distinction (chat mode vs. command mode).
  FARS modes are *substrate authorization restrictions*, surface-independent.
  The same mode applies regardless of whether the agent is operating from a CLI, an MCP server, a TUI, or a web interface.
- **Not a workflow state.** A workflow state is a runtime predicate that determines what comes next.
  A FARS mode is a substrate predicate that determines what is *admissible*.
  The two are different kinds of operational artifacts.
- **Not optional.** A FARS session SHALL have an active mode at all times during `active` and `paused` phases.
  Sessions without modes operate under the office's full unrestricted scope; the absence-of-restriction IS itself a mode (often called `default` or `unrestricted`), expressed as a `ModeRecord` whose `restricts` fiber is empty.

## Position

Modal restriction is the framing under which sessions can be *partially* authorized within an office's full grant.
Without modes, an office's authorization is monolithic — all-or-nothing.
With modes, the substrate admits operationally meaningful sub-restrictions: review-modes that disable writes, planning-modes that disable mutations, observation-modes that disable everything but observation events.

The framing depends on [`mode`](../../teaching/explanations/mode.md) (AgOP concept), [`mode-record`](../objects/mode-record.md) (FARS instantiation), and [scope-as-fiber](../scope-as-fiber/scope-as-fiber.md) (the underlying scope-composition discipline).
It composes with [`transition-mode`](../code/transformers/transition-mode.md) (the operator) and [`check-authorization`](../code/transformers/check-authorization.md) (where mode contributions show up).
