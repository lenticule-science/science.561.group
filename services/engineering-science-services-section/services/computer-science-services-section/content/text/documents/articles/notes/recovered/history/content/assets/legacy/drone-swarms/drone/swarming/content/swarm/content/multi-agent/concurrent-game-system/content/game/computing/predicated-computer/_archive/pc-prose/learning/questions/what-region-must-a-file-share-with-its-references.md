---
name: what categorical region must a file's references share with the file
description: The deep check the resource-file linter's `term-reachable-via-dag` rule was approximating — "the structures and transformers a file uses are in the same category as it, mathematically" — needs a definite answer to "which categorical region" before it can become a skill. This question records the candidates and the trade-offs.
---

## Background

The resource-file linter carried (briefly) a rule named `term-reachable-via-dag` that emitted a warning whenever a markdown file's body mentioned the stem of a structure or transformer record that was not reachable from the file's frontmatter via the `derives-from` graph. The rule's stated intent was: "Terms used without a derives-from path are dirty: a future reader of the file has no way to look them up from the frontmatter alone."

In practice the rule fired noisily on every root surface file, every task record, every agent file, and every memory entry — none of which are theoretical-derivation nodes. The framing "the future reader" turned out to be a paraphrase of a deeper categorical concern, and the file-level `derives-from` walk was the wrong operationalization of it.

The deeper concern, stated formally: a resource file F references structures S₁…Sₙ and transformers T₁…Tₘ in its body and frontmatter. Those references should be coherent — in some categorical sense — with the kind of file F is. A governance-record file should not draw exclusively on math-internal vocabulary it has no relation to; a math-derivation file should not borrow operational governance terms in load-bearing positions.

The rule deleted from `linting-a-resource-file` was a placeholder. The question is what the right replacement is.

## What categorical region is being checked?

Candidate readings, none yet selected:

- **The `derives-from` connected component.** Two files share a region iff there is an undirected path between them via `derives-from` references. Cheap to compute; structurally meaningful for theoretical content; meaningless for files outside the derivation DAG (root surface files, task records, agent files).
- **The role-class neighborhood.** Files at `code/structures/`, `code/transformers/`, `prose/teaching/explanations/`, and their `theories/` analogs form one neighborhood; `work/governance/` files form another; root surface files a third. A reference is in-region when the cited record is in the same neighborhood or in a neighborhood the file's neighborhood explicitly admits. Requires authoring the admission relation.
- **The hyperdoctrine fiber.** Each predicate $p$ in the predication category has a fiber algebra $A_p$; structures and transformers participate in specific fibers. A file's references are in-region iff they all live in fibers the file itself is over. Pure-math reading; requires the substrate to actually record fiber participation per record, which it does not yet do.
- **The closure-rule subsystem scope.** The substrate carries multiple closure-rule subsystems — wolakȟota for the tiyóšpaye, military command for the RSC Quiescent, the engineering math subsystem. A file's references are in-region iff they all fire under the same subsystem or under subsystems the file's subsystem admits. Requires authoring the cross-subsystem admission relation.
- **The application sublocale.** The platform's predicated-agentic-orchestration-platform theory commits to application sublocales; a file's references are in-region iff they share an application sublocale.

Each reading is a different category. Each gives a different answer for which references are admissible from which files.

## What the answer governs

Once a reading is chosen:

- The structure record at `code/structures/<some-specific-membership>.md` can be authored (e.g. `resource-file-membership-in-a-derives-from-connected-component.md`).
- The morphism that produces cells of that structure from a candidate file can be authored as a transformer.
- The skill that reads such cells and reports the unresolved ones can be authored.
- The skill becomes one of the checks `auditing-a-file` composes.

## What this question does not decide

- Whether the check fires as `warn` or `error`.
- Whether files at different role-class roots are subject to the same membership relation or to different ones.
- Whether root surface files, task records, memory entries, and diary entries should be exempt entirely.

These follow from the categorical choice but are downstream.

## What is needed to answer

A short paper-shaped record (claim or theorem) at `prose/learning/claims/` or `theories/.../code/transformers/` that picks one of the readings and shows that the resulting region structure is well-defined on the substrate's records as they currently exist. Until that record is authored, this question is open and the categorical-membership check should not be built.
