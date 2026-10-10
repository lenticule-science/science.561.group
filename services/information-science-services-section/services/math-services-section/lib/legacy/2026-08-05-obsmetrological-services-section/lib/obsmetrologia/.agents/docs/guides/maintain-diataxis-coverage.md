---
title: Maintain Diataxis Coverage
description: A repeatable guide for keeping tutorial, guide, explanation, and reference coverage attached to every Obsmetrologia claim-site.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - guide
  - diataxis
  - maintenance
  - claim-sites
---

# Maintain Diataxis Coverage

Use this guide when adding or auditing documentation for a topic, concept, or
term.

## 1. Identify The Claim-Site

Classify the object before writing:

- topic: namespace-scale region, usually a top-level or major namespace;
- concept: module-scale construction;
- term: declaration-scale definition, theorem, lemma, proposition, example, or
  named construction.

Record the preferred name, aliases, and local path.

## 2. Gather The Carriers

Find all current surfaces:

- Lean module or declaration;
- Blueprint chapter, section, label, `\lean{...}`, and status;
- Verso page or section;
- generated API path, if available;
- corpus or note provenance.

If a carrier is absent, record `missing`, not `none`.

## 3. Assign Maturity

Use the status vocabulary:

- foundation;
- recovery;
- frontier;
- provenance;
- archived;
- computational witness;
- unknown.

Do not infer status from topic familiarity. Use local files.

## 4. Fill Or Inherit The Four Modes

For each Diataxis mode:

- tutorial: learning path or worked route;
- guide: repeatable maintenance or construction procedure;
- explanation: generative reason and conceptual role;
- reference: compact facts, paths, declarations, labels, and status.

Large topics need all four as explicit pages. A small term can inherit tutorial
and explanation from its concept while carrying a reference entry and a local
guide note.

## 5. Add Missing Obligations

If a page cannot honestly fill a mode, create a visible obligation:

```text
Coverage obligation: explanation missing because no Verso concept page exists.
```

or:

```text
Coverage obligation: reference missing because the Blueprint node has no Lean
declaration yet.
```

Do not hide missing coverage.

## 6. Re-run Alignment Checks When Relevant

For documentation-only agent docs, a file-count/frontmatter check is enough.
For Lean, Blueprint, or Verso changes, use the package's own gates:

```sh
make check
pnpm run lean:audit:blueprint
pnpm run lean:audit:surfaces
```

Use the Lean LSP tools first for Lean-specific declarations, diagnostics,
hovers, and axiom checks.

## Done Criteria

A claim-site is covered when a future agent can answer:

- What is it?
- What generated it?
- What does it generate next?
- Which carrier currently settles or states it?
- Which Diataxis modes are present, inherited, or missing?
- What status can be spoken without overclaiming?

