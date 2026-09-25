---
type: morphism
class: refactor-generator
status: draft
depends-on: [codebase-cell-system, refactor]
realizes: [refactor]
title: Move
description: A refactor that changes the value of defined-in cells — relocating a definition from one source file to another — without changing any other witness cell.
---

# Move

A refactor that changes the value of `defined-in` cells — relocating a definition from one source file to another — without changing any other witness cell. An entity-permutation acting on the file-entity coordinate of `defined-in` cells.

In $N_W$ iff $W$ does not track the file-coordinate of definitions. Test-only and public-API-aware witness languages typically do not; source-text and import-path-aware languages do (an `import x from 'a/b'` references the file path; moving the definition's file changes the spelling-witness of the import). Like rename, move is a refactor under identity-tracking witnesses and a substantive change under spelling-tracking witnesses.

## Where used

- [refactor-as-invisible-automorphism](../concepts/refactor-as-invisible-automorphism.md).
