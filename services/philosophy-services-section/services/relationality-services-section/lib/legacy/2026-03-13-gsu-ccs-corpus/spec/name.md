---
id: name
description: "Naming rules for skill files and spec files; the description: field states what a skill produces; the filename encodes the action."
---

# Name

## What this is

A **name** identifies a skill or spec file unambiguously. The name and the
`description:` frontmatter field play different roles and MUST NOT duplicate
each other:

- The **name** (filename without `.md`) encodes *what action the skill performs*
  or *what concept the spec defines*.
- The **`description:`** field states *what the skill produces* — the output,
  the artifact, the result. An agent reading only the description knows what
  it will get back.

Two things that are not the same thing MUST NOT share a name.

This spec covers naming rules for skills and spec files. For math unit naming
(Object/Quality/Relation/Act, head word, modifiers) see
[naming-math-unit](naming-math-unit.md).

---

## Naming skills

A skill name MUST follow the pattern **flat-verb [object]**:

- **Flat verb** — the base/imperative form of the verb. No `-ing`, no `-ed`,
  no `-s`. `write`, not `writing` or `writes`. `classify`, not `classifying`.
- **Object** — what the verb acts on. May be a noun phrase in kebab-case.

The flat-verb rule holds for all four skill closure kinds. For Inquiry skills
(where the output is not predetermined), the object names the **territory
being investigated**, not an expected output — because there is none yet.

MUST:
- Use a flat verb as the first word
- Be globally unique within its namespace
- Be in kebab-case

CANNOT:
- Use a gerund (`-ing`) as the verb — `reviewing-work` names an ongoing
  activity, not a skill
- Use a vibe or feeling as the verb — `improve`, `sharpen`, `enhance` describe
  how the work feels, not what it does
- Use `run-` as a prefix — `run-audit` just says "execute a thing called audit";
  name the action directly: `audit-math-compliance`
- Use numbering — `step-3`, `pass-2` are positions, not names

**Entry-point exception:** department entry-point procedures (`improve-math`,
`improve-proofs`, etc.) currently violate the flat-verb rule. This is a known
naming debt tracked in root `PLANS.md` (`entry-point-naming-exception`). Do not
introduce new `improve-*` names; the exception is bounded to existing entry
points pending a user decision.

---

## Naming spec files

A spec file name MUST be a noun or noun phrase naming the concept it defines —
the same as its `id:` field. `work-item`, `agent-loop`, `skill-file-format`.

---

## The description: field

The `description:` field MUST state what the skill produces (for known-output
skills) or what territory it covers and what terminates it (for Inquiry skills).
An agent who reads only the description MUST know what to expect back.

`description:` is NOT a restatement of the name. If the name is
`classify-spec-claims`, the description should not say "Classifies spec claims"
— it should say what the classification produces and when to use it.

---

## Examples

| Name | Verdict | Reason |
|---|---|---|
| `write-spec-file` | ✓ | flat verb `write` + object `spec-file` |
| `classify-spec-claims` | ✓ | flat verb `classify` + object `spec-claims` |
| `review-recent-work` | ✓ | flat verb `review` + territory (Inquiry — output unknown) |
| `interpret-repo-state` | ✓ | flat verb `interpret` + object `repo-state` |
| `audit-math-compliance` | ✓ | flat verb `audit` + object `math-compliance` |
| `append-ideas-entry` | ✓ | flat verb `append` + object `ideas-entry` |
| `improve-diagram` | ✗ | `improve` is a vibe; what specifically happens to the diagram? |
| `reviewing-work` | ✗ | gerund verb — names an activity, not a skill |
| `run-audit` | ✗ | `run-` prefix says nothing; name the action: `audit-X` |
| `sharpen-node` | ✗ | `sharpen` is a vibe |
| `step-3` | ✗ | position, not a name |
