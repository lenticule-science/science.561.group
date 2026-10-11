---
type: definition
class: fiber-bundle
status: draft
symbol: "\\mathcal{K}"
depends-on: [operations-base, predication-fiber-algebra, normative-operational-layering]
---

# Capability fiber bundle

The pair $\mathcal{K} = (\mathcal{K}^{\mathrm{prov}}, \mathcal{K}^{\mathrm{req}})$ of [predication fiber algebras](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over the operations base, indexed by the two capability predicates:

$$\mathcal{K}^{\mathrm{prov}} \;=\; A_{\texttt{provides-capability}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$ $$\mathcal{K}^{\mathrm{req}} \;=\; A_{\texttt{requires-capability}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$

A valuation $v(\texttt{provides-capability})$ is a function $E_{\mathrm{op}} \times E_{\mathrm{op}} \to \mathbf{FOUR}$.
The cells of operational interest are pairs $(A, c)$ where $A$ is an agent and $c$ is a capability:

| $v(\langle A, \texttt{provides-capability}, c\rangle)$ | Reading |
|---|---|
| $\bot$ | No information: agent has not declared either way |
| $\mathbf{t}$ | Positive: enrollment witness or capability assertion is recorded |
| $\mathbf{f}$ | Negative: revocation or exclusion witness is recorded |
| $\top$ | Contradictory: both an enrollment and a revocation witness exist; repair condition |

The same four-state reading applies to $\mathcal{K}^{\mathrm{req}}$ for $(T, c)$ pairs.

## Sections

The *capability section of agent $A$* is the function

$$\sigma_A : c \mapsto v(\langle A, \texttt{provides-capability}, c\rangle)$$

— the row of $\mathcal{K}^{\mathrm{prov}}$ at $A$.
Symmetrically, the *requirement section of task $T$* is

$$\rho_T : c \mapsto v(\langle T, \texttt{requires-capability}, c\rangle).$$

These sections are the inputs to the capability component $\delta^C$ of the [dispatch morphism](../../morphisms/dispatch.md).

## Authority fiber bundle (normative-layer analog)

Per [normative-operational-layering](teaching/explanations/normative-operational-layering.md) and [operations-base](operations-base.md), the operations base carries normative predicates alongside operational ones.
The *authority fiber bundle* is the normative-layer analog of $\mathcal{K}$:

$$\mathcal{A}^{\mathrm{held}} \;=\; A_{\texttt{holds-power-over}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$ $$\mathcal{A}^{\mathrm{req}} \;=\; A_{\texttt{requires-authority-for}} \;=\; \mathbf{2}^{\bowtie\, E_{\mathrm{op}} \times E_{\mathrm{op}}}$$

The *authority section of agent $A$* is

$$\sigma_A^N : X \mapsto v(\langle A, \texttt{holds-power-over}, X\rangle)$$

recording which action types $X$ the agent is normatively authorized to perform.
The *required-authority section of task $T$* is

$$\rho_T^N : X \mapsto v(\langle T, \texttt{requires-authority-for}, X\rangle)$$

recording which action types the task requires its assigned agent to hold authorization for.

The authority fiber bundle has the same four-state structure as the capability fiber bundle.
The structural difference is how cells are populated:

- Capability cells are populated by *training records, certification witnesses, and enrollment assertions* — O-layer events.
- Authority cells are populated by *installation increments, delegation increments, and power-jural-relation settlings* — N-layer events (per the N→O and O→N rules in [normative-operational-layering](teaching/explanations/normative-operational-layering.md)).

Capability cells can be asserted by any witness-producer with access to the substrate.
Authority cells have *felicity conditions* — an installation increment asserting authority cells is valid only if the installer holds the power-to-install (per [installation](theories/predicated-governance/morphisms/installation.md)); an invalid authority assertion produces a failure-witness rather than a settled authority cell.

## Capability propagation under office membership

When an agent reaches *dignitas* on an [office](theories/predicated-governance/objects/office-as-double-settlement.md) $O$ (both recognition and induction predicates settle to $\mathbf{t}$), two propagations fire simultaneously:

**Capability propagation.** The office's capability section transfers to the agent:

$$\langle O, \texttt{provides-capability}, c\rangle = \mathbf{t} \;\Longrightarrow\; \langle A, \texttt{provides-capability}, c\rangle \geq_k \mathbf{t}.$$

**Authority propagation.** The office's deontic profile — every jural relation $R_i$ with active-holder $O$ — transfers to the agent (per [installation](theories/predicated-governance/morphisms/installation.md) and the capability-propagation rule in [operations-settling](operations-settling.md)):

$$\langle R_i, \texttt{active-holder}, O\rangle = \mathbf{t} \;\Longrightarrow\; \langle R_i^\iota, \texttt{active-holder}, A\rangle = \mathbf{t}.$$

This double propagation is the substrate-algebraic content of *office-bearing*: becoming an officer gives both the capability to do the work and the authority to authorize related actions.
Capability without authority (an agent with the skills but not installed in the office) and authority without capability (installed but lacking skills) are structurally distinguishable as $\delta^C = \mathbf{t}, \delta^N = \bot$ and $\delta^C = \bot, \delta^N = \mathbf{t}$ respectively.

Both propagations are realized via the [predicate-specialization morphism](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) applied to each bundle independently.

## Settling-monotonicity and capability/authority evolution

By [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), both capability cells and authority cells only grow in $\leq_k$.
The behaviors are:

- *Capability revocation*: a negative-evidence witness moves a capability cell from $\mathbf{t}$ to $\top$ (not back to $\bot$).
  Repair resolves $\top$ to $\mathbf{f}$ via the substrate's repair catalog.
- *Authority revocation*: the [revocation](theories/predicated-governance/morphisms/revocation.md) morphism moves the jural relation's cells from $\mathbf{t}$ toward $\top$ (via a contradicting revocation increment), which the repair machinery resolves by retiring the relation ($\mathbf{f}$-settlement).
  This is the felicity-checked version of authority removal.

Capability revocation is simpler (any witness-producer can assert a negative capability witness).
Authority revocation requires the revocation morphism's felicity condition (the revoker must hold the power to revoke), matching the governance structure's constraint that authority cannot be removed arbitrarily.
