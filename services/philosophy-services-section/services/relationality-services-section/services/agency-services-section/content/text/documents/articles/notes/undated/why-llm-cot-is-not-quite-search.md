---
type: narrative
class: critical
status: active
depends-on:
  - ../teaching/explanations/inference-time-search.md
  - ../teaching/explanations/heuristic-search.md
see-also:
  - ../learning/questions/is-llm-cot-genuine-search.md
  - ../theorems/inference-time-compute-tradeoff.md
references:
  - ../references/wei-cot2022.md
  - ../references/yao-tot2023.md
title: Why LLM CoT is not quite search
description: "Chain-of-thought prompting and its derivatives are routinely described in the language of search: \"the model explores reasoning paths\"; \"tree-of-thoughts performs branching search\"; \"ReAct interleaves search with action.\" This vocabulary…"
---

# Why LLM CoT is not quite search

Chain-of-thought prompting and its derivatives are routinely described in the language of search: "the model explores reasoning paths"; "tree-of-thoughts performs branching search"; "ReAct interleaves search with action."
This vocabulary is not exactly wrong, but it elides four substantial differences between LLM inference-time procedures and classical search algorithms.
Whether those differences are *important* enough to refuse the search analogy entirely is contested; what is *not* contested is that the analogy is approximate rather than literal.

## Difference 1: The successor function is learned and stochastic

Classical search has a *defined* successor function: from a state $s$ and action $a$, the algorithm computes the next state $s' = T(s, a)$ deterministically.
The action set is enumerable and the transition is known.

In LLM CoT, the "successor function" is *the model itself*.
From a partial reasoning trace, the next reasoning step is sampled from the model's continuation distribution.
The action set is the combinatorially-vast space of token continuations.
The transition is non-deterministic and learned.

This means LLM CoT is closer to *sample-based planning* (MCTS, POMCP) than to *systematic search* (A*, BFS).
The relevant comparison is to MCTS-style algorithms whose successor sampling is the principal cost driver, not to A* whose successor enumeration is trivial.

## Difference 2: The state space has no clean atomic structure

Classical search states are atomic objects: ground STRIPS atoms, Go board positions, robot configurations.
Two states are either equal or unequal; the equality test is cheap and reliable.

LLM CoT states are *natural-language reasoning traces*.
Two traces "the same up to phrasing" are formally distinct strings, and there is no efficient procedure for deciding whether two reasoning paths are exploring the same partial solution or genuinely different ones.
This breaks the closed-list optimization that systematic search relies on; LLM CoT cannot recognize when it is repeating itself.

It also breaks the *meaning of branching*: in classical search, each branch corresponds to a distinct path in a well-defined state space; in LLM CoT, branches may explore very different partial plans or may be paraphrases of each other, with no easy way to tell which.

## Difference 3: The heuristic is unreliable in a structurally specific way

Classical search uses heuristics with explicit properties (admissibility, consistency) that produce explicit guarantees (optimality, no re-expansion).
The heuristic is *separately specified* from the search and can be analyzed independently.

In LLM CoT, the "heuristic" is the LLM's own continuation likelihood or a self-evaluation prompt.
There is no admissibility guarantee; the heuristic is empirically biased in known ways (toward common patterns, toward confident-sounding text, toward continuations similar to training examples).

Worse, the heuristic and the search are *not separable*: the LLM is both the successor function and the evaluator.
This makes failure modes structurally specific:

- **Self-confirming reasoning**: the LLM produces a wrong reasoning step; when asked to evaluate, it confirms the step it just produced.
  The evaluator's bias is correlated with the generator's bias because they are the same network.
- **Plausibility-driven non-correctness**: the LLM prefers continuations that *look* plausible over continuations that *are* correct.
  In domains where plausibility and correctness diverge (subtle math, adversarial logic, novel deductions), this can produce confidently-wrong answers.
- **No backtrack signal**: classical search backtracks on failure; LLM CoT often "doubles down" on a wrong path because the model tends to maintain narrative consistency.
  Explicit backtracking-prompted variants (ToT) mitigate but do not eliminate this.

## Difference 4: There is no soundness guarantee

Classical search is *sound*: when it returns a plan, the plan provably achieves the goal in the model.
The proof is structural (by induction on the search procedure).

LLM CoT has no soundness guarantee.
When the LLM returns "the answer is 42," there is no formal argument that 42 is correct; there is only the empirical observation that LLMs are right about this kind of thing some fraction of the time.
For domains with external verifiers (math with formal proof checking, code with unit tests, formal-system reasoning), the verifier provides post-hoc soundness on the output; for domains without external verifiers, there is nothing.

This difference is the deepest.
Classical planning's central theoretical achievement is *correctness-by-construction*: a correctly-implemented A* with admissible heuristic *cannot* produce a wrong answer.
LLM CoT has no analogous construction; its correctness is empirical and unverifiable.

## Why the search vocabulary is still useful

Despite all four differences, the search analogy captures something real:

- The structure of branching, evaluation, and selection genuinely recurs.
- Many techniques transfer: beam search, importance sampling, best-first selection, tree search with backtracking — all imported from classical search and useful in LLM CoT.
- The empirical scaling laws ([inference-time-compute-tradeoff](inference-time-compute-tradeoff.md)) parallel classical-search scaling laws (more search, better answers, with diminishing returns).
- The *failure modes* of LLM CoT, when analyzed carefully, often map to failure modes of classical search with bad heuristics or bad successor functions.

The vocabulary is a useful organizing frame, *provided* the four differences above are kept in view.
It becomes misleading when those differences are forgotten: when CoT is treated as if it had classical-search guarantees, or when the search-vs-pattern-matching distinction is treated as resolved.

## What is genuinely different about LLM CoT

The single thing about LLM CoT that has no classical-search analogue: the *capability* to produce useful next-reasoning-steps across enormous task variety, drawn from training on a substantial fraction of human written reasoning.
Classical search is brittle to domain change (a planner for blocksworld is useless for chess); LLM CoT is robust to domain change (the same model reasons across math, code, law, medicine, philosophy).

This breadth-of-applicability is not a *search* property; it is a *model* property.
LLM CoT works as well as it does because the LLM is a remarkable artifact.
The search structure on top is doing modest additional work; most of the lifting is the underlying language model's prior over reasonable reasoning steps.

This is the structural reason LLM CoT *is not quite search*: it is a *learned model* with a *light search procedure* on top, not a search procedure with model-derived heuristics.
The classical-search literature has barely begun to integrate this insight.
