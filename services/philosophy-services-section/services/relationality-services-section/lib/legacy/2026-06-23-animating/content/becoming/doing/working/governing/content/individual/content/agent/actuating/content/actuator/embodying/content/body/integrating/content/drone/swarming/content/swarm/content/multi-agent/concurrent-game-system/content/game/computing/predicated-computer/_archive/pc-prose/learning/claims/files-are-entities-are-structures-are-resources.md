---
name: files are entities are structures are resources
description: A file is an entity. An entity is a structure. A file is a resource. Three is-a relations, stated as facts, encoded as cells in the structure records.
status: active
depends-on:
  - bytes-are-predications.md
  - ../../../code/structures/regular-file.md
  - ../../../code/structures/entity.md
  - ../../../code/structures/structure.md
  - ../../../code/structures/resource.md
---

# Files are entities are structures are resources

**Claim.**

1. A file is an entity.
2. An entity is a structure.
3. A file is a resource.

The three is-a relations are encoded as `is-a:` cells in the structure records:

- [`code/structures/regular-file.md`](../../../code/structures/regular-file.md) bears `is-a: entity` and `is-a: resource`.
- [`code/structures/entity.md`](../../../code/structures/entity.md) bears `is-a: structure`.

The chain `file → entity → structure` is the predication-category-theory side: a file bears predication cells (per [`bytes-are-predications`](bytes-are-predications.md)) and is therefore an entity; an entity inhabits a structure-type and is therefore a structure-instance. The relation `file → resource` is the flatfile-agentic-drone-resource-system side: a file in a role-partitioned directory addressable by its path and dispatchable by agents is a resource.

The is-a relations do not posit a common substance under the four structures. The model is the model of rings and sheaves on a set: the underlying object (the set; the file) doesn't change; what changes is the additional mathematical apparatus put on it.
