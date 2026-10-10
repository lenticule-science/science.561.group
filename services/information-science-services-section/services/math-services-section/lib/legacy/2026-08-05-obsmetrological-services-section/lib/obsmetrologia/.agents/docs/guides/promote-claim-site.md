---
title: Promote A Claim-Site
description: How to move an Obsmetrologia idea from provenance or frontier pressure into Blueprint, Verso, Lean, and agent-facing Diataxis coverage.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - guide
  - promotion
  - blueprint
  - verso
---

# Promote A Claim-Site

Use this when documentation reveals a new thing that must be explained.

## 1. Start From The Source, Not The Slug

Open the source file that generated the term. If the source is a corpus path,
read the local Markdown. If it is a Lean module, read the module docstring and
the declaration signatures. If it is a Blueprint node, read the surrounding
section and dependency labels.

Never infer content from the file name alone.

## 2. State The Smallest Honest Claim

Write one sentence:

```text
This claim-site names <object> generated from <inputs> and currently carried by
<carrier/status>.
```

If you cannot fill that sentence, the object is not ready for normative docs.
Keep it as provenance or a question.

## 3. Choose The Carrier Path

Use this routing:

- exploratory source language: corpus or `dev/content/notes`;
- precise open theorem or dependency pressure: Blueprint red node;
- proved declaration: Lean plus Blueprint green node;
- teaching exposition: Verso;
- operating and maintenance route: `.agents/docs`;
- compact lookup: reference table or API docs.

Do not maintain the same long paragraph in multiple carriers.

## 4. Add Diataxis Coverage

For a new topic, add or update:

- tutorial entry route;
- guide for contributors;
- explanation of generative role;
- reference map.

For a new concept, add or update:

- explanation;
- local worked example or inherited tutorial;
- guide for using or extending the concept;
- reference entry with Lean/Blueprint/Verso/provenance paths.

For a new term, add:

- reference entry;
- status;
- owner concept;
- smallest checked example when possible;
- links back to inherited tutorial and explanation.

## 5. Preserve Maturity

If it is frontier, say frontier. If it is only finite, say finite. If it is a
recovered comparison, name the local construction first and the familiar
comparison second.

Do not weaken the mathematical claim to make it easy to prove while prose still
claims the strong result. Do not strengthen prose beyond the current carrier.

## 6. Verify The Surface You Touched

For `.agents/docs`, verify frontmatter and file placement.

For Lean, use the Lean LSP tools for local diagnostics, goals, hovers, search,
and verification, then run the relevant package checks.

For Blueprint or Verso, run the package audit or build path documented in the
repository.

