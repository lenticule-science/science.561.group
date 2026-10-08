---
name: ships-harness-different-substrate-classes
description: "Ships harness different substrate-classes; the ship-record schema doesn't distinguish them"
type: question
class: harness-discipline
status: open
depends-on: [swarm, ../../teaching/explanations/boundary]
see-also: [harness-as-deployment-substrate-projection, mcp-client-as-swarm-participant]
title: ships-harness-different-substrate-classes
---

# Ships harness different substrate-classes; the ship-record schema doesn't distinguish them

The 561 Group polity has at least three ships of materially different *substrate-class*:

- **Ack** — a digital-system ship (a VPS).
  Its harness surface is computable: a Nix flake describes how to deploy fars on it, the OS is a software target, the runtime is bytes-and-processes.
- **Gnalens** — a digital-system ship (a personal laptop).
  Same class as Ack: computable, Nix-flake-projectable.
- **RSC Quiescent** — *not* a digital-system ship.
  The captain's framing: "more... a vibespace that I manifest with my being."
  It harnesses things like human labor, gardens, embodied attention, physical presence.
  Some aspects have computable artifacts (calendars, todo lists, written intentions); the *substrate* is not bytes-and-processes.

The `kind: ship` schema is uniform across these: same fields (slug, title, designation, captain, status, voyage, home-office, crewed-by-offices).
The fields the nix-flake harness consumes (`nix-system`, `role` ad-hoc) work for the digital ships and are simply absent on RSC Quiescent — that's how the harness skips it.
But the *absence* of fields is a poor stand-in for the *kind* of ship.
The substrate currently has no record-level distinction between "this is a thing the digital harness reaches" and "this is a thing the digital harness *can never* reach because that's not what it is."

## Why this matters

The captain's framing extends the harness mechanism beyond Nix and beyond digital systems: "FARS needs to harness more than just digital systems."
Different substrate-classes need different harnesses:

- *Digital system* — Nix flake, container image, cloud-deployment manifest.
- *Embodied / mixed* — daily protocols, attention-allocation discipline, physical environment maps, garden plans, human-labor commitments.
- *Organizational* — meeting cadences, office staffing, voyage records.

These are real and the substrate is meant to reach them.
The current ship-record schema flattens them; the [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md) discipline implies they should be structurally distinguished, because the boundary fiber is parameterized by what kind of substrate the boundary is *to*.

## Candidate readings

1. **A `substrate-class:` field on ship records.** Values like `digital`, `embodied`, `organizational`, `mixed`.
  The harness mechanism's dispatch table chooses which harness applies based on this field.
  Simple, explicit, captures the distinction the captain just drew.

2. **A `harnessable-via:` list on ship records.** Each ship declares which harnesses can project from it (`["nix-flake", "calendar"]`, `["embodied-protocol"]`, etc.).
  More flexible — a ship might be partially-digital — but adds a maintenance burden of keeping the list in sync.

3. **No new field; harnesses self-select via inputs.** A harness reads what fields a ship provides; if it has the inputs, it projects; if not, it doesn't.
  The current nix-flake harness already does this (filters by `nix-system`).
  Lightweight but invisible — there's no substrate-level statement of *what kind of thing* a ship is.

The third is what we have today.
The first is the most direct response to the captain's distinction.
The second is the most general but feels like premature flexibility.

## Sub-questions

- *Are some ships of *no* harnessable substrate-class*?
  RSC Quiescent might be partly harnessable (calendars, intent records) but partly not (embodiment proper).
  If the substrate-class is multi-valued, the schema should support that — `substrate-classes:` list rather than singular field.
- *Does the harness mechanism's "extract/apply/compose" interfacer discipline change shape across substrate-classes?* For digital, extract/apply are about bytes and processes.
  For embodied, what are they?
  The captain's daily protocol is a kind of "apply" against the embodied substrate; observation is a kind of "extract."
  The triple may generalize cleanly, or it may need a parallel triple for non-digital substrates.
- *How does the cost-discipline interact with non-digital substrates?* Digital cost is computable (CPU-time, dollars per inference).
  Embodied cost is real but differently-structured (attention, fatigue, time-of-day).
  The cost-quantale's `[0, ∞]` shape may need extension or specialization.

This question lives upstream of any further harness work.
The nix-flake harness ships in its rough form because it only handles one class; closing this question is what lets us draft the broader harness theory the FARS [_index](../_index.md) promises ("Harness surfaces & interfacers").
