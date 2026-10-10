---
name: write-a-term
description: Write a clear, comprehensive, Obsidian-compatible Markdown definition of a supplied term using supplied source text. Use when asked to define a term, turn selected text into a glossary entry, or author a source-bounded term definition.
---

# Write a term

Identify the term the user wants defined. Ask for it only when it cannot be inferred from the request or supplied material.

Use supplied or selected text as the exclusive source. Do not introduce outside information when source text is available. When no source text is supplied, use general knowledge and clearly avoid unsupported specificity.

Write a clear and comprehensive definition in Obsidian-compatible Markdown. Begin with the term in bold italics and link relevant concepts with Obsidian wikilinks when their intended targets are clear.

When creating a repository file, invoke `../../../scripts/write-a-term.mjs` with explicit `--name`, `--description`, `--author`, and `--output-directory` arguments. Pass `--date-created` when reproducing a known creation date. Do not pass `--force` unless replacement is explicitly intended.

Prefer the following form:

```markdown
A ***term*** may be [[definition|defined]] as a [[word]] or [[phrase]] that has a [[definition]].
```

Keep the definition proportional to the available evidence. Do not add process commentary, research notes, or claims not supported by the source.
