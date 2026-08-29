---
title: "Semiotic GitHub"
date-created: 2026-03-06T00:00:00
---
# Semiotic GitHub

This repository specifies how GitHub (Actions, releases, artifacts, checks) is used as part of a "semiotic repository" practice.

It extends the model in `semiotic-git` by specifying CI/CD and hosted automation as *interactions* that:

- are provenance-bearing,
- are deterministic when possible,
- yield auditable artifacts,
- and (when appropriate) mark stability via tags/releases.

Status: draft.

## Repository kind: tooling-contract

This is a **tooling-contract repository**: it encodes an enforceable contract for how GitHub-hosted execution and publication are treated as semioverse interactions.

It is not generic CI/CD best practices. The intent is a stable, auditable interface for hosted operators:

- inputs: git refs + workflow definitions + parameters
- constraints: provenance-bearing runs; determinism when possible; stable artifact naming and hashing; stability marked via tags/releases
- outputs: build/test/publish artifacts plus machine-readable provenance and diagnostics

Enforcement surface (current):

- spec text (`semiotic-github.md`)
- (future) reusable workflow templates and/or validators that assert required provenance fields and determinism constraints
