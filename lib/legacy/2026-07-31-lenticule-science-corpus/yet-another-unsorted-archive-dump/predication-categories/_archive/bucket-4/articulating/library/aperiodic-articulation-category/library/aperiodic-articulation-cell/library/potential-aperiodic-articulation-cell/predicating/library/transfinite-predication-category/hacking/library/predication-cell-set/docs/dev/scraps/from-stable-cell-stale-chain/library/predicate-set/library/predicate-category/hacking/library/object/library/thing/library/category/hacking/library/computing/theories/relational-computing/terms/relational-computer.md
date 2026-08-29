---
title: "Relational Computer"
defines: relational-computer
aliases: [relational-computers]
description: "A computer whose primary substrate is the relation: data is encoded as associations between entities, and computation is the addition, removal, and traversal of those associations in a graph."
instance-of: computer
uses: relationality
composes: relation
relates: entity
contrasts-with: boolean-computer
date-created: 2026-04-27
---

A relational computer is a [computer](../../../terms/computer.md) whose primary substrate is the [relation](../../../../../../../../humanities/domains/philosophy/terms/relation.md): [data](../../../../../../../../science/domains/information/terms/data.md) is encoded as associations between [entities](../../../../../../../../science/domains/information/terms/entity.md), and [computation](../../../terms/computation.md) is the addition, removal, and traversal of those associations in a [graph](../../../../../../../../humanities/domains/math/domains/number-theory/terms/graph.md). The relational computer takes [relationality](../../../../../../../../humanities/domains/philosophy/domains/relationality/_index.md) as its organizing ontology — an entity is constituted by the relations it participates in, not by its location in memory or the value stored at that location. Two entities are the same when their relational structure is the same; an entity persists when its relations persist; an entity is observed by traversing the [edges](../../../../../../../../humanities/domains/math/terms/edge.md) incident to it.

A query is a graph traversal: starting from an entity, one follows edges of named [predicates](../../../../../../../../science/domains/information/terms/predicate.md) to reach related entities. There is no fetch-from-address primitive — the closest analog is "what is related to entity *e* by predicate *p*?", a question the graph answers by enumeration. A write is the addition or retraction of a relation; there is no value-mutation primitive, because there are no stored values to mutate.

A relational computer contrasts with a [boolean computer](../../../terms/boolean-computer.md) — one whose data is two-valued and whose computation is the manipulation of those values held at memory addresses. Most architectures realized in physical hardware to date are boolean computers. The substrate choice is ontological, not architectural: layering a graph database on a boolean-computer store does not produce a relational computer, because storage, addressing, and operations still presume the boolean substrate underneath.
