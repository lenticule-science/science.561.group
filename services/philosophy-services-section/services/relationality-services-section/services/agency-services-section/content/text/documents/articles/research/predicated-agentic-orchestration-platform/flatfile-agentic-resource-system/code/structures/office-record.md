---
name: office-record
description: Office record
type: definition
class: record
instantiates: [office, office-record]
depends-on: [office-as-fuzzy-cell, agential-self-generation, formality-progression, fiber]
see-also: [agent-record, skill-record, runbook-record, seven-channel-decomposition]
title: office-record
---

# Office record

The substrate-record holding one *office* — the action-domain entity that bundles identity, authority, normative system, deontic profile, accountability, action-domain, capabilities, and installation into one substrate-resident structure.
An `OfficeRecord` is FARS's realization of AgOP's [office-record](../../../objects/office-record.md) at the bilattice value-domain.
Per [office-as-fuzzy-cell](../../office-as-fuzzy-cell/office-as-fuzzy-cell.md), an office is a *cell*: site, fibers, constructors, laws, with mixed formality across components.

An office is *what an agent inhabits* to do work.
Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the office IS the record: an office that is not representable as a substrate entity is outside the substrate.
An [`AgentRecord`](agent-record.md) carries an `offices` predicate listing the offices it currently inhabits; the agent's effective capabilities are the union of its own skill list and its offices' constructor sets.

The universal office template emerged from prior-art analysis of operational substrates: every office record needs identity, authority, normative system, deontic profile, accountability, action domain, capabilities, and installation predications.
The eight-component template is what makes offices uniformly *queryable* — the substrate can answer "who can do X?", "is Y accountable for Z?", "what work can office X handle?", "is this office authorized for Y?" via fiber composition over the template's predicates.

## Required fields

Every conforming realization SHALL hold, for each `OfficeRecord`:

### Core identity

- **`name`** — canonical identifier.
- **`title`** — human-readable office title (e.g., "First Officer", "Operations Officer", "Bookkeeper").
- **`type`** — what kind of office (`coordination`, `production`, `governance`, `analytical`, `support`, `boundary-crossing`).
- **`description`** — narrative account of the office's role and remit.
- **`department`** — reference to the parent department or scope-bearing entity.

### Authority

- **`authority-source`** — who or what authorized this office to exist (charter, predecessor office, captain directive, federation peer).
  A predicate chain leading back to substrate-installation.
- **`weber-type`** — `traditional` | `charismatic` | `rational-legal`.
  The Weberian classification of how the office's authority is grounded.
- **`scope-dimensions`** — the five-dimension scope of the office's authority:
  - **`positional`** — what position the office occupies (e.g., bridge, engineering)
  - **`substantive`** — what subject matter the office governs
  - **`temporal`** — when the office's authority is in force
  - **`jurisdictional`** — what entities the office's decisions bind
  - **`who-bound`** — explicit list of entities or scopes this office's decisions apply to

### Normative system

- **`charter-bindings`** — list of [`ClosureRuleRecord`](closure-rule-record.md) (or charter rule entity) references that bind THIS office.
  Not all charter rules bind every office; this predicate names the applicable subset.
- **`installation-anchored`** — boolean indicating whether the office's authority depends on a continuous installation chain.
  If true, retraction of any link in the chain retires the office; if false, the office persists across personnel changes.

### Deontic profile (Hohfeldian)

The four Hohfeldian positions, all four required for a complete office specification:

- **`duties`** — what the office MUST do.
  Predicates the office is *bound* to fulfill; failure to fulfill is a substrate-coherence diagnostic on the `guard` channel.
- **`powers`** — what the office CAN command.
  Predicates declaring the substrate-edits or dispatch-decisions the office is admitted to perform.
- **`privileges`** — what the office MAY do without asking.
  Actions admissible without further authorization.
- **`immunities`** — what the office CANNOT be forced to do.
  Actions outside the office's compulsion-set; a captain directive ordering an immune action produces $\top$ on the office's authority fiber.

### Accountability

- **`bearer`** — the entity (agent, personnel, or external party) accountable for the office's outputs.
- **`accountability-scope`** — what dimension of outputs the bearer is accountable for (decisions, dispatch, output quality, schedule).
- **`non-transferable`** — boolean.
  If true, the bearer cannot delegate accountability; if false, accountability can flow to a delegate.
