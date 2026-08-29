---
type: theorem
class: algorithmic-convergence
status: proved
depends-on:
  - teaching/explanations/monte-carlo-tree-search.md
see-also:
  - inference-time-compute-tradeoff.md
references:
  - references/kocsis-szepesvari2006.md
---

# UCT convergence

**Theorem (Kocsis & Szepesvári 2006).** Consider a finite-horizon Markov decision process with bounded rewards $r \in [0, R_{\max}]$.
Run UCT (Upper-Confidence-bound applied to Trees) at the root state $s_0$ for $N$ iterations.
Let $\hat{V}_N(s_0)$ be the empirical value estimate of $s_0$ after $N$ iterations and let $V^*(s_0)$ be the true optimal expected return.

Then:

1. **Value convergence.** $\hat{V}_N(s_0) \to V^*(s_0)$ as $N \to \infty$.
2. **Action convergence.** The probability that UCT recommends a suboptimal action at the root tends to zero: for any $\epsilon > 0$, $$\mathbb{P}\!\left[\hat{V}_N(s_0) - V^*(s_0) \geq \epsilon\right] \to 0.$$
3. **Regret bound.** The expected regret at the root after $N$ iterations is $O(\log N)$ — the same logarithmic regret as the underlying UCB1 bandit, lifted to the tree.

The convergence holds when the tree policy at each node uses UCB1 with exploration constant $c$ proportional to the value range $R_{\max}$ at that node, and the rollout policy ensures bounded rewards (e.g., uniform random in finite-action MDPs).

## Proof sketch

The proof proceeds by induction on tree depth.

**Base case (leaf actions).** At a node $s$ all of whose children are terminal states (or evaluated by a fixed evaluator), the action selection is a UCB1 bandit problem with stationary rewards.
Auer, Cesa-Bianchi, Fischer (2002) prove UCB1 has expected regret $O(\log n)$ after $n$ pulls.
By the law of large numbers, the empirical mean reward of each action converges to its true expected reward, and the UCB1 selection rule converges to selecting the optimal action with probability $\to 1$.

**Inductive step.** At a node $s$ whose children are non-terminal, the value of each child action $a$ is the *expected return from following the UCT-induced policy in the subtree rooted at $\delta(s, a)$*.
By the inductive hypothesis, this value converges to the optimal $V^*(\delta(s, a))$ as the visit count to that subtree grows unboundedly.
The UCB1 selection at $s$ is then a *non-stationary* bandit problem, since the empirical reward distribution of each arm is changing over time.
The technical core of the proof is showing that the non-stationarity is mild enough — the empirical means converge — that a modified regret analysis gives convergence at the parent node as well.

The full proof requires careful treatment of (i) the non-stationarity, (ii) tail bounds on the empirical means with growing visit counts, and (iii) the propagation of the inductive hypothesis up the tree.
Details in the original paper.

$\square$

## What this theorem does and does not say

**Does say.** UCT is *consistent*: with infinite computation, it converges to the optimal action.
The regret grows only logarithmically in the number of iterations.

**Does not say.** That UCT is fast.
The convergence is asymptotic; the constants in the regret bound depend on the tree depth, the value range, and the *gap* between the optimal and next-best actions at each node.
In domains with small gaps (many near-optimal options), finite-time performance can be poor.

**Does not say.** That UCT is sample-efficient.
The exploration term ensures every action is sampled infinitely often; in tasks where some actions are clearly bad, this is wasteful.
Modern variants (progressive widening, RAVE, learned-prior MCTS) modify UCT to be more sample-efficient at the cost of stronger assumptions.

**Does not say.** That the *rollout policy choice* is irrelevant.
The theorem assumes bounded rewards from rollouts; the *quality* of the rollout policy strongly influences the practical convergence rate.
Random rollouts converge slowly in domains where random play is uninformative; learned rollouts converge much faster but lose the generality of the assumption.

**Does not say.** Anything about partially-observed MDPs (POMDPs).
UCT for POMDPs (POMCP) requires substantial modification and has weaker theoretical guarantees.

## Relationship to other results

UCT convergence underpins the success of MCTS-based game-playing systems (AlphaGo, AlphaZero) and increasingly general MCTS-based planning systems.
The theorem justifies using UCT in domains where no admissible heuristic is available: with enough compute, UCT will find the optimal action even without external guidance.

The theorem composes with the [inference-time-compute-tradeoff](inference-time-compute-tradeoff.md) result: more inference compute (more UCT iterations) yields better plans, with diminishing but non-zero returns through many orders of magnitude.

The contrast with [a-star-optimality](a-star-optimality.md) is instructive: A* gives a *finite-time* optimality certificate when the heuristic is admissible; UCT gives an *asymptotic* optimality guarantee when no heuristic is required.
The two are complementary techniques addressing different problem structures.
