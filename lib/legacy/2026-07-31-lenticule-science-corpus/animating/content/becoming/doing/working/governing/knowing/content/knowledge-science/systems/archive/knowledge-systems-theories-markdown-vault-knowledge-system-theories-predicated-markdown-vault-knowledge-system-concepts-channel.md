---
type: concept
class: structural
status: open
depends-on:
  - note.md
  - ../../../../../../../../communication/concepts/channel.md
see-also:
  - audience.md
  - pragmatic-register.md
  - note-type.md
  - questions/audience-and-pragmatics-of-each-note-type.md
  - ../../../../../../../../../humanities/theories/communication/concepts/transport.md
---

# Channel

The **channel** of a typed [note](note.md) is the medium through which the note reaches its [audience](audience.md). For this corpus the primary channel is the markdown file itself, read in three derived forms: as plain text in an editor or `grep`-pipe; as rendered HTML in the published site; as one node in the relation graph traversed by the FARS toolkit. The discipline commits — per the [markdown-vault commitments](../../../_index.md) — that the file is the source and the rendered forms are derived; channel-aware writing is therefore writing that the source-file form must support, not writing optimized for any particular rendered form.

This concept binds upstream to the [science-side communication theory's channel concept](../../../../../../../../communication/concepts/channel.md) (the source-channel-receiver tradition's notion: a transport substrate with capacity, noise characteristics, and a code that maps messages onto signals) and, on the closure side, to the humanities-side communication theory's [transport](../../../../../../../../../humanities/theories/communication/concepts/transport.md) concept (preservation of communicative identity across registers). The substantive specification of how channel constrains body conventions for each note type is held open at [audience-and-pragmatics-of-each-note-type](questions/audience-and-pragmatics-of-each-note-type.md).

## Why channel is its own anchor

Several discipline rules are channel-load-bearing without naming the channel explicitly:

- The "plain-text first" commitment requires that a note be useful with no rendering pipeline beyond a text editor — a constraint on how dense, how interactively-formatted, and how visually-laid-out the body can be.
- Each typed-relation edge is stored at exactly one site — the source note's frontmatter. The renderer derives a target's "notes that point at this one" view at read-time by inverse-edge traversal, which requires a channel that supports cross-file lookup over frontmatter (`grep`, FARS toolkit). A channel that drops frontmatter loses the substrate the derivation runs on.
- The `directory-tree-carries-meaning` commitment turns the file system into a navigable channel in its own right; the directory layout is part of what each note communicates.

## Relation to upstream

The corpus's three derived channels — plain-text, rendered HTML, FARS-traversed graph — are three distinct registers in the humanities-side communication theory's sense. A change of channel is a change of `register` in that vocabulary, with its own native panels, native rigor, and characteristic transport-loss. This connection is what makes the per-note-type pragmatics question answerable: each typed note's body conventions can be stated as commitments about *which* of the three channels each commitment serves, and what transport-loss the discipline accepts in the other two.
