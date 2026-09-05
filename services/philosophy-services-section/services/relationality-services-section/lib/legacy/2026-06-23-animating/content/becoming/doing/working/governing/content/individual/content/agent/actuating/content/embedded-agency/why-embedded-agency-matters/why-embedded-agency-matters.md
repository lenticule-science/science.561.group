---
type: narrative
status: active
see-also:
  - ../teaching/explanations/embedded-agency.md
  - ../theorems/embedded-agent-impossibility.md
---

# Why embedded agency matters

The standard picture of a rational agent — the picture VNM, Savage, and Bayes inherit from Descartes — is of a mind *outside* the world it reasons about.
The agent observes the world through a clean input channel, deliberates inside its own head, and acts on the world through a clean output channel.
The agent and the world are categorically separate substances.

This picture works well enough for many engineering problems — classical control, classical statistics, classical decision-theoretic economics — because the systems being modeled satisfy the Cartesian assumption to a useful approximation.
The thermostat is a separate object from the furnace.
The poker player's mind is, for purposes of the game, distinct from the cards.

It does not work for AI agents in the limit.

## How the picture breaks

A real AI system is a physical computation.
Its "mind" is electrons moving in silicon.
Its "observations" are bits coming from sensors that are themselves electrons moving in silicon near the mind.
Its "actions" are bits going to actuators that are more electrons. *There is no Cartesian boundary in the physics.*

This has consequences the classical framework cannot handle:

**Self-modeling.** A sufficiently capable AI must model the world that *contains itself*.
But a strict Bayesian prior cannot include itself among its hypotheses without self-referential incoherence.
See [embedded-agent-impossibility](../theorems/embedded-agent-impossibility.md).

**Source-code uncertainty.** The AI may be uncertain about its own implementation details, training data, or computational resources.
Classical decision theory has no apparatus for an agent that is uncertain about its *own* parameters.

**Self-modification.** Real agents can take actions that change their own future decision procedures.
The optimal policy under self-modification is not the optimal policy of a fixed agent; it is a fixed-point.

**Subagent emergence.** A trained model may contain learned subprocesses that are themselves optimizers with possibly divergent objectives.
This is precisely the [mesa-optimization](../../alignment/concepts/mesa-optimization.md) analysis in alignment.

**Source-code observability.** A predictor that can read the agent's code creates Newcomblike scenarios where the agent's choices and the predictor's predictions are *algorithmically* coupled.
Classical decision theory cannot handle this without contortion.

## Why the alignment problem is downstream

Each of these failure modes is something the alignment problem must contend with.
The alignment problem itself — getting an AI to do what its principal wants — presupposes a decision-theoretic substrate the principal and the AI share.
But that substrate (Bayesian reasoning, expected utility, clean agent-environment boundary) does not exist for an embedded AI in the limit.

So embedded agency is not a separate research program from alignment.
It is the *substrate* alignment needs and currently lacks.
The alignment theorems we have today ([mesa-optimization-emergence-conditions](../../alignment/theorems/mesa-optimization-emergence-conditions.md), [corrigibility-capability-tension](../../alignment/theorems/corrigibility-capability-tension.md)) are stated in classical decision-theoretic language and are precisely as well-founded as that language is.
Embedded agency is the project of making the language well-founded for the AI systems alignment is supposed to constrain.

## Status

The embedded-agency program has produced concrete partial results — Garrabrant's logical induction, FDT, Cartesian frames, reflective oracles — but no unified replacement for the Cartesian framework.
The reason to care about the program is not that it has finished its work; it is that the work is prerequisite to the rest of agent-theory and we cannot finish without it.
