---
description: Improve the emsemioverse as an implementation of an agential semioverse repository
id: better-emsemioverse
name: better-emsemioverse
version: [0, 1]
type: meta
runtime: inference
triggers:
  - "better the emsemioverse"
  - "improve the emsemioverse"
  - "improve the ASR"
inputs:
  area: string?
outputs:
  gap: string
  work_done: string
  method_improved: string
region:
  reads: ["content/", ".claude/skills/", "CLAUDE.md"]
  writes: ["content/", ".claude/skills/", "CLAUDE.md"]
dependencies:
  - stabilize
  - fix-frontmatter
  - audit-content-folders
  - improve-skill
requires:
  - "agential semioverse repository"
  - "prompt routing"
  - "skill manifests"
part-of:
  - "emsemioverse"
extends:
  - "skill-first workflow"
questions:
  - "Where does the repository fall short of being a proper ASR?"
  - "What ASR specification needs to be extended or created?"
scopes: []
---
Better the emsemioverse: $ARGUMENTS

## Operation

Run `python .claude/skills/better-emsemioverse/assess.py` to produce a
gap report. The script checks the repository against five ASR requirements:

1. **Directory organization** — directories with content but no index.md
2. **Skill manifests** — SKILL.md files missing required manifest frontmatter
3. **Semantic frontmatter** — files without typed relation fields
4. **Formal artifacts** — files without colocated .ttl, .lean, .py, .json
5. **Linking** — wikilinks remaining in published content

Use `--check <name>` to run one check. Use `--json` for structured output.

## After assessment

Pick the highest-impact gap from the report. Close it using existing
skills. If no skill covers the operation, create or extend one.

After closing the gap, run `assess.py` again to verify the count changed.
Then run `/improve-skill better-emsemioverse` if the assessment missed
something or the script needs a new check.

## Extending

When a new ASR specification is written, add a corresponding check
function to `assess.py`. The check should:
- Reference the spec by path
- Produce a count of conforming vs non-conforming items
- List the non-conforming items

The script is the ground truth for "how close is this to a proper ASR."
