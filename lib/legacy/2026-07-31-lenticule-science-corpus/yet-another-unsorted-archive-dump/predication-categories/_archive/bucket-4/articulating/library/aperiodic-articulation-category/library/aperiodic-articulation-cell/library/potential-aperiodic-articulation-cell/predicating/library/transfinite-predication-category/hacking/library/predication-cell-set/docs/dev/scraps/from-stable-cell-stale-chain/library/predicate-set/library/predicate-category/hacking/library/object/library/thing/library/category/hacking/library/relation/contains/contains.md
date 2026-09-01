---
name: contains
description: Aggregation morphism from a directory-index to each child (file or subdirectory) it documents. Domain: directory-index. Codomain: any substrate file or directory beneath it.
---

Domain: a `directory-index` record (an `_index.md`)
Codomain: a file or subdirectory inside the indexed directory

A directory-index R `contains` a child C means: C lives inside the directory R represents, and R documents C as part of the collection. The edge is directional and one-step — the index only `contains:` its immediate children, not transitive descendants (a subdirectory's own `_index.md` carries that subdirectory's `contains:` list).

`contains:` is not ownership or authorship — it is the readable manifest of a collection's membership, recorded in frontmatter so the collection's shape is parseable without scraping body links.
