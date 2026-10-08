# Philosophy Services Section

The Philosophy Services Section is the science branch's home for philosophical
material that isn't yet organized under one of its tradition-specific
subsections, plus the cross-tradition apparatus (glossary, triage, notes)
that spans all of them. Its own `content/` holds three kinds of material:
a large glossary under `content/text/glossary/` (`topics/`, `concepts/`,
and several hundred `terms/`), survey and research notes under
`content/text/documents/articles/` (including dated notes under `notes/2025/`
and `notes/2026/`), and an unprocessed triage backlog under
`content/text/triage/` organized into `christianity/`, `ontology/`,
`rituals/`, `spirituality/`, and a `philosophical-agential-semioverse-repository/`
capture.

The glossary is not a narrowly curated philosophical dictionary. Alongside
technical entries with citations (`dialetheia.md`, `catuskoti.md`,
`mereology.md`, `phenomenology.org`) it holds a wide range of `.org` and
`.md` files that read as a personal knowledge-base export — musicians,
television shows, activists, one-off phrases, and short reflections sit
next to formal philosophical terms, several with `--archive-2026-08-17`
duplicates from a prior consolidation pass. This breadth is a fact about
how the glossary was built (bulk import from a personal notes system, not
authored entry-by-entry for this library), not a claim that every file in
it is philosophy in a technical sense. `content/data/ontology/philosophy/`
holds a pair of Turtle ontology/shapes files versioned as `ontology.ttl` /
`ontology-1.ttl` and `shapes.ttl` / `shapes-1.ttl`.

`lib/agency/skills/enrich-philosophical-content/` holds an agent skill for
extending this glossary; `lib/legacy/2026-08-17-windows-library/arts-theory/`
is a historical capture, not live content.

The section's live subject matter lives under `services/`, one
subsection per tradition or register:

- `buddhist-services-section/` — Buddhist philosophy, presently Madhyamaka
  and pramāṇa (epistemology/logic) theory.
- `caribbean-services-section/` — Caribbean philosophical traditions,
  presently Glissant's creolization and opacity.
- `dao-services-section/` — Daoist philosophy and the estate's own
  Dao-grounded writing, from a 2024 personal essay through a 2026
  formal treatment of the *Yijing*.
- `lakota-services-section/` — Lakota cosmogonic philosophy, held as an
  extensive notes-only research consolidation.
- `logic-services-section/` — a small glossary (`true`, `false`) plus an
  active triage backlog on dialetheia recognition; the fuller logic
  taxonomy (classical, intuitionistic, paraconsistent) lives under
  `western-services-section/services/logic-services-section/`.
- `relationality-services-section/` — the 561 Group's own metaphysical
  philosophy and original research program; by far the largest
  subsection (see its own README for scale and provenance).
- `theology-services-section/` — philosophical theology across
  scholastic, Jewish, Islamic/Sufi, and Orthodox registers.
- `western-services-section/` — the analytic/continental split, ethics,
  epistemology, metaphysics, political philosophy, and Marxism; the
  bulk of the library's philosophical holdings, reflecting the
  Western-academic training of the people who built it rather than a
  claim to primacy (see its own `content/text/glossary/topics/western.md`).

Comparative work drawing these traditions into direct dialogue with one
another, and reconciliation of the root-level glossary's `--archive`
duplicates, are standing directions.
