---
name: "Desync"
description: "The detected divergence, via a checksum mismatch, between two or more peers' supposedly identical simulations in a deterministic-lockstep architecture, treated in that literature as a programming bug to be eliminated rather than a routine event with reconciliation machinery."
instance-of: concept
date-created: 2026-08-22
references:
  bettner2001:
    authors: ["Paul Bettner", "Mark Terrano"]
    title: "1500 Archers on a 28.8: Network Programming in Age of Empires and Beyond"
    publication: "GDC 2001 (Ensemble Studios)"
    year: 2001
---

A desync is the state in which two or more peers running a deterministic-lockstep simulation, which should by design compute bit-identical results from an identical input stream, are found to have diverged, detected by comparing periodic checksums of each peer's state. Paul Bettner and Mark Terrano's account of Age of Empires' networking is explicit that a desync — a "checksum difference" or "out of sync" error — is treated as a bug to be fixed, not as a routine event with any built-in reconciliation machinery, because the architecture's entire premise is that such divergence should be structurally impossible if the implementation is correct. Their own assessment of how persistent this class of bug proved to be is blunt: "there is one stubborn bug that goes all the way to the wire — I think out-of-sync is going to be it."

The causes the paper names are specific: unsynchronized or unseeded random-number generation, and any code path that varies locally between machines, such as sound triggers tied to frame rate rather than to the shared simulation clock. Guarding against these sources of hidden non-determinism is the real, ongoing cost of the deterministic-lockstep architecture, and the paper treats that discipline as inseparable from the architecture's benefits.

The section reads a desync as a gluing failure between two independently computed local sections — each client's full simulation — that the deterministic-lockstep architecture is built to prevent by construction rather than to correct after the fact; this is a proposed reading offered by the settlement-substrate research program, not a claim Bettner and Terrano make in those terms themselves. It marks a genuinely different regime from every other architecture in this glossary: under client-side prediction and server reconciliation, and under rollback netcode, divergence between a local guess and the true state is routine and is corrected as a matter of course; under deterministic lockstep, the same kind of divergence is instead named, flagged, and treated as evidence that the implementation itself is broken.
