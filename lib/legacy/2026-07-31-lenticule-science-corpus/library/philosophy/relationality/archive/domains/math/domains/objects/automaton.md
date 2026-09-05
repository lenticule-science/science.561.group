---
id: automaton
description: "An Automaton is a quintuple (Q, Σ, δ, q₀, α) — a state set Q, input alphabet Σ, transition structure δ encoding how inputs drive state changes, an initial state q₀, and an acceptance condition α that classifies runs as accepting or rejecting. The defining structure: an automaton recognizes (classifies) behaviors rather than producing outputs. Every run — a path through Q driven by an input sequence — either satisfies α (accepted) or does not (rejected); the automaton's meaning is its recognized language L(A). An automaton is not a process (which produces outputs, not acceptance decisions) and not a derivation (which applies licensed inference rules, not input-driven transitions)."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  state-set: relational-universe
  input-alphabet: relational-universe
  acceptance-condition: relational-universe-morphism
output: relational-universe
ast:
  transition-system-with-acceptance:
    - state-set
    - input-alphabet
    - transition-structure:
        - state-set
        - input-alphabet
    - acceptance-condition:
        - transition-structure
---

# Automaton

## Formal definition

An **Automaton** is a quintuple $\mathcal{A} = (Q, \Sigma, \delta, q_0, \alpha)$:

$$\mathcal{A} = (Q : \mathrm{States},\; \Sigma : \mathrm{Alphabet},\; \delta : \mathrm{Transition},\; q_0 \in Q,\; \alpha : \mathrm{Acceptance})$$

where:
- $Q$ is the **state set** — the carrier of the automaton; for finite automata $Q$ is finite; for infinite-state automata $Q$ may be countable or uncountable
- $\Sigma$ is the **input alphabet** — the finite set of symbols the automaton reads; inputs arrive one symbol at a time from $w \in \Sigma^*$ (finite words) or $w \in \Sigma^\omega$ (infinite words)
- $\delta$ is the **transition structure** — for a **deterministic** automaton, $\delta : Q \times \Sigma \to Q$ is a total function; for a **nondeterministic** automaton, $\delta : Q \times \Sigma \to \mathcal{P}(Q)$ maps each state-symbol pair to a set of possible successors; for a **weighted** automaton, $\delta : Q \times \Sigma \times Q \to K$ assigns weights in a semiring $K$
- $q_0 \in Q$ is the **initial state** — where every run begins
- $\alpha$ is the **acceptance condition** — for finite automata over finite words, $\alpha = F \subseteq Q$ is a set of final states: a run is accepting iff it ends in $F$; for automata on infinite words, $\alpha$ is a condition on the states visited infinitely often (Büchi, Rabin, Muller, parity)

**A run** of $\mathcal{A}$ on $w = a_1 \cdots a_n \in \Sigma^*$ is a sequence $\rho = q_0 q_1 \cdots q_n$ where $\delta(q_{i-1}, a_i) = q_i$ (deterministic) or $q_i \in \delta(q_{i-1}, a_i)$ (nondeterministic) for each $i$. The **recognized language**:

$$L(\mathcal{A}) = \{w \in \Sigma^* \mid \text{there exists an accepting run of } \mathcal{A} \text{ on } w\}$$

**Two invariants.** $\mathcal{A}$ is an automaton iff:

1. **Input-driven transitions**: $\mathcal{A}$ only transitions upon receiving an input symbol. The transition structure $\delta$ is defined on state-symbol pairs; the automaton does not evolve autonomously. This distinguishes automata from dynamical systems (which evolve without external input) and from processes equipped with output (which both transition and produce). The input-driven character means the automaton's behavior is always a response to an externally supplied sequence.

2. **Run-defined acceptance**: the acceptance condition $\alpha$ is a property of runs (paths through $Q$ driven by inputs), not a property of individual states or transitions in isolation. For finite-word automata, acceptance is determined by the run's terminus; for infinite-word automata, by the set of states visited infinitely often. This dependence on runs makes automata recognizers of behavioral patterns, not transducers of values.

## Kleene: regular languages and finite automata

Stephen Kleene (*Representation of Events in Nerve Nets and Finite Automata*, 1956) proved the fundamental theorem connecting automata-theoretic and algebraic descriptions:

**Kleene's theorem**: $L \subseteq \Sigma^*$ is recognized by a finite automaton iff $L$ is **regular** — expressible by a **regular expression** built from: $\emptyset$, $\{\varepsilon\}$, $\{a\}$ for $a \in \Sigma$; union $R_1 \cup R_2$; concatenation $R_1 \cdot R_2$; Kleene star $R^*$ (zero or more concatenations from $R$).

The proof:
- **Automaton $\Rightarrow$ regular expression**: eliminate states one by one, computing the language through each surviving state pair
- **Regular expression $\Rightarrow$ automaton**: union yields a combined NFA; concatenation sequences two NFAs; Kleene star adds an $\varepsilon$-loop to the initial state

