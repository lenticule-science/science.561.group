---
description: "Reads a set of files of a given kind and returns the 3–5 best as canonical examples, with a one-line reason each was selected. Use when writing a skill, spec, or doc that needs representative examples to reason from."
skill-closure-kind: inquiry
title: pick-examples
---

# pick-examples

domain: - `kind` — the kind of file to sample: `math-unit`, `skill`, `spec`, `runbook`, or a glob pattern pointing at a specific directory - `n` — number of examples to return (default: 3)

codomain: an ordered list of `n` file paths, each with a one-line reason it was selected as a canonical example of `kind`

---

1. **Locate candidates.** Map `kind` to a directory and file pattern:
   - `math-unit` → `math/*.md`, excluding `math/skills/`, `math/AGENTS.md`,
     `math/INBOX.md`, `math/PLANS.md`, `math/IDEAS.md`, `math/MEMORY.md`,
     `math/SOUL.md`
   - `skill` → `skills/*.md`, `math/skills/*.md`, `spec/skills/*.md`,
     `src/skills/*.md`, `proof/skills/*.md`
   - `spec` → `spec/*.md`, excluding context files (`AGENTS.md`, `INBOX.md`, etc.)
   - `runbook` → `runbooks/*.yaml`
   - glob pattern → files matching the pattern directly

Read all candidates.
If there are more than 20, sample by reading only those whose filenames begin with letters a–f, m–p, and s–z to get spread.

2. **Score each candidate.** For each file, apply the criteria for its kind:

**math-unit:** - Has both `id` and `description` in frontmatter (+1 each) - Body defines exactly one concept without drifting (+2) - Has at least one cross-reference link (+1) - Has a MUST or Axiom section (+1) - Has no Pending section longer than the main body (+1)

**skill:** - Has `description` and `skill-closure-kind` in frontmatter (+1 each) - Has explicit `domain` and `codomain` (+2) - Steps are numbered and each step has a single action (+2) - No step says "as appropriate" or "if needed" without a condition (+1)

**spec:** - Has `id`, `description`, and `defines` in frontmatter (+1 each) - Has a "What it is" or opening definition section (+1) - Has MUST and CANNOT sections (+1 each) - No section describes a specific instance rather than the concept (+2)

**runbook:** - Has `id`, `description`, and `skill-closure-kind` in frontmatter (+1 each) - Has explicit `inputs` and `outputs` (+2) - Each step has a unique `id` (+1) - No step embeds a hardcoded environment value (+1)

3. **Select top `n`.** Take the `n` highest-scoring files.
  Break ties by preferring shorter files (simpler is more exemplary than complete).

4. **Return.** For each selected file, output:
   - file path
   - score
   - one sentence stating the specific reason it was selected
   - the file content in full

Order from highest score to lowest.
