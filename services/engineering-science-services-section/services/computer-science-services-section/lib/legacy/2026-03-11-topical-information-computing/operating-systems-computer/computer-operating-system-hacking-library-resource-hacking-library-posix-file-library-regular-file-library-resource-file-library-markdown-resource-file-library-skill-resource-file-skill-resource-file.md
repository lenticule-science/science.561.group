---
name: skill-resource-file
description: A markdown-resource-file that additionally conforms to the skill role-class schema — a SKILL.md frontmatter shape plus the three body sections that materialize an invocable competence.
specializing: markdown-resource-file
realizing: skill
references:
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **skill-resource-file** is a markdown-resource-file $F$ whose name component is `SKILL.md`.
Its frontmatter parses to a mapping containing exactly two keys.
`name` matches the parent directory's name component in kebab-case.
`description` is a single-line string of exactly two sentences: the first names the effect the skill causes; the second contains the word `use` or `when`.
The body contains three top-level headings in document order: `## Requirements`, `## Steps`, `## Outcomes`.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{SkillResourceFile} & \longrightarrow & \mathbf{Skill} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Skill} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter and the three body sections onto the components of a skill — its invocation signature (from `name` and `description`), its preconditions (from `## Requirements`), its body (from `## Steps`), and its postconditions (from `## Outcomes`).

A SKILL.md alone does not realize a complete skill: the executable body of the skill lives in scripts referenced from `## Steps`, and additional invariants are recorded in a sibling `_index.md`.
The realizing cell records the projection from this one file to the skill's externally-visible signature, not the realization of the skill's full implementation.
