---
type: morphism
class: projection
status: draft
depends-on: [capability-fiber-bundle, quantifier-adjoints-on-work-fibers, normative-operational-layering]
name: Project fiber to capability
description: "The morphism $\\pi^{\\exists} : \\mathcal{K}^{\\mathrm{prov}} \\to \\mathcal{K}^{\\mathrm{avail}}$ that takes the agent-indexed provides-capability fiber and projects out the agent argument by an existential quantifier-adjoint, producing a…"
---


The morphism $\pi^{\exists} : \mathcal{K}^{\mathrm{prov}} \to \mathcal{K}^{\mathrm{avail}}$ that takes the agent-indexed `provides-capability` fiber and projects out the agent argument by an existential quantifier-adjoint, producing a *capability-availability* fiber: a function $C \to \mathbf{FOUR}$ recording, for each capability, whether *some agent* provides it.

## Data

The morphism is the [knowledge-order existential adjoint](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/quantifier-adjoints-on-work-fibers.md) $\exists_f^k$ for $f$ the subject-projection morphism collapsing the agent argument:

$$\pi^\exists \sigma (c) \;=\; \bigvee_{A \in E_{\mathrm{op}}}^{(k)} \sigma_A(c)$$

The dual right-adjoint $\pi^\forall$ collapses the agent by *universal* quantification, producing a *capability-coverage* fiber: $\pi^\forall \sigma(c) = \bigwedge_A^{(k)} \sigma_A(c)$, recording whether *every agent* provides $c$.

## Operational reading

