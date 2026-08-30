---
type: theorem
status: sketch
depends-on: [capability-fiber-bundle, project-fiber-to-capability, quantifier-adjoints-on-work-fibers, normative-operational-layering, capability-matching]
---

# Capability availability as the existential adjoint over agents

The *capability-availability* fiber $\mathrm{avail}^C : C \to \mathbf{FOUR}$ — recording, for each capability $c$, whether *some agent* in the working community provides $c$ — is the value of the [knowledge-order existential adjoint](../objects/quantifier-adjoints-on-work-fibers.md) $\exists_f^k$ on the `provides-capability` fiber, where $f$ is the subject-projection morphism collapsing the agent argument.

Equivalently, $\mathrm{avail}^C = \pi^\exists \sigma$, where $\pi^\exists$ is the [project-fiber-to-capability](../morphisms/project-fiber-to-capability.md) morphism.

## Sketch (capability layer)

By definition of $\pi^\exists$,
$$\mathrm{avail}^C(c) \;=\; \pi^\exists \sigma(c) \;=\; \bigvee_{A \in E_{\mathrm{op}}}^{(k)} \sigma_A(c).$$

The right-hand side is the knowledge-order join of the per-agent provision values at $c$. By the four-state reading of $\mathbf{FOUR}$ in $\leq_k$:

| Per-agent values $\{\sigma_A(c)\}_A$ | $\mathrm{avail}^C(c)$ |
|---|---|
| All $\bot$ | $\bot$ |
| At least one $\mathbf{t}$, no $\mathbf{f}$ | $\mathbf{t}$ |
| At least one $\mathbf{f}$, no $\mathbf{t}$ | $\mathbf{f}$ |
| Both $\mathbf{t}$ and $\mathbf{f}$ present (across agents or for one agent) | $\top$ |

The knowledge-order join is exactly "the most-informative position consistent with all per-agent positions." That this coincides with the operational reading of capability-availability is the substrate-algebraic content of the theorem.

By the universal property of the [hyperdoctrine](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md) adjunction $\exists_f^k \dashv f^*$, $\mathrm{avail}^C$ is the *least* capability-availability fiber whose pullback along $f$ recovers the per-agent provision fiber up to $\leq_k$. This is what makes $\pi^\exists$ the *canonical* projection: any other notion of capability-availability would either lose information ($\not\geq_k$ the per-agent join) or add unjustified content ($\not\leq_k$ the per-agent join). $\square$

## Authority-availability theorem (normative-layer analog)

The identical argument applies to the normative predicate fiber. The *authority-availability* fiber $\mathrm{avail}^N : \mathcal{X} \to \mathbf{FOUR}$ — recording, for each action type $X$, whether *some agent* holds the power to perform $X$ — is the existential adjoint over the `holds-power-over` fiber:

$$\mathrm{avail}^N(X) \;=\; \bigvee_{A \in E_{\mathrm{op}}}^{(k)} \sigma_A^N(X)$$

By the same universal-property argument, $\mathrm{avail}^N$ is the canonical community-level authority-availability fiber. Its four-state reading:

| Per-agent authority values $\{\sigma_A^N(X)\}_A$ | $\mathrm{avail}^N(X)$ |
|---|---|
| All $\bot$ | $\bot$ — no information on who holds authority over $X$ |
| At least one $\mathbf{t}$, no $\mathbf{f}$ | $\mathbf{t}$ — some agent is authorized for $X$ |
| At least one $\mathbf{f}$, no $\mathbf{t}$ | $\mathbf{f}$ — no agent is authorized for $X$ |
| Both $\mathbf{t}$ and $\mathbf{f}$ present | $\top$ — contradicted; adjudication needed |

A $\mathbf{f}$-valued authority-availability at $X$ means the community has positively recorded that no agent holds power over $X$ — an authority gap, distinguishable from $\bot$ (merely unknown). This is the normative-layer analog of a confirmed capability gap.

## Community-dispatchability theorem

Combining the two layers per [capability-matching](teaching/explanations/capability-matching.md) and [dispatch-readiness](teaching/explanations/dispatch-readiness.md), the *community-dispatchability* of a task $T$ is:

