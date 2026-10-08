---
description: "Collects all cross-layer context for a concept X: math unit, supporting math files, proof files, spec file, and src files. Use whenever a spec or skill needs the full picture of what is known about X across all four departments."
skill-closure-kind: process
title: find-context
---

# find-context

domain: `X` — a CamelCase name or kebab-case id of the thing to look up.

1. Convert X to kebab-case id if given in CamelCase (insert hyphens at word boundaries, lowercase).
  Call this `target_id`.

2. **math layer.** Find the file in `math/` whose frontmatter `id` equals
   `target_id`. If found, record as `math_primary`. Read it in full.
   Collect all markdown link targets from its prose; for each, find
   and read the corresponding `math/` file. Record all as `math_supporting`.
   From all math files read, collect:
   - `established_claims`: statements introduced by "Axiom", "Theorem", "Lemma",
     "Corollary", or "Construction" — record as (kind, one-sentence statement, source_id).
   - `ruled_out`: statements introduced by "not", "cannot", "impossible", or "breaks"
     inside a theorem or remark — record as (one-sentence statement, source_id).
   - `open_gaps`: statements marked "open", "conjectured", "not yet proved", or
     "pending" — record as (one-sentence statement, blocking_item).

3. **proof layer.** If `math_primary` has a `lean_file` annotation, read that file.
  Also grep `proof/` for any file referencing `target_id` in a comment or theorem name.
  Record all matches as `proof_files`.
  Note whether any sorry remains.

4. **spec layer.** Search `spec/` for files matching `spec/[target_id].md`, `spec/[target_id]-spec.md`, or any file with frontmatter `id: [target_id]`.
  If found, read it.
  Record as `spec_file`.
  Note its MUST, CANNOT, CAN, and Pending sections.
  If not found, record `spec_file = null`.

5. **src layer.** Grep `src/` for `target_id`.
  Record any matching files as `src_files`.
  Note whether any are stubs or marked TODO.

codomain:
   - `math_context`: { primary: math_primary, supporting: math_supporting,
       established_claims, ruled_out, open_gaps }
   - `proof_context`: { files: proof_files, has_sorry: bool }
   - `spec_context`: { file: spec_file or null, must, cannot, can, pending }
   - `src_context`: { files: src_files }