- $\pi^\exists \sigma(c) = \mathbf{t}$ — the capability $c$ is *available* in the working community: at least one agent provides it (with positive witness).
- $\pi^\exists \sigma(c) = \bot$ — *no information*: no agent has been recorded as providing or not-providing $c$.
- $\pi^\exists \sigma(c) = \mathbf{f}$ — *unavailable*: every agent has been positively recorded as not providing $c$.
  (This requires a $\mathbf{f}$-witness on every agent's cell — a strong condition that arises when the community has explicitly certified that no member holds $c$.)
- $\pi^\exists \sigma(c) = \top$ — *contradicted availability*: there exist both positive and negative witnesses for some agent's provision; capability availability is held until adjudication.
- $\pi^\forall \sigma(c) = \mathbf{t}$ — *fully covered*: every agent in $E_{\mathrm{op}}$ provides $c$.

## Partial match structure

The existential projection $\pi^\exists$ gives a community-level availability reading.
A finer projection is the *partial-match fiber*: for a given task $T$ with required-capability section $\rho_T : C \to \mathbf{FOUR}$, the partial-match fiber records, for each capability $c$, the gap between the community's availability and the task's requirement:

$$\mathrm{gap}(c) \;=\; \rho_T(c) \Rightarrow \pi^\exists \sigma(c) \;\in\; \mathbf{FOUR}$$

- $\mathrm{gap}(c) = \mathbf{t}$ — the community provides $c$ to the extent the task requires it.
- $\mathrm{gap}(c) = \mathbf{f}$ — the community cannot meet the task's requirement at $c$.
- $\mathrm{gap}(c) = \bot$ — no evidence either way.
- $\mathrm{gap}(c) = \top$ — contradicted; adjudication required.

The community-level dispatch readiness for task $T$ is $\bigwedge_c^{(t)} \mathrm{gap}(c)$.
This is the existential projection version of [dispatch-readiness](../concepts/dispatch-readiness.md): "can anyone in the community do this task?"
The individual dispatch readiness $\delta(A, T)$ asks "can this specific agent do this task?" — using $\sigma_A$ rather than $\pi^\exists \sigma$.

## Authority availability: the normative dual

The existential projection $\pi^\exists$ applies equally to normative predicate fibers.
The *authority-availability* projection is:

$$\pi^\exists_{\mathrm{auth}}(X) \;=\; \bigvee_{A \in E_{\mathrm{op}}}^{(k)} \langle R^P_A, \texttt{scope-action}, X\rangle$$

— the knowledge-order join of all agents' authority cells for action $X$. $\pi^\exists_{\mathrm{auth}}(X) = \mathbf{t}$ means *some agent* holds the power to perform $X$; $= \mathbf{f}$ means no agent does; $= \bot$ means no information.

This is the normative-layer analog of capability-availability.
The two projections compose:

$$\text{Eligible-community}(T) \;=\; \mathrm{gap}_{\mathrm{cap}}(T) \;\wedge_t\; \mathrm{gap}_{\mathrm{auth}}(T)$$

— a task $T$ is *community-dispatchable* only if some agent has both the capability (operational layer) and the authority (normative layer) to do it.
If $\pi^\exists \sigma$ gives $\mathbf{t}$ for capability but $\pi^\exists_{\mathrm{auth}}$ gives $\bot$ for authority, the community has the skill but no authorized agent — a normative bottleneck.

## Monotonicity of the projection

$\pi^\exists$ inherits the [dispatch-monotonicity](../../documents/articles/notes/undated/dispatch-monotonicity.md) property: if $\sigma \leq_k \sigma'$ pointwise on agents (additional capability witnesses), then $\pi^\exists \sigma \leq_k \pi^\exists \sigma'$.
Adding capability witnesses to any agent can only increase or preserve the community's capability-availability fiber.

Similarly, $\pi^\forall$ is antitone in the agent set: adding new agents to $E_{\mathrm{op}}$ with unknown provision can only decrease $\pi^\forall$ (the universal may now fail on the new agent), while $\pi^\exists$ can only increase.

This asymmetry is operationally meaningful: a growing community is harder to keep *fully covered* ($\pi^\forall$) but easier to keep *available* ($\pi^\exists$).
The substrate distinguishes these two organizational concerns structurally.

## CALM for community capability-availability queries

The existential projection $\pi^\exists \sigma(c) = \mathbf{t}$ — capability $c$ is available in the community — is a $\leq_k$-monotone positive statement: once some agent $A$ has a settled positive capability cell, the projection is at least $\mathbf{t}$, and by $\leq_k$-monotonicity it stays there.
By the [predication-settling CALM corollary](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "does the community have capability $c$ available?" is coordination-free: any replica that has received at least one agent's positive capability cell for $c$ can confirm availability.
- Confirming "is capability $c$ unavailable?"
  (the $\pi^\exists \sigma(c) = \mathbf{f}$ case) requires coordination: it requires confirming that *every* agent's capability cell for $c$ is at $\mathbf{f}$, which is a universal negative.

This asymmetry matches organizational reality: confirming that *someone* on the team can do a thing is easy (ask around, check the enrollment log); confirming that *no one* can do it requires exhaustive negative confirmation.

The authority-availability projection $\pi^\exists_{\mathrm{auth}}$ has the same CALM structure: confirming that some agent holds the power for action $X$ is coordination-free; confirming no one holds it requires coordination.
The combined community-dispatchability check for task $T$ — the conjunction of $\mathrm{gap}_{\mathrm{cap}}(T)$ and $\mathrm{gap}_{\mathrm{auth}}(T)$ being $\mathbf{t}$ — is coordination-free in the positive direction.

## Truth-knowledge LES for contradicted availability

When $\pi^\exists \sigma(c) = \top$ — both a positive and negative capability witness exist for some agent — the inconsistency sheaf over the capability fiber, $\mathcal{F}^{(\top)}_{\mathcal{K}}$, is non-zero at capability $c$.
The [truth-knowledge long exact sequence](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) applied to $\mathcal{F}_{\mathcal{K}}$:

The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_{\mathcal{K}}) \to H^1_t(\mathcal{F}^{(t)}_{\mathcal{K}})$ is non-zero at each contradicted capability.
The LES gives a cohomological count: $H^0(\mathcal{F}^{(\top)}_{\mathcal{K}}) \cong \mathbb{Z}^k$ where $k$ is the number of capability indices with contradicted agents.
Each $H^0$ class corresponds to one capability-dimension contradiction requiring adjudication.

For the authority fiber: $\mathcal{A}^{\mathrm{held}}$ has a corresponding inconsistency sheaf $\mathcal{F}^{(\top)}_{\mathcal{A}}$.
A contradicted authority cell (both an installation and revocation increment on the same jural relation) produces a non-zero class in $H^0(\mathcal{F}^{(\top)}_{\mathcal{A}})$.
The LES-derived count is the *authority contradiction audit metric* for the community — the number of outstanding authority disputes requiring governance resolution.

## Where used

- [capability-availability-from-existential](../concepts/capability-availability-from-existential.md) — the structural content of "what capabilities are held by someone."
- [examples/capability-grant-as-witness-increment](../../documents/articles/notes/undated/capability-grant-as-witness-increment.md) — a worked instance where granting a capability to an agent updates the projected availability fiber.
- [dispatch-readiness](../concepts/dispatch-readiness.md) — community-level vs. individual dispatch readiness.
- [normative-operational-layering](../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/concepts/normative-operational-layering.md) — the normative-dual projection for authority-availability.
