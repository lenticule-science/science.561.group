---
type: concept
class: causal-structure
symbol: "\\Delta"
see-also: [social-position, social-field, habitus-closure, subject-formation]
---

# Structural determination

The degree to which an agent's social position — their predication profile across socially significant predicates — causally constrains the range of actions they can take and the social outcomes they can achieve.
Classical sociological tension: Durkheimian social-facticity (structures determine agents) versus Weberian interpretive agency (agents make meaning and thus action).

Predicated sociology does not dissolve this tension but gives it a substrate-algebraic shape: structural determination is the *closure-rule density and strength* acting on an agent's action-predicate cells given their positional cells.
High structural determination means that an agent's positional profile at stage $\tau$ tightly constrains what values their action cells can receive by stage $\tau + n$ — the closure rules are strong enough to make the action-cell trajectory nearly determined by the initial positional profile.

## Substrate realization

Let $\Phi_{\mathrm{action}} \subseteq \Phi$ be the set of action-predicate cells for agent $e$, and let $\Pi_e^\tau$ be $e$'s positional profile at $\tau$.
Structural determination at $e$ is high when the closure rules in $\mathcal{S}_{\mathrm{soc}}$ are of the form:

$$\bigwedge_{i} v(\langle e, p_i, o_i\rangle) = \mathbf{t} \;\Longrightarrow\; v(\langle e, \texttt{can-act-on}, a\rangle) = \mathbf{t}$$

or, in the negating direction:

$$v(\langle e, p_j, o_j\rangle) = \mathbf{f} \;\Longrightarrow\; v(\langle e, \texttt{can-act-on}, a\rangle) = \mathbf{f}$$

When rules of this form are dense in $\mathcal{S}_{\mathrm{soc}}$ — when most action cells have their values fully determined by positional cells — the agent's action space is structurally predetermined.
This is the substrate-algebraic content of the Marxist claim that class position determines class interest, or Bourdieu's claim that habitus generates practices that reproduce the conditions of production of habitus.

## The regime of structural determination

Structural determination interacts with the [four-regime dichotomy](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md).
In a highly determined social position:

- The closure ordinal for action-cell settling is small (strict regime): the positional constraints propagate quickly and completely through the closure rules, determining action cells within a finite number of steps.
- Agents in this regime have little effective freedom: their action cells converge to structurally determined values rapidly, before any contestation or reflexive agency can introduce contradicting witnesses.

In less determined positions — or positions undergoing contestation — the closure ordinal is larger: the action cells take longer to settle, and the intermediate states may be exploited for agentive action (contestation increments that introduce $\top$ into structural predicate cells before the closure can re-settle them to $\mathbf{t}$).

## Determination vs. determinism

Structural determination is not sociological determinism.
The predication substrate is bilattice-valued: agents can introduce $\top$ states by acting against their structurally predicted trajectory (a contradicting witness arrives on a cell that the closure rules pushed to $\mathbf{f}$).
The question is whether the social system's closure rules are fast and strong enough to re-resolve that $\top$ back to $\mathbf{f}$ before the contradiction propagates.
In highly determined regimes (strict and Scott-continuous), re-resolution is fast.
In less determined regimes (transfinite-bounded, aperiodic), contradictions can persist and accumulate — this is the substrate-algebraic structure of [social contestation](../morphisms/contestation-increment.md).
