---
title: "Guix module"
aliases:
  - "Guile module used by Guix"
  - "Guix package module"
date-created: 2026-08-28
date-modified: 2026-08-28
type: term
defines:
  - "Guix module"
requires:
  - "Guix"
  - "module"
---

# Guix module

## Plain definition

A **Guix module** is informally a Guile module that defines or uses Guix data
types and procedures. It is an ordinary named Guile code namespace, not a
separate kind of module invented by Guix. It can export package objects,
service types, records, readers, codecs, policies, lowering procedures, or any
other reusable binding.

Boss version: **a module is a reusable chapter of executable definitions.** A
channel delivers chapters; a manifest chooses things those chapters define.

Guile convention maps a module name to a file path relative to a load path:

```scheme
(define-module (phezi ochage atlas)
  #:use-module (guix packages)
  #:export (atlas-package open-atlas))
```

The module `(phezi ochage atlas)` conventionally lives at
`phezi/ochage/atlas.scm`. If this repository uses `guix/` as its module root,
the full repository path would be `guix/phezi/ochage/atlas.scm`.

## What a module is not

A module is not:

- a Git repository or channel;
- necessarily one package definition;
- a manifest or installed environment;
- a built artifact merely because it contains build logic; or
- automatically visible to Guix because the file exists somewhere in a
  checkout.

A module may export zero, one, or many package objects and arbitrary non-package
logic. During development, `guix -L guix ...` can add the repository's module
root to the load path. A channel makes selected modules available through a
versioned `guix pull` instead.

## Relation to Pheží Ocháǧe

Modules are where the reusable implementation of the atlas should live. For
example:

```text
(phezi ochage cell)          cell records and identity law
(phezi ochage census)        streaming census procedures
(phezi ochage atlas)         lazy query interface
(phezi ochage classify)      readers and admission procedures
(phezi ochage guix lower)    explicit Guix lowering
(phezi ochage packages atlas) Atlas package definition
```

The modules do not themselves constitute the whole atlas. They provide the
vocabulary and procedures by which admitted atlas carriers are read, queried,
and selectively realized.

## See also

- [Guix](./guix.md)
- [Guix channel](./guix-channel.md)
- [Guix manifest](./guix-manifest.md)
- [GNU Guix manual: Package Modules](https://guix.gnu.org/manual/en/html_node/Package-Modules.html)
