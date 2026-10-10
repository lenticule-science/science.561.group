---
description: "Derives the most-needed unspecced concept by applying four ranked rules: missing link targets, incomplete frontmatter, math units without specs, and finally the C4 diagram as the fallback job. Returns a target id or 'texture-c4-diagram'."
skill-closure-kind: derivation
---

# next-spec-target

domain: `excluded` — optional list of ids to skip (default empty)

codomain: `target` — a kebab-case id of the concept most in need of a spec,
or `"texture-c4-diagram"` when all concepts are specced

---

Inference rules (apply in order; first non-empty result wins).

Before applying any rule: remove all ids in `excluded` from consideration.

1. **Missing-spec rule.** Collect every `[text](../path/to/id.md)` link target
   appearing in any file under `spec/` and `skills/`. For each linked `id`:
   - If a spec file exists with frontmatter `id: {id}`: skip (already specced).
   - If a `math/*.md` file exists with frontmatter `id: {id}`: skip (math unit,
     not a missing spec).
   - Otherwise: add to `unspecced`.
   If `unspecced` is non-empty: count link occurrences per id. Output the id
   with the highest count as `target`. Tie-break: alphabetical.

2. **Frontmatter-incomplete rule.** Scan all `spec/*.md` files for missing
   required frontmatter fields (`id`, `description`). If any exist: output the
   first such file's id as `target`.

3. **Math-without-spec rule.** Collect all `id:` values from `math/*.md`
   frontmatter. For each, check whether a spec file exists with that id.
   Collect missing as `math_unspecced`. If non-empty: output the id appearing
   most frequently as a link target across `math/` files as `target`.
   Tie-break: alphabetical.

4. **Diagram-work rule.** All three rules returned empty — all linked concepts
   have spec files. The remaining job is to advance the C4 diagram.
   Output `target = "texture-c4-diagram"`.
