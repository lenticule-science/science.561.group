---
name: apply-legibility-analysis
id: apply-legibility-analysis
description: >-
  Apply legibility analysis to an intelligence assessment — identifying how the
  analyst's categories simplify the adversary, what the simplification excludes,
  and how the excluded knowledge creates blind spots that the adversary's
  unconstrained action space extends into.
type: operational
date-created: 2026-03-06
keywords:
  - Analysis
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "apply legibility analysis"
  - "what are we not seeing"
  - "what do our categories miss"
  - "check for legibility blind spots"
  - "legibility audit"
inputs:
  target_assessment: string
  adversary: string?
  context: string?
outputs:
  legibility_audit: string
---

# Apply Legibility Analysis

## What you will be able to do

- Identify the simplifying categories an intelligence assessment imposes on the adversary
- Determine what situated, relational, or narrative knowledge those categories exclude
- Assess whether the excluded knowledge is consequential for the assessment's conclusions
- Locate the boundary between what the intelligence system can see and where the adversary's actual action space extends
- Recommend collection or analytic adjustments that partially recover what legibility destroys

## Prerequisites

- Familiarity with [intelligence as legibility](../../../glossary/terms/intelligence-as-legibility.md) — the theoretical framework
- Familiarity with [legibility](../../../../../../../../../../critical-theory-services-section/services/abolition-services-section/services/state-repression-services-section/content/text/glossary/terms/legibility.md) — Scott's original concept
- Familiarity with [mirror-imaging](../../../glossary/terms/mirror-imaging.md) — a specific form of legibility failure
- Familiarity with [strategic culture analysis](../../../glossary/terms/strategic-culture-analysis.md) — the primary corrective for cultural-level legibility failure

## When to use this technique

Legibility analysis is most productive:
- After an assessment has been drafted, as a quality check on what the assessment's categories exclude
- When an adversary's behavior surprises — surprise is often a signal that the adversary acted in the space the analyst's legibility could not encode
- When integrating assessments across collection disciplines — each discipline imposes its own legibility, and the integration may compound rather than correct the simplification
- Before major operations — to identify where the operation's success depends on the legible representation being sufficient

## Application procedure

### 1. Surface the categories

Every intelligence assessment organizes the adversary through categories. Make these explicit:

- **What entities does the assessment identify?** (Leaders, units, facilities, networks, capabilities)
- **What relationships does the assessment map?** (Command structures, supply chains, communication networks)
- **What dynamics does the assessment model?** (Decision processes, escalation logic, capability trajectories)
- **What collection disciplines produced the evidence?** Each discipline sees through its own grid — [IMINT](../../../glossary/terms/imint.md) sees physical infrastructure, [SIGINT](../../../glossary/terms/sigint.md) hears communications, [HUMINT](../../../glossary/terms/humint.md) accesses intention through recruited sources

The output is a catalog of the assessment's legible representation of the adversary: *this is what we see and how we see it.*

### 2. Identify what the categories exclude

For each category, ask what it cannot encode:

| Category | What it captures | What it excludes |
|----------|-----------------|-----------------|
| Order of battle | Formal military units, equipment, locations | Informal authority, unit morale, cultural cohesion |
| Leadership structure | Command hierarchy, named individuals | Informal power networks, patronage, relational authority |
| Target set | Coordinates, hardness, functional significance | Narrative meaning, social embeddedness, symbolic value |
| Network diagram | Nodes and edges | Trust, obligation, shared narrative, emergent adaptation |
| Capability assessment | What the adversary can do technically | What the adversary believes it can do, what it would accept as cost |

The output is a catalog of excluded knowledge: *this is what we cannot see because our categories do not encode it.*

### 3. Assess consequentiality

Not all excluded knowledge matters. The question is whether the excluded knowledge is consequential for the assessment's conclusions:

- **Would the excluded knowledge change the assessment's key judgments?** If the assessment concludes that decapitation will produce paralysis, and the excluded knowledge includes the adversary's narrative of martyrdom that transforms death into political authority, the exclusion is consequential.
- **Does the excluded knowledge create action space the assessment doesn't account for?** If the legible representation bounds the adversary's options to X, Y, and Z, but the excluded knowledge reveals options A and B that the categories cannot encode, the exclusion creates a blind spot in the assessment's predictive value.
- **Does the excluded knowledge affect the assessment's timeline?** If the adversary's self-assessment of its constraints differs from the analyst's assessment because the adversary incorporates metis the analyst cannot access, the assessment's duration estimates may be wrong.

### 4. Map the legibility boundary

The most analytically productive step is to map the boundary between the legible and the illegible — the frontier where the intelligence system's categories end and the adversary's unconstrained action space begins. This is where:

- Surprise is most likely to originate
- The adversary has the most freedom of action
- Collection gaps are structural rather than correctable
- [Constraint-based reasoning](../../../../../../../../../../sociology-services-section/content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) should be applied to bound what the legible representation cannot see

### 5. Recommend adjustments

Legibility analysis cannot be "fixed" — all analysis requires categories, and all categories exclude. But the analysis can recommend:

- **Alternative categories** that capture what the current representation misses (e.g., strategic culture analysis as a supplement to rational-actor modeling)
- **Collection adjustments** that improve visibility into the illegible domain (e.g., HUMINT collection tasked toward the adversary's self-understanding rather than toward operational intelligence)
- **Analytic integration** that combines multiple legibility grids to partially recover what each excludes individually
- **Explicit caveats** that flag the assessment's blind spots so that consumers understand the representation's limits

## Integration with constraint-based reasoning

Legibility analysis and [constraint-based reasoning](../../../../../../../../../../sociology-services-section/content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) are most powerful in combination:

1. **Legibility analysis** identifies where the analyst's categories end — the boundary of the legible
2. **Constraint-based reasoning** maps the adversary's actual action space — including the space beyond the legible boundary
3. **The gap** between what the analyst can see (legible) and what the adversary can do (constrained action space) is the zone of maximum analytical risk

This gap is where surprise originates. The analyst's categories say "the adversary's options are X, Y, Z." Constraint analysis says "the adversary's action space includes X, Y, Z, but also A and B." Options A and B are invisible to the legible representation but available to the adversary. They are the space where the adversary has freedom of action and the analyst has no visibility — the conditions for surprise.

## Quality standards

- Category surfacing must be honest — including categories the analyst did not consciously choose but that the collection architecture imposed
- Exclusion identification must be specific — not "we're missing something" but "here is the specific knowledge our categories cannot encode"
- Consequentiality assessment must be rigorous — not every exclusion matters
- Recommendations must be actionable — not "see better" but "collect this, analyze through this framework, caveat this judgment"

## Scope

This skill covers the application of legibility analysis to intelligence assessments and collection architectures. It does not cover:
- Scott's broader theory of state simplification (covered by the sociology term)
- Writing the assessment itself (covered by **write-intelligence-assessment**)
- The specific frameworks that recover excluded knowledge (strategic culture analysis, constraint-based reasoning — covered by their respective skills)

## Verification

You have this skill if you can: (1) make explicit the simplifying categories an assessment uses, (2) identify what those categories exclude with specificity, (3) assess whether the exclusions are consequential for the assessment's key judgments, (4) map the boundary between legible and illegible as the zone of maximum analytical risk, and (5) integrate with constraint-based reasoning to bound the adversary's action space in the illegible zone.
