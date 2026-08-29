---
title: "Environment"
id: environment
description: "An Environment is a tuple (S, A, P, R, ρ₀) — a Markov Decision Process — specifying the state space, action space, transition kernel, reward function, and initial state distribution that constitute the dynamic vessel within which an agent acts and receives feedback."
defines: Environment
component-of: relational-universe
fiber-of: relational-universe
base: relational-history-site
element-of: entity
extends: arena
contains: [state-space, action-space, transition-kernel, reward-function]
governs: agent
enables: act
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  state-space: relational-universe
  action-space: relational-universe
  transition-kernel: relational-universe-morphism
  reward-function: relational-universe-morphism
output: relational-universe
ast:
  markov-decision-process:
    - state-space
    - action-space
    - transition-kernel:
        - state-space
        - action-space
    - reward-function:
        - state-space
        - action-space
---

# Environment

## What this is

An **Environment** is the dynamic vessel that maintains state, receives agent actions, and emits observations and rewards. It is the computational counterpart of the ambient [Vessel](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md): where a vessel is defined institutionally (charter, offices, crew), an environment is defined dynamically (state, transition, reward). The environment is what an agent is *in*, not what an agent *is*.

## Formal definition

A (single-agent) environment is a Markov Decision Process: a tuple E = (S, A, P, R, ρ₀) where:

