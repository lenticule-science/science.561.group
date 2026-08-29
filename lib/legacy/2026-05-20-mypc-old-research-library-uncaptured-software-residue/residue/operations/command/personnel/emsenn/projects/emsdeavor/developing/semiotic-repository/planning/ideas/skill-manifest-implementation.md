---
title: "Implementing skill manifests"
aliases:
  - "Implementing skill manifests"
  - "implementing skill manifests"
date-created: 2026-01-08T00:00:00
type: topic
tags: []
---


This document describes the practical pieces for generating, validating, and consuming skill manifests in the [agential semioverse](../../../../../mathematics/objects/universes/agential-semioverse/index.md).

## Specification
- JSON Schema: `library/mathematics/objects/agential-semioverse/tools/skill-manifest/specs/skill-spec-v1.schema.json`.
- Source SKILL files conform to Skill Spec v1.
- Only entries with a `runtime` are considered executable; others are advisory.

## Tooling
- **Build**: `python library/mathematics/objects/agential-semioverse/tools/skill-manifest/scripts/build-skill-manifest.py --output library/skill-manifest.json`
- **Lint**: `python library/mathematics/objects/agential-semioverse/tools/skill-manifest/scripts/lint-skills.py`
- **Manifest path**: `library/skill-manifest.json` (consumed by engine API and MCP).

## Integration points
- Engine startup rebuilds the manifest if missing and validates for duplicate ids and runtimes.
- MCP/OpenAPI surfaces only skills present in the manifest and allowed for the requesting agent.
- Tests should cover: manifest generation, missing runtime rejection, duplicate id rejection.

## Future work
- Add manifest fragments for per-agent scopes.
- Emit reference URIs to encyclopedia concepts for tokens in inputs/outputs.
