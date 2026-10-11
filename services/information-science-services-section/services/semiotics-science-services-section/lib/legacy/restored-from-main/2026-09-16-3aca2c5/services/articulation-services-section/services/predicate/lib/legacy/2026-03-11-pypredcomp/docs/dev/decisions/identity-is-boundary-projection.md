---
title: "Identity is a boundary projection"
description: "A user is a boundary entity that projects four fibers (auth, authz, attention, history). Personnel, office, and persona-agent are projections of the boundary, not independent record kinds."
kind: decision
date: "2026-05-02"
status: committed
---


## What

The OS's primitive identity is the **boundary entity**.
A user is not a row in a users table, not a record kind, not a tuple of attributes — it is a *boundary* that projects four canonical fibers onto the substrate's surface:

1. **Auth fiber** — who is this key.
2. **Authz fiber** — what can they do.
3. **Attention fiber** — what are they looking at.
4. **History fiber** — what have they done.

The substrate's existing identity primitives — personnel, office, persona-agent — are **projection operators** that select sub-fibers of the boundary at particular surfaces.
Personnel is the legal/social projection.
Office is the functional projection (composed with the office's own grants).
Persona-agent is the publication projection (rebased to the persona's own keypair).

This rebases the older "personnel / office / persona-agent are three flat record kinds" framing without weakening any guarantee: capability discipline, audit, persona-attribution privacy, signing — all preserved, all expressed through boundary projections.

Per the captain's source idea at `operations/engineering/triage/operations/command/ideas/triage/user-as-boundary.md` (2026-04-04).
Spec at [specs/security/user-as-boundary.md](../specs/security/user-as-boundary.md).

## Why

The captain's source idea applies the holographic boundary principle (per `voidmath/IDEAS.md`, "Holographic Boundary Identity") to identity: a real human (the bulk) has indefinite complexity that the substrate cannot model; the substrate models only the boundary, the projection of the bulk onto the system's surface.
The substrate's identity records are then exhausted by the four fibers; nothing about the bulk that doesn't project through the boundary is in the substrate at all — and that is structural privacy, not omission.

The boundary framing is not an aesthetic re-labelling; it changes what the system can *say* about identity:

- It unifies session attribution, capability composition, and audit into one projection model rather than three independent record-kind disciplines.
- It explains why persona-agents aren't a separate kind from personnel: they are projections of the same boundary at a different surface.
  The persona's content commitments are the projection's properties, not a parallel record's.
- It makes multi-user semantics rigorous at v0.2: each user is a boundary; the substrate composes boundaries when sessions cross them via the $\Rightarrow$ algebra, with non-amplification preserved by construction.
- It is the structural source of the privacy guarantee that persona content does not leak personnel attribution.
  The persona projection is a quotient; the operating boundary is unreachable from the persona surface without a privileged cross-projection capability.

The captain has been clear across multiple notes (`unified-architecture-from-sender-identity`, `everything-is-messages-from-an-entity`, the agential-orchestration-platform's `personnel-vs-office` separation discipline) that identity is a relational property, not an attribute set.
The boundary framing is the formalisation.

## What it rules out

- Treating personnel, office, and persona-agent as three independent kinds with parallel disciplines.
  They are projections of one boundary; the discipline is the projection algebra.
- Storing personal data as attributes on a "user account" record.
  The boundary record carries no personal data; what the substrate knows is exhausted by the four fibers, all reconstructible from substrate cells.
- A "user database" as a separate authentication subsystem.
  There is no users table; auth is a fiber projection of the boundary, consulted via the substrate's standard cell-read.
- Persona-agents that *are* the operating personnel (no projection separation).
  The persona surface is a distinct projection with its own keypair; the operating boundary is reachable only by privileged cross-projection.
- Cross-projection authority amplification.
  A session opened under one projection cannot escalate to another projection's authority without a fresh session-open under that projection.

## What it does not constrain

- The specific content of the four fibers.
  (Defined in [specs/security/user-as-boundary.md](../specs/security/user-as-boundary.md) §2.)
- Whether to expose Unix-style `/etc/passwd`-equivalent views for compatibility.
  The boundary IS the canonical model; compatibility shims may project to passwd-shaped output.
- How many projection surfaces exist.
  The OS ships with personnel, office, persona-agent at v0.2; future projections (e.g., a `peer-boundary` projection for federated nodes, a `service-account` projection for unattended automation) are substrate edits, not structural changes.
- Whether a boundary may carry application-specific projections beyond the OS's canonical four.
  Yes — applications may define their own projection operators that read sub-fibers of the boundary; the canonical four are the OS's commitment.
- The cryptographic mechanism for signing across projections.
  (Ed25519 per [federation-signatures-ed25519.md](federation-signatures-ed25519.md); per-projection keypairs per [signing-and-witnessing.md](../specs/security/signing-and-witnessing.md).)