- **`escalation-path`** — ordered list of office references the office escalates to when its work exceeds its scope.

### Action domain

- **`entities-governed`** — predication-pattern declaring which substrate entities are within the office's action domain.
- **`channels-read`** — list of [`Channel`](channel.md) names the office consumes (per [seven-channel-decomposition](../../architecture/seven-channel-decomposition/seven-channel-decomposition.md)).
- **`channels-write`** — list of channel names the office produces to.
- **`state-transitions`** — declared state-transitions on entities within the action domain (e.g., a task office may change task status from `open` to `in-progress` to `completed`).

### Capabilities

- **`work-types`** — what kinds of work the office handles (`process`, `derivation`, `procedure`, `inquiry`).
- **`provides-capabilities`** — capability predicates the office contributes to its agents.
- **`constructors`** — list of [`SkillRecord`](skill-record.md) and [`RunbookRecord`](runbook-record.md) references the office grants its agents.
  The office's *constructor set* per [office-as-fuzzy-cell](../../office-as-fuzzy-cell/office-as-fuzzy-cell.md).
  Universally F3 across offices.
- **`settlement-path-position`** — declares where the office sits on the [formality-progression](../../formality-progression/formality-progression.md) scale, per-component (its site's formality, its constructors' formality, its laws' formality, its fibers' formality).
  Used by sharpening operators to target the office's least-formal component for next-pass refinement.

### Installation

- **`felicity-conditions`** — predication pattern that SHALL hold for the office's installation to be valid.
  If conditions fail, the office is *not really installed* and its authority is in $\top$-state.
- **`installation-mechanism`** — how the office gets installed (charter declaration, peer ratification, captain directive, federation-handshake admission).
- **`installation-markers`** — predicates marking that the office IS installed.
  The substrate-visible signs of installation.

## Invariants

- **Substrate entity.** An `OfficeRecord` SHALL be a substrate entity.
  Editing the office is editing predications; retiring the office is retraction; transferring the office is rename + re-installation.
- **Universal-template-conformant.** Every office SHALL hold predicates for all eight components (core identity, authority, normative system, deontic profile, accountability, action domain, capabilities, installation).
  An office missing components is an *underspecified office*; the substrate's `analysis`-channel rules surface it for sharpening.
- **Per-component formality declared.** The `settlement-path-position` predicate SHALL hold per component, declaring formality at F0–F3 per [formality-progression](../../formality-progression/formality-progression.md).
  Offices are explicit about *which parts of themselves are still prose*.
- **Authority-scoped.** Office actions outside the declared `scope-dimensions` produce $\top$ on the office's authority fiber and are blocked by the `guard` channel.
- **Witness-attributed.** Every action the substrate records as having been performed by an agent *qua* this office SHALL cite the office in addition to the agent in the witness.

## What an `OfficeRecord` is not

- **Not a job description.** Job descriptions are prose narratives meant for human reading.
  An office record is substrate content the algebra operates on.
  (See [office-as-fuzzy-cell](../../office-as-fuzzy-cell/office-as-fuzzy-cell.md).)
- **Not a permission list.** The office's authority is computed from `scope-dimensions`, `powers`, and `privileges` via fiber composition, not from a permission lookup table.
- **Not a person.** An office is the *role*; the agent is *who inhabits it*.
  One office may be inhabited by different agents over time; one agent may inhabit several offices simultaneously.
  The relationship is declared on `AgentRecord.offices` and on `OfficeRecord.bearer`, not implied.

## Position

`OfficeRecord` is the substrate-level statement of "this office exists, with these eight components specified, at these formality levels."
It is what makes the *agent-side substrate* coherent: agents inhabit offices; offices grant constructors; constructors invoke skills; skills produce witnesses; witnesses accumulate into the substrate's history.

The record composes with [`AgentRecord`](agent-record.md) (the inhabitant), [`SkillRecord`](skill-record.md) and [`RunbookRecord`](runbook-record.md) (the constructor set), [`Channel`](channel.md) (the channels the office reads/writes per the seven-channel decomposition), and [`HeartbeatRecord`](heartbeat-record.md) (the heartbeat at the office's scope ticks the office's entities).
