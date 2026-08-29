---
title: "Skill colocation"
---

# Skill colocation

An *operational skill* — a `SKILL.md` file under `governance/skills/<name>/` — is an instance of the theoretical *skill* concept. The theory that establishes the skill as possible is the [agential-orchestration-platform](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/), and the canonical record-shape it must conform to is the FARS [skill-record](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md) object.

This note states the discipline that connects the operational artifact (the SKILL.md file an agent loads at runtime) to the theoretical artifact (the skill-record definition that says what shape the SKILL.md must have).

The commitment is simple: **a skill that is not anchored in the theory that establishes it as possible is outside the theory.** Operational skills MUST cite their establishing theory; theoretical skill-records SHOULD point at their realizing operational SKILL.md files.

## Why colocation matters

Without the binding, two failure modes recur:

1. **Skills drift from theory.** An agent's runtime collection of skills evolves under operational pressure (new use cases, new tools, new patterns) without the theory's discipline tracking the evolution. Skills accumulate fields the theory doesn't model, drop fields the theory requires, and grow patterns the theory hasn't named. The theory's account of what a skill is becomes stale; the operational reality becomes ungrounded.

2. **Theory drifts from practice.** The skill concept and the SkillRecord object grow elaborate as the theory matures, with required fields and invariants the operational SKILL.md files don't satisfy. The theory becomes aspirational; the practice becomes uncited.

Both drift modes are visible in the current corpus. The recent FARS work names the connection ("a SkillRecord is what `invoke-skill` reads at invocation time"), but the operational SKILL.md files in `governance/skills/<name>/` predate FARS and do not cite the SkillRecord object. The fix is mechanical and small per-skill but accumulates: every operational SKILL.md gets a `realizes:` (or `instantiates:`) reference to a SkillRecord-shaped substrate-resident anchor.

## The colocation pattern

For each operational skill `governance/skills/<name>/SKILL.md`:

### 1. The operational SKILL.md SHOULD declare its theoretical anchor

The SKILL.md frontmatter SHOULD include:

```yaml
---
name: <skill-slug>
description: "..."
realizes: skill-record           # the theoretical object this skill instantiates
part-of: <theory-slug>           # the theory whose machinery establishes this skill (typically agential-orchestration-platform)
enables-capabilities: [...]      # the capabilities an agent holding this skill gains
runtime: <inference|tool|composed>
region:
  reads: [...]
  writes: [...]
triggers: [...]                  # human-readable trigger phrases
inputs: { ... }                  # input schema
outputs: { ... }                 # output schema
---
```

The fields above match what FARS's SkillRecord object [requires](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md#required-fields). An operational SKILL.md that satisfies the SkillRecord shape is a *conformant skill instance*; one that does not is a curation diagnostic.

### 2. The theory's `examples/` SHOULD cite the operational skill

When a theory documents that operational skills realizing its concepts exist, it SHOULD do so in `examples/`:

```
agential-orchestration-platform/
└── examples/
    └── operational-skill-orient-to-area.md      # type: example, instantiates: skill-record
```

Each such example is a thin pointer: it cites the operational SKILL.md, lists which fields satisfy which SkillRecord requirements, and notes which fields are missing or extended. The operational SKILL.md remains the source-of-truth; the example is the theory's *witness* that the operational instance exists and conforms.

### 3. The skill concept's body SHOULD link to the operational instance directory

The [skill concept](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill.md) SHOULD have a `## Realized in` section that points at `governance/skills/`:

> Operational skill instances live in [`governance/skills/`](../../../../../../../../../../../../governance/skills/). Each subdirectory holds one SKILL.md file conforming to the [skill-record](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/objects/skill-record.md) shape.

This is the *back-pointer* from theory to practice. The forward-pointer (practice → theory) is the SKILL.md's `realizes:` field.

## What about non-AOP-anchored operational artifacts?

Some operational artifacts in `governance/skills/` are not classical agential skills — they are tools, scripts, validation harnesses, or composite procedures that happen to live in the skills directory. The discipline:

- An operational artifact that is *agent-invoked at the F1–F2 formality* (the agent reads it, decides whether to execute it, calls it via the substrate's `invoke-skill` morphism) is a *skill* per AOP and MUST conform to the SkillRecord shape.
- An operational artifact that is a *deterministic tool* (a Python script with a fixed entry point, called without agent deliberation) is a [tool](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill-composition.md) per AOP. It MAY be wrapped in a SKILL.md (as the F2-formality body of a skill) or live directly in `operations/engineering/tools/`.
- An operational artifact that is a *composed procedure* (multiple skills called in sequence) is a [runbook](../../../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/skill-composition.md). Its theoretical anchor is the AOP `runbook-record` object; its colocation discipline is the same as for skills.

## Other theories that establish operational artifacts

The pattern generalizes. Each of these operational artifact families has a theoretical anchor:

| Operational artifact family | Theoretical anchor (object) | Establishing theory |
|---|---|---|
| `governance/skills/*/SKILL.md` | `skill-record` | agential-orchestration-platform |
| `governance/skills/*/RUNBOOK.md` (planned) | `runbook-record` | agential-orchestration-platform |
| `operations/command/agents/*/AGENT.md` | `agent-record` | agential-orchestration-platform |
| `operations/command/offices/*/OFFICE.md` | `office-record` | agential-orchestration-platform |
| `operations/engineering/closure-rules/*.toml` | `closure-rule-record` | flatfile-agentic-resource-system |
| `operations/engineering/tools/*` | `tool-record` (proposed) | agential-orchestration-platform or functional-runtime-platform |

For each row, the operational artifact MUST cite its theoretical anchor; the theory MAY cite specific artifacts as `examples/` witnesses.

## Curation work this implies

The current state:

- 41 operational skills under `governance/skills/<name>/SKILL.md`, none citing AOP's SkillRecord.
- AOP has a `skill` concept and a `skill-record` object (in FARS) — but no `examples/` cited from AOP that point at the operational skills.
- AGENT.md, OFFICE.md, RUNBOOK.md operational families are sparse or not yet established; their theoretical anchors exist (agent-record, office-record, runbook-record) and are waiting for instances.

The work is per-skill — small mechanical edits to add the `realizes:` and `part-of:` frontmatter, plus per-AOP work to add `examples/` witnesses. It is out-of-scope for this convention spec but is the most concrete curation followup the spec implies.
