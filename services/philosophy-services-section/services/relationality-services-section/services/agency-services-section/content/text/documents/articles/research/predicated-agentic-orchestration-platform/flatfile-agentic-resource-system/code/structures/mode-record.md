---
name: mode-record
description: Mode record
type: definition
class: record
instantiates: [mode, mode-record]
depends-on: [modal-restriction, scope-as-fiber, fiber]
see-also: [transition-mode, session-record, office-record, check-authorization]
title: mode-record
---

# Mode record

The substrate-record holding one *mode* — a named restriction that an agent activates within a session to constrain its operations below the office's full grant.
A `ModeRecord` is FARS's realization of AgOP's [mode-record](../../../objects/mode-record.md) at the bilattice value-domain.

Per [modal-restriction](../../modal-restriction/modal-restriction.md), modes only restrict (never expand): a mode's `restricts` fiber removes predicates from the agent's effective scope.
Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the mode is itself a substrate entity; new modes are added by creating new `ModeRecord` entities; modifying a mode is editing predications.

Common modes across realizations: `default` (no restriction; the office's full grant); `plan` (writes disabled; analysis and planning only); `act` (writes enabled within the office's full grant); `review` (mutations disabled; observations and analysis only); `pause` (everything disabled except resume-session).
Realizations MAY add domain-specific modes.

## Required fields

Every conforming realization SHALL hold, for each `ModeRecord`:

### Identity

- **`name`** — canonical mode identifier (e.g., `default`, `plan`, `act`, `review`, `pause`).
- **`description`** — human-readable account of what the mode does and when to use it.

### Restriction content

- **`restricts`** — the fiber of restrictions.
  Predicates the mode *removes* from the agent's effective `writes` and (occasionally) `reads`.
  Cells in this fiber typically carry `f` (denial) on predicates the mode disallows; composing the mode's `restricts` with the office's `writes` produces $\top$- or $\bot$-cells on the disallowed predicates per [scope-as-fiber](../../scope-as-fiber/scope-as-fiber.md).
- **`restrict-channels`** — list of channels the mode restricts.
  May restrict emit-policy on a channel (the agent cannot emit on `mutation` while in `review` mode) or read-policy (a more locked-down mode disallows reading certain channels).
  Channel-level restrictions compose with the channel's own `emit-policy` and `read-policy` per [`Channel`](channel.md).
- **`substitutions`** — optional list of skill-substitution pairs.
  A mode MAY replace a skill with a more-restrictive variant (e.g., `interactive-grep` → `batch-grep` in `unattended` mode).
  Encoded as `[<original-skill-ref>, <substitute-skill-ref>]` pairs; at kit assembly, the substitutions are applied per [kit-assembly](../../kit-assembly/kit-assembly.md).

### Activation

- **`activation-policy`** — predication-pattern declaring who can activate this mode.
  May reference agent capabilities, office authority predicates, scope conditions.
  The pattern is read by [`transition-mode`](../transformers/transition-mode.md) to verify admissibility.
- **`default-for-offices`** — optional list of office references for which this mode is the default at session-open.
  An office that defaults to `review` mode opens its sessions with `review` active; the agent must transition to `act` (with policy permission) to mutate.

### Composition

- **`compose-with`** — declares whether this mode composes with other modes (modes-as-stack) or is exclusive (modes-as-state-machine).
  FARS commits to *exclusive* modes by default — at most one mode is active per session — but admits realization-level mode-stacks for richer authorization layering.

### Description-level

- **`tags`** — classification labels (`safety`, `audit`, `planning`, `interactive`).
  Used for filtering and dispatch.

## Invariants

- **Substrate entity.** A `ModeRecord` SHALL be a substrate entity, addressable like any other.
- **Restriction-only.** A mode's `restricts` fiber SHALL only remove predicates from the agent's effective scope.
  A mode whose restriction *adds* a `t`-cell where the office had $\bot$ is non-conformant — modes do not expand authorization.
- **Substrate-resident activation policy.** The `activation-policy` SHALL be substrate content (predications), not realization-side code.
  A realization that hard-codes mode-activation rules has lost the substrate's discipline.
- **Replay-stable.** A session's mode transitions SHALL produce substrate events; replay reproduces the mode trajectory and the resulting authorization decisions.
- **Composable.** Modes that declare `compose-with` properties SHALL compose without producing surprises.
  Two modes whose restrictions interact (e.g., `review` AND `read-only-channels-only`) compose pointwise via [`compose`](../morphisms/compose.md); the composition's $\top$-cells are detectable per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md).

## How modes are used

A session opens with a mode (declared at [`open-session`](../morphisms/open-session.md) or defaulting from the office).
Mode transitions during the session are substrate edits per [`transition-mode`](../transformers/transition-mode.md): the session's `active-mode` predicate is updated, the kit is re-assembled, and the transition event is recorded.

Authorization checks per [`check-authorization`](../transformers/check-authorization.md) read the session's effective scope, which already includes the active mode's contribution.
The mode is *not* re-checked per action; its effect is in the working fiber, which is the substrate's read-time view.

## What a `ModeRecord` is not

- **Not a flag.** A flag is a runtime boolean.
  A mode is a *substrate entity* with structure (restrictions, substitutions, activation policy).
  The mode IS substrate-visible; its effects are in the substrate's fiber compositions.
- **Not a workflow state.** A workflow state determines what comes next; a mode determines what is *admissible*.
  The two can co-exist (a session can be in `act` mode AND in `runbook-step-3` workflow state) but they are different substrate predicates.
- **Not a permission set.** A mode is a *restriction over an existing permission set* (the office's).
  It cannot exist outside an office's grant.

## Position

`ModeRecord` is the substrate-record under which sub-restrictions are first-class.
Without mode records, sessions would have monolithic authorization; with mode records, sessions can shift authorization scope mid-flight in substrate-recorded ways.

The record composes with [`OfficeRecord`](office-record.md) (whose grant the mode restricts), [`SessionRecord`](session-record.md) (which carries the active mode), [`Channel`](channel.md) (whose policies modes can further restrict), and [kit-assembly](../../kit-assembly/kit-assembly.md) (the operation where the mode's contribution is applied).
