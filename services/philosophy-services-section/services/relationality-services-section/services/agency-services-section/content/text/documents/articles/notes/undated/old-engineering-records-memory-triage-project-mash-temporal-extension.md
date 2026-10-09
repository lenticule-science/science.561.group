---
name: project_mash-temporal-extension
description: The user recognized that MASH's role is not to add new primitives but to give FARS's possibility-structure (modal geometry) temporal persistence — the evolution of the system state over time.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_mash-temporal-extension
---

## The Insight

During the discussion of cellular computer systems and architecture (2026-04-04), the user identified that:

**MASH does not introduce new primitives beyond FARS.** Instead, MASH provides **persistent dynamics** to FARS's **modal geometry**.

In other words:
- **FARS** defines the *possible states* the system can occupy — the state space, the territory of what configurations exist
- **MASH** realizes *which specific states the system actually occupies at each moment* — the trajectory through state space over time

This maps to mathematical topology: FARS is the topology (the shape of possibility), and MASH is the dynamics (how the system evolves through that space).

## Why This Matters

Previous understanding conflated MASH with "the virtual environment" without precision. The clearer formulation:

1. **FARS is modal**: It defines normative positions (rights/duties/powers/immunities), possible actions, constraints, resource types. These are the *modalities* — what CAN be.

2. **MASH is temporal**: It tracks which modalities are *actualized* at each history/session/moment. It's the settlement path applied to FARS — the conversion of possible to actual.

3. **They are orthogonal**: FARS is a *statics* — the unchanging logical structure. MASH is a *dynamics* — the persistent change through that structure.

This resolves the earlier question: MASH doesn't need different primitives than FARS because it's not building a different logical space. It's *inhabiting* the logical space that FARS defines, and tracking how the system moves through it over time.

## Application

When designing MASH components (context injector, skill matcher, dispatch logic):
- Ask not "what new capability does this add?" but "what aspect of the system's *temporal trajectory* does this govern?"
- MASH hooks are those that concern themselves with: session state, decision points, history accumulation, path dependency, persistence across moments
- FARS hooks are those that concern themselves with: file format, frontmatter schema, logical constraints, static validity

The two layers can then be unified: FARS + MASH dynamics = the full description of a system that has both logical structure and historical persistence.
