---
name: token
description: A unit of text — a word, a multi-word phrase, or a regex-pattern instance — recognized within a stretch of bytes. A token carries the surface text, the byte position of its occurrence in a source, and the kind that classifies how it appears (bare prose, code-fenced, quoted, link-target, frontmatter value).
noticing: token
quoting: token
emitting: token
specializing: vague-token
---

Entity record for token. A token is the unit a watchlist scanner produces when it finds a match in a stretch of text. Each token carries a *surface* (the matched bytes), a *position* (offset and line in the source), a *kind* (bare prose, code-fenced, quoted, link-text, link-target, frontmatter-value), and a *source* (the path or origin of the text it was found in). The data shape is fixed at [the JSON schema](token.schema.json); the EAVT log at [token.jsonl](token.jsonl).

Specializations of token are recorded under [the library subtree](library/). The first specialization is [vague-token](../vague-token/) — a token whose surface matches a stretch-indicator in the watchlist.
