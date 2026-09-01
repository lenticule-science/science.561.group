---
name: skill-file-format

description: "Required sections and layout of every skill file; what a conformant skill file must contain so that any agent can read, classify, and compose skills without ambiguity."
---

*Spec-domain object*

## What it is

A skill file is a markdown document that encodes one unit of SkillfulWork
(§skillful-work). It is a first-class artifact: it can be read by agents,
cited in other skill files, and composed into skill chains by matching
`codomain` to `domain`. The format defined here applies to every `*.md` file
under `skills/` and any department's `skills/` subdirectory.

## Required sections

Every skill file MUST contain the following, in this order:

### 1. YAML frontmatter block

```yaml
---
description: "Sentence 1: what it produces from what. Sentence 2: when to use it."
skill-closure-kind: process | procedure | derivation | inquiry
---
```

Both fields are required. `description` MUST be two sentences. The first
sentence states what the skill produces and from what input. The second states
when an agent should invoke it rather than something else.

A skill file MAY also declare a `dispatch` block:

```yaml
dispatch:
  input: argument_name     # which input drives the routing decision
  reason: |                # natural-language reasoning rule for the LLM
    If the input starts with math/, use math-unit.
    If it starts with spec/, use spec.
    ...
  routes:                  # explicit map from resolved value to runbook or skill
    math-unit: runbooks/find-weak-math-unit.yaml
    skill:     skills/find-weak-skill.md
    spec:      runbooks/find-weak-spec.yaml
    all:
      sequence:
        - skills/fix-weak-math-unit.md
        - skills/fix-weak-spec.md
```

When a skill declares `dispatch`, the `runbooks/dispatch-skill.yaml` runbook
can execute it: it reads the skill's frontmatter, applies the `reason` prompt to
resolve the input to a route key, then calls the matching runbook or skill.
This moves routing logic out of skill prose and into structured, machine-readable
frontmatter.

### 2. Title line

```markdown
# {skill-id}
```

The title MUST be the kebab-case `id` of the skill (same as the filename
without `.md`). The title MUST be named by what the skill produces, not by
what it does to get there (§name).

### 3. Domain declaration

```
domain:
- `{input_name}` — {description of the input}
```

The `domain:` label introduces the skill's inputs. Each input MUST have a name
and a one-line description. For skills with no external inputs (those that
operate on files they locate themselves), the domain MAY state `(none)` or
describe the implicit input (e.g., "the repository file system").

### 4. Body

The body contains the executable content of the skill. Its form varies by type:

- **Process**: numbered steps, no conditions, no `if`. Each step is a
  deterministic instruction. (§process)
- **Procedure**: numbered steps with `IF ... → ...` branches; each branch
  ends in a named skill call or `halt`. (§procedure)
- **Derivation**: numbered inference steps (read, apply criterion, conclude);
  no branching; the final step states the judgment. (§derivation)
- **Inquiry**: territory statement, starting point, iteration rule, and
  termination condition. (§inquiry)

### 5. Codomain declaration

```
codomain: {description of what is produced}
```

The `codomain:` label closes the skill file. It names what the skill produces.
For Inquiries, the codomain MUST list the possible output types including
"nothing found."

The codomain MUST name the output as a typed object (§work-item, §message,
§memory-entry, or an application-specific type) rather than as a vague
description.

## MUST constraints

A skill file MUST have all five sections above in order.

A skill file MUST NOT use `Given:` or `Takes:` in place of `domain:` — these
are legacy labels that predate the current format.

A skill file MUST NOT use `Gives:` or `Returns:` in place of `codomain:`.

The `skill-closure-kind` value MUST be one of the four valid values:
`process`, `procedure`, `derivation`, `inquiry`. No other values are accepted.

A Process body MUST NOT contain `if`, `IF`, or conditional branches. If a
condition is needed, the skill is a Procedure (§process).

A Procedure body MUST NOT contain inline execution that belongs in a Process or
Derivation. Every branch MUST end in a named skill call or `halt` (§procedure).

A Derivation body MUST NOT contain branching (`IF ... → ...`). If a branch is
needed, the skill is a Procedure (§derivation).

## CAN constraints

A skill file MAY include a `Given:` preamble before `domain:` as a
human-readable summary — but `domain:` is still required.

A skill file MAY include sub-sections under the body (e.g., `## Step 2a`)
provided the sub-sections do not introduce new conditions that the type
forbids.

## Pending

- The types named in `domain:` and `codomain:` declarations are currently
  informal strings. A formal vocabulary of skill object types is needed so
  skill chains can be type-checked mechanically. Blocked by skill-algebra
  construction (§skillful-work Pending).
- The question of whether skill files are unit files (with `id:` and
  `description:` frontmatter, appearing in the knowledge graph) or a separate
  document type is unresolved — see WI-10 in spec/PLANS.md.
