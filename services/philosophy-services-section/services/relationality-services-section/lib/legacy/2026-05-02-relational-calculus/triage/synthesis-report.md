---
name: synthesis-report
type: report
status: current
date: 2026-05-02
---

This pass synthesized five overlapping triage dumps into a single theory directory at `operations/engineering/triage/library/humanities/theories/math/theories/relational-calculus/triage/`, shaped on the precedent of [predication-categories](../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md).

## Sources read

In approximate order of synthesis weight:

1. **`relationality/`** (23 MB) — the dominant source. Contained 59 already-cleanly-named concept files in `concepts/`, an articulation theorem in `theorems/`, and substantial narrative material in `narratives/from-math/`, `narratives/relational-applications/internal/` (~50 stack-engineering files), and `narratives/relational-applications/external/` (~18 mathematical-correspondence files). The concepts/ directory was effectively a near-finished synthesis that prior work had produced and left in triage.
2. **`relationality-2/relationality.md`** (4528 lines) — a single-file consolidated draft restating much of relationality/ with different framing.
3. **`relationality-2/texts/on-relationality.md`** — the unified five-movement synthesis draft used as the seed for the [unified-derivation narrative](narratives/unified-derivation.md).
4. **`from-sloppyresearch/content/relationing/`** (612 KB):
   - `formal-axioms-of-relationing/formal-axioms-of-relationing.md` (2890 lines) — Movement I in axiom/lemma form, the seed for the [formal-axioms layer narrative](narratives/formal-axioms-layer.md).
   - `foundations-of-relation/foundations-of-relation.md` (1233 lines) — Movements I–V in compressed form, used to confirm the formal-axioms layer at later movements.
   - `relational-posets/relational-posets.md` (401 lines) — the order-theoretic prototype.
   - `proposing-a-modality-of-relationing-existence/proposing-a-modality-of-relationing-existence.md` (266 lines) — early framing.
5. **`on-relationality/`** (576 KB) — earlier draft of the same content; subsumed by relationality-2/on-relationality.md.
6. **`relationality-inner-triage/internal-theory/`** (344 KB) — `deriving-a-reflexive-infinity-topos.md/.org` (~3000 lines each), `proposing-a-reflexive-existence.md`, `foundations-of-relation.org`. RITM-derivation drafts; subsumed by the [RITM concept](concepts/ritm.md), [Filter-Induced Reflexive Reconstruction theorem](theorems/filter-induced-reflexive-reconstruction.md), and the formal-axioms layer.
7. **`relationality-inner-triage/research/`** and **`research-notes/`** (~380 KB combined) — `physics-of-relational-infinity-topos-modality.org` and supporting research material; subsumed by Movement V (states/observables/conservation) content in concepts/ and the formal-axioms layer.

## What was created

Under `operations/engineering/triage/library/humanities/theories/math/theories/relational-calculus/triage/`:

- `_index.md` (1 file) — theory entry point with five-views framing, position relative to predication-categories, and pointer to the open questions.
- `concepts/` (59 files) — bulk-copied from `relationality/concepts/` with frontmatter rewritten from `kind: term` to `type: concept` / `status: sketch`. Internal `[X](Y.md)` sibling links and `[X](../theorems/articulation-theorem.md)` cross-section links work as-is. `../terms/` paths were normalized to `../teaching/explanations/`. Cross-vault links into `voidmath/` and `../texts/` are preserved as-is (they were already broken in the source dumps).
- `theorems/` (3 files):
  - `articulation-theorem.md` — converted from `relationality/theorems/articulation-theorem.md` with frontmatter rewrite and link normalization.
  - `filter-induced-reflexive-reconstruction.md` — newly written, lifted from inline statement in `concepts/discipline-regime-filter-profile.md` and `concepts/self-grounding.md`.
  - `heyting-closure-of-movement-i.md` — newly written, lifted from the formal-axioms doc.
- `narratives/` (3 files):
  - `unified-derivation.md` — the act-algebra trace + five-movement walkthrough, lifted and consolidated from `relationality-2/on-relationality.md` and the granular-trace material in `concepts/`.
  - `formal-axioms-layer.md` — the formal-math articulation, lifted from `from-sloppyresearch/.../formal-axioms-of-relationing/`, `foundations-of-relation/`, and `relational-posets/`.
  - `position-vs-predication-categories.md` — newly written; positions the relational calculus relative to the parallel predication-categories theory.