Kleene's theorem establishes that regular expressions and finite automata are two syntactic presentations of the same class of languages — the **regular languages**. This is the first major closure-and-characterization result in formal language theory.

## Rabin and Scott: nondeterminism and the powerset construction

Michael O. Rabin and Dana Scott (*Finite Automata and Their Decision Problems*, 1959) introduced **nondeterministic finite automata** (NFAs) — allowing multiple transitions from a single state on the same input and $\varepsilon$-transitions — and proved their equivalence with deterministic finite automata.

**The powerset construction**: from any NFA $(Q, \Sigma, \delta, q_0, F)$, construct a DFA $(\mathcal{P}(Q), \Sigma, \hat\delta, \{q_0\}, \hat F)$ where:
- States are subsets $S \subseteq Q$ — tracking the set of NFA states reachable by any run on the input seen so far
- $\hat\delta(S, a) = \bigcup_{q \in S} \delta(q, a)$
- $\hat F = \{S \subseteq Q \mid S \cap F \neq \emptyset\}$

**Rabin-Scott theorem**: $L(\mathcal{A}_\mathrm{NFA}) = L(\mathcal{A}_\mathrm{DFA})$. The powerset construction converts every NFA to an equivalent DFA, at the cost of at most $2^{|Q|}$ states. Determinism and nondeterminism are equi-expressive for finite automata — unlike for pushdown automata, where nondeterminism strictly increases expressive power. Rabin and Scott also proved closure properties (union, intersection, complement, reversal, homomorphism) and decidability of emptiness and equivalence.

## Myhill-Nerode: the minimal automaton

**The Nerode relation** (Nerode 1958): $x \sim_L y$ iff for all $z \in \Sigma^*$: $xz \in L \Leftrightarrow yz \in L$. Two strings are equivalent iff indistinguishable by any future continuation.

**Myhill-Nerode theorem**: $L$ is regular iff $\sim_L$ has finitely many equivalence classes. The number of classes equals the number of states in the minimal DFA for $L$.

**The minimal DFA**: states are $\sim_L$-classes $[\![x]\!]$; initial state is $[\![\varepsilon]\!]$; transition $\hat\delta([\![x]\!], a) = [\![xa]\!]$; accepting states $\{[\![x]\!] \mid x \in L\}$. The minimal DFA is **unique up to isomorphism**.

Hopcroft (1971) gave an $O(n \log n)$ algorithm for minimizing a DFA with $n$ states (optimal). The minimal automaton is the canonical state space for a language: its states are exactly the observational equivalence classes of strings (Nerode equivalence = bisimulation for finite automata).

## Büchi: automata on infinite words

J. Richard Büchi (*On a Decision Method in Restricted Second Order Arithmetic*, 1960) extended finite automata to infinite words $w \in \Sigma^\omega$, motivated by the decidability of the monadic second-order theory of one successor (S1S).

A **Büchi automaton** has the same structure as a finite automaton but with acceptance: an infinite run $\rho = q_0 q_1 q_2 \cdots$ is **Büchi-accepting** iff $\mathrm{Inf}(\rho) \cap F \neq \emptyset$ — the run visits some state in $F$ infinitely often.

**Büchi's theorem**: the $\omega$-languages recognized by nondeterministic Büchi automata are exactly the **$\omega$-regular languages** — finite unions of $U \cdot V^\omega$ where $U, V$ are regular over $\Sigma$.

Unlike finite automata, nondeterministic Büchi automata are strictly more expressive than deterministic Büchi automata. Stronger deterministic conditions restore full expressiveness: **Muller automata** (accepting runs whose $\mathrm{Inf}(\rho)$ belongs to a specified family), **Rabin automata** (pairwise conditions on infinitely and finitely visited sets), and **parity automata** (the minimum infinitely-visited priority is even).

Büchi automata are the primary tool for **model checking** (Clarke, Emerson, Sistla 1986): a reactive system is modeled as a Büchi automaton; an LTL specification is translated to a Büchi automaton for its negation; the system satisfies the specification iff the intersection automaton accepts no infinite run.

## Open questions

- Whether the Myhill-Nerode minimization theorem is the automata-theoretic instance of a general coalgebraic minimization, and whether every final coalgebra arises as such a quotient of behavioral equivalence.
- Whether Büchi acceptance — "visits $F$ infinitely often" — has a formulation in tower dynamics: whether the $\omega$-recurrence condition corresponds to recurrence at periodic tower levels, making $\omega$-regular languages the behaviors that repeat at bounded tower depth.
- Whether there is a sheaf-theoretic characterization of automaton minimization — whether the Nerode equivalence is a congruence in the topos of presheaves over the history site, and whether the minimal automaton is the colimit of a covering diagram.
- Whether the class of behaviors recognized by automata in the final coalgebra of the behavior functor $F(X) = O \times X^I$ exactly corresponds to the $\omega$-regular languages, or whether the final coalgebra sees behaviors requiring automata on higher ordinals.
