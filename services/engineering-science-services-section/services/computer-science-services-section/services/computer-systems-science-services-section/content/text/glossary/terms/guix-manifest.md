---
name: "Guix manifest"
aliases:
  - "manifest (Guix)"
  - "manifest.scm"
date-created: 2026-08-28
date-modified: 2026-08-28
requires:
  - "Guix"
  - "Guile module"
---


## Plain definition

A **Guix manifest** is a Guile value describing the packages and related
outputs that should be present in one environment, profile, or bundle. A file
conventionally named `manifest.scm` is Scheme code whose evaluated result is a
Guix manifest object.

Boss version: **a manifest is the roster for one material environment.** It
answers “what should this shell, profile, or pack contain?”

Commands such as `guix shell -m manifest.scm`, `guix package -m manifest.scm`,
and `guix pack -m manifest.scm` can realize that roster in different forms. The
same manifest can therefore participate in an ephemeral development shell, a
persistent profile generation, or a distributable pack.

## What a manifest is not

A manifest is not:

- a package definition explaining how to build a package;
- a channel that supplies package and service definitions;
- a complete operating-system or deployment configuration;
- an inventory of everything in a repository; or
- by itself, a lockfile.

Most manifest entries are symbolic selections whose meaning depends on the
channel revisions used to evaluate them. “Install the package named `guile`”
can resolve differently next year if the channel universe changes. Reproducing
an environment therefore normally requires both:

1. a manifest selecting the desired material; and
2. pinned channels selecting the exact definition universe in which that
   manifest is interpreted.

In short: **the manifest chooses; the channels determine what the choices
mean.**

## Relation to a package and profile

A Guix package object is a recipe and metadata for one buildable artifact. A
manifest selects package outputs for a purpose. A profile is a realized,
generational filesystem view of that selection.

```text
channel revisions + Guile modules
              -> available package definitions
manifest      -> selected package outputs
Guix          -> realized profile, shell, or pack
```

## Relation to Pheží Ocháǧe

A machine-owned `manifest.scm` should name the tools required to develop or
operate that machine's atlas—for example Guile and testing or encoding tools.
It should not pretend to enumerate every document, service, person, or resource
in Pheží Ocháǧe. Those belong to the atlas; the manifest selects the software
environment used to work on it.

## See also

- [Guix](./guix.md)
- [Guix channel](./guix-channel.md)
- [Guix module](./guix-module.md)
- [GNU Guix manual: Writing Manifests](https://guix.gnu.org/manual/en/html_node/Writing-Manifests.html)