- `questions/` (9 files) — each surfaces a real divergence in the source material rather than silently picking a winner. See list in `_index.md`.
- `references/` (5 files) — Spencer-Brown 1969, Lawvere–Schreiber, Street 1972, Riehl–Verity 2022, Kelly 1974. Citations identified by grep over the source dumps.
- `synthesis-report.md` — this file.

Total file count: 79.

## What was deleted

After confirming the substantive content was absorbed into the new theory directory:

| Path | Size | Status |
|---|---|---|
| `triage/relationality/` | 23 MB | deleted |
| `triage/relationality-2/` | 1.6 MB | deleted |
| `triage/on-relationality/` | 576 KB | deleted |
| `triage/from-sloppyresearch/content/relationing/` | 612 KB | deleted |
| `triage/relationality-inner-triage/internal-theory/` | 344 KB | deleted |
| `triage/relationality-inner-triage/research/` | 348 KB | deleted |
| `triage/relationality-inner-triage/research-notes/` | 36 KB | deleted |

**Total recovered: ~25.5 MB (26 164 KB).**

The `relationality-inner-triage/` directory was *not* deleted in full — its persona-staging subdirectories (`emsenn/`, `hive/`, `koios-news/`, `per/`, `turntide-islands/`, `ideas-for-concept-computers/`, `scientific-texts/`) are out of scope for this synthesis and remain for separate triage passes.

The `from-sloppyresearch/content/` directory retains `docs/`, `mathematics/`, and `triage/` siblings, which were untouched.

## Synthesis decisions that should be reviewed

1. **The 59 concept files were copied wholesale.** The source material was already cleanly divided into one-concept-per-file form, and re-writing each from the underlying drafts would have multiplied work without obvious gain. The trade-off: the prose in each concept file is the prior synthesizer's prose, not this pass's. If the captain wants the prose re-cast in a more uniform voice, that is a separate pass.

2. **Frontmatter is minimal.** Each concept file has only `type: concept` and `status: sketch`. The corpus convention permits richer frontmatter (`depends-on`, `class`, `symbol`); these were not extracted because automated extraction from prose is fragile and manual extraction across 59 files was out of scope. A follow-up pass could fill these in.

3. **Cross-vault links to `voidmath/` and to `../texts/` are preserved as broken.** These links were already broken in the source dumps (the `voidmath/` paths assume an old vault structure; the `../texts/` paths reference dump-internal documents that did not get copied because the texts were used as the source for the new narratives). Fixing them would require either re-targeting (uncertain — the right targets are not obvious) or rewriting the sentences that contain them. This pass preserved the broken links and noted them here.

4. **Nine questions were surfaced rather than resolved.** The task specified surfacing divergences as questions; doing so faithfully means *not* picking winners. Each question file proposes 2–3 candidate resolutions and stops. A future pass with the captain's input can settle them.

5. **Only three theorems were extracted.** The source material contains many theorem-shaped statements (Existence-Observation Duality / Ambidexterity, RITM Self-Stabilization Theorem, Reflex Emergence Lemma, Generative Closure Fixed-Point Theorem, Noether Correspondence, …). Most are stated *inside* concept files; lifting each into a standalone theorem note is appropriate but was scoped down for this pass. The three extracted (Articulation, Filter-Induced Reflexive Reconstruction, Heyting Closure of Movement I) are the load-bearing ones.

6. **The `concepts/relational-mathematics.md` and similar narrative-leaning concept files** were not re-classified as narratives, even though they read more like surveys than concepts. Reclassification would require renaming and dependency-rewiring; left for review.

## Cross-task interactions

- **Existing task: predicated-knowledge-systems sketch promotion.** Independent — different theory directory, no overlapping files.
- **Existing task: non-monotonic-extensions sketch question.** Independent — different theory directory.
- **No commits were made.** The captain runs commits.

## Next-pass candidates

Roughly in priority order:

1. Settle one or two of the nine open questions (most valuable: `relate-trace-disagreement`, `primitive-of-the-derivation`, `relation-to-predication-categories`).
2. Lift the remaining inline theorems into standalone theorem notes.
3. Fill in `depends-on:` frontmatter on the 59 concept files.
4. Promote the directory out of `triage/` (rename `…/relational-calculus/triage/` → `…/relational-calculus/`) once the open questions are settled and the captain has signed off.
5. Lean library: shared with predication-categories' Lean module via the closure-2-monad lax-idempotence theorem.
6. Triage `relationality-inner-triage/{emsenn,hive,koios-news,per,turntide-islands,ideas-for-concept-computers,scientific-texts}/` — out of scope for this task; they are persona-staging directories with their own life cycle.
