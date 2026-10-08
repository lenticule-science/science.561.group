---
title: "Agent Foundations"
component-of: artificial-intelligence
type: theory
class: engineering-theory
status: active
discipline: The formal study of what it means to be a rational agent embedded in the same physical universe whose laws the agent must reason about. The theory covers classical decision theory (von Neumann- Morgenstern utility, Savage's subjective expected utility, the Jeffrey-Bolker framework), the family of variant decision theories (Causal Decision Theory, Evidential Decision Theory, Functional / Updateless Decision Theory) that emerge from the failure of classical theory on Newcomblike problems, the embedded-agency research program (the agent is a physical subsystem of its environment, not a Cartesian outsider), Garrabrant's logical- induction account of self-reference and uncertainty over logical facts, reflective stability and Loebian obstacles to self-trust, and bounded-rationality theories that recognize agents as computationally limited. Engages classical literature (von Neumann-Morgenstern 1944, Savage 1954, Jeffrey 1965, Gibbard- Harper 1978) and the contemporary MIRI / agent-foundations program (Yudkowsky 2010, Soares-Fallenstein 2015, Garrabrant et al. 2016, Demski-Garrabrant 2019).position: >
  This theory is a sibling of [agents](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/agents/_index.md),
  [alignment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/alignment/_index.md),
  [reinforcement-learning](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/reinforcement-learning/_index.md), and
  the other AI theories. Where the agents theory characterizes
  *agentic systems* operationally (what they do, how they
  coordinate), agent-foundations addresses the prior question of
  *what it means for a physical system to be a rational decision-
  maker at all*. It provides formal substrate the alignment theory
  presupposes — for example, the very notion of a "mesa-objective"
  inside an optimizer requires a decision-theoretic account of
  what objects an embedded computation can be said to optimize for.
  The theory inherits classical decision theory but pushes past
  its Cartesian assumption (agent and environment cleanly
  separated) to face problems classical theory cannot state, let
  alone solve: Newcomblike scenarios, Loebian self-reference,
  logical uncertainty, the embedding of decision algorithms into
  the physics they reason about.
description: The agent-foundations theory gives formal structure to the question of what a rational agent is, prior to questions of how it learns, plans, or coordinates.
---

The agent-foundations theory gives formal structure to the question of what a rational agent *is*, prior to questions of how it learns, plans, or coordinates.
It answers four questions precisely:

**What is rational choice?** The classical answer — maximize expected utility under a coherent prior — is given by von Neumann- Morgenstern (preferences over lotteries) and Savage (preferences over acts).
The theory spells out the axioms and shows that any agent satisfying them admits a representation as an expected-utility maximizer.
See [decision-theory](../../../../glossary/concepts/decision-theory.md) and [vnm-utility-theorem](vnm-utility-theorem.md).

**Which decision theory?** Once the world contains predictors, copies, and counterfactual structure, the classical answer fragments.
Causal Decision Theory two-boxes on Newcomb's problem; Evidential Decision Theory smokes in the Smoking Lesion; Functional Decision Theory aims to satisfy both intuitions by choosing the *output of the decision algorithm itself* rather than a single act.
The theory analyzes which problems each formalism handles.
See [cdt-edt-divergence-newcomb](cdt-edt-divergence-newcomb.md) and [fdt-newcomb-resolution](fdt-newcomb-resolution.md).

**What changes when the agent is embedded?** Classical decision theory presupposes a Cartesian agent — a mind separate from its environment, with a well-defined input-output interface.
Real agents are physical subsystems of the environment they reason about.
This breaks the Bayesian framework in concrete ways (self-modeling, source-code uncertainty, naturalized induction) and motivates the embedded-agency research program.
See [embedded-agency](../../../../glossary/concepts/embedded-agency.md) and [embedded-agent-impossibility](embedded-agent-impossibility.md).

**What grounds self-trust and self-modification?** An agent that contemplates upgrading itself, or that proves theorems about its own behavior, runs into Loebian obstacles: a sufficiently expressive formal system cannot consistently assert the soundness of its own proofs.
Garrabrant's logical induction provides a partial substrate by giving a calibrated account of belief over logical sentences.
See [logical-induction-criterion](logical-induction-criterion.md) and [reflective-stability-impossibility-loeb](reflective-stability-impossibility-loeb.md).
