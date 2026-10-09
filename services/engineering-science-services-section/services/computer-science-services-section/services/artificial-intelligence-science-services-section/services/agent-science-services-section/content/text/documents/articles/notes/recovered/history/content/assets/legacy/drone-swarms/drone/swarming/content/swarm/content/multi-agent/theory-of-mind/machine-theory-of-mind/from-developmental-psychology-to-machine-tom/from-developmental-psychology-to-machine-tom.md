---
type: narrative
status: active
see-also:
  - ../teaching/explanations/theory-of-mind.md
  - ../teaching/explanations/false-belief-task.md
  - ../teaching/explanations/machine-theory-of-mind.md
---

# From developmental psychology to machine ToM

The contemporary machine theory-of-mind program traces a half-century arc through developmental psychology, philosophy of mind, and AI.
The trajectory is worth following because the methodological lessons of the earlier work bear directly on contemporary debates about LLM ToM.

## The Premack-Woodruff founding (1978)

Premack & Woodruff asked: "Does the chimpanzee have a theory of mind?"
The paper proposed *theory of mind* as a research program: an agent has ToM iff it attributes mental states (beliefs, intentions, knowledge) to others and uses these attributions to predict behavior.

The paper used Sarah, a chimpanzee, in tasks involving problem-solving by a human actor; Sarah seemed to recognize the actor's *goals* and select solution photographs accordingly.

The paper's central methodological move — testing ToM through behavioral predictions of agents-with-mental- states — set the agenda for decades.
Commentators on the original paper (Dennett among them) immediately raised the *underdetermination* concern: Sarah's behavior was consistent with goal recognition but also with simpler behavioral pattern matching.

## The false-belief task (Wimmer-Perner 1983)

Wimmer & Perner introduced the false-belief task to *disambiguate*: testing whether children predict behavior from an actor's *false* belief shows mental- state attribution is operating, since pure behavioral pattern matching would predict the wrong answer.

The Maxi/chocolate task (and its Sally-Anne variant by Baron-Cohen, Leslie & Frith 1985) became the diagnostic standard.
Children typically pass at age 4; younger children typically fail; the transition is robust.

This was a *methodological* contribution as much as an empirical one: false-belief tasks gave the field a shared diagnostic that could test for ToM rather than just consistent-with-ToM behavior.

## The autism connection (Baron-Cohen 1985)

Baron-Cohen, Leslie & Frith reported that children with autism spectrum disorder systematically fail false- belief tasks even when matched with younger typically- developing children on general cognitive ability.
This was originally interpreted as evidence of an *autism- specific ToM deficit* — the "mindblindness" hypothesis.

Subsequent work has complicated this picture: the relationship between autism and ToM is more nuanced than originally proposed, and ToM differences in autism appear to be quantitative and contextual rather than binary.
But the original finding was deeply influential in establishing ToM as a distinct cognitive capacity amenable to differential study.

## The intentional-stance framework (Dennett 1971, 1987)

In parallel with empirical developmental work, Dennett developed the *intentional stance* framework — treating systems as rational agents with beliefs and desires for predictive purposes, regardless of underlying mechanism.

The framework defused metaphysical debates about "real" mentality: instead of asking whether systems "really have" beliefs, ask whether the intentional stance is predictively useful for them.
This pragmatic framing has aged well as AI systems exhibit behavior amenable to intentional-stance prediction without clear metaphysical answers.

## The cognitive-hierarchy turn (game theory, 1990s-)

Game theorists discovered that *strategic reasoning is recursive ToM*.
Modeling another agent that models you that models them... is exactly the structure ToM investigators studied.

The behavioral game theory program (Stahl-Wilson level- $k$, Camerer-Ho-Chong cognitive hierarchy) measured empirical depth of recursive reasoning, finding it *bounded*: humans typically reason at L1-L3, rarely deeper.
ToM, formerly a developmental milestone, became a *quantitative parameter* in strategic interaction.

## The neural-network turn (2010s-)

Deep learning enabled a new approach: train neural networks on agent trajectories and see whether they develop ToM-like representations.

Rabinowitz et al. (2018) trained networks on simulated agent populations and found the networks developed implicit representations of agent characteristics (preferences, capabilities) — *emergent ToM* through training.

This was *engineering* progress: machine ToM was no longer purely theoretical but had concrete neural-network implementations.

## The LLM era (2022-)

The arrival of capable LLMs reshaped the field again:

- LLMs can be *prompted* to reason about other agents' mental states; they do this fluently.
- LLMs *pass* classical false-belief tasks (Kosinski 2023, GPT-4 with high accuracy).
- LLMs *fail* systematic perturbations of false-belief tasks (Ullman 2023, showing brittleness).
- The interpretation is contested.

The contemporary debate (see [the-llm-tom-debate](the-llm-tom-debate.md)) recapitulates Premack-Woodruff's original concern at larger scale: LLM behavior is consistent with ToM, but behavior alone underdetermines whether ToM is operating in any robust sense.

## Lessons for contemporary work

The half-century arc offers several methodological lessons:

- **Behavioral consistency ≠ ToM.** This was the original 1978 lesson; it remains relevant.
- **Diagnostic perturbations matter.** False-belief tasks added value by *disambiguating* behavior; contemporary LLM ToM evaluation should similarly emphasize perturbation tests, not just standard-task accuracy.
- **Pragmatic framing helps.** Dennett's intentional stance defuses some unproductive disputes about "real" ToM.
- **Mechanism matters eventually.** Behavioral evidence is suggestive; mechanistic interpretability provides disambiguation behavior cannot.
- **Quantitative measurement.** Cognitive hierarchy models show that ToM is not binary but graded — reasoning at depth $k$ for various $k$.

The contemporary machine ToM program is the latest chapter of a long arc; the methodological lessons of earlier chapters apply.
