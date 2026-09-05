---
type: concept
class: algorithmic
status: stable
depends-on:
  - heuristic-search.md
see-also:
  - ../morphisms/simulation-rollout.md
  - ../theorems/uct-convergence.md
  - planning-under-uncertainty.md
references:
  - references/kocsis-szepesvari2006.md
  - references/silver-alphazero2018.md
---

# Monte Carlo tree search

**Monte Carlo tree search (MCTS)** is an anytime, sample-based search algorithm that builds an asymmetric tree of states by repeatedly running simulations from the root and using their outcomes to refine the search policy.
Unlike A* and similar systematic-expansion algorithms, MCTS does not require an explicit heuristic — it builds its evaluation from sampled outcomes — and it returns *some* answer at any time, with quality improving with more samples.

## The four-phase iteration

A standard MCTS iteration consists of:

1. **Selection.** Starting from the root, repeatedly choose a child according to a *tree policy* until a leaf node is reached.
  The tree policy must balance *exploitation* (preferring children with high observed value) and *exploration* (preferring children with few visits).
  [UCT](references/kocsis-szepesvari2006.md) uses the UCB1 formula

$$\arg\max_a \; \bar{Q}(s, a) + c \sqrt{\frac{\ln N(s)}{N(s, a)}}$$

where $\bar{Q}$ is mean observed return, $N(s)$ is visit count at $s$, $N(s, a)$ is visit count of action $a$ from $s$, and $c$ is an exploration constant.

2. **Expansion.** Add one or more children of the selected leaf to the tree.

3. **Simulation (rollout).** From the newly-added node, simulate a trajectory to a terminal state using a default policy (random, heuristic, or learned).
  Record the outcome.

4. **Backpropagation.** Update visit counts $N$ and value estimates $\bar{Q}$ along the path from the new leaf back to the root.

After the iteration budget is exhausted, the algorithm returns the action at the root with the highest visit count (or highest value, or a robust child).

## Convergence

The [uct-convergence](../theorems/uct-convergence.md) theorem (Kocsis & Szepesvári 2006): UCT converges to the optimal action at the root in finite Markov decision processes.
The convergence is asymptotic; the exploration term $c\sqrt{\ln N / N(s,a)}$ ensures every action is sampled infinitely often, and the law of large numbers gives convergence of $\bar{Q}$ to the true expected return.

The convergence rate depends on the gap between the optimal action's value and the next-best, the depth of the tree, and the variance of the simulations.
In practice the convergence is often slow; MCTS is chosen for its anytime-ness and its tolerance of unknown dynamics rather than for sample-efficient optimality.

## Why MCTS matters

**Domain-generality.** MCTS works whenever a simulator is available — in particular, in deterministic domains where the next-state function can be queried, or in stochastic domains where transitions can be sampled.
No analytic heuristic is required.

**Anytime answer.** A simulation budget cut short by a deadline still yields a usable action; the longer the budget, the better the answer.
This is structurally different from systematic search, which typically returns nothing useful until completion.

**Composability with learning.** MCTS composes powerfully with learned value and policy networks.
AlphaGo Zero / AlphaZero (Silver et al. 2018) use a learned value network to replace the rollout phase and a learned policy network to bias selection.
The result is a system whose strength comes from search × learning rather than either alone — a pattern that has become foundational for modern high-performance game-playing and increasingly for general planning.

**Bridging classical and learning-based planning.** MCTS is the clearest meeting point of classical search (it is search) and learning (it builds its value estimates from samples).
Most modern "planning + learning" hybrids — including the inference-time-search patterns being explored in LLM agents — use some MCTS variant.

## Limits

**Exponential branching.** The selection phase explores depth, but the underlying state space is still exponential; MCTS gives anytime but not necessarily *fast* results.

**Simulation-quality dependence.** The default rollout policy determines whether MCTS converges in feasible time.
Random rollouts work only on domains where random play is informative; learned rollouts are now standard.

**Stochastic rather than provably-optimal answers.** UCT converges in the limit but provides no finite-time optimality certificate.
For applications requiring proven optimality, A* with admissible heuristic remains preferable when feasible.
