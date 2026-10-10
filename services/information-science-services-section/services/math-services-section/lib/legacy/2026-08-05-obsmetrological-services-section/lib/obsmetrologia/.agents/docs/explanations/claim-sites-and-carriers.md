---
title: Claim-Sites and Carriers
description: The shared documentation base that lets Lean, Blueprint, Verso, API docs, and provenance describe one mathematical object without becoming parallel books.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - claim-sites
  - documentation-architecture
  - explanation
  - diataxis
---

# Claim-Sites and Carriers

The current Verso documentation architecture names the base object as a
claim-site: a typed position where a mathematical, technical, or conceptual
claim can live. The claim-site is not identical to Lean, Blueprint, Verso, API
docs, or provenance. It is the address over which those surfaces are organized.

This is the main reason the agent documentation should not become a second
manual. It should maintain coverage over claim-sites.

## Carrier Roles

Lean is the settlement carrier. It answers what the kernel admits, which names
exist, what their signatures are, and what depends on what.

Blueprint is the incidence carrier. It answers which claim-sites depend on
which others, which are proved, which are frontier, and where pressure remains.

Verso is the expository carrier. It teaches the claim-site with explanations,
tutorials, examples, and reference sections.

Generated API docs are the interface carrier. They make declarations searchable
and expose module docstrings and declaration docstrings.

Corpus and notes are the provenance carrier. They record source language,
exploratory pressure, history, and unpromoted material.

The `.agents/docs` tree is the maintenance carrier for future agents.

## Drift

Drift is failed gluing between carriers.

Examples:

- Blueprint marks a theorem green but no Lean declaration witnesses it.
- Verso teaches a concept with no claim-site or status.
- A Lean declaration exists but has no Blueprint node and no teaching path.
- A frontier note speaks as if it were settled.
- A term appears in a glossary but has no provenance, module, or route.

When drift is found, do not hide it by writing smoother prose. Name the missing
fiber and either add it or mark it as a coverage obligation.

## Diataxis As Fibers

Diataxis coverage is a set of fibers over a claim-site:

- tutorial: how a reader enters by doing or following a learning path;
- guide: how a contributor performs a repeatable task;
- explanation: why the object exists and what generates it;
- reference: compact status, links, declarations, dependencies, and terms.

These fibers may be inherited. A declaration-level term can inherit the tutorial
from its concept page while keeping only a compact reference entry. A topic may
have a guide for maintaining all concept pages below it.

## The Rule For New Concepts

When a new thing is revealed during documentation, create the claim-site before
writing around it.

Minimum entry:

- preferred name;
- scale: topic, concept, or term;
- status: foundation, recovery, frontier, provenance, archived, or unknown;
- generating inputs;
- generated outputs;
- current carriers: Lean, Blueprint, Verso, API, provenance;
- missing Diataxis fibers.

This keeps new discoveries from becoming loose prose.

