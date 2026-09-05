---
name: grammar
description: "A set of production rules that decide which strings are well-formed names. The project's name-grammar parses names along the path-alternation gerund-noun-modifier sequence and resolves each component against the appropriate library structure or transformer record."
specializing: production-system
parsing: name
producing: name-parse-tree
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

A **grammar** is a set of production rules that decides which strings are well-formed names and parses each well-formed name into its components. The classical definition is [@chomsky1959]'s — a tuple $(V, T, P, S)$ of variables, terminals, productions, and a start symbol.

The project's **name-grammar** is the specific grammar that every name on the filesystem must conform to. A name is a kebab-case sequence of components, parsed as:

```
<name>     := <gerund-name> | <structure-name>
<gerund-name>    := <gerund>(-<article>)?-<noun>(-<modifier>)*
<structure-name> := <noun>(-<modifier>)*
<article>  := "a" | "an" | "the"
<gerund>   := a name registered as a transformer in the lawful tree (a directory `[$gerund]/[$gerund].md` exists)
<noun>     := a name registered as a structure in the lawful tree (a directory `library/[$noun]/[$noun].md` exists)
<modifier> := a name registered as a structure or as a concept-modifier
```

A name is conformant iff (1) it parses against this grammar, and (2) every component resolves to its declared record. The transformer that decides conformance is [the checking-a-name-for-grammar transformer](../../doing/working/checking/checking-a-name/checking-a-name-for-grammar/checking-a-name-for-grammar.md).

The recursive consequence: every well-formed path in the lawful directory layout alternates gerund and noun positions, with each position resolving to its lawful library or transformer record. The grammar is therefore not only a string predicate; it is the constraint that makes the filesystem-as-cell-log queryable by `grep` over typed paths.
