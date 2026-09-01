---
name: bytes are predications
description: Every byte of a file is a predication cell. The foundational claim of predicated computing — at the level of bytes, computation is predication. Files bear predications within themselves by virtue of byte-content being a cell-graph; this is what makes files entities and what makes computing in this substrate predicated.
status: active
depends-on:
  - ../../../code/structures/predication-cell.md
  - ../../../code/structures/bilattice.md
---

# Bytes are predications

**Claim.** Every byte of a file is a predication cell. The byte at position $p$ with value $v$ is the cell $(p, \texttt{is}, v)$ — the assertion "this byte is that value." A file's byte-content is therefore a cell-graph: the collection of byte-cells the file bears.

A file bears predications within itself. That is what "having byte-content" means under the predication-categorical reading of computing.

## What flows from this claim

This claim is foundational to predicated computing. Everything else in the substrate flows from it.

- **Files are entities.** An entity is a bearer of predication cells (per [`code/structures/entity.md`](../../../code/structures/entity.md)). Every file bears byte-cells. Therefore every file is an entity.
- **All computer data is $(s, p, o)$-shaped.** A file has properties, a row has columns, a pointer points-to, a function call applies-to (per [`code/structures/predication-cell.md`](../../../code/structures/predication-cell.md), §"In computer data more generally"). The byte-level cell-graph is the floor of this structure; higher-level computer data is composed cell-graphs.
- **Computation is predication.** An operation that reads, writes, or transforms bytes is an operation on cells. The category of cell-operations IS the category of computational operations.
- **The bilattice value-algebra applies to byte-content.** Byte-cells take values in the bilattice fiber algebra $A_p$ at the byte-identity predicate. The four values $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$ make the absence of a byte ($\bot$, no evidence) and the contradiction of a byte ($\top$) first-class, not error states.
