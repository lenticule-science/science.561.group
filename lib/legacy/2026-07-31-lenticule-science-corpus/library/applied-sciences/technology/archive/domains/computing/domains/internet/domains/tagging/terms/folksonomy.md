---
name: "folksonomy"
aliases:
  - "folksonomy"
date-created: 2026-03-04
tags: []
---

A folksonomy is a classification system that emerges from the aggregate tagging behavior of users rather than from a centrally designed taxonomy. Thomas Vander Wal coined the term in 2004, combining "folk" and "taxonomy" to describe the collaborative categorization practices he observed on social bookmarking sites like del.icio.us. Unlike a [controlled vocabulary](./controlled-vocabulary.md) maintained by domain experts, a folksonomy grows organically as users apply whatever labels make sense to them.

Vander Wal identified two varieties. A broad folksonomy arises when many independent users tag the same object — the aggregate reveals which tags are most popular for each item, producing a rough consensus through statistical weight. del.icio.us bookmarks were the canonical example: hundreds of users bookmarking the same URL would independently converge on similar tags, and the distribution of tags across users revealed which labels the community found most useful. A narrow folksonomy arises when one person (or a few people) tags their own content. Flickr photo tags were the canonical example: the photographer labeled their own images, making unsearchable visual content findable through text. A personal knowledge vault is a narrow folksonomy of one — the narrowest possible case.

Folksonomies have characteristic failure modes. Synonym proliferation occurs when different users apply different tags to the same concept — "javascript," "js," and "JavaScript" all refer to the same language but fragment the namespace. Polysemy creates confusion when one tag has multiple unrelated meanings — "python" as a programming language and "python" as a snake. Granularity drift happens when broad tags ("science") coexist with narrow tags ("heyting-algebras") without consistent hierarchical relationships. These problems are inherent to emergent systems and explain why many platforms have moved toward hybrid models — allowing free tagging at the point of creation but applying [tag wrangling](./tag-wrangling.md) retroactively to bring the namespace under control.
