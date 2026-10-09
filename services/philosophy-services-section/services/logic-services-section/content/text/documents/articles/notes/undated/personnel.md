---
name: personnel
title: personnel
description: A member of a polity.
---

A **member of a polity**. An entity a polity has formally recognized — subject to charter, eligible to hold offices, eligible to participate in governance decisions, bound by that polity's discipline.

Membership is a *granted relation* between an entity and a polity, not an intrinsic property of the entity. An entity does not become personnel by *being something*; it becomes personnel when a polity issues a recognition cell for it. Revoking membership is an operation that removes the relation; the underlying entity persists.

In the 561 polity, only `personnel:emsenn` currently exists as personnel — the constitutive member, the captain, the only entity for whom the 561 polity has issued a constitutive-recognition cell. Other entities the 561 polity dispatches against (the AI personas) are not personnel: they are personae operated by emsenn, not members in their own right.

## Distinguishing predication-shape

- `member-of-polity(personnel, polity)` — the granting relation; the personnel record is in some sense an instantiation of this cell.
- `enrolled-at(personnel, t-from)` — when the relation began.
- `revoked-at(personnel, t-end)` — when (if ever) it ended.
- `subject-to-charter(personnel, charter-version)` — explicitly bound to the granting polity's charter at the recognized version.
- `recognition-witness(personnel, witness)` — the witness that issued or transferred recognition.

## Step-induction role

Charter-bound action: only personnel can vote in governance decisions, only personnel can be appointed to offices, only personnel are subject to the granting polity's discipline. Without personnel as a distinct form, a polity cannot distinguish member-acts from non-member-acts in audit.

Federation: when the 561 Group recognizes another polity's personnel, that's a peer-level relation between recognition cells; both polities track their own personnel rosters, and federation issues cross-polity recognition cells.

## Not synonymous with

- **Persona** — persona is the persistent identity (soul, memory). Personnel is the polity-membership-relation. An entity can be both (emsenn) or only one (cassia-lorne is persona but not personnel; a peer-confederacy member is personnel-of-the-peer-polity but not necessarily personnel-of-the-561-polity).
- **Officer** — officer is the time-bounded incumbency-of-an-office relation. Personnel may or may not hold offices; offices may not be held by personnel (an office can be vacant).

## Provenance

The pypredcomp spec's earlier framing tied personnel narrowly to "real humans" or to the "legal/social-accountability surface" of a boundary. The captain corrected this (2026-05-07): personnel is a membership-relation, not a personhood predicate. AI agents *can* be personnel if a polity recognizes them as members. The 561 polity does not currently recognize any AI agent as personnel; that is a captain's decision.
