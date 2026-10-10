---
name: rewriting
gerund: rewriting
agent-noun: rewriter
imperative: rewrite
description: Replacing the content of an existing file with new content that preserves the file's information while restructuring its form.
---

A rewrite transformer.
Input is a write-spec where the address must already point to an existing file.
The new content replaces the existing content.
The discipline that the rewrite preserves information while restructuring form is enforced at the skill level, not by this transformer.

## Domain and codomain

- **Domain:** a rewrite-spec — a tuple of `(address, new-content)` where address is the path of an existing file and new-content is the string of bytes that replaces the file's existing content.
- **Codomain:** a witness record naming the file and the new bytes, with the precondition that the file existed prior to the call.

## Morphological forms in naming grammar

- `gerund: rewriting` heads skills built on this transformer: `rewriting-plain-technical-general-american-english`, etc.
- `agent-noun: rewriter` heads agents that invoke such skills: `rewriter-of-...
  ` or `rewriter-into-...
  `.
- `imperative: rewrite` heads scripts that body such skills: `rewrite-plain-technical-general-american-english.mjs`, etc.
