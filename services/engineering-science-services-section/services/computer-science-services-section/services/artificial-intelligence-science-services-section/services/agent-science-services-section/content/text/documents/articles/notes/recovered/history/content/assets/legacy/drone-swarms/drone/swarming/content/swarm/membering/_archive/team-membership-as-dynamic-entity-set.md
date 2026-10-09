---
type: question
status: open
explores: [operations-base, operations-settling, distributed-settling-system, multi-agent-work-as-crdt]
---

# Does dynamic entity-set evolution model open-world work team membership?

The operations settling's entity set $E_{\mathrm{op}}$ is fixed throughout settling: at every stage $\tau < \lambda$, the set of agents, tasks, and capabilities is the same.
This assumption bounds PredWork's ability to model *open-world work teams* — teams where agents join (new hires, newly instantiated workers, newly recruited members) and leave (resignations, terminations, task completions that retire the agent from the team) during ongoing work.

The math program's [dynamic-entity-set-open-world-swarms question](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/dynamic-entity-set-open-world-swarms.md) develops the foundational extension for open-world swarms; this question holds the PredWork-side work — what that extension would yield for team-structured work.

## What the fixed entity-set assumption forecloses

Under the fixed-$E_{\mathrm{op}}$ assumption, PredWork cannot natively model:

- **Mid-project agent addition:** a new contractor joins a running project.
  The contractor's entity does not exist in $E_{\mathrm{op}}$; no capability-fiber cells can reference them; they cannot be dispatched to.
- **Mid-project agent departure:** a team member leaves.
  Their assignment cells are still live in the settling; the task they held cannot be cleanly reassigned without an explicit retraction mechanism that the fixed-entity model does not support without additional rules.
- **Rotating membership:** a working committee that changes composition across cycles.
  The fixed-entity model can represent multiple entities participating in different cycles, but cannot model the *structural* fact that the committee's membership changes.

## What dynamic entity-set settling would provide for teams

A filtration-style dynamic entity-set extension (agents only join, do not leave) would give:

- **Agent birth as closure-rule firing:** a rule of the form "when an onboarding-complete cell fires for candidate $c$, add entity $c$ to $E_{\mathrm{op}}$ with initial capability sections."
  This is a birth event encoded in the closure-rule language.
- **Capability section initialization:** the new agent's capability sections $\sigma_c$ are set by the onboarding rule's consequents — the new entity arrives with known capabilities.
- **Dispatch extensibility:** once $c \in E_{\mathrm{op}}$, dispatch can include $c$ in the capability-matching computation on subsequent cycles.

A co-filtration-style extension (agents only leave) would give:

- **Agent death as rule deactivation:** the departing agent's entity is not removed from $E_{\mathrm{op}}$ (settling-monotonicity prohibits retraction) but an activation-guard cell $\langle c, \texttt{departed}\rangle = \mathbf{t}$ is asserted, inhibiting all rule firings that have $c$ as an potential agent.
  The effect is functionally equivalent to removal without structural retraction.
- **Assignment transfer:** existing assignments for $c$ need to be rehandled.
  The departure cell triggers a transfer rule that creates new assignment entities referencing the task, not $c$.

## Sub-questions

### (a) Agent-birth as closure-rule firing

Can the closure-rule language accommodate agent-birth events — rules whose consequents include creating a new entity in $E_{\mathrm{op}}$?
The math program's sub-question 9b asks whether this preserves the rule-language's $\Pi_1 + <$ structure.
For the work case: do agent-birth rules (triggered by onboarding completions, contract signings, instantiation events) stay within the expressive fragment that keeps compliance decidable?
If agent-birth requires $\Pi_2$ antecedents, it would lift the operations settling into the transfinite-bounded or aperiodic regime — problematic for operational work tracking.

### (b) Cohomological invariants of team membership evolution

The [aperiodic-classifying-invariant](../objects/operations-causal-settling.md) is defined over a fixed bitopological settling site.
With a dynamic entity-set, the site itself evolves.
Does the aperiodic classifying invariant for the team's operations settling have a well-defined form over the evolving site?
The math program's sub-question 9c asks whether the cohomology is the colimit of the evolving site's cohomologies; the work-side question is what this colimit says about the team's operational structure across membership changes.

### (c) CRDT convergence with team churn

The [multi-agent-work-with-local-rules-as-crdt theorem](../theorems/multi-agent-work-with-local-rules-as-crdt.md) establishes convergence under per-agent local rules for a fixed agent set.
Does convergence extend when agents join and leave?
The math program's sub-question 9d asks for CRDT-with-churn convergence; the work-side question is whether the per-observer-rules compatibility condition is preserved when new observers join with new local rule subsystems.

### (d) Reconciling dynamic membership with governance

When a new agent $c$ joins the team, they must be installed in a [role](../../../../../../../../../../humanities/theories/sociology/theories/work/terms/role.md) and their standing must be recognized.
This is a governance event — an [installation morphism](../../predicated-governance/morphisms/installation.md) in the predicated-governance framework.
The question is whether agent-birth (predicated-work event) and installation (predicated-governance event) are the same closure-rule firing or two sequential firings with a logical dependency.
If sequential, the gap between birth and installation is a period when the agent exists in $E_{\mathrm{op}}$ but has no governance standing — a structurally anomalous period requiring careful treatment.