- **S** is the **state space** — all possible configurations of the world
- **A** is the **action space** — all possible agent choices
- **P: S × A → Δ(S)** is the **transition kernel** — a probability distribution over next states given current state and action. P(s' | s, a) is the probability of transitioning to state s' when the agent takes action a in state s.
- **R: S × A × S → ℝ** is the **reward function** — the scalar feedback signal emitted at each transition
- **ρ₀ ∈ Δ(S)** is the **initial state distribution** — from which the first state s₀ is sampled at the start of an episode

At each discrete time step t: the environment holds state sₜ; receives agent action aₜ; samples next state sₜ₊₁ ~ P(·|sₜ, aₜ); emits reward rₜ = R(sₜ, aₜ, sₜ₊₁); the agent receives (sₜ₊₁, rₜ). The agent cannot modify P or R — these are fixed structural properties of the environment, not parameters the agent controls.

## Partial observability

A **Partially Observable MDP (POMDP)** extends the MDP with:

- **Ω**: an observation space — what the agent can directly perceive
- **O: S × A → Δ(Ω)**: an observation function — the probability of receiving observation oₜ given state sₜ and action aₜ₋₁

The environment maintains the true state sₜ; the agent receives only oₜ ~ O(·|sₜ, aₜ₋₁) and must maintain a **belief state** bₜ ∈ Δ(S) — a probability distribution over true states — by Bayesian updating. The agent never directly observes sₜ; it acts on its belief state. The environment's true state and the agent's belief state are distinct objects.

## Multi-agent extension

A **Markov Game** (Shapley 1953) — also called a **Stochastic Game** — extends the MDP to N agents: E = (S, A₁ × ... × Aₙ, P, R₁, ..., Rₙ, ρ₀) where each agent i has its own action space Aᵢ and reward function Rᵢ. The transition kernel P: S × A₁ × ... × Aₙ → Δ(S) depends on the joint action. The environment mediates joint actions and produces per-agent observations and rewards. This is the foundation of multi-agent reinforcement learning (MARL).

In a Markov game: cooperation arises when agent reward functions align (Rᵢ ≈ Rⱼ for all i, j); competition arises when they are opposed; mixed motives arise when some pairs cooperate and others compete. The environment itself is neutral with respect to these alignments — it processes joint actions and emits per-agent rewards without preference.

## Relation to arena

An [Arena](./arena.md) is an environment stripped of dynamics and feedback: it retains only the enabling relation (what actions are legal given the current context) and discards the transition kernel and reward function. An environment is an arena made dynamic (P determines what state results from each action) and evaluative (R assigns value to each transition). The arena is the propositional skeleton of the environment: it says what is legal; the environment additionally says what follows and how good it is.

Formally: given an environment (S, A, P, R, ρ₀), define moves M = A, enabling relation ⊢ = {(s, a) | a ∈ A legal in s}. This gives an arena. The arena loses P and R entirely.

## Relation to vessel

The [Vessel](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) is the environment viewed from the institutional angle. The correspondence:

| Environment (MDP) | Vessel |
|---|---|
| State space S | The set of possible crew configurations and charter states |
| Action space A | The set of actions agents can take as officers |
| Transition kernel P | The constitutive rules (what institutional state results from each action) |
| Reward function R | The charter's success criteria (what counts as advancing the endeavor) |
| Initial state distribution ρ₀ | The initial officer installation and charter ratification |

The environment adds dynamics and feedback to the vessel concept; the vessel adds institutional identity, deontic structure, and persistence to the environment concept. Neither subsumes the other — they describe the same underlying structure from different theoretical perspectives.

## Relation to this system

The relational universe R = Sh(T, J) is the environment for agents in the FARS. The correspondence:

| E = (S, A, P, R, ρ₀) | R = Sh(T, J) |
|---|---|
| S (state space) | The set of histories T — each history t is a world-state |
| A (action space) | The set of steps Σ — each step s ∈ Σ is an agent action |
| P (transition kernel) | The stepping map — s★t is the (deterministic) next state after step s in state t |
| R (reward function) | The nucleus evaluation — propositions in H* are the "rewarded" (settled) states |
| ρ₀ (initial distribution) | The empty history ε — the initial state is the empty context |

The commutation topology J determines which histories are equivalent as states (commuting steps produce the same state up to isomorphism). The nuclei σ and Δ are the reward-generating structure: a proposition "earns reward" when it reaches the nuclear fixed point H* — the subtopos of fully settled claims. The POMDP extension applies directly: agents observe sections F(t) ∈ F(t) (local sections of a sheaf), not the global state; they must infer the full global section by gluing local observations.

## Key references

Bellman (1957), *Dynamic Programming*. Puterman (1994), *Markov Decision Processes: Discrete Stochastic Dynamic Programming*. Sutton & Barto (2018), *Reinforcement Learning: An Introduction* (2nd ed.). Shapley (1953), "Stochastic Games", *PNAS*. Wooldridge (2009), *An Introduction to MultiAgent Systems* (2nd ed.).

## Dark sector reading: unsettled modes and vacuum energy

**Sources:** [Dark Matter–Dark Energy Conversion](../math/relational-universe-spectral-dark-energy-conversion-tunneling-physics-conjecture.md), [Spectral Thermodynamics](../math/relational-history-fiber-spectral-thermodynamics-temperature-duality-golden-conjecture.md), [Hubble Tension](../math/relational-universe-hubble-tension-golden-step-physics-correspondence-conjecture.md).

The environment's state space $S$ contains both settled and unsettled relational history. The settled part ($H^*_t$ elements) is directly observable and directly rewarding. The unsettled part — the FreeShadowType and TrShadowType elements that have not yet reached $H^*_t$ — exerts structural influence through the transition kernel $P$ but cannot itself be directly collected as reward. This is the **relational dark sector**:

| Physical concept | Environment reading |
|---|---|
| Dark matter $\rho_{\mathrm{DM}}$ | Spectral mass $M_t(\delta)$ = total unsettled-mode density = shadow-class elements not yet in $H^*_t$ |
| Dark energy $\rho_\Lambda$ | Vacuum energy = rate of reward generation as modes tunnel from FreeShadow/TrShadow into $H^*_t$ |
| Hubble expansion rate $H$ | Rate of reward-settled-state accumulation; environment's "expansion" rate |
| Dark matter density decreasing | Unsettled modes settling over the tower depth; fewer shadow-class elements remain |
| Dark energy increasing | Reward-generation rate increases as modes settle: $\rho_\Lambda \propto M_t^{-1/3}$ |

**The conservation relation.** As the environment depth increases through the tower, the dark sector quantities evolve along a conservation curve:
$$\rho_\Lambda \cdot \rho_{\mathrm{DM}}^{1/3} \;=\; \mathrm{const}.$$
As the spectral mass $M_t$ (unsettled-mode density) decreases by a factor of $\varphi$ per tower level, the reward-generation rate $\rho_\Lambda$ increases by $\varphi^{1/3}$. The environment's unsettled substrate is not destroyed — it is converted into vacuum energy, into the reward-generating settling events that constitute the agent's payoff.

**Reward-expansion rate and the Hubble formula.** The rate at which the environment generates new settled states (new reward-events) scales as:
$$H \;\propto\; \rho_\Lambda^{1/2} \;\propto\; M_t^{-1/6}.$$
Over one golden step ($M_t$ decreases by $\varphi$), the reward-expansion rate increases by $\varphi^{1/6}$. For a 3-dimensional environment ($d = 3$): the late-to-early reward-expansion ratio is $\varphi^{1/6} \approx 1.0835$. This is the formal content of the Hubble tension formula applied to the environment's reward dynamics.

**Non-equilibrium evaporation.** The dark sector reading does not place the environment in thermal equilibrium. The thermodynamic temperature of the unsettled modes ($T_{\mathrm{thermo}} \propto M_t$) and the Hawking temperature of the reward-generating horizon ($T_H = 1/(2M_t)$) describe two non-equilibrium aspects of the same settling process. An environment with a large unsettled-mode reservoir ($M_t$ large) has high internal temperature but a cold reward-generation rate. An environment nearly at fixed-point ($M_t \to 0$, all modes settled) has low internal temperature but a divergently hot reward-generation horizon: the last few settling events are energetically concentrated.

**Equation of state.** If the spectral mass evolves as $M_t(z) \propto (1+z)^\alpha$ over the environment's depth, then the reward-generation rate has equation of state:
$$w_{\mathrm{eff}} \;=\; -1 - \frac{\alpha}{9} \;\approx\; -1.008$$
for $\alpha \approx \ln\varphi / \ln(1 + z_{\mathrm{CMB}}) \approx 0.069$ — a **phantom** equation of state ($w < -1$): the environment's vacuum energy grows over time, consistent with the DM-to-DE conversion mechanism. This means the environment is not a static reward structure: the reward-generation rate itself expands as the depth tower progresses.

**Proposition (DM-DE conservation in the environment).** The environment's dark-sector quantities satisfy the conservation constraint $\rho_\Lambda \cdot \rho_{\mathrm{DM}}^{1/3} = C$ across tower levels, where $C$ is determined by the initial spectral mass $M_t^{(0)}$. Every settling event transfers mass from $\rho_{\mathrm{DM}}$ to $\rho_\Lambda$ along this curve. The curve is the environment's conserved structural identity across its depth evolution: the total reward-generative capacity is not depleted but transformed.

*Source.* Bridge conjecture and conservation relation from [Dark Matter–Dark Energy Conversion](../math/relational-universe-spectral-dark-energy-conversion-tunneling-physics-conjecture.md) §The Conjectural Correspondence. Hubble formula from §The Hubble Tension Connection. Equation of state from §Numerical Check. Status: conditional on spectral surface conjecture and golden stability conjecture. $\square$

## Open questions

- Whether the stepping map s★t is genuinely deterministic (giving a full MDP) or whether the commutation structure introduces irreducible nondeterminism (giving a true MDP with |P| > 1 for some (t, s) pairs).
- Whether the POMDP reading — agents observe local sections, not global states — is the right framework for the FARS agent-environment interaction, or whether agents have access to more global structure than a POMDP allows.
- Whether the Markov game extension (N agents with per-agent rewards) has a direct categorical description in R, and if so whether the per-agent reward functions correspond to the per-locale nuclei in the hyperverse tower.
