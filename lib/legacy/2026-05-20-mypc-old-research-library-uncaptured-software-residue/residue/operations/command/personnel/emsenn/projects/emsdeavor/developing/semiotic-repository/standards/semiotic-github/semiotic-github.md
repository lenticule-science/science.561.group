---
title: "Semiotic GitHub (draft)"
date-created: 2026-03-06T00:00:00
---
# Semiotic GitHub (draft)

## Repository kind: tooling-contract

This repository is a **tooling-contract**: it specifies enforceable constraints on GitHub usage (Actions, artifacts, releases) so hosted automation remains operable as semioverse interaction.

It is not a generic best-practices guide; it is a semiotic constraint surface that future hosts and validators should be able to enforce.

## Scope

This document specifies conventions for using GitHub features—especially GitHub Actions and release artifacts—so that a repository remains operable as an interactive semioverse.

This is not a general best-practices guide; it is an extension of the `semiotic-git` model with hosted execution and publication.

## Core idea

A workflow run is treated as a semiotic interaction over a repository state:

- inputs: a git reference (commit/tag), workflow definition, and parameters;
- operators: the declared steps (build, test, publish) treated as an operator algebra;
- outputs: artifacts plus diagnostics;
- provenance: run identifiers, inputs (refs), toolchain versions, and hashes of outputs.

## Stability and release

- Annotated git tags remain the canonical "necessity" marker (stable fragment) as in `semiotic-git`.
- A GitHub Release is treated as a projection of that stable fragment plus attached artifacts.

## Artifact publishing (preferred)

- Workflows SHOULD publish build products as GitHub Actions artifacts.
- Artifact sets SHOULD be reproducible from the tagged commit under a pinned toolchain.

## Determinism

- Toolchains SHOULD be pinned (container images or exact versions).
- Workflows SHOULD avoid non-deterministic network fetches during publication.

## Minimal provenance schema

A publication run SHOULD record:

- git ref (commit SHA; tag if any)
- workflow file path + commit SHA of workflow definition
- toolchain identity (container digest/version)
- output hashes for each published artifact
- run URL / run ID

## Relationship to other repos

- `pandoc-publishing`: a concrete operator family for Markdown→{HTML,PDF} projections.
