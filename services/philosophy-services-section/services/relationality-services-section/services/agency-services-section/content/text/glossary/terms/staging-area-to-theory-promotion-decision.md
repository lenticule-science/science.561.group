---
type: morphism
class: discipline-morphism
status: settled
depends-on:
  - ../objects/validation-rule.md
  - teaching/explanations/note-type.md
  - ../../../objects/note.md
see-also:
  - relation-graph-update.md
  - ../specifications/note-types/_index.md
title: Staging area to theory promotion decision
description: The promotion morphism is the discipline operation that moves a note from the staging area (where un-typed or in-progress material lives, typically operations-side) into a settled location in the vault, under a typed home, with all its…
---

# Staging area to theory promotion decision

The **promotion morphism** is the discipline operation that moves a note from the staging area (where un-typed or in-progress material lives, typically operations-side) into a settled location in the [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md), under a typed home, with all its discipline commitments declared.

## Signature

$$\mathrm{promote}: \mathrm{StagingNote} \to \mathrm{TypedNote} \cup \{\mathrm{rejected}\}$$

A *staging note* is a markdown file in operations-side or in a triage directory whose type is undeclared, whose home is provisional, and whose frontmatter is in a triage shape (often with a `type: triage` field). A *typed note* is a fully discipline-conformant note as defined in [the parent's note object](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/objects/note.md). The morphism either produces a typed note (promotion) or returns *rejected* (the staging note does not yet meet the bar).

## What the morphism commits to

The promotion morphism is what enforces the boundary the discipline's [staging-area](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/staging-area.md) concept names (the staging-area-vs-settled-location distinction is the concept's substance). Promoting a note commits to *all* of the following, each of which can independently fail:

1. **Type identification.** The note's type is determined by inspecting its content and matching it to the type spec. If the note carries multiple commitments, it is *split*, not promoted as one.
2. **Home selection.** The typed note's path is fixed by the discipline's [theory-directory](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/theory-directory.md) commitment (the directory tree carries meaning): a `concept` note belongs at `<theory>/concepts/<name>.md`; a `theorem` belongs at `<theory>/theorems/<name>.md`; etc. The home is not negotiable once the type is fixed.
3. **Frontmatter completion.** The frontmatter is brought to type-spec conformance: required fields filled, relation edges declared and pointing at real upstream notes, status field set.
4. **Body conformance.** The body is brought to the type's [pragmatic-register](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/pragmatic-register.md) and structural conventions: a `theorem` body acquires `## Statement` and a `## Proof` (or `## Sketch` or `## Refutation`); a `concept` body opens with the role-paragraph; etc.
5. **Upstream binding.** Every claim the body makes that loads on upstream content acquires a `depends-on:` edge in frontmatter. No silent loads.
6. **Validation pass.** The candidate typed note is run through the [FARS lint operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md). Promotion is conditional on zero defects.

If any step cannot be completed, the morphism returns *rejected* with a witness explaining which commitment failed. The note remains in staging, with the witness attached as guidance for the next pass.

## Position in the discipline

This morphism is what the discipline (see the [theory front-door](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/_index.md)) commits to *operationally*: the discipline is not just a set of rules a finished note must satisfy; it is also the trajectory by which a note becomes finished. The promotion morphism is the trajectory's terminus. The dual morphism (a settled note that drifts out of conformance and is sent back to staging for repair) is *demotion*; that is a different morphism with different commitments and is not authored here.
