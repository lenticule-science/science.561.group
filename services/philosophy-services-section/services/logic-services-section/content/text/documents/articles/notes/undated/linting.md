---
name: linting
gerund: linting
agent-noun: linter
imperative: lint
description: Checking a resource candidate against the specifications that apply to it and returning diagnostics without changing the substrate.
title: linting
---

A lint transformer observes a candidate resource and reports whether it satisfies the declared specifications that apply to that candidate.

Linting is read-only at the substrate boundary. It may parse, normalize for observation, and emit diagnostics, but it does not repair or rewrite the file it checks.

## Domain and codomain

- **Domain:** a resource candidate, usually a [`resource-file`](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/emsenn-archive-org/resource-file.md) addressed by repository-relative path.
- **Codomain:** a diagnostic report with a boolean outcome and zero or more structured diagnostics.

## Morphological forms in naming grammar

- `gerund: linting` heads skills built on this transformer: `linting-a-resource-file`.
- `agent-noun: linter` heads agents that invoke such skills: `linter-of-a-resource-file`.
- `imperative: lint` heads scripts that body such skills: `lint-a-resource-file.mjs`.
