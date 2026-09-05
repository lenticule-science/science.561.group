---
title: "How to Classify the Gutters of an Artifact"
date-created: 2026-05-02
---

This is an operational guide for analyzing the gap structure of a candidate communicative artifact. The output is a classification of every gap the artifact contains as one of: acceptable for the declared audience, acceptable for a narrower audience (audience-drift), disciplinary (closed by named apparatus), unaccountable, or invented (cross-dressed as a frame transition when the frame change is itself the artifact's content). The procedure takes a few hours for a short paper, longer for a textbook chapter, much longer for a practice's whole corpus.

## What you need

- The artifact in a form you can mark up.
- A clear statement of the artifact's declared audience. If the artifact does not declare one, derive it from the publication venue and from any explicit framing.
- The list of apparatus the artifact's discipline considers shared with that audience. For a math paper, this is roughly the curriculum the audience is presumed to have absorbed plus the standard references in the field. For a software tutorial, the standard tools the audience is presumed to have installed plus the standard practices of their working environment.

## The procedure

**Step 1: Enumerate the framed units.** Walk through the artifact and mark every framed unit (statement, definition, equation, paragraph, step, screenshot, slide). The frames are usually visible — typographic environments in mathematics, headings in technical writing, slides in a deck, code blocks in a tutorial. Number them.

**Step 2: Mark every gutter.** Between every pair of consecutive framed units, mark the gap. This is the closure the reader is being asked to perform. The gap is everything not stated between the units.

**Step 3: For each gap, ask what closes it.** Five possibilities:

- **Self-evident.** The transition is moment-to-moment in McCloud's sense — the next unit is a small extension of the previous and any competent reader closes it without thinking. (Mark it acceptable.)
- **Disciplinary.** The transition is closed by named shared apparatus the audience is trained on. (Mark it disciplinary; note the apparatus.)
- **Acceptable but unflagged.** The transition is closable by the declared audience from general competence, without specific apparatus. (Mark it acceptable; note what competence is required.)
- **Audience-drift.** The transition is closable only by a narrower audience than the artifact declares. (Mark it audience-drift; note the actual closing audience.)
- **Unaccountable.** The transition is not closable by the declared audience and the artifact does not provide a license. (Mark it unaccountable; note what the artifact would need to do to close it.)

**Step 4: Check for cross-dressing.** Some gaps are not gaps but frame transitions in disguise — the artifact is asking the reader to recognize that the next unit is a different *kind* of unit (a definition becoming a theorem, a remark becoming a derivation), and the transition is doing classificatory work rather than completion work. Mark these separately. They are not failures, but they require different repair than ordinary gaps.

**Step 5: Aggregate.** Count each category. Audit the audience-drift gaps to determine whether the audience claim or the gaps need to change. Audit the unaccountable gaps to identify the repairs. Note the gap-density and locations of the disciplinary gaps; these are where the artifact is making the most use of the discipline's installed apparatus.

## What the output is for

The audit produces three pieces of usable output:

1. **A patch list.** Every unaccountable gap is a candidate for repair. The repair is one of: cite the apparatus, expand the step, narrow the audience claim, or drop the closure.
2. **An audience honesty report.** The audience-drift count, weighted by how far the actual closing audience is from the declared one, tells you whether the artifact is honoring its own audience commitment.
3. **A disciplinary inventory.** The list of apparatus the artifact relies on, made explicit. This is useful for review, for course design, and for understanding what installed apparatus the discipline is actually carrying.

The audit is, in short, the operationalization of [convergent-completion](../terms/convergent-completion.md) for the artifact's gap structure. It does not require performing the closures — that would be the convergent-completion test proper. It requires only classifying what kind of closure each gap is asking for, which a single qualified reader can do without external comparison.
