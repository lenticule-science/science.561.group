---
type: concept
class: coordination
status: sketch
depends-on: [dispatch, scope, predication-graph-store, engelmore-morgan1988]
see-also: [agent, skill, inbox]
title: Blackboard as substrate projection
description: "The platform's reformulation of the blackboard system architecture (Engelmore–Morgan (1988)): a blackboard system is structurally a projection of the substrate where the predication-graph store plays the blackboard's role, agents play the…"
---

# Blackboard as substrate projection

The platform's reformulation of the *blackboard system* architecture ([Engelmore–Morgan (1988)](engelmore-morgan1988/engelmore-morgan1988.md)): a blackboard system is structurally a projection of the substrate where the predication-graph store plays the blackboard's role, agents play the role of knowledge sources, dispatch plays the role of the control component, and the substrate's scope hierarchy plays the role of the blackboard's partition / level structure.

The classical view: a blackboard system has a hierarchical, partitioned shared data structure (the blackboard) on which independent knowledge sources (KSes) post evidence, hypotheses, and partial solutions.
Each KS monitors the blackboard for trigger conditions; when triggered, it contributes to the blackboard at a (possibly different) level.
A control component arbitrates between simultaneously-eligible KSes by priority, focus-of-attention heuristics, or explicit control rules.
Solutions emerge opportunistically from KS interactions through the blackboard's structure.

The platform's reformulation: the substrate's [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) carries everything the blackboard would carry; agents play the KS role; dispatch plays the control-component role.

- **Blackboard partitions / levels** ↔ substrate [scope](../../scope/scope.md)s.
  The blackboard's hierarchical partitioning into levels (raw data, hypotheses, intermediate solutions, final solutions) is structurally a scope hierarchy: raw-data scope, hypothesis scope, intermediate-solution scope, final-solution scope, with predications visible up the hierarchy via the substrate's [extend-restrict-adjoint](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md) discipline.
- **Knowledge sources** ↔ [agents](agent.md) carrying [skills](skill.md).
  A KS that maps evidence at one level to hypotheses at another is an agent whose skill's preconditions match predications at the evidence scope and whose postconditions admit predications at the hypothesis scope.
- **Trigger conditions** ↔ skill preconditions.
  The KS-monitoring loop is the platform's [dispatch](dispatch.md)'s eligible-set computation.
- **Control component** ↔ dispatch's match-strength ranking and selection.
  The blackboard's focus-of-attention heuristics become inputs to dispatch ranking, with the heuristics themselves substrate content (per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md)) editable as predications.
- **Opportunistic contribution** ↔ the platform's [tick](tick.md) discipline.
  An agent contributes when dispatch matches its skills against current substrate state; agents do not run on a pre-determined schedule.

Three engineering consequences:

- **Blackboard structure is editable as substrate content.** A classical blackboard system has its partition / level structure baked into the implementation; reorganizing the blackboard requires recompilation.
  The platform's scope hierarchy is substrate content; reorganizing the "blackboard" structure is editing predications.
- **Multi-blackboard federation falls out of substrate federation.** A classical multi-blackboard system needs a separate inter-blackboard messaging discipline.
  The platform inherits federation-as-substrate-join: multiple substrates federating produce a single combined "blackboard" through the substrate's normal merge.
- **KS conflicts surface as substrate $\top$.** When two KSes contribute incompatible hypotheses to the same blackboard slot in a classical system, the blackboard either accepts the latest, raises an alert, or invokes a conflict-resolution KS.
  The platform's substrate-level analog: contested predications become $\top$ in the four-valued domain, surfacing the conflict as substrate content that subsequent agents can act on without losing either contribution.

The concept is *sketch* status: it names the relationship so the [upstream-classical-mas](../../upstream-classical-mas/upstream-classical-mas.md) narrative has an atomized referent.
A theorem-level statement — that any blackboard system implementing the BB1 / GBB control discipline can be embedded as a sub-region of a substrate with a corresponding scope hierarchy and dispatch ranking — is left for follow-up work.
