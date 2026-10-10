---
description: "Improves or writes the spec file for a single concept X by locating existing context and classifying whether to write, update, review, or defer. Use when a specific concept needs its spec written or updated."
skill-closure-kind: procedure
---

# improve-spec

domain: `X` — the concept whose spec to improve or write, or `"texture-c4-diagram"`
to advance the C4 diagram

codomain: the spec file written or updated; or updated diagram files; or a halt
with a reason if no action is possible

---

IF `X` is `"texture-c4-diagram"`:
  → Run `spec/skills/texture-specs.md`. Halt.

1. Run `spec/skills/find-spec-file.md` with X.
   Output: `spec_file` (path or null).

2. Run `skills/find-context.md` with X.
   Output: `context`.

3. Classify the situation:

   IF `spec_file` is null AND `context.math_context.primary` is null:
   → Halt: no spec file and no math unit found for X.
     Tell user what was searched and what is missing.

   IF `spec_file` is null AND `context.math_context.primary` is non-null:
   → Run `spec/skills/build-spec-claims.md` with `context.math_context`.
     Output: `claim_sets`.
   → IF `claim_sets.must_list` is empty:
       Run `spec/skills/append-ideas-entry.md` with X and
       `context.math_context.open_gaps`. Halt.
   → ELSE:
       Run `spec/skills/write-spec-file.md` with X and `claim_sets`. Halt.

   IF `spec_file` exists AND `context.math_context.primary` is null:
   → Run derivation: `spec/skills/review-spec-file.md` with `spec_file`. Halt.

   IF `spec_file` exists AND `context.math_context.primary` is non-null:
   → Run `spec/skills/build-spec-claims.md` with `context.math_context`.
     Output: `claim_sets`.
   → Run `spec/skills/update-spec-file.md` with `spec_file` and
     `claim_sets`. Halt.
