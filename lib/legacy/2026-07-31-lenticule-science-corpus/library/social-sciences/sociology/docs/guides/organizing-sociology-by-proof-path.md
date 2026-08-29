---
title: Organizing Sociology by Proof Path
description: A local guide for applying Curry-Howard directionality by Yoneda embedding inside the sociology archive without moving sociology material out of its existing tree.
date-created: 2026-06-22
date-modified: 2026-06-22
keywords: ["sociology", "archive-organization", "curry-howard", "directionality", "yoneda-embedding", "proof-path"]
---

# Organizing Sociology by Proof Path

This sociology tree is organized by path-as-proof, not by shelf containment.
Each directory segment should add a true restriction to the proposition named by
the path. A child under `content/` is a settled narrower sociological
proposition; a document under `archive/` is still source-shaped, duplicate,
unmerged, or awaiting a settled proof path.

## Local Rule

- `sociology.md` names the root proposition: sociology as a social-science
  domain.
- `content/` contains settled child nodes whose paths are entailment chains from
  sociology, such as `content/critical-theory/critical-theory.md` and
  `content/legalism/legalism.md`.
- `archive/` keeps unsettled fibers: loose terms, references, texts, prose,
  source-library projections, and material whose best path has not been proven.
- `docs/` holds guides, explanations, tutorials, and references about how to
  work in this tree.
- Cross-cutting classifications belong in frontmatter tags or references, not as
  extra directory segments.

## Applying the Rule

When organizing a sociology file, ask what the path proves.

If the file is itself a settled child domain, school, lineage, or topic, place it
under `content/<child>/<child>.md`. If that child has its own settled children,
place them under its own `content/` when the child directories are converted, or
leave the existing child shape in place until the conversion can be done without
breaking the local links.

If the file is a term, reference, text, survey, or teaching note whose domain is
clear but whose proof path is not yet canonical, keep it in `archive/` near its
current source-shaped neighborhood. Do not promote it merely because its topic is
known.

If the file belongs to multiple sociological lineages, keep one canonical path
and record the other lineage claims as tags or links. A path should express the
strongest settled entailment chain, not every useful association.

## First Applied Conversion

The first conversion in this tree made the sociology root look like the potential
node pattern used by `content/mark` and the archive pattern used by
`content/_archive/algebra`:

- `archive/sociology.md` became `sociology.md`.
- `archive/domains/critical-theory/` became `content/critical-theory/`.
- `archive/domains/legalism/` became `content/legalism/`.

The remaining `archive/` material is intentionally still archival until each
piece has a settled proof path.
