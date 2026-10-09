---
type: theorem
class: informal
status: active
depends-on:
  - behavioral-equivalence-underdetermination.md
see-also:
  - teaching/explanations/machine-theory-of-mind.md
  - teaching/explanations/the-llm-tom-debate.md
references: []
---

# ToM-from-behavior bound

**Statement (informal).** Inferring an agent's full mental state from finite behavioral observation is fundamentally underdetermined.
Theory-of-mind attributions are inherently inferential commitments, not deductive consequences of behavior.

## What it asserts

- Behavior is a *projection* of mental state to a lower-dimensional space.
- Recovering the full mental state from behavior requires assumptions beyond observation.
- Different attribution frameworks (Bayesian, BDI, Dennettian) produce different attributions from the same behavior.
- No finite behavior set determines a unique mental- state attribution.

## Why it holds

This is a specialization of [behavioral-equivalence-underdetermination](behavioral-equivalence-underdetermination.md):

- The *forward* mapping from mental state to behavior is many-to-one (many states produce the same behavior).
- The *inverse* mapping is one-to-many (each behavior is consistent with many states).
- Without strong constraints (rationality assumptions, preference priors, etc.), the inverse problem is ill-posed.

## In ToM specifically

Several specific underdeterminations:

- **Belief vs preference.** An agent who avoids X may believe X is bad or believe X is uncertain or have preferences against X.
  Behavior alone doesn't distinguish.
- **Knowledge vs belief.** An agent who acts on $p$ may know $p$ or believe $p$ falsely.
  Behavior only reveals the agent's commitment, not its truth-value.
- **Reasoning depth.** An agent's behavior is consistent with various depths of recursive reasoning; depth is not determined by behavior alone.
- **Mechanism.** Same ToM behavior is consistent with different ToM mechanisms (theory-theory vs simulation, mature vs developing, robust vs brittle).

## What enables practical attribution

In practice, ToM attribution succeeds because:

- **Strong rationality priors** constrain the space of plausible mental states.
- **Conventions** about what mental states are typical defaults.
- **Multiple observations** rule out many attributions through cumulative constraint.
- **Linguistic communication** provides direct mental- state reports (with credibility caveats).
- **Pragmatic shortcuts** make practical attribution fast even when underdetermined.

These work for everyday ToM but break down for adversarial or unusual cases.

## Implications for machine ToM

The bound is central to the LLM-ToM debate:

- **LLMs passing false-belief tasks** establishes behavioral consistency with ToM but not the *underlying mechanism*.
- **The "do LLMs really have ToM" question** is partially ill-posed; it asks about underlying mechanism on the basis of behavior, which the bound prohibits.
- **Robust LLM ToM evaluation** must combine behavioral and mechanistic evidence; behavior alone cannot settle the question.
- **AI safety arguments invoking ToM** should be cautious about reading rich mental states into behavioral evidence.

## Connections

- **Behavioral-equivalence underdetermination** — parent claim.
- **Machine theory-of-mind** — practical context.
- **Mechanistic interpretability** — partial disambiguation method.
- **Ullman 2023** — concrete LLM ToM failure pattern that the bound predicts could arise from purely behavioral evidence.

## Limits

- **The bound doesn't prohibit attribution.** It prohibits *deductive* derivation of attribution from behavior; *inferential* attribution remains possible.
- **Cumulative observation tightens.** Many observations across diverse contexts narrow the space of consistent attributions.
- **Pragmatic adequacy.** For most practical purposes, underdetermined attribution is adequate; only edge cases require disambiguation.

## Status

Informal but methodologically important.
Implicit in much philosophy of mind.
Increasingly relevant to AI discourse where behavioral evidence about LLMs is being asked to settle questions behavior is structurally underdetermined to settle.
