---
title: "Decision: repository means the physical files on disk"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: decision
status: accepted
keywords:
  - Repository
  - Terminology
  - AgentialSemioverse
---

## Context

The term "repository" is used in at least three senses across the
emsemioverse:

1. **Physical repository**: the actual files on disk — the git
   repository, the filesystem, the directory structure.
2. **Endeavor**: the practice, governance, plans, decisions, and
   people doing the work.
3. **Specification**: the organizational conventions an ASR
   instantiates (currently called "agential-semioverse-repository
   specification").

This ambiguity is load-bearing in the name "agential-semioverse-
repository" (ASR), which appears to refer to all three at once. When
agents or specifications say "the repository," it is often unclear
which sense is meant.

## Decision

**Repository** means sense (1) only: the physical git repository —
files, directories, git history, and filesystem structure. It does
not mean the endeavor, the project, or the organizational conventions.

**Endeavor** refers to sense (2): the semiotic-endeavor instantiated
in this repository — the practice, governance, plans, decisions,
and the people conducting work.

The "agential-semioverse-repository specification" is a specification
of how a physical repository SHOULD be organized to instantiate an
agential semioverse. It is correctly named in that its subject IS the
repository (files on disk). However, many artifacts currently nested
under it — plans, decisions, policies — belong to the **endeavor**,
not the repository qua files.

This is not a rename of the ASR spec. It is a disambiguation that
future specifications and naming decisions should follow.

## Consequences

- When a specification says "the repository," it means files on disk.
- When referring to the practice, governance, or project, use
  "endeavor" or "semiotic-endeavor."
- Plans, decisions, and policies live under the endeavor layer, not
  the repository layer. That they are currently nested under the ASR
  spec is a structural debt to address in a future pass.
- The SHACL deviation-measurement tooling validates the REPOSITORY
  (files on disk) against the knowing-semioverse standard. It is
  correctly described as repository-level tooling.
- Future specifications should be precise about which layer they
  govern. A spec about directory naming governs the repository. A
  spec about governance processes governs the endeavor.

## Alternatives considered

- **Keep all three senses**: too much ongoing confusion; the word
  does real work and should mean one thing.
- **Rename the ASR spec**: the ASR spec IS about the repository in
  the strict sense (physical organization). The name is defensible.
  What needs to change is clarity about what ELSE the name entails.

## Open questions

- Plans and decisions currently live at
  `agential-semioverse-repository/plans/` and `.../decisions/`. Do
  these belong to the repository (governance of the files) or the
  endeavor (governance of the practice)? Likely the endeavor — but
  this relocation is future work.
- Does the endeavor need its own specification separate from the ASR
  spec? Probably yes — the semiotic-endeavor-specification already
  covers this at the abstract level; a concrete emsemioverse-endeavor
  specification might be needed.
