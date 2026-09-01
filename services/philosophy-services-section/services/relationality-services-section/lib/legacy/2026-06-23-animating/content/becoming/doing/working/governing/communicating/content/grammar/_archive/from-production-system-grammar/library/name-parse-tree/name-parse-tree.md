---
name: name-parse-tree
description: "The derivation tree produced when a candidate name parses against the project's name-grammar — a context-free grammar quadruple (V, T, P, S) with two production rules: gerund-name and structure-name. A name-parse-tree records which production matched and the values of each terminal in the production."
specializing: thing
references:
  - id: chomsky1959
    type: article-journal
    title: On certain formal properties of grammars
    volume: 2
    issue: 2
    author:
      - literal: Chomsky, Noam
    container-title: Information and Control
    page: 137-167
    issued:
      - year: 1959
---

A **name-parse-tree** is the derivation tree produced when a name string is parsed against the project's name-grammar [@chomsky1959]. A name parse has two possible shapes:

- A **gerund-name** parse, matching `<gerund>(-<article>)?-<noun>(-<modifier>)*`. The parse-tree carries: `kind: "gerund-name"`, a `gerund` field naming the registered transformer at the head, an optional `article` field (one of "a", "an", "the"), a `noun` field, and an optional `modifiers` array.
- A **structure-name** parse, matching `<noun>(-<modifier>)*`. The parse-tree carries: `kind: "structure-name"`, a `noun` field, and an optional `modifiers` array. No gerund or article.

The schema dispatches between the two shapes using JSON Schema 2020-12's `if`/`then`/`else` conditional, with the discriminator field `kind` pinned by `const` in the conditional's branch. When `kind == "gerund-name"`, `gerund` is required. When `kind == "structure-name"`, the schema's `else` branch uses `not`/`required` to exclude both `gerund` and `article` from the parse-tree — a structure-name parse with stray gerund or article fields is malformed.

The two terminal classes have additional resolution-conformance constraints checked outside the schema: the `gerund` field must resolve to an existing transformer record, the `noun` field must resolve to an existing structure record, and each `modifier` must resolve to a structure or concept-modifier record. These resolution checks are performed by the checking-a-name-for-grammar transformer, not by JSON Schema, because they involve lookups against the existing record-set on disk and JSON Schema is purely syntactic.
