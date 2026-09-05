---
type: concept
class: semantic-anchor
status: draft
depends-on: [capability-fiber-bundle, dispatch, normative-operational-layering, project-fiber-to-capability]
---

# Capability matching

The pointwise comparison of an agent's provided-capability section against a task's required-capability section: a function from $(A, T)$ pairs to bilattice-valued matchings, indexed by the capability index $C$. Capability matching is *one dimension* of overall dispatch readiness; it operates within the operational layer of the [two-layer predicate structure](./normative-operational-layering.md).

## Per-capability matching

The per-capability match at capability $c$ is the [twist-product residuation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/twist-product-residuation.md):

$$\mu_c(A, T) \;=\; \rho_T(c) \Rightarrow \sigma_A(c) \;\in\; \mathbf{FOUR}$$

read as "the agent's provision suffices for the task's requirement at $c$." Matching is *substrate-evidential*: it inherits the four-state reading directly from the witness layer.

| $\rho_T(c)$ | $\sigma_A(c)$ | $\mu_c(A, T)$ | Reading |
|---|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | $\mathbf{t}$ | Required and provided |
| $\mathbf{t}$ | $\mathbf{f}$ | $\mathbf{f}$ | Required and provably not provided |
| $\mathbf{t}$ | $\bot$ | $\bot$ | Required; provision unknown |
| $\mathbf{f}$ | any | $\mathbf{t}$ | Not required; matching trivially |
| any | $\top$ | $\top$ | Contradicted provision; held for adjudication |

## Capability-layer readiness

The capability-layer readiness is the truth-order conjunction over the full capability index:

$$\delta^C(A, T) \;=\; \bigwedge_{c \in C}^{(t)} \mu_c(A, T)$$

$\delta^C(A, T) = \mathbf{t}$ iff the agent has settled positive provision for every required capability. This is what [dispatch-readiness](dispatch-readiness.md) calls the *capability component* of dispatch readiness.

## Authority-layer matching

Per [normative-operational-layering](./normative-operational-layering.md), tasks carry not only required-capability sections but also required-authority sections: a task $T$ may require that the assigned agent holds a specific [jural relation](theories/predicated-governance/objects/jural-relation.md) — a privilege, power, or authorization — to perform the relevant action. The authority-matching morphism is:

$$\alpha_X(A, T) \;=\; \rho_T^N(X) \Rightarrow \sigma_A^N(X) \;\in\; \mathbf{FOUR}$$

where $\rho_T^N(X)$ is the task's required-authority cell for action type $X$ and $\sigma_A^N(X)$ is the agent's provided-authority cell (i.e., the cell asserting that $A$ holds the relevant jural relation over action $X$). The authority-layer readiness is:

$$\delta^N(A, T) \;=\; \bigwedge_{X \in \mathcal{X}}^{(t)} \alpha_X(A, T)$$

for $\mathcal{X}$ the set of authority-indexed dimensions the task requires. $\delta^N(A, T) = \mathbf{t}$ iff the agent is normatively authorized to perform every action type required by $T$.

## Combined match and partial-match structure

Overall dispatch readiness combines both layers (per [dispatch-readiness](dispatch-readiness.md)):

$$\delta(A, T) \;=\; \delta^C(A, T) \;\wedge_t\; \delta^N(A, T)$$

The partial-match structure exposes the *failure mode* when $\delta(A, T) \neq \mathbf{t}$:

| $\delta^C$ | $\delta^N$ | Failure type |
|---|---|---|
| $\mathbf{t}$ | $\mathbf{t}$ | No failure — dispatch ready |
| $\mathbf{f}$ | $\mathbf{t}$ | *Capability gap* — agent lacks skill; can be resolved by training/grant |
| $\mathbf{t}$ | $\mathbf{f}$ | *Authority gap* — agent lacks normative authorization; resolved by installation or delegation |
| $\mathbf{f}$ | $\mathbf{f}$ | *Both gaps* — training and authorization both needed |
| $\bot$ | any | *Capability unknown* — provision not yet settled; await evidence |
| any | $\bot$ | *Authority unknown* — authorization not yet settled; await normative settling |
| $\top$ | any or any $\top$ | *Contradicted* — held for adjudication on the relevant dimension |

This stratification makes the failure-mode visible to the closure-rule system: the rules that respond to a capability gap (offer-training rules, capability-grant rules) are different from those that respond to an authority gap (delegation rules, installation rules). Collapsing both gaps into a single Boolean readiness verdict would lose the distinction.

## Match-level monotonicity

Per [dispatch-monotonicity](../theorems/dispatch-monotonicity.md), both $\delta^C$ and $\delta^N$ are monotone in the knowledge order as their respective evidence sections grow. The per-capability residuation $\mu_c$ and per-authority residuation $\alpha_X$ are each individually monotone. Capability matching is therefore monotone in both dimensions simultaneously: adding evidence (capability or authority witnesses) never decreases overall match in $\leq_k$.

## Where used

- [capability-fiber-bundle](../objects/capability-fiber-bundle.md) — the bundle whose sections are matched.
- [dispatch](../morphisms/dispatch.md) — the morphism that aggregates per-capability and per-authority matchings into readiness.
- [project-fiber-to-capability](../morphisms/project-fiber-to-capability.md) — the projection that produces the community-level capability-availability fiber and the community-level partial-match fiber.
- [dispatch-readiness](dispatch-readiness.md) — the combined $\delta(A, T) = \delta^C \wedge_t \delta^N$.
- [normative-operational-layering](./normative-operational-layering.md) — the two-layer structure motivating the capability/authority distinction.
