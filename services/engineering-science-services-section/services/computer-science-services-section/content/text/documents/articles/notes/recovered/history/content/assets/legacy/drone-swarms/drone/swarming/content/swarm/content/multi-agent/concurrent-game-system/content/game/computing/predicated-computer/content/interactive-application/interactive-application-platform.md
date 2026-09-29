---
title: "Interactive Application Platform"
component-of: predicated-computing
---

# Interactive Application Platform

A subtheory of [predicated-computing](../../_index.md) specializing the substrate to *user-facing interactive applications*: substrates whose primary actors include human users (alongside agents per [agential-orchestration-platform](../agential-orchestration-platform/_index.md)) and whose substrate content includes user-experience structures — accounts, documents, lists, forms, notifications, UI views.

Where [agential-orchestration-platform](../agential-orchestration-platform/_index.md) commits to *agents* (human and AI alike) acting through dispatch and runbook discipline, this subtheory commits to *human users* interacting through documents, lists, forms, and structured input. The two subtheories compose: a platform may be both agential-orchestration-bearing and interactive-application-bearing, with users producing content that agents process and agents producing content that users review.

## What this subtheory adds

Beyond the parent predicated-computing's substrate-level primitives, this subtheory adds:

- **User accounts** — substrate-content representation of human users, distinct from agent records (agents act for the substrate; users act on it). Authentication patterns (password, SSO, MFA, OAuth) as substrate content.
- **Documents** — text, markdown, structured-document content as substrate-recorded predications. Collaborative editing as multi-observer settling. Cursor and selection state.
- **Lists / sequences / ordered collections** — sequence-typed substrate content with append/insert/iterate operations. Per [federation-convergence](../../theorems/federation-convergence.md), CRDT-shaped sequences for collaborative ordering.
- **Forms / validation** — form-as-shape, input-as-admission-with-validation. Validation errors as substrate-content predications.
- **Notifications** — user-bound message substrate content. Delivery semantics, read/unread state, dismissal.
- **UI views** — view composition beyond the substrate's [project](../../morphisms/project.md): UI elements, layout primitives, input event handling, accessibility properties.

## What it inherits

Inherits everything from parent predicated-computing: substrate-determinism, federation-convergence, snapshot-replay-fidelity, conformance, encryption, identity-keys, the four-regime classification. User content is substrate content; user actions are substrate operations; user audit is substrate audit.

## Convention

Per the parent corpus's convention: every note is a Markdown file with YAML frontmatter, one entity per file, lower-kebab-case slugs.

## Layout

- `concepts/` — semantic anchors specific to interactive applications.
- `objects/` — substrate-entity records for accounts, documents, lists, forms, etc.
- `morphisms/` — operators specific to interactive applications.
- `theorems/` — engineering claims about interactive-application substrate properties.

## Position

Interactive applications and agential orchestration are two complementary specializations of the same substrate. A real platform typically uses both: AgOrchPlat handles the agent-bearing operational layer (work routing, governance, sessions); this subtheory handles the human-facing interactive layer (what users see, edit, submit). Cross-subtheory composition is structural (both live in the same substrate); the engineering integration is in the substrate's federation between the two layers.
