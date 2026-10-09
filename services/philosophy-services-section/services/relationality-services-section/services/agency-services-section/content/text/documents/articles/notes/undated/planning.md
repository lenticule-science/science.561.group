---
title: "Planning"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: The formal study of how agents construct courses of action that achieve goals in environments whose dynamics are at least partially known. The theory covers the classical planning formalism (STRIPS, ADL, PDDL) and its complexity, heuristic search and the admissibility theory of heuristics, Monte Carlo tree search and its convergence properties, hierarchical planning (HTN, options), planning under uncertainty (contingent, conformant, POMDPs), and the contemporary recasting of inference-time search in large language models (chain-of-thought, tree-of-thoughts, ReAct) as a planning paradigm. It engages both the classical literature (Fikes-Nilsson 1971, Hart-Nilsson-Raphael 1968, Ghallab-Nau-Traverso 2016) and the contemporary inference-time-compute literature (Kocsis-Szepesvári 2006, Silver et al. 2018, Wei et al. 2022, Yao et al. 2023).position: >
  This theory is a sibling of [agents](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/agents/_index.md),
  [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/reinforcement-learning/_index.md),
  [swarm-intelligence](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/swarm-intelligence/_index.md), and
  [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/alignment/_index.md) within the artificial-intelligence
  branch. Where the agents theory characterizes what makes a system
  agentic, RL addresses how an agent updates its policy from reward,
  swarm covers local-rule coordination, and alignment addresses
  whether the agent's goals match its principal's, the planning theory
  addresses the orthogonal question: *given a goal and a model of the
  environment, how does an agent construct a course of action?* The
  theory provides the formal substrate for "the agent decides what to
  do" that the agents theory assumes but does not develop, and
  complements RL — which learns values from interaction — by analyzing
  what can be done when dynamics are known or modelable. The theory
  is positioned to engage the math-side bilattice-valued progress
  framing in predication-categories without depending on it.
description: The planning theory gives formal structure to the family of methods by which agents construct goal-achieving courses of action from known or modeled environment dynamics.
derives-from: acting
position: "This theory is a sibling of [agents](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/agents/_index.md), [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/reinforcement-learning/_index.md), [swarm-intelligence](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/swarm-intelligence/_index.md), and [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/planning/content/alignment/_index.md) within the artificial-intelligence branch. Where the agents theory characterizes what makes a system agentic, RL addresses how an agent updates its policy from reward, swarm covers local-rule coordination, and alignment addresses whether the agent's goals match its principal's, the planning theory addresses the orthogonal question: *given a goal and a model of the environment, how does an agent construct a course of action?* The theory provides the formal substrate for \"the agent decides what to do\" that the agents theory assumes but does not develop, and complements RL — which learns values from interaction — by analyzing what can be done when dynamics are known or modelable. The theory is positioned to engage the math-side bilattice-valued progress framing in predication-categories without depending on it."
---

The planning theory gives formal structure to the family of methods by which agents construct goal-achieving courses of action from known or modeled environment dynamics.
It answers four questions precisely:

**What is the formal substrate of planning?** A planning problem is a tuple of state space, action set, transition relation, initial state, and goal predicate.
The agent's task is to construct a plan — a sequence, policy, or contingent tree of actions — whose execution from the initial state leads to a goal state under the transition relation.
See [planning-problem](planning-problem.md) and [classical-planning](../../../../glossary/concepts/classical-planning.md).

**How is planning computationally hard?** Even classical deterministic plan-existence is PSPACE-complete; bounded-horizon plan-existence is NP-complete.
Heuristic search (notably A* with admissible heuristics) is the principal technique for tractable planning at scale, with optimality guarantees when the heuristic is admissible.
Monte Carlo tree search (UCT) gives anytime convergence to the optimal plan in finite MDPs.
See [classical-planning-complexity](classical-planning-complexity.md), [a-star-optimality](a-star-optimality.md), and [uct-convergence](uct-convergence.md).

**How does planning compose hierarchically?** Hierarchical task networks decompose abstract tasks into networks of sub-tasks; the options framework lifts this to RL by treating temporally-extended actions as policies.
Hierarchical planning trades completeness for tractability — the decomposition library determines what is expressible and what is reachable.
See [hierarchical-planning](../../../../glossary/concepts/hierarchical-planning.md) and [hierarchical-decomposition-soundness](hierarchical-decomposition-soundness.md).

**How does inference-time search in LLMs relate to classical planning?** Chain-of-thought prompting elicits sequential reasoning; tree-of-thoughts adds branching and backtracking; ReAct interleaves reasoning with environmental action.
These are search procedures operating over a different state space (token sequences, plan fragments) under a different evaluation function (a learned language-model likelihood plus task-specific verification), but they share the structure of classical planning: branch, evaluate, select, backtrack.
Whether they are *genuine* search in the algorithmic sense or sophisticated pattern-matching of search-shaped data is contested.
See [inference-time-search](../../../../glossary/concepts/inference-time-search.md) and [is-llm-cot-genuine-search](is-llm-cot-genuine-search.md).
