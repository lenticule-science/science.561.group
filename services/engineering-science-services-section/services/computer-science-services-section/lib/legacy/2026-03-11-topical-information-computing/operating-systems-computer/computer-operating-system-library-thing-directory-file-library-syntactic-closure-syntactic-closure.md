---
name: syntactic-closure
description: The syntactic-conformance closure on a thing-directory-file's state-poset: frontmatter is complete and well-typed, style is conformant, placement matches type, markdown links are syntactically valid, tags are well-formed.
specializing: thing-directory-file
realizes: closure-operator
---

**Syntactic closure** S_syn on the state-poset of a thing-directory-file.
Its fixed points are files whose frontmatter is complete and validates against the structure's JSON Schema, whose body conforms to the project's markdown-style rules, whose directory placement matches its type, whose links use canonical markdown syntax, and whose tags follow the registered vocabulary.
Realizes a layer-1 [closure-operator](../../../../../../../../../../../../lattice/library/closure-operator/closure-operator.md).
Composed with [semantic-closure](../semantic-closure/semantic-closure.md) and [fusion-closure](../fusion-closure/fusion-closure.md) by the [stabilizing](../../doing/working/stabilizing/) transformer.
