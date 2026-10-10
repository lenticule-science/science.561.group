---
name: transformer-resource-file
description: A markdown-resource-file at code/transformers/<gerund>.md — defines a mathematical morphism (a functor, a natural transformation, a specific class of arrow) and encodes its typed signature in frontmatter.
specializing: markdown-resource-file
realizing: transformer
references:
  maclane1971:
    class: book
    authors: ["Mac Lane, Saunders"]
    year: 1971
    title: "Categories for the Working Mathematician"
    publisher: "Springer"
    location: "New York"
---

A **transformer-resource-file** is a markdown-resource-file $F$ at the path `code/transformers/<gerund>.md` where `<gerund>` is the kebab-case `-ing` form of a single English verb.
The frontmatter mapping carries:

- `name` — equals `<gerund>`.
- `description` — one sentence stating what the morphism does.
- `gerund` — equals `name`.
  Carried as a typed cell because skill and agent naming grammars resolve their heads against this field.
- `agent-noun` — the English deverbal agent-noun form (`-er`, `-or`, `-ist`, `-ant`, or an irregular form).
- `imperative` — the bare-verb form, used to derive script filenames.
- `originating` — a structure slug naming the source object of the morphism.
- `terminating` — a structure slug naming the target object of the morphism.
- Zero or more additional typed-signature cells (e.g. `preserves:`).

The body is the mathematical definition of the morphism: domain, codomain, action on objects and arrows, preservation conditions, references to public mathematical literature.
As with structure records, the body MUST NOT carry application content.

The joint type is the pullback [@maclane1971, ch. II §2–4; ch. III §3] in the diagram $$\begin{array}{ccc} \mathbf{TransformerResourceFile} & \longrightarrow & \mathbf{Transformer} \\ \downarrow & & \downarrow \\ \mathbf{MarkdownResourceFile} & \xrightarrow{\;\rho\;} & \mathbf{Transformer} \end{array}$$ where the realizing functor $\rho$ projects the frontmatter cells onto the components of a transformer record — its identity, its morphological forms, its source/target objects, and its preservation conditions — and the body onto the morphism's mathematical definition.
