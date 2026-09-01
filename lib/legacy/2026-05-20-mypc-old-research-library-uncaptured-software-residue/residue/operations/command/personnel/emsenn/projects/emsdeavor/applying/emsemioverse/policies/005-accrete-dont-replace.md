---
title: "Policy 005: Accrete, don't replace"
date-created: 2026-03-07T00:00:00
type: policy
number: 5
keywords:
  - Policies
  - KnowledgeAccretion
description: "Knowledge builds by accretion. Add to what exists rather than replacing it."
---

Knowledge builds by accretion. Add to what exists rather than replacing
it.

## What this means

The emsemioverse grows by adding new content that connects to existing
content. It does not grow by rewriting what already exists to match new
understanding. When understanding changes, the change is recorded as a
new layer — a new decision record, a superseding term, an updated
concept with dated context — not as a silent edit that erases the
previous state.

This follows from the repository's use of git (which preserves history)
and from the constructive commitment (Policy 004): demonstrating
that a new understanding is better requires showing the old
understanding and the new one, not erasing the old one.

## Operational implications

- Decision records are append-only. Supersede, don't edit.
- When a term's meaning changes, add a dated section or create a new
  term file that references the old one.
- Working notes accrete session entries; they are not rewritten.
- Prefer extending existing files over creating replacements.
- When something is genuinely wrong (not just outdated), fix it — but
  note the fix in the commit message.
- The git history is part of the knowledge. Avoid force-pushes and
  history rewrites.
