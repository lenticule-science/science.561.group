---
name: find-weak-math-unit

description: "Scans math/ and returns all math units ranked by weakness: missing frontmatter, stub bodies, no cross-references, deprecated fields, heading violations."
skill-closure-kind: inquiry
---

domain: none — reads `math/` autonomously, excluding context files and `math/skills/`

codomain: a ranked list of math units from weakest to strongest, each with a score
and a list of defects tagged `auto` (fixable without user input) or `needs-input`

---

Read all `math/*.md` files excluding: `AGENTS.md`, `INBOX.md`, `PLANS.md`, `IDEAS.md`,
`MEMORY.md`, `SOUL.md`, and files in `math/skills/`.

For each file, check:

- **Missing `id`** (−2, auto): frontmatter has no `id` field
- **Missing `description`** (−2, auto): frontmatter has no `description` field
- **Description too long or contains LaTeX** (−1, auto): > 200 chars or contains `$`
- **Missing `kind`** (−3, needs-input): no `kind` field; cannot determine epistemic status
- **Deprecated `name` field** (−1, auto): `name:` stored in frontmatter (derivable from `id`)
- **Stub body** (−4, needs-input): body is `**Status.** Stub.` or fewer than 3 sentences of content
- **No cross-references** (−2, needs-input): body names other concepts but has no `[...](...)`
  markdown links
- **Heading uses type prefix** (−1, auto): heading is `### Theorem — X` instead of `### X`
- **`domain`/`codomain` without `defines`** (−2, auto): morphism fields present but `defines` absent
- **Mixed epistemic statuses** (−3, needs-input): file contains both a proved result and an open conjecture
- **Empty or heading-only body** (−5, needs-input): body contains nothing beyond the heading

Score = sum of penalties. Return files sorted ascending by score (most negative first).
Exclude files with score = 0. Report total defect count across all files.
