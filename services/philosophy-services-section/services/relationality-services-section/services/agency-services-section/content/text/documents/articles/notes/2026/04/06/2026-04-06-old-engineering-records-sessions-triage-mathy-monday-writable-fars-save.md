---
name: mathy-monday-writable-fars-save
introduces: session-save
date: 2026-04-06
label: mathy-monday-writable-fars
plans: [interfacer-entity-system, planning-predication-and-ontological-dependencies, agentic-to-fars-refactor, convergent-enrichment-plan]
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: mathy-monday-writable-fars-save
date-created: 2026-04-06
---


## What WORKED

- **markdown.js apply()**: Text-edits YAML frontmatter in place. Preserves key ordering, quoting style, body content. Handles scalars, arrays (inline and multi-line), additions, deletions, conflict detection. Counit law verified: extract(apply(changes, content)) = expected. 7/7 self-tests pass. Tested against real repo files (convergent-enrichment-plan.md, plan.md).
  - File: `operations/engineering/systems/fars/filetypes/markdown.js`

- **message.js persistToFiles()**: After settle() computes changes, translates bilattice-level changes (predicate:value → t/f/⊥) to frontmatter-level changes (key → value). Writes atomically (temp file + rename). Only persists DIRECT changes, not cascade fiber broadcasts.
  - File: `operations/engineering/systems/fars/message.js`

- **Full round-trip verified**: `message('planning-predication-and-ontological-dependencies', {horizon: 'month'})` → settle() → persist → file on disk changed → read back confirmed → restored to 'quarter'. The system is read-write.

- **Decision 005 (general/particular)**: Library/operations IS the general/particular distinction, expressed as a tower of specificity. extends inherits the settled remainder — the fixed point of composing all same-named entities across the tower. Only what's invariantly true propagates. Pre-AI human decision, now recorded.

- **Decision 006 (hooks as interfacers)**: ALL hooks become thin adapters — zero exceptions. Logic lives in entity fibers. Precompiled constraint fibers solve hot-path performance.

- **Campaign library term**: The missing coordination level between project and enterprise. Grounded in Clausewitz and Haudenosaunee confederacy pattern. Enriched plan/project/task with campaign-awareness predicates.

- **Ontological dependency audit**: All 7 infrastructure plans assume concepts without library terms. The 4 FARS operations (message, respond, settle, interfacer) have no library terms. Plans now have requires-concepts-takes predicate.

## What Did NOT Work

- **Cascade persistence**: Initial implementation tried to persist cascade changes (2924 affected entities). Wrong — cascade changes are fiber compositions (entity learns about neighbors), not predicate modifications. Fixed: only persist direct changes.

- **Bilattice-to-frontmatter translation**: First attempt passed raw bilattice changes to apply(). settle() returns `{predicate: "horizon:quarter", from: "⊥", to: "t"}` but apply() needs `{key: "horizon", to: "quarter"}`. Had to add translation layer.

- **Test false positive**: Counit test checked `fm.title === "term"` but plan.md has `defines: Plan`, not `title`. My test was wrong, not the code.

## Key Insights

- The tower of specificity: not 2 levels (library/ops) but N levels per domain depth. File path IS disambiguation via lexical scoping.
- `extends: message` inherits the SETTLED REMAINDER — invariant across all accounts. Missing library terms = thinner fixed point = impoverished fibers everywhere below.
- Hooks ARE interfacers (extract: JSON → payload, apply: settlement → exit code). Zero exceptions per captain directive.
- Precompiled constraint fibers: constraint entities compile to lightweight cache during generate, hooks read cache in ~1ms.

## What's Next

1. **atf-classify-hooks-by-algebra**: Take 30 potential hooks, classify each by target entity and constraint fiber structure. First candidate: safety-guard.js (clearest pattern: regex arrays → constraint entities).
2. **Write FARS operation library terms**: message, respond, settle, interfacer — the 5 most-referenced undefined concepts across all plans. Fattens the fixed point for everything.
3. **Write general terms**: first-officer, crew, charter — fix the most visible general/particular conflations.
4. **Study cost-reduction path**: with writable FARS, old hooks (patch-graph, auto-record-events) become redundant — they're doing what message() does natively. Each replaced hook = permanent cost reduction.

## Files Modified This Session

- `operations/engineering/systems/fars/filetypes/markdown.js` — added apply() (~180 lines)
- `operations/engineering/systems/fars/message.js` — added persistToFiles(), resolveFilePath(), wired into message()
- `library/theories/humanities/theories/sociology/theories/work/terms/campaign.md` — new
- `library/.../work/terms/plan.md` — added requires-concepts-takes, coordinated-by-takes
- `library/.../work/terms/project.md` — added coordinated-by-takes, can-be-part-of campaign
- `library/.../work/terms/task.md` — added requires-concepts-takes
- `operations/command/endeavor/records/decisions/005-library-operations-general-particular.md` — new
- `operations/command/endeavor/records/decisions/006-hooks-are-interfacers.md` — new
- `operations/command/endeavor/records/plans/planning-predication-and-ontological-dependencies.md` — new
- `operations/command/endeavor/records/plans/convergent-enrichment-plan.md` — enriched with concrete targets
- `operations/command/endeavor/records/plans/agentic-to-fars-refactor.md` — enriched with zero-exceptions directive
