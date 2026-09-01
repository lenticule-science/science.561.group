---
title: 561 Group Design Bible
status: living
edition: v.0.3
drafted: 2026-05-01
parent: ../../_index.md
---

# 561 Group Design Bible — FARS subtheory

This subtheory holds the visual constraints — color, type, grid, mark, voice, imagery, templates — and the rules of restraint that keep them from drifting, drafted as the working visual language for [561 Group](narratives/cover.md), an autonomous confederacy in pursuit of black liberation and indigenous sovereignty.

The bible is a [working manual](narratives/manifesto.md), not a finished system. v.
0.3 is a living document; edits are welcome where it fails the work.
Where the bible contradicts the work, the work wins — then come fix the bible so it stops failing the next person.

## Layout

The corpus is organized as eight registers (concepts, objects, morphisms, theorems, examples, narratives, questions, references) following FARS conventions.
Each entity gets its own kebab-case file with YAML frontmatter declaring `type`, `class`, `status`, and cross-link slots (`depends-on`, `realizes`, `see-also`, `instantiates`).

- [concepts/](concepts/) — recurring disciplines the bible names (color budget, grid system, voice, two registers, refusal as method).
- [objects/](objects/) — structural definitions of artifact-bearing things (the mark, the wordmark, the type stack, the four inks, the document grid, the spec block, the colophon stamp).
- [morphisms/](morphisms/) — the operative procedures (mark clearspace, slogan setting, caption setting, duotone treatment, voice substitution, grid break).
- [theorems/](theorems/) — the seven refusals (§ 09) and the test/check clauses they carry, stated as falsifiable artifact-failure tests.
- [examples/](examples/) — the five starting templates (§ 08): slogan poster, assembly call, numeral banner, field-instruction pamphlet, web template.
- [narratives/](narratives/) — the cover, the manifesto opener, the lineage, the colophon.
- [questions/](questions/) — open questions the bible's editor recognizes but has not yet ruled on.
- [references/](references/) — citations to primary methodological sources (visual engineering, brutalism, Tufte, Emory Douglas, El Lissitzky).

Source artifacts (the v3 HTML, the CSS, the render JS, the glyph set, the upload images, and the v1/v2 archived editions) are under [tools/bible-source/](tools/bible-source/).
The 16 secondary glyphs are decomposed one-per-file under [tools/glyphs/](tools/glyphs/).

## Reading order

A first pass: [cover](narratives/cover.md) → [manifesto](narratives/manifesto.md) → the [three rules](concepts/the-three-rules.md) → the [mark](objects/five-six-one-mark.md) → the [color budget](concepts/color-budget.md) → the [type stack](objects/type-stack.md) → the [grid system](concepts/grid-system.md) → the [voice](concepts/voice-as-specificity.md) → the [two imagery registers](concepts/two-registers.md) → the [five templates](examples/) → the [seven refusals](theorems/) → [lineage](narratives/lineage.md) → [colophon](narratives/colophon.md).

A working pass: pick the artifact you are making, find its template under [examples/](examples/), follow the named morphisms it cites, run each refusal's test before approving the proof.
