---
title: The Emsemioverse
id: emsemioverse-readme
kind: readme
date-created: 2025-12-04
authors: [emsenn]
---

# The Emsemioverse

***The Emsemioverse*** is an *Interactive Semioverse* created and stewarded primarily by *emsenn*.

## What is an Interactive Semioverse

An *Interactive Semioverse* is a *semiotic universe* that has been enriched to allow for multi-agential persistent existence.

### Okay, then what's a Semiotic Universe

A *semiotic universe* is a mathematical object for handling meaning like it's algebra and calculus.
It and the Interactive Semioverse are documented within the Library of Mathematical Objects.

## Why have an Interactive Semioverse?

It provides the structuration that makes all my other work more intelligible.
"All my other work," is various forms of research and production of releated media.
The research program is centered around **relationality**, an epistemic and ontological framework I've derived from my own Lakota learning.

While the research and work this is built on is decades in the making, the notion of "interactive semioverse" is quite recent and thus the main focus right now is reshaping my work under this new, more cohesive framing.

## How the Emsemioverse is organized

The Emsemioverse is a *Semioverse Repository* and follows its agent contract and local specifications.

The library is now organized by disciplines and subdisciplines derived from tags.
See the layout specification for details:

- [Library layout specification](/library/mathematics/objects/agential-semioverse/practice/library-layout-v1/README.md)
- [Library entities specification](/library/mathematics/objects/agential-semioverse/practice/library-entities-v1/README.md)
- [Tags taxonomy](/library/mathematics/objects/agential-semioverse/practice/tags-taxonomy/README.md)

## For Agents

Unless otherwise instructed, agents should act as the [Emsemiote](library/agents/emsemiote/AGENTS.md).

## Specifications

Specifications live alongside the domains they govern.
The library uses local `SPECIFICATIONS.md` files and domain-specific specification documents, paired with skills and scripts that make the specs operational.

- [Writing specifications](/library/media/writing/practice/SPECIFICATIONS.md)
- [Math specifications](/library/study/math/SPECIFICATIONS.md)
- [Agent specifications](/library/agents/SPECIFICATIONS.md)
- [Semiotic Markdown specification](/library/applications/software/semiotic-markdown/semiotic-markdown.md)

## Deployment (ops quickstart)

- Requirements: Python 3.11+.
- Configure: copy `.env.example` to `.env` and adjust `EMSEMIOVERSE_HOST`, `EMSEMIOVERSE_PORT`, `EMSEMIOVERSE_LOG_LEVEL` as needed.
- Install/build: `make setup` (creates `.venv`, installs backend).
- Run locally: `make run` (serves FastAPI + MCP at port 5000; see `/docs` for HTTP endpoints).
- Tests: `make test` (pytest in `engine/tests`).
- Lint/manifest: `make lint` for Ruff + skill lint; `make manifest` to rebuild `library/skill-manifest.json`.
