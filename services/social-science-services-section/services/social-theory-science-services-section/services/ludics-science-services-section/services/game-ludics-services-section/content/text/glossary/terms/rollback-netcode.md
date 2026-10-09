---
name: "Rollback Netcode"
description: "A netcode architecture, canonically GGPO, that combines full simulation determinism with speculative input prediction, silently rewinding and resimulating the game whenever a late-arriving remote input contradicts an earlier guess, to give the appearance of zero input latency without the fixed delay of deterministic lockstep."
instance-of: concept
date-created: 2026-08-22
references:
  cannonGgpo:
    authors: ["Tony Cannon"]
    title: "GGPO rollback netcode developer documentation (pond3r/ggpo README, doc/README.md)"
    publication: "GGPO project"
    year: "n.d."
  bettner2001:
    authors: ["Paul Bettner", "Mark Terrano"]
    title: "1500 Archers on a 28.8: Network Programming in Age of Empires and Beyond"
    publication: "GDC 2001 (Ensemble Studios)"
    year: 2001
---

Rollback netcode is a networking architecture, canonically GGPO, that depends on total simulation determinism — Tony Cannon's own developer documentation states the precondition plainly: "with full determinism, the game is guaranteed to play out the same way on all players' computers if we simply feed them the same inputs" — but, unlike deterministic lockstep, does not simply wait a fixed delay for every remote player's input before simulating. Instead it predicts unknown remote input and simulates ahead immediately. When a remote input later arrives that contradicts the earlier guess, GGPO rewinds the simulation to the last-known-good frame and resimulates forward invisibly, without rendering during the replay, until it catches back up to the present; Cannon's documentation describes the effect as GGPO dropping "out of rollback mode" once resynchronized.

Rollback shares its dependence on total determinism with the deterministic lockstep architecture Paul Bettner and Mark Terrano describe for Age of Empires, but the two differ in exactly when correction happens: lockstep enforces a fixed communications-turn delay so that no divergence between peers is ever visible in the first place, while rollback predicts immediately and corrects after the fact when a prediction proves wrong.

The retraction involved is explicit and unambiguous, not a metaphor: whatever was displayed on screen for the frames between the mispredicted input and its correction is discarded and silently overwritten by a different history once the real input arrives. Cannon's documentation frames this invisible retraction as the deliberate tradeoff that distinguishes rollback from delay-based netcode — it accepts periodic, hidden rewriting of the shown world in exchange for zero perceived input latency in the ordinary case. The settlement-substrate research program reads GGPO, alongside TimeWarp and lag compensation, as an established counterexample to monotone settling at the level of the displayed, committed-so-far presentation, while separately noting — as its own distinct and more speculative reading, not stated in Cannon's documentation — that the underlying deterministic causal history, once all inputs are eventually known, never actually changes; only the client-visible rendering is ever retracted. Trailing state synchronization was built explicitly as an alternative correction strategy to the closely related TimeWarp algorithm, avoiding this style of retraction by consulting an already-live, more-settled copy of the simulation instead of resimulating from a snapshot.
