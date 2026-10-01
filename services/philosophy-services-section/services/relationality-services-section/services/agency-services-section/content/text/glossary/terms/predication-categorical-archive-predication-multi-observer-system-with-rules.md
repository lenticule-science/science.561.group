---
type: definition
class: extended-system
depends-on:
  - multi-observer-system
  - closure-rule-system
  - knowledge-presheaf-category
  - settling-morphism
see-also:
  - distributed-settling-system
  - crdt-convergence-with-per-observer-rules
name: Ruled multi-observer system
description: An extension of the multi-observer system carrying per-observer closure-rule data.
---


An extension of the [multi-observer system](../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) carrying per-observer closure-rule data. Where the base [multi-observer system](../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) treats each observer's settling as a black-box settled state, a *ruled* multi-observer system records *which closure rule system produced* each observer's settling — making explicit the inferential dynamics behind each observer's view.

## Definition

A **ruled multi-observer system** on a base $B = (\mathbf L, \mathcal C, E, \lambda)$ is a triple

$$(O,\ V,\ r)$$

where:

- $O$ is a small category (the **observer category**).
- $V : O \to \mathrm{Settlings}_B$ is a functor (the underlying [multi-observer system](../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md)).
- $r : \mathrm{ob}(O) \to \{\text{closure-rule systems on } B\}$ is a function assigning to each observer $o$ a [closure-rule system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/content/multi-observer-system/_archive/teaching/explanations/closure-rule-system.md) $r(o) = \mathcal S_o$.

**Compatibility.** For each $o \in O$, the settling $V(o)$ is the closure-driven settling produced by $\mathcal S_o$ from some initial increment sequence — i.e., $V(o) = \mathrm{cl}^{\mathcal S_o}(v_o^{(0)})$ for some initial state $v_o^{(0)}$.

For each morphism $\alpha : o_1 \to o_2$ in $O$, the [settling-morphism](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/content/multi-observer-system/morphisms/settling-morphism.md) $V(\alpha) : V(o_1) \to V(o_2)$ is required to be compatible with the rule systems: $V(\alpha)$ takes the closure-driven structure of $\mathcal S_{o_1}$ to that of $\mathcal S_{o_2}$ in the appropriate sense (typically, $V(\alpha)$ commutes with the closure operators in the slice, when both rule systems can be composed compatibly; for incompatible rule systems, the constraint reduces to settling-morphism on the underlying settled states, with the inferential layers tracked separately).

## What's new versus the unrullednrules version

The base [multi-observer system](../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) has a generic functor $V$ to settlings; nothing distinguishes "two observers with the same rule and different data" from "two observers with different rules and the same data." The ruled version makes this distinction first-class. Three structural sub-cases:

1. **Same rule, different initial states.** All $\mathcal S_o$ equal; $v_o^{(0)}$ vary. Recovers the [distributed settling system](../../documents/articles/notes/undated/distributed-settling-system.md) up to indexing.

2. **Different rules, different initial states.** Both vary. Most general case; observers may produce settlings in different closure-ordinal regimes.

3. **Different rules, same initial state.** This is the genuinely new case the ruled extension surfaces: observers with identical evidence may produce different settlings because their *inferential commitments differ*. The disagreement here is at the inferential layer rather than the evidence layer — distinct from the [multi-observer disagreement benchmark](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/benchmark-multi-observer-disagreement.md), which is at the evidence layer.

## Why the extension matters

The unruled multi-observer system handles "agents with different views" but compresses "different views due to different evidence" with "different views due to different inferential rules." For applications to multi-agent reasoning systems where agents share evidence but apply distinct rule systems (multi-context systems, distributed reasoners, paraconsistent argumentation frameworks), the inferential-layer distinction is load-bearing.

The ruled extension is also the substrate for the [CRDT convergence with per-observer rules theorem](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/crdt-convergence-with-per-observer-rules.md), which establishes that the corpus's CRDT machinery extends to per-observer-rule systems without requiring rule-system agreement.

## Specializations

For $O$ discrete (no non-identity morphisms): the ruled multi-observer system is just a family $\{(V(o), \mathcal S_o)\}_{o \in O}$ of independently-evolving (settling, rule-system) pairs. This is the most-general "agents with potentially-distinct rules" case.

For $O$ a graph (incidence poset): a ruled multi-observer system on the agent graph carries per-agent rule data plus per-channel "compatibility morphisms" between adjacent agents' rule systems. The [network-sheaf consensus on agent graphs theorem](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/knowledge-presheaf-category/content/multi-observer-system/theorems/network-sheaf-consensus-on-agent-graphs.md) lifts to this setting; the per-agent rules give richer disagreement-via-inference structure beyond the unruled version's disagreement-via-evidence content.

For $O$ a group action (apparatus group, per the [multi-observer system narrative](../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md)): each $g \in G$ may have its own rule system, recording how the apparatus's operating mode determines the inferential rules.

## Position in the program

The ruled extension is a load-bearing piece of the [agentic-swarm-theory study plan](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/toward-agentic-swarm-theory.md) — task 5, per-agent closure dynamics. It is the foundational object for any multi-agent setting where agents have distinct inferential commitments, including:

- Multi-context systems in distributed reasoning (Brewka–Eiter style).
- Paraconsistent multi-agent epistemic logic where agents apply different K-axioms.
- Argumentation frameworks where agents reason with distinct argument-acceptance semantics.
- Bilattice-valued opinion dynamics where agents have different inference patterns over shared data.

The accompanying theorem [CRDT convergence with per-observer rules](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/crdt-convergence-with-per-observer-rules.md) shows the CRDT structure is preserved by the extension; further theorems would extend the corpus's other settling theorems (regime classification, strong-MLD, etc.) to the ruled setting.
