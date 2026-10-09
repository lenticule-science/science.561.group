---
name: harness-as-deployment-substrate-projection
description: "Do deployment-substrate harnesses share a section that all platform-specific harnesses refine?"
type: question
class: harness-discipline
status: open
depends-on: [../../teaching/explanations/boundary, ../../../../teaching/explanations/interfacer]
see-also: [mcp-client-as-swarm-participant, routable-llm-endpoint-as-swarm-participant]
title: harness-as-deployment-substrate-projection
---

# Do deployment-substrate harnesses share a section that all platform-specific harnesses refine?

The seven harnesses currently implemented under `pyfars.harnesses:` (`replit`, `repo-instructions`, `claude-code`, `claude-code-hooks`, `cline-workflows`, `claude-agent-sdk-plugin`, `replit-config`) are all *agent-runtime harnesses*: they project substrate state to a particular agent runtime's expected layout.
None project to a deployment substrate (Nix, Docker, plain-systemd, etc.).

A *deployment-substrate harness* — for instance, one emitting a Nix flake describing how to instantiate FARS on a host — is structurally a different kind of harness.
The captain's concrete request is for such a harness, but pursued naively as "POSIX harness specializes to Nix harness," a category error may follow.
The question is whether the proposed POSIX→Nix specialization is real factorization or premature abstraction.

In substrate language: in the (yet-to-be-drafted) category of [boundary](../../teaching/explanations/boundary.md)-fibered harnesses over deployment substrates, does there exist a section over POSIX such that all platform-specific harnesses (Nix, Docker, plain-systemd, …) refine it?
Equivalently: do POSIX-and-friends share a common deployment-substrate fiber under which Nix is a refinement, or are POSIX and Nix sibling sections of the deployment-substrate fibration with no shared parent below the abstract harness-machinery itself?

## Why this matters

If a common section exists, the right work order is *POSIX harness first, Nix harness as refinement* — duplication is avoided, and the cohomology is trivial.

If no common section exists, the right work order is *Nix harness directly, POSIX harness later if and when a non-Nix POSIX target arises* — and "POSIX harness as parent of Nix harness" is a category error that would mislead the implementation.

## What's needed to answer

The FARS *Harness surfaces & interfacers* spec section (still to write per [`_index.md`](../_index.md)) is the material this question is downstream of.
Its promised content — "boundary-as-fiber-composition, transport-independence, the three interfacer operations (extract/apply/compose), the counit law, the cost settlement path" — gives the categorial language to formulate the section/refinement question precisely.

Without that section, the answer is unfalsifiable; with it, the answer should fall out of structural analysis of the deployment-substrate fiber.

## Empirical hint

The seven existing agent-runtime harnesses do *not* share a common section that's been factored out — each has its own `_install_<name>` function with no abstracted parent.
This is consistent with either (a) common factorization possible but not yet done, or (b) the harnesses are genuinely distinct sections with no common parent.
The same disambiguation will arise for the deployment-substrate harnesses.
