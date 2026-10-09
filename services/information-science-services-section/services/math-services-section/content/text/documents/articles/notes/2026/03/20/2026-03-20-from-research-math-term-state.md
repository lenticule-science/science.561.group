---
title: "State"
type: "page"
date-created: 2026-03-20
description: "A State is a pair (x, D) — an element x drawn from a state domain D — that encapsulates the totality of a system's past behavior relevant to its future responses: any two histories of a system that produce the same state are…"
---

A State is a pair (x, D) — an element x drawn from a state domain D — that encapsulates the totality of a system's past behavior relevant to its future responses: any two histories of a system that produce the same state are indistinguishable by any future experiment. The Markov property is constitutive: a state is exactly the information that makes future behavior conditionally independent of past behavior. A state is not a history (a state forgets everything about how it was reached) and not an output (an output is produced; a state is occupied). State identity is behavioral — observationally equivalent states are the same state.

Table of contents

- [Formal definition](#formal-definition)

- [Shannon: states as information](#shannon-states-as-information)

- [Moore and Mealy: the two machine models](#moore-and-mealy-the-two-machine-models)

- [Kripke: states as possible worlds](#kripke-states-as-possible-worlds)

- [Scott: states as domain elements](#scott-states-as-domain-elements)

- [Open questions](#open-questions)

# State

## Formal definition

A **State** is a pair $(x, D)$:

(x∈D,  D:StateDomain)(x \in D,\; D : \mathrm{StateDomain})

where:

- $D$ is the **state domain** — the carrier from which states are drawn; the state domain&rsquo;s mathematical structure depends on what the system computes: a finite set $Q$ for a finite automaton, a directed-complete partial order (dcpo) for recursive computations, a metric space for hybrid systems, or any object in a category with enough structure to support a coalgebra

- $x \in D$ is the **current state** — the element of $D$ the system currently occupies; $x$ carries everything about the system&rsquo;s history that matters for future behavior; it is the system&rsquo;s memory, condensed into a single point in $D$

**Two invariants.** $(x, D)$ is a state in a system $\mathcal{S}$ iff:

- **The Markov property** (state sufficiency): future behavior given current state $x$ is independent of the trajectory by which $x$ was reached. For any behavioral predicate $\varphi$ about future outputs, the system&rsquo;s response to $\varphi$ given state $x$ is the same regardless of which history ended in $x$. The state screens off the past. This is what justifies treating the state as the system&rsquo;s complete present description: knowing $x$ is knowing everything about the past that matters.

- **Behavioral determinacy**: $x$ together with the transition structure $\delta$ of $\mathcal{S}$ completely determines the system&rsquo;s next state and output given any input $i$. There is no hidden information beyond $x$ that influences the transition. This is the condition that makes states observable from the outside: an experimenter who knows $x$ and the transition structure can predict the system&rsquo;s behavior without knowing its history.

**Observational equivalence.** Two states $x_1, x_2 \in D$ are **observationally equivalent** (x1∼x2x_1 \sim x_2) iff no experiment distinguishes them — for every input sequence $i_1, i_2, \ldots$ and every $n$, the output sequences from x1x_1 and x2x_2 agree on the first $n$ outputs. The **minimal state space** of a system is D/∼D/{\sim}. In the theory of coalgebras (Rutten 2000), x1∼x2x_1 \sim x_2 iff they are **bisimilar** — they map to the same element of the final coalgebra.

## Shannon: states as information

Claude Shannon (*A Mathematical Theory of Communication*, 1948) introduced states as a formal device for analyzing channels with memory. A **finite-state channel** has state set $S$; the channel transitions from $s$ to s′s&#x27; upon transmitting symbol $x$, described by transition probabilities p(s′,y∣s,x)p(s&#x27;, y \mid s, x) where $y$ is the output symbol. The state $s$ encodes the channel&rsquo;s memory — the residual effect of past transmissions that influences future behavior.

Shannon&rsquo;s key insight: channel capacity depends only on the stationary distribution over states, not on individual transmission histories. The state makes this separation possible. Without states, analysis would require accounting for all possible histories (an infinite object); with states, memory is finitely encoded.

**Shannon entropy** of a state distribution $p$ over $S$: H(S)=−∑s∈Sp(s)log⁡p(s)H(S) = -\sum_{s \in S} p(s) \log p(s). A state drawn from $D$ carries at most log⁡∣D∣\log |D| bits of information (uniform distribution). The state space&rsquo;s size is the system&rsquo;s memory capacity.

## Moore and Mealy: the two machine models

**George H. Mealy** (*A Method for Synthesizing Sequential Circuits*, 1955): a **Mealy machine** $(Q, \Sigma, \Lambda, \delta, \lambda, q_0)$ where $\delta : Q \times \Sigma \to Q$ is the state transition and $\lambda : Q \times \Sigma \to \Lambda$ is the output function — output depends on both current state and current input.

**Edward F. Moore** (*Gedanken-Experiments on Sequential Machines*, 1956): a **Moore machine** $(Q, \Sigma, \Lambda, \delta, \lambda, q_0)$ where $\lambda : Q \to \Lambda$ — output depends on state alone.

Moore proved every Mealy machine has an equivalent Moore machine (same output sequences on same inputs), and vice versa, with state spaces differing by at most ∣Λ∣|\Lambda|. The models are behaviorally equivalent; the difference is an implementation choice about output timing.

**State minimization**: the minimum-state machine is unique up to isomorphism. Its states are exactly the equivalence classes of the Myhill-Nerode relation (Myhill 1957, Nerode 1958): q1∼q2q_1 \sim q_2 iff the machine starting from q1q_1 and from q2q_2 produce identical output sequences on every input sequence. Minimum-state machines are the canonical representatives of their behavioral equivalence classes.

## Kripke: states as possible worlds

Saul Kripke (*Semantical Considerations on Modal Logic*, 1963) gave modal logic its standard semantics using **Kripke frames** $(W, R)$ where $W$ is a set of possible worlds and $R \subseteq W \times W$ is the accessibility relation. Each world $w \in W$ is a state — a complete specification of what is true at that point.

A **Kripke model** $(W, R, V)$ adds a valuation $V : \mathrm{Prop} \to \mathcal{P}(W)$ assigning each atomic proposition the set of worlds where it holds. Modal operators are quantifiers over accessible states:

□φ true at w  ⟺  φ true at every w′ with wRw′\Box\varphi \text{ true at } w \iff \varphi \text{ true at every } w&#x27; \text{ with } wRw&#x27;

◊φ true at w  ⟺  φ true at some w′ with wRw′\Diamond\varphi \text{ true at } w \iff \varphi \text{ true at some } w&#x27; \text{ with } wRw&#x27;

**Van Benthem&rsquo;s characterization theorem** (1984): two pointed Kripke models (W1,R1,V1,w1)(W_1, R_1, V_1, w_1) and (W2,R2,V2,w2)(W_2, R_2, V_2, w_2) satisfy the same modal formulas iff they are **bisimilar** — iff there exists a relation $Z \subseteq W_1 \times W_2$ with w1Zw2w_1 Z w_2 such that ZZ-related worlds agree on all atomic propositions and can match each other&rsquo;s transitions. Bisimulation is simultaneously the right notion of state equivalence and the bridge between modal logic and process theory.

Temporal logics (LTL, CTL) replace the single relation $R$ with timed transitions x→tx′x \to_t x&#x27;, making state the location in a temporal execution and giving the Kripke framework a dynamical interpretation.

## Scott: states as domain elements

Dana Scott (*Outline of a Mathematical Theory of Computation*, 1970) provided the mathematical framework for states of recursive computations. A **Scott domain** is a directed-complete partial order (dcpo) $D$ with a least element $\bot$ (the &ldquo;undefined&rdquo; or &ldquo;uninitialized&rdquo; state). The partial order $x \sqsubseteq y$ means &ldquo;yy extends the information in xx&rdquo; — $y$ is a more defined state.

Scott-continuous functions preserve directed joins: f(⨆idi)=⨆if(di)f(\bigsqcup_i d_i) = \bigsqcup_i f(d_i). The **least fixed point theorem**: every Scott-continuous $f : D \to D$ has lfp(f)=⨆n≥0fn(⊥)\mathrm{lfp}(f) = \bigsqcup_{n \geq 0} f^n(\bot). This least fixed point is the state reached by iterating a recursive computation from the undefined state.

In Scott&rsquo;s denotational semantics, a program $P$ denotes a Scott-continuous function ⟦P⟧:D→D\llbracket P \rrbracket : D \to D on the state domain. Recursive programs are defined as least fixed points:

⟦while  b  do  c⟧=lfp(λf.  if  ⟦b⟧  then  ⟦c⟧∘f  else  id)\llbracket \mathbf{while}\; b\; \mathbf{do}\; c \rrbracket = \mathrm{lfp}(\lambda f.\; \mathrm{if}\; \llbracket b \rrbracket\; \mathrm{then}\; \llbracket c \rrbracket \circ f\; \mathrm{else}\; \mathrm{id})

The domain-theoretic state space is not merely a set but carries an approximation order: partial states ($d$) are approximated by more complete states (d′⊒dd&#x27; \sqsupseteq d). The tower $\bot \sqsubseteq f(\bot) \sqsubseteq f^2(\bot) \sqsubseteq \cdots$ is the sequence of computational approximations converging to the final state $\mathrm{lfp}(f)$.

## Open questions

- Whether the final coalgebra of a behavior functor $F(X) = O \times X^I$ — the canonical minimal state space for processes with input type $I$ and output type $O$ — has a concrete description in terms of the history presheaf; and whether states in the final coalgebra correspond to global sections of some behavioral sheaf over the history site.

- Whether Scott&rsquo;s domain-theoretic partial order ($x \sqsubseteq y$ = &ldquo;yy is more defined than xx&rdquo;) corresponds to a fiber order in the relational history — whether the approximation order on states is the restriction of the sub-history order to the fiber, with $\bot$ corresponding to the empty history and the directed join corresponding to the history colimit.

- Whether the Myhill-Nerode characterization of minimal state spaces (states = observational equivalence classes) has a topos-theoretic interpretation — whether the Nerode equivalence is a congruence in the sheaf topos $\mathbf{Sh}(T, J)$ and the quotient is the appropriate subobject.

- Whether modal bisimulation (van Benthem) and coalgebraic bisimulation (Rutten) are exactly the same notion in all generality, or whether there exist behavioral equivalences detected by modal logic that differ from coalgebraic bisimulation for non-standard behavior functors.
