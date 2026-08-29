---
name: spec-compliance-check

description: "Checks all spec/*.md files with a defines: frontmatter field for violations of their stated MUST and CANNOT constraints. Returns violations[] for the spec department's AgentLoop compliance step."
skill-closure-kind: derivation
---

domain: `department` — the string `"spec"` (this skill is spec-specific)

codomain: `violations[]` — list of violation descriptions, each naming the offending file,
the governing spec, and the constraint broken; empty if all governed files comply.

---

Collect all `spec/*.md` files that have a `defines:` frontmatter field. For each,
apply the rules below to the files it governs.

## Governing rules by `defines:` value

**`defines: Skills`** → governs all `*.md` files under `skills/` and `spec/skills/`.
- Each file MUST have `skill-closure-kind` frontmatter with a value in
  `{process, procedure, derivation, inquiry}`.
- No file MAY have a standalone `*Type*` line in the body (single source of truth
  is `skill-closure-kind` frontmatter).

**`defines: Name`** → governs all skill and spec filenames in the repo.
- Each filename MUST be kebab-case.
- Each filename MUST be named by its output, not by a vibe or action verb.
- No numeric suffixes permitted.

**`defines: Process`** → governs all `*.md` files with `skill-closure-kind: process`.
- Body MUST contain no conditional branches (`if`, `IF`, `else`).

**`defines: Procedure`** → governs all `*.md` files with `skill-closure-kind: procedure`.
- Every branch in the body MUST end in a skill call or halt.
- No inline execution (computations belong inside called skills, not here).

**`defines: Derivation`** → governs all `*.md` files with `skill-closure-kind: derivation`.
- Inference rules MUST be stated explicitly.
- Body MUST contain no control-flow branching.

**`defines: Inquiry`** → governs all `*.md` files with `skill-closure-kind: inquiry`.
- Body MUST state a question or territory.
- Body MUST include a termination condition.

**`defines: Specs`** → governs all `spec/*.md` files.
- Each MUST have `id:` and `description:` frontmatter fields.
- Each MUST be organized by topic sections.
- Each MUST use RFC 2119 keywords inline (MUST, SHOULD, MAY, MUST NOT, etc.).

**Other specs** → find files that link to `spec/{id}.md`; check that they do not
contradict the spec's MUST/CANNOT claims.

---

For each violation, emit one entry in `violations[]`:

```
{file: "path/to/file.md", governing_spec: "spec/X.md", constraint: "violated rule text"}
```

Return `violations[]` (empty if no violations found).
