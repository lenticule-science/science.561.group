---
name: "Agent skill proficiency"
date-created: 2026-03-08
authors:
  - claude
type: concept
keywords:
  - AgentialSemioverse
  - Skills
  - Agents
description: "The degree to which a specific agent is trusted to execute a specific skill — a property of the agent-skill pair, not of either alone."
---

**Agent skill proficiency** is the degree to which a specific agent
is trusted to execute a specific skill. It is a property of the
agent-skill pair, not of either alone: an agent may be highly
proficient at classification but unreliable at architectural
reasoning; a skill may be executable by many agents at one maturity
level but only by a few at another.

## Theoretical basis

In the agential semioverse, agents have profiles (role, goals, policy,
skills, tools, memory) and act through skill applications. The skill
calculus describes how skills compose and sequence. Agent skill
proficiency adds a missing dimension: the *quality* of execution —
not just whether an agent can invoke a skill, but how well it
performs.

This matters because the agential semioverse permits agents of varying
capability to operate on the same semioverse. A human agent and an AI
agent may both have access to the same skill; they may produce outputs
of different quality. A large language model and a small one may both
be able to classify documents; the larger model may do so more
accurately. Proficiency formalizes this variation.

## Components of proficiency

Proficiency is not a single scalar. It decomposes into:

1. **Accuracy**: does the agent produce correct output for the skill's
   domain?

2. **Consistency**: does the agent produce stable output across
   equivalent inputs?

3. **Coverage**: does the agent handle the full range of inputs the
   skill encounters?

4. **Constraint respect**: does the agent stay within the skill's
   declared region and output schema? An agent that exceeds its
   declared scope violates the non-interference property that
   multi-agent coordination depends on.

5. **Cost**: what resources (time, computation, money) does the agent
   consume?

## Relationship to skill maturity

The skill-maturity progression (inference-heavy → structured →
delegable → procedural → tool) describes decreasing capability
requirements for execution. Agent skill proficiency adds a
perpendicular axis: at each maturity stage, which agents meet the
capability threshold?

```
                    inference-heavy → structured → delegable → procedural → tool
high-capability      ✓                ✓             ✓           (N/A)        (N/A)
medium-capability    partial          ✓             ✓           (N/A)        (N/A)
low-capability       ✗                partial       ✓           (N/A)        (N/A)
deterministic        (N/A)            (N/A)         (N/A)       ✓            ✓
```

The progressive automation direction moves skills rightward (toward
lower capability requirements). Agent skill proficiency tracks which
agents can operate at each column. The combination identifies the
current "floor" of the endeavor: the least capable agent that can
execute the least mature skill.

## Encoding proficiency

Proficiency can be encoded at multiple levels of formality:

### Ordered trust list (simplest)

A skill declares an ordered list of trusted agents. When provenance
is tracked, a weaker agent's output can be recognized and overwritten
by a stronger one.

### Proficiency matrix (moderate)

A per-skill, per-agent matrix records proficiency across the component
dimensions. This enables nuanced decisions: an agent with high
accuracy but low consistency might be used for initial passes but not
for final review.

### Earned proficiency (most rigorous)

Proficiency is measured, not declared. An agent's proficiency at a
skill is established by running the skill on a test corpus and
evaluating output against known-good results. This is the
constraint-forcing validation applied to agents: an agent's
proficiency claim is a greenfield claim until tested against
resistant reality.

## Relationship to provenance

When an agent executes a skill, the output should carry provenance
that identifies the agent and its proficiency context. This enables
downstream consumers to assess the output's reliability and enables
re-execution by higher-proficiency agents when warranted.

## Relationship to trust

Agent skill proficiency is a specific instance of trust applied to
skill execution. The trust concept (at the endeavor level) describes
the interpersonal precondition for coordination. Agent skill
proficiency operationalizes trust for a specific case: trusting that
an agent will produce adequate output for a specific skill. The
decomposition into accuracy, consistency, coverage, constraint
respect, and cost is what makes this operationalizable — it replaces
a vague "do I trust this model?" with specific measurable dimensions.

## Open questions

1. **Granularity**: per-skill or per-skill-per-input-type? An agent
   might be proficient at enriching short notes but not long essays.

2. **Transitivity**: if agent A is trusted for skill X, and skill X
   invokes skill Y, is agent A trusted for skill Y?

3. **Dynamic proficiency**: does proficiency change over time? A model
   might improve at a skill through fine-tuning or degrade through
   distribution shift in the input corpus.

4. **Proficiency as closure condition**: when has enough proficiency
   measurement been done? This is itself a convergence question —
   measurement continues until the proficiency assessment stabilizes
   under further testing.
