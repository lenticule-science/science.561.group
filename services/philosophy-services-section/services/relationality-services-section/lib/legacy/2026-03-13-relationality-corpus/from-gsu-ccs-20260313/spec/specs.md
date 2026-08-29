---
name: specs

description: "Structure and rules for all spec files in this repository."
defines: Spec
domain: Thing
codomain: SpecFile
---

A spec file describes one thing — a mathematical object, a system behavior, or a
convention — by stating what is true of it, what is forbidden, and what is open.

Every normative claim uses RFC 2119 keywords: **MUST**, **MUST NOT**, **SHOULD**,
**SHOULD NOT**, **MAY**. Claims that are settled by proof or definition use MUST/MUST NOT.
Claims that are open or preferred use SHOULD/MAY.

## Structure

```
# [Thing Name]

## What this is
One paragraph. What the thing is and why it exists.
For mathematical objects: cite the defining math unit(s) as a markdown link —
`[unit-id](../math/unit-id.md)` from spec/, or `[unit-id](unit-id.md)` for
same-directory references.
For conventions: state the purpose directly.

## [Topic section]
One section per distinct aspect of the thing. Normative claims appear inline,
in context, not collected into a flat list. A section looks like:

  An X MUST be Y. An X MUST NOT be Z. An X MAY be W when [condition].

## [Another topic section]
...

## Open questions
Claims that would be MUST or MUST NOT once a specific gap is resolved.
Each item names the blocking dependency.

## Encodings (optional)
One subsection per named encoding format (e.g., `### YAML encoding`, `### Markdown encoding`).
Each subsection shows how the concept is represented in that format — field names,
structure, constraints specific to the encoding. Encoding sections describe the format,
not the concept; if a constraint belongs to the concept regardless of encoding, it goes
in a topic section, not here.

## Implementations (optional)
One subsection per named implementation context (e.g., `### Python`, `### SQLite`).
Each subsection states what the concept maps to in that context and any
implementation-specific constraints. Same rule: if a constraint is conceptual,
it belongs in a topic section.
```

## Rules

Sections are organized by topic, not by constraint severity. A reader looking
for everything about one aspect of the thing finds it in one section.

Normative keywords follow RFC 2119:
- **MUST** / **MUST NOT**: absolute requirement or prohibition; settled by proof,
  axiom, or definition.
- **SHOULD** / **SHOULD NOT**: strong preference; deviation requires justification.
- **MAY**: explicitly permitted; not a requirement.

Every MUST/MUST NOT claim for a mathematical object spec is traceable to a math
unit or proof. State the citation inline as a markdown link:
"A nucleus MUST be idempotent — [nucleus](../math/nucleus.md)."

Never invent. If a claim is not settled, it goes in Open questions, not MUST.
