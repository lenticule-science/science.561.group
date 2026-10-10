---
name: structure-resource-file
description: A markdown-resource-file at code/structures/<slug>.md — defines a mathematical object (a type, a category, a structure-in-the-mathematical-sense) and encodes its typed signature in frontmatter.
specializing: markdown-resource-file
realizing: structure
references:
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **structure-resource-file** is a markdown-resource-file $F$ at the path `code/structures/<slug>.md` whose frontmatter mapping carries:

- `name` — the structure's name (matching the filename stem, with hyphens kept).
- `description` — one sentence stating what the structure is.
- Zero or more *typed-signature cells*: each key is a gerund resolving to a transformer record at `code/transformers/<key>.md`, and each value is a structure slug (or a list of structure slugs) resolving to a `code/structures/<value>.md`.

The body is the mathematical definition of the structure: its formal content (objects, morphisms, axioms, properties), its categorical role, and references to public mathematical literature.
The body MUST NOT carry application content — references to specific repositories, file paths, or examples-from-our-use belong in records under `prose/`, not on the structure record itself.

The joint type is the pullback [@maclane1971, ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{StructureResourceFile} & \longrightarrow & \mathbf{Structure} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Structure} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter cells onto the components of a structure record — its name, its description, and its typed-signature predication cells — and the body onto the structure's mathematical definition.
