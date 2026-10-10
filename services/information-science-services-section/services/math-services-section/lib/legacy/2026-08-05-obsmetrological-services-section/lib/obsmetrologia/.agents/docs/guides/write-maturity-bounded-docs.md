---
title: Write Maturity-Bounded Docs
description: A guide for writing Obsmetrologia prose whose claims stay aligned with proved Lean, Blueprint frontier status, Verso exposition, and provenance.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - guide
  - documentation-style
  - maturity
  - proof-discipline
---

# Write Maturity-Bounded Docs

Maturity-bounded docs say exactly what the current carrier permits.

## Use These Verbs Carefully

Use `defines` only when a Lean declaration or source document actually defines
the object.

Use `proves` only when Lean and Blueprint support the proof status.

Use `states` for Blueprint frontier nodes or formal obligations.

Use `teaches` for Verso exposition.

Use `records` for corpus, archive, and provenance notes.

Use `projects`, `recovers`, or `compares` when a familiar mathematical surface
appears downstream of local construction.

## Required Paragraph For Concept Pages

Every concept explanation should have this shape:

```text
<Concept> is generated from <inputs>. It currently lives in <Lean/module or
source carrier>. It generates or supports <outputs>. Its current status is
<status>. The closest received comparison is <comparison>, but the local
construction should not be identified with that comparison unless the listed
carrier proves it.
```

Edit the wording, but keep the information.

## Red Node Wording

For Blueprint `\notready` nodes:

- "Blueprint states the frontier obligation..."
- "This is not yet a settled Lean theorem in the opened evidence."
- "The page may explain why the obligation matters, but not cite it as proved."

Avoid:

- "we have shown";
- "the theorem says" unless the theorem is actually settled;
- "therefore" when the dependency is still red.

## Green Node Wording

For Blueprint `\leanok` nodes:

- name the Lean declaration;
- state the exact local claim;
- avoid adding stronger external conclusions;
- link the theorem to its concept explanation and reference entry.

## Provenance Wording

For corpus or notes:

- "The source note records..."
- "The promoted reading used here is..."
- "This remains provenance until a claim-site is promoted."

Do not convert old language into current doctrine unless the current manual,
Blueprint, or Lean surface confirms the promotion.

## Bad Smells

Revise if a paragraph:

- starts from a public mathematical field rather than a local generator;
- uses "just", "simply", or "basically" to normalize a local term;
- calls a frontier obligation a result;
- hides missing carriers;
- omits status;
- mentions a familiar theorem without saying whether it is recovered,
  compared, or still frontier.