$$\mathrm{comm\text{-}disp}(T) \;=\; \Bigl(\bigwedge_{c \in C}^{(t)} \mathrm{avail}^C(c) \Rightarrow \rho_T(c)\Bigr)^* \;\wedge_t\; \Bigl(\bigwedge_{X \in \mathcal{X}}^{(t)} \mathrm{avail}^N(X) \Rightarrow \rho_T^N(X)\Bigr)^*$$

— whether the community has *some agent* who is both capable and authorized for every dimension $T$ requires. More precisely, community-dispatchability is positive when:

$$\exists A.\; \delta^C(A, T) = \mathbf{t} \;\wedge\; \delta^N(A, T) = \mathbf{t}$$

The $\pi^\exists$ projections provide the *necessary condition* check (if $\mathrm{avail}^C(c) = \mathbf{f}$ for any required $c$, then no agent can have $\delta^C = \mathbf{t}$ for $c$, and the task is community-undispatchable on capability grounds). But they do not directly confirm the *existential combined condition* — it is possible that all required capabilities and all required authorities are available, but no single agent has both simultaneously.

The substrate-algebraic content of the combined theorem: community-dispatchability requires not just two separate existential witnesses but a *joint* existential witness — a single agent with both capability and authority. The independence of the two fibers does not guarantee the existence of such a joint witness.

## Four failure modes for community non-dispatchability

| $\mathrm{avail}^C$ status | $\mathrm{avail}^N$ status | Community-dispatchability failure mode |
|---|---|---|
| $\mathbf{f}$ on some $c$ | any | *Capability void* — no agent has skill; must train or recruit |
| any | $\mathbf{f}$ on some $X$ | *Authority void* — no agent has authorization; must install or delegate |
| $\mathbf{t}$ on all $c$; $\mathbf{t}$ on all $X$ | both | *Joint-agent absence* — capability and authority exist separately but not in one agent |
| $\bot$ or $\top$ on any dimension | any | *Evidence gap or conflict* — settle evidence before assessing dispatchability |

The joint-agent-absence case is the most subtle: it is invisible to either projection alone. It requires examining the intersection of capability-providing agents and authority-holding agents to determine if any agent is in both sets.

## CALM for community-dispatchability queries

The existential projections $\mathrm{avail}^C$ and $\mathrm{avail}^N$ are $\leq_k$-monotone: adding capability or authority evidence can only increase (in $\leq_k$) the availability values. By the [predication-settling CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md):

- Confirming "is capability $c$ available in the community?" is coordination-free: any replica with a positive capability cell for any agent can confirm availability.
- Confirming "is capability $c$ unavailable?" requires coordination — universal negative across all agents.

The joint-agent-absence failure mode — capability and authority exist separately but no single agent has both — is the one case where both projections are $\mathbf{t}$ yet community-dispatchability still fails. Detecting joint-agent absence requires the *intersection* query: "is there an agent $A$ with both $\delta^C(A,T) = \mathbf{t}$ and $\delta^N(A,T) = \mathbf{t}$?" This is a positive existential over a *joint* condition — the conjunction is not $\leq_k$-monotone over the set of agents (it requires checking which agents have both, not just some agent having capability and some agent having authority). Joint-agent-absence detection requires coordination across the capability and authority fibers simultaneously.

This is the CALM-theoretic reason that "staffing" (finding someone who has *all* the required capabilities and authorities) requires more coordination than "skill inventory" (confirming each capability or authority exists somewhere): the existential projections are individually coordination-free, but their intersection is not.

## Operational content

The theorem grounds the operational practice of asking "what capabilities are held by someone?" and "is anyone authorized for this?" without naming agents. The existential-adjoint projections give the canonical bilattice-valued answers. The community-dispatchability theorem grounds the compound question "can someone in this community actually do this task?" — with the four failure modes making the different kinds of non-dispatchability substrate-visible.

The dual question — "what capabilities are held by *every* agent?" / "is *every* agent authorized for this?" — is the universal-adjoint projection $\pi^\forall \sigma$, identical in shape but with $\bigwedge^{(k)}$ in place of $\bigvee^{(k)}$.
