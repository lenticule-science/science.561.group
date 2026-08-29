---
title: "Mathematician Agents"
date-created: 2026-03-07
type: text
authors:
  - claude-opus-4-6
status: draft
aliases:
  - "Mathematician Agents"
  - "mathematician agents"
  - "AI theorem proving agents"
keywords:
  - AgentialSemioverse
  - FormalVerification
  - ProofAssistant
---

# Mathematician Agents

A mathematician agent is an [agent](./index.md) whose skills include formal proof construction and whose tools include proof assistants (Lean, Agda, Coq, Isabelle). Within the [agential semioverse](./agential-semioverse.md) framework, a mathematician agent is a triple (Sigma, K, Pi) where:

- Sigma is bounded internal state (working memory of proof context, goals, hypotheses)
- K is a set of interaction operators (proof tactics, term construction, type-checking)
- Pi is a policy selecting admissible operators given the current state and universe

The key structural insight: **the proof checker neutralizes hallucination**. Unlike natural-language generation where errors propagate silently, a proof assistant rejects invalid reasoning immediately. This makes the agent loop fundamentally different from open-ended text generation — every proposed step is verified or rejected by the tool.

## The agent loop

The core workflow of a mathematician agent:

1. **Read the specification** — understand what needs to be proved and why
2. **State the theorem** — write a type signature that precisely captures the claim
3. **Propose proof steps** — generate tactic applications or term constructions
4. **Verify with the checker** — `lake build` or `agda --check` provides ground truth
5. **Interpret errors** — compiler feedback is the primary learning signal
6. **Iterate** — fix errors, decompose goals, search for lemmas

This loop is a semiotic process: each proof attempt is a sign, the compiler's response is an interpretant, and the agent's revised attempt is the next sign in the chain. The trace comonad G records this provenance — each proved theorem carries the history of its construction.

## Landscape of LLM + proof assistant systems

### Lean 4 ecosystem (most active)

- **LeanDojo** — gym-like environment for ML-driven proving; extracts training data from Mathlib4
- **ReProver** — retrieval-augmented tactic generation; searches Mathlib for relevant premises
- **LeanCopilot** — native LLM integration in the Lean editor; suggests tactics in real-time
- **DeepSeek-Prover-V2** — achieved 88.9% on miniF2F-test benchmark
- **LeanAide** — autoformalization from natural language to Lean 4
- **leanprover/skills** — official Lean 4 skills for Claude Code

### Other proof assistants

- **LEGO-Prover** (Isabelle) — grows a skill library of verified lemmas; each proved lemma becomes available for future proofs
- **Prover Agent** — agent-based framework for formal proofs with reflection and iterative repair
- **AGDA2TRAIN** (NeurIPS 2024) — first large-scale Agda dataset for ML, extracting intermediate proof states

### Key findings from research

1. **Agent architectures beat single-shot generation** — decomposition, reflection, and iterative repair are standard practice
2. **Bottom-up construction works best** — prove helper lemmas first, main theorem last (LEGO-Prover validates this)
3. **The compiler feedback loop is the core mechanism** — `lake build` → read errors → fix → retry
4. **Bite-sized goals** — fill one `sorry` at a time, compile after each
5. **Benchmark progress is dramatic** — miniF2F went from ~50% to ~99% in roughly two years

## Mathematician agents in the agential semioverse

Within the [agential semioverse](./agential-semioverse.md) framework, a mathematician agent's proof-writing skills are [admissible behaviors](../../../../../mathematics/objects/universes/semiotic-universe/formalization/lean/SemioticUniverse/Fusion.lean) in the fusion-theoretic sense:

- **Fragment-preserving**: proofs operate within bounded contexts (fragments); a proof about Heyting algebras does not require understanding all of mathematics
- **Modal-compatible**: proved theorems are habitual — once verified, they settle into stable knowledge (j(theorem) = theorem)
- **Trace-compatible**: proofs carry provenance of their construction; the chain of proof attempts, compiler errors, and fixes is itself semiotic data

The fusion principle applies: if two proof strategies agree on all fragments (produce the same theorems from the same hypotheses), they are congruent and may be identified. The agent's skill library is the syntactic component; the verified theorems are the semantic component; fusion ensures coherence between them.

## Constructive reasoning and AI

Most LLM training data uses classical mathematics. This creates a systematic bias: models tend to reach for proof by contradiction, the law of excluded middle, and case splits on `P ∨ ¬P` — none of which are available in intuitionistic logic.

For the semiotic universe formalization, this means:
- The agent must be explicitly constrained to avoid classical axioms
- `#print axioms` in Lean and the absence of LEM postulates in Agda serve as verification
- The gap between `a` and `¬¬a` in a Heyting algebra is not a deficiency — it represents genuine indeterminacy, meanings not yet determined by relational activity

This is an underserved area in the AI + formal verification landscape. The AGDA2TRAIN dataset (NeurIPS 2024) and "Learn from Failure" (arXiv 2024) represent early steps toward training models specifically for constructive reasoning.

## Open questions

- Can an agent learn constructive proof patterns from classical training data, guided only by the proof checker's rejections?
- How does the agent's proof search strategy relate to the fragment structure of the semiotic universe?
- Is there a natural notion of "proof complexity" that corresponds to the ordering on partial semiotic structures?
- Can the fusion principle be used to identify equivalent proof strategies and simplify the agent's skill library?

## References

- [Formal Mathematical Reasoning: A New Frontier in AI](https://arxiv.org/html/2412.16075v1) — ICML 2025 position paper
- [AI will make formal verification go mainstream](https://martin.kleppmann.com/2025/12/08/ai-formal-verification.html) — Martin Kleppmann
- [AGDA2TRAIN](https://papers.nips.cc/paper_files/paper/2024/file/77c87a15bbf0aad017c53995b832cf84-Paper-Conference.pdf) — NeurIPS 2024
- [LeanDojo](https://leandojo.org/) — Lean 4 ML environment
- [Survey on Deep Learning for Theorem Proving](https://github.com/zhaoyu-li/DL4TP) — COLM 2024
