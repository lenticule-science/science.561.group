---
title: "Theory of mind"
component-of: multi-agent
type: theory
class: engineering-theory
status: active
discipline: >
  The formal study of agents modeling other agents' mental
  states — beliefs, desires, intentions, knowledge,
  preferences. The theory comprises developmental
  psychology's discovery of theory-of-mind in children
  (Premack & Woodruff 1978, Wimmer & Perner 1983),
  Dennett's intentional-stance philosophy, recursive
  belief modeling and cognitive-hierarchy theory in game
  theory, Aumann's agreement theorem and common-knowledge
  reasoning, machine theory-of-mind in deep learning
  (Rabinowitz et al. 2018), and the contested empirical
  question of whether large language models have any form
  of theory-of-mind capability.
position: >
  Subtheory of [multi-agent](../../_index.md) studying the
  substructure that lets one agent model another. Where
  multi-agent theory studies what happens when agents
  interact, theory-of-mind theory studies the *modeling
  capacity* — what agents represent about other agents'
  internals — that enables strategic interaction,
  cooperation, and communication. Connects to
  [interpretability](../../../interpretability/_index.md)
  (an external interpretability of one neural net by
  another) and to
  [agents](../../../agents/_index.md) (the mental-state
  vocabulary at issue).
---

The theory-of-mind theory gives formal structure to how agents represent other agents' mental states — and to the question of which agents have this capacity.
It answers four questions:

**What is theory-of-mind?** A capacity to attribute mental states (beliefs, desires, intentions, knowledge, emotions) to other agents and use these attributions to predict and explain behavior.
Distinct from *behavioral* prediction (predicting what an agent will do without modeling why).

**How do humans develop it?** Developmental psychology's canonical sequence: infants distinguish agents from objects (~6 months), young children attribute desires (~18 months), pass false-belief tasks (~4 years), and develop higher-order ToM (modeling what others believe about others' beliefs) into adolescence.
The [false-belief-task](concepts/false-belief-task.md) is the diagnostic standard.

**How does it relate to game-theoretic reasoning?** Strategic reasoning is recursive ToM: "I think you think I think...".
The [cognitive-hierarchy](concepts/cognitive-hierarchy.md) formalism (Camerer-Ho-Chong, Stahl-Wilson) bounds practical reasoning at finite depth.
Aumann's agreement theorem characterizes when common-knowledge constraints force agents to agree.

**Do LLMs have theory-of-mind?** Empirically contested.
Some studies (Kosinski 2023) report LLMs passing classical false-belief tasks; others (Ullman 2023) show they fail systematic perturbations.
Whether LLMs have robust ToM, exploit task surface features, or have something genuinely new is open.
See [do-llms-have-theory-of-mind](questions/do-llms-have-theory-of-mind.md).
