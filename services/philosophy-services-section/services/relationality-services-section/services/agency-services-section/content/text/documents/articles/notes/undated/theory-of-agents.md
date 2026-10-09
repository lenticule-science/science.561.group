---
name: theory-of-agents
type: theorem
status: proved
description: "An agent is a cross-theory entity: its inference engine is a K₂-realizable continuous function (from the AI sub-theory of RT(K₂)) and its interaction protocol is a CLL process in CGS (from interactive computation). The three-condition characterization — environmental action, goal-directed planning, persistent state — is a theorem about concurrent strategies in CGS whose P-moves are determined by a K₂-continuous inference function."
parent-theory: [theory-of-artificial-intelligence, theory-of-interactive-computation]
see-also: [theory-of-artificial-intelligence, theory-of-interactive-computation, theory-of-concurrent-computation]
title: theory-of-agents
---

# The Theory of Agents

**Theorem.** An agent is a concurrent strategy in $\mathbf{CGS}$ (the theory of interactive computation) whose Player-moves are determined by a $\mathcal{K}_2$-continuous inference function (from the theory of AI).
The three-condition characterization of agency — environmental action, goal-directed planning, persistent state — is a theorem about this combined structure: each condition corresponds to a structural property of the strategy.
The theory of agents is the intersection of $RT(\mathcal{K}_2)$ (continuous computation, for inference) and the CLL fragment of $\mathbf{CGS}$ (interactive computation, for the interaction protocol).

**Proof.**

*The agent as coalgebra.* Let $S$ be the agent's state space, $O$ its observation type, $A$ its action type.
An agent is a coalgebra for the functor $F(S) = O \times (A \times S)^O$ — given a state and an observation, the agent produces an action and a next state.
Equivalently, the agent is a coalgebra map $\alpha: S \to O \times (A \times S)^O$.
In categorical terms, this is a state machine with output: at each step, the agent observes $o \in O$, selects action $a \in A$ via its inference function, and transitions to a new state $s' \in S$.

*The inference function is $\mathcal{K}_2$-realizable.* For an LLM-based agent, the inference function $\phi: S \times O \to A$ is the neural network's forward pass — a composition of continuous operations (embedding lookup, transformer attention, layer normalization, softmax) on real-valued representations of tokens.
By the theory of AI (theorem above), $\phi$ is $\mathcal{K}_2$-realizable: it is a $\mathcal{K}_2$-computable continuous function from the product space $S \times O$ (encoded as elements of Baire space) to the action space $A$.

*The interaction protocol is a CLL process in $\mathbf{CGS}$.* The agent-environment interface is a two-party interaction: the agent (Player) and its environment (Opponent) exchange moves alternating between observations and actions.
In the CLL fragment of $\mathbf{CGS}$: the agent's session type $T$ is a CLL formula describing the interaction protocol; the agent process $P \vdash x: T$ is a CLL proof implementing the protocol on channel $x$; and the cut rule $P \vdash x: T \mid E \vdash x: T^\perp \Rightarrow P \| E$ composes the agent with its environment.
This is precisely the Caires-Pfenning correspondence (2010): the agent is a session-typed process, and its protocol type $T$ is a CLL formula in $\mathbf{CGS}$.

*The three-condition characterization as a theorem.* Given an agent as a concurrent strategy $\sigma: S \to A^O$ in $\mathbf{CGS}$ with $\mathcal{K}_2$-continuous inference $\phi$:

1. **Environmental action** — the strategy has non-trivial Player-events on the output channel: $P$-moves in $\sigma$ include writes to external state (tool calls, memory updates, API calls).
  This is equivalent to the existence of a non-trivial co-algebra output map: $\sigma$ is not a closed process.

2. **Goal-directed planning** — the strategy is not view-innocent (it is not determined by the last move alone): $\sigma$'s P-moves depend on the full observation history $o_1, \ldots, o_t$ (the strategy is stateful over the play).
  Equivalently, the inference function $\phi: S \times O \to A$ is non-trivially stateful: $\phi(s, o)$ depends on $s \in S$, where $S$ accumulates plan-relevant history.
  This goes beyond the PCF-fragment (which is view-innocent); planning agents are strategies outside the sequential Hyland-Ong sub-$*$-autonomous-category.

3. **Persistent state** — the coalgebra state $s \in S$ survives across interactions: the strategy's next-state function $s \mapsto s'$ is non-trivial and the state space $S$ persists across play boundaries (not reset after each observation-action exchange).
  In session-type terms: the session is not a single round-trip but a long-lived channel with state carried through the $!$ modality (repeated interactions use $!
  T$ rather than $T$).

*The cross-theory location.* The agent draws from two theories simultaneously: its inference function $\phi \in RT(\mathcal{K}_2)$ (a $\mathcal{K}_2$-continuous function) and its protocol type $T$ in the CLL fragment of $\mathbf{CGS}$.
Neither theory alone suffices: $RT(\mathcal{K}_2)$ has no notion of interaction protocol (it is not $*$-autonomous); $\mathbf{CGS}$ has no notion of continuous inference function (its strategies are combinatorial, not $\mathcal{K}_2$-valued).
An agent is their intersection: a CLL strategy in $\mathbf{CGS}$ whose inference moves are computed by a $\mathcal{K}_2$-realizable function.
The cross-theory nature is not a deficiency; it is the correct structure for an entity that both *infers* (continuous computation) and *interacts* (interactive computation).
The PCF full-abstraction bridge from the theory-of-interactive-computation provides the connection: the Dialectica-game functor $F^!$ embeds $RT(\mathcal{K}_2)$ inference into $\mathbf{CGS}$ strategies, and an agent's inference function is an instance of this embedding — a $\mathcal{K}_2$-realizable strategy in $\mathbf{CGS}$'s concurrent computable fragment. $\square$
