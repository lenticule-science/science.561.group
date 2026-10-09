---
name: prepare-theory-for-dev-claim
description: "For a (dev-claim, theory-entity) pair where the gap is small, do the local prep: tighten the definition, add an example, state the theorem precisely. Bounded work that does NOT include non-trivial proof drafting."
status: triage
owner-agent: theory-supporter
project: supporting-pypredcomp-development
blocked-by:
  - "operations/command/projects/supporting-pypredcomp-development/specs/methodology/local-prep-boundary.md"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: prepare-theory-for-dev-claim
---

Local theory prep. Bounded work; non-trivial proofs are out of scope (those go to [`file-research-target`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/file-research-target/SKILL.md)).

## Inputs

- `dev-claim` — path:section pointer into the pypredcomp dev docs.
- `theory-entity` — slug into the math substrate.
- `gap-kind` — what kind of small gap (see procedure).

## Procedure

Pick the right math skill based on `gap-kind`:

- **definition-vague** → call [`tighten-specification`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/tighten-specification) on the entity.
- **example-missing** → call [`draft-example`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/math/draft-example) under the entity's theory.
- **theorem-stated-imprecisely** → rewrite the theorem's statement (body, not proof) to make the claim sharp; leave `status: stated` until proof drafting happens.
- **counterexample-needed** → call [`draft-counterexample`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/skills/math/draft-counterexample).

After the math-side change lands, link the dev claim to the (now solid) theory entity in the dev doc's `depends-on:` and add a body reference if missing.

## What this skill does NOT do

- Draft non-trivial proofs. If the gap requires a real proof, the (dev-claim, theory-entity) pair was misrouted by [`identify-load-bearing-theory-gaps`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/identify-load-bearing-theory-gaps/SKILL.md) — it should have been filed as a research target instead. Push it back.
- Edit pypredcomp source code or pypredcomp decisions. This skill writes only in the math substrate and in the link from the dev doc to the math entity.

## Graduation criteria

Will graduate once `local-prep-boundary.md` has landed and the skill has handled at least three real (dev-claim, theory-entity) pairs without escalating.
