---
name: apply-constraint-based-reasoning
id: apply-constraint-based-reasoning
description: >-
  Apply constraint-based reasoning to an adversary or conflict situation —
  mapping capability envelopes, hard boundaries, structural invariants, and
  persistent vulnerabilities rather than attempting to assess intent.
type: operational
date-created: 2026-03-06
keywords:
  - analysis
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "apply constraint-based reasoning"
  - "analyze constraints"
  - "what can the adversary do"
  - "map the action space"
  - "constraint analysis"
inputs:
  adversary_or_system: string
  known_capabilities: string?
  known_limitations: string?
  context: string?
outputs:
  constraint_assessment: string
title: apply-constraint-based-reasoning
---

# Apply Constraint-Based Reasoning

## What you will be able to do

- Analyze an adversary's capability envelope without relying on intent assessment
- Identify hard boundaries that constrain the adversary's action space regardless of strategic preferences
- Define structural invariants that bound the conflict trajectory for both sides
- Locate persistent vulnerabilities that any sufficiently capable adversary would exploit
- Produce assessments that remain valid even when the adversary's decision-making is opaque

## Prerequisites

- Familiarity with [constraint-based reasoning](../../../glossary/terms/constraint-based-reasoning.md) — the theoretical framework
- Familiarity with [analysis of competing hypotheses](../../../glossary/terms/analysis-of-competing-hypotheses.md) — the SAT that constraint-based reasoning extends
- Understanding of [indications and warning](../../../glossary/terms/indications-and-warning.md) — the warning function that constraint monitoring reframes

## When to use this technique

Constraint-based reasoning is most productive when:
- The adversary's decision-making apparatus is opaque (disrupted leadership, closed political system, unfamiliar strategic culture)
- Intent-based analysis produces speculation rather than assessable hypotheses
- The adversary's behavior may be emergent rather than centrally directed
- The analyst needs to bound the space of possible adversary actions without predicting specific moves

It is less useful when the adversary's intent is well-established through reliable collection and the question is timing or operational details rather than strategic direction.

## Application procedure

### 1. Map the capability envelope

Ask: *What can this adversary actually do?* Catalog capabilities across all relevant domains — military, economic, cyber, proxy, diplomatic, informational. For each capability, assess:

- **Current status.** Is the capability intact, degraded, or destroyed?
- **Operational requirements.** What resources (materiel, personnel, infrastructure, command authority) does the adversary need to employ this capability?
- **Reconstitution timeline.** If degraded, how quickly can the capability be restored? What constrains reconstitution?
- **Dependencies.** Does this capability depend on other capabilities or external support?

The output is not a prediction but a bounded set: these are the things the adversary *can* do, whether or not it chooses to.

### 2. Identify hard boundaries

Ask: *What can the adversary not do, regardless of intent?* Hard boundaries arise from:

- **Physics and geography.** The strait is 21 miles wide. Missiles have maximum ranges. Industrial capacity has fixed limits.
- **Resource constraints.** Munition inventories deplete. Economic reserves draw down. Personnel losses accumulate.
- **Technological asymmetry.** If the adversary cannot contest air superiority, symmetric military escalation is bounded out of the action space.
- **Political constraints.** If the adversary's allies have red lines, those red lines constrain the adversary's options.

Hard boundaries define what the adversary *cannot* do. They narrow the analysis from "anything is possible" to "these specific options are available."

### 3. Define structural invariants

Ask: *What properties of the situation hold regardless of either side's decisions?* Invariants are features of the environment, the political system, or the economic structure that constrain the conflict's trajectory:

- **Economic fundamentals.** Supply-demand curves, price elasticities, production capacities.
- **Political cycles.** Electoral timelines, legislative calendars, public opinion dynamics.
- **Geographic facts.** Chokepoints, distances, terrain.
- **Institutional dynamics.** Bureaucratic processes, alliance structures, international legal constraints.

Invariants are the background against which both sides' decisions play out. They determine what the conflict's possible trajectories look like at the structural level.

### 4. Locate persistent vulnerabilities

Ask: *What weaknesses exist that any sufficiently capable adversary would exploit, whether deliberately or emergently?* These are structural features of one's own system that create opportunities for adversary action regardless of the adversary's specific plans:

- **Economic exposure.** Dependency on vulnerable supply routes, energy sources, or financial systems.
- **Political fragility.** Coalition dependencies, domestic political divisions, legitimacy vulnerabilities.
- **Intelligence gaps.** Areas where collection is thin, where the adversary's metis exceeds the system's legible representation.
- **Institutional seams.** Gaps between organizations, domains, or authorities that the adversary's actions can exploit.

### 5. Derive constraint curves

The final step integrates the analysis into constraint curves — trajectories showing how each side's constraints tighten over time. The intersection of constraint curves indicates where the conflict's structural dynamics force a change in posture. Key questions:

- Which side's constraints bind first?
- What indicators would signal that a constraint is approaching its limit?
- What collection requirements would support monitoring these indicators?

## Integration with other techniques

Constraint-based reasoning complements rather than replaces other analytical methods:

| Technique | What it provides | What constraint analysis adds |
|-----------|-----------------|------------------------------|
| Key assumptions check | Surfaces unstated premises | Identifies which assumptions are constrained by material facts vs. dependent on intent |
| ACH | Compares competing intent hypotheses | Bounds the hypothesis space by eliminating options the adversary cannot execute |
| Red teaming | Simulates adversary decisions | Provides the constraint envelope within which the red team must operate |
| [Legibility analysis](../../../../../../../../../../../content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) | Identifies what the analyst's categories miss | Reveals where the adversary's action space extends beyond the legible representation |

## Quality standards

- Capability assessments must be grounded in evidence, not assumption
- Hard boundaries must be genuinely hard — not "unlikely" options treated as "impossible"
- Invariants must be structural, not contingent — features that persist across scenarios
- Vulnerability identification must be honest — including vulnerabilities the analyst's own side would prefer not to acknowledge
- Constraint curves must include uncertainty ranges, not point estimates

## Scope

This skill covers the application of constraint-based reasoning to adversary analysis and conflict assessment. It does not cover:
- The theoretical foundations of constraint-based reasoning (covered by the [concept](../../../glossary/terms/constraint-based-reasoning.md))
- Its original context in synthetic adversarial ecology analysis
- Writing the assessment that incorporates constraint findings (covered by **write-intelligence-assessment**)

## Verification

You have this skill if you can: (1) analyze an adversary's action space without defaulting to intent assessment, (2) identify hard boundaries that genuinely constrain rather than soft preferences that might be overridden, (3) define invariants that hold across scenarios rather than assumptions that hold under specific conditions, and (4) produce constraint curves that identify the structural dynamics determining the conflict's trajectory.

## Earlier material

- Familiarity with [constraint-based reasoning](../../../glossary/terms/constraint-based-reasoning.md) — the theoretical framework
- Familiarity with [analysis of competing hypotheses](../../../glossary/terms/analysis-of-competing-hypotheses.md) — the SAT that constraint-based reasoning extends
- Understanding of [indications and warning](../../../glossary/terms/indications-and-warning.md) — the warning function that constraint monitoring reframes
