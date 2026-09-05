---
name: semantic-closure
description: The semantic-integrity closure on a thing-directory-file's state-poset: every referenced concept resolves, every relation is reciprocated, every definition is self-standing.
specializing: thing-directory-file
realizes: closure-operator
---

**Semantic closure** S_sem on the state-poset of a thing-directory-file.
Its fixed points are files whose referenced concepts all resolve to existing records, whose declared relations are reciprocated by their targets, and whose definitions stand independent of inaccessible external documents.
Realizes a layer-1 [closure-operator](../../../../../../../../../../../../lattice/library/closure-operator/closure-operator.md) on the integrity-poset of thing-directory-files.
Composed with [syntactic-closure](../syntactic-closure/syntactic-closure.md) and [fusion-closure](../fusion-closure/fusion-closure.md) by the [stabilizing](../../doing/working/stabilizing/) transformer.
