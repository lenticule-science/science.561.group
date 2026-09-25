---
name: "Guix channel"
aliases:
  - "channel (Guix)"
  - "Guix package channel"
date-created: 2026-08-28
date-modified: 2026-08-28
requires:
  - "Guix"
  - "Guile module"
---


## Plain definition

A **Guix channel** is a named, versioned source from which Guix obtains Guile
modules containing package definitions, service definitions, and other Guix
logic. In ordinary use the source is a Git repository. A channel declaration
can select a repository URL, branch or exact commit, and authentication
information.

Boss version: **a channel is a versioned delivery line for the definitions that
teach Guix what is available.** The official collection of Guix packages is
itself delivered as a channel. An organization can publish another channel to
extend that collection.

Running `guix pull` with a channel configuration fetches, authenticates, and
compiles the selected channel revisions into a new generation of Guix. It
updates the Guix program and its available definition universe. It does not by
itself install the packages selected for a project.

## What a channel is not

A channel is not:

- the Git repository itself; the channel declaration points to and selects a
  version of a repository;
- a package or build artifact;
- a list of tools to install in an environment;
- a deployment description;
- a binary cache or substitute server; and
- activated merely because a repository contains `.guix-channel`.

## The two channel files people confuse

`channels.scm` is consumer-side configuration. It normally returns a list of
channel records and answers: **which channel repositories and revisions define
the Guix universe I want to use?** It can be supplied to `guix pull -C` or
`guix time-machine -C`. A project-root `channels.scm` is conventional but is
not automatically used by every Guix command.

`.guix-channel` is author-side metadata inside a repository that is being
offered as a channel. It can declare where the repository's Guile modules live,
which other channels it depends on, and channel news or authentication
metadata. It does not subscribe a machine to the channel.

For example, `.guix-channel` may say that the repository's `guix/` directory is
the module root. That does not make Git fetch only `guix/`, install anything,
or turn the rest of the repository into packages.

## Relation to Pheží Ocháǧe

A Pheží Ocháǧe channel would distribute selected Guile modules defining the
cell kernel, atlas readers, packages, services, and lowering procedures. It
would not make the entire life corpus one package. During development those
same modules can be loaded directly with a Guile/Guix load path; the channel is
their authenticated, versioned delivery mechanism.

## See also

- [Guix](./guix.md)
- [Guix manifest](./guix-manifest.md)
- [Guix module](./guix-module.md)
- [GNU Guix manual: Channels](https://guix.gnu.org/manual/en/html_node/Channels.html)
