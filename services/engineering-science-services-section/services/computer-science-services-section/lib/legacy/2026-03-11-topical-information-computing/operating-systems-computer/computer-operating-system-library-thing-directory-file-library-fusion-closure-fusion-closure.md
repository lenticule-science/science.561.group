---
name: fusion-closure
description: The type-content-alignment closure on a thing-directory-file's state-poset: the type field matches what the content actually is, tag-content alignment, directory-content alignment, naming coherence across filename/title/body.
specializing: thing-directory-file
realizes: closure-operator
---

**Fusion closure** S_fus on the state-poset of a thing-directory-file.
Its fixed points are files where the declared type matches the content kind, tags align with content, directory placement matches type and role, and naming coheres across filename, frontmatter name, and body title.
Realizes a layer-1 [closure-operator](../../../../../../../../../../../../lattice/library/closure-operator/closure-operator.md).
Composed with [semantic-closure](../semantic-closure/semantic-closure.md) and [syntactic-closure](../syntactic-closure/syntactic-closure.md) by the [stabilizing](../../doing/working/stabilizing/) transformer.
