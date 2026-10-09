---
name: "Deterministic Lockstep"
description: "A multiplayer networking architecture, canonical in real-time strategy games, in which every peer runs an identical copy of the simulation driven by an identical, delayed stream of player commands, so that state is never replicated and there is no divergence to reconcile."
instance-of: concept
date-created: 2026-08-22
references:
  bettner2001:
    authors: ["Paul Bettner", "Mark Terrano"]
    title: "1500 Archers on a 28.8: Network Programming in Age of Empires and Beyond"
    publication: "GDC 2001 (Ensemble Studios)"
    year: 2001
---

Deterministic lockstep is a multiplayer networking architecture described by Paul Bettner and Mark Terrano's "1500 Archers on a 28.8" for Age of Empires and its Ensemble Studios successors. Rather than replicating game *state* between peers, every peer runs the exact same simulation, fed the exact same stream of player commands, deterministically. Commands issued on a given turn N are not executed immediately but are held and executed on turn N+2 everywhere, a fixed communications-turn delay that is elastically re-tuned by a mechanism the paper calls "Speed Control" against each peer's measured ping.

Because every peer computes an identical result from identical input, there is no privileged copy of state to correct toward and no analog of server reconciliation at all: the shared causal history simply is the game, produced identically by construction rather than reconciled after divergence. This guarantee was hard-won rather than automatic — the paper documents synchronized or seeded random-number generation and a strict ban on any locally-varying code path, citing frame-rate-dependent sound triggers as a real source of the bugs this discipline was meant to eliminate. The authors' own verdict on how hard bit-identical execution is to sustain is blunt: they call it "the one stubborn bug that goes all the way to the wire."

Deterministic lockstep stands in sharp contrast to the authoritative-server family and its companion techniques, client-side prediction and server reconciliation: there is no privileged state to reconcile toward, because agreement is enforced at the input layer, before simulation runs, rather than corrected after simulation runs ahead speculatively. When agreement nonetheless fails under this architecture, the failure has its own name and its own, very different treatment: see desync. Rollback netcode shares deterministic lockstep's dependence on total determinism but departs from it by predicting unknown input rather than delaying for it.
