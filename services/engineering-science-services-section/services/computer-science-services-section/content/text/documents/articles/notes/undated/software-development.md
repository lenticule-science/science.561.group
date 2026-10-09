---
title: "Software Development"
component-of: software-engineering
locates: activity
contains: [software-refactoring]
teleology: "The activity by which a working software artifact comes into existence and changes over time — the cycle from a problem-statement to running, observed code, and the iteration of that cycle as understanding accrues."
method: "Comparative analysis of development cycles and their constituent activities, attending to which activities preserve structure (refactoring, formatting), which add capability (feature work), and which remove or replace it (deletion, rewrite)."
description: "Software development is the activity-slice of software-engineering: the cycle by which software comes into being and changes."
---

Software development is the activity-slice of [software-engineering](../../research/2026/07/31/lenticule-import/computing/software/_index.md): the cycle by which software comes into being and changes. The discipline as a whole includes deployment, operation, decommissioning, and team-organization; *development* names specifically the work of producing or transforming the source artifact itself.

This theory is intentionally thin. Its job is to host [`software-refactoring/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories/software-refactoring/_index.md) and to give the predicated fusion ([predicated-software-development](../../research/2026/07/31/lenticule-import/computing/predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/_index.md)) somewhere to land. The discipline's content can be developed as the running practice surfaces it.

## What development is, minimally

A development episode is a transition of a codebase from one state to another, accompanied by the witnesses that make the transition mean something — tests passing, reviewers agreeing, deployments succeeding, users not complaining. The episode has constituent activities, each distinguished by what it *does* to the codebase:

- **Feature work** — adds new capability; introduces predicates that didn't exist or extends those that did.
- **Bug fix** — modifies the codebase to bring observed behavior into alignment with intended behavior. The intent may itself be revised in the process.
- **Refactoring** — transforms the codebase's structure without changing its observable behavior. Studied as the leaf subtheory.
- **Deletion** — removes capability that is no longer needed. Often the most valuable activity per line, the rarest in practice.
- **Rewrite** — replaces a region of the codebase with a structurally-different one, typically without preserving observable behavior in the strict sense.

These categories are not disjoint in practice — a feature-work episode commonly contains refactoring sub-episodes, and a bug-fix may require a rewrite. The categories are *aspects* of activity, recoverable by asking what changed about the substrate.

## Subtheories

- [`software-refactoring/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories/software-refactoring/_index.md) — the activity of changing structure without changing observable behavior. The leaf where the predicated fusion has the most to say.

## Layout

- [`questions/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/questions) — open questions about the activity.
- [`texts/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/texts) — long-form treatments (forthcoming as the theory accrues).
- [`theories/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories) — subtheories.

## Status

Drafted to anchor software-refactoring. The activity-categories above are sketches; sharpening them — especially the boundaries between refactoring, rewrite, and feature work — is downstream work, much of which proceeds in the predicated form where the substrate-algebraic distinctions are precise.
