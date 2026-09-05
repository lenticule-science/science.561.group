---
name: "Fragment"
aliases:
  - "fragment"
  - "fragments"
date-created: 2025-12-31
tags: []
---

A fragment is a finitely generated modal-temporal [Heyting](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/arend-heyting.md) subalgebra of the semantic domain H.

Concretely, a fragment F ⊆ H is the smallest subset of H that contains some finite seed set S and is closed under all the structure of the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe: meets (∧), joins (∨), implication (⇒), top (⊤), bottom (⊥), the [modality](./modality.md) j, and the [trace comonad](./trace-comonad.md) G. Starting from finitely many elements and closing under all operations produces a fragment — a self-contained local reasoning context.

Fragments formalize the idea that reasoning is always local. No agent operates on the entire [Heyting algebra](../../../../concepts/heyting-algebra/index.md) at once. Instead, each context of inquiry — a proof, a measurement, a design decision — generates a fragment from the finite set of distinctions it actually uses. The fragment contains everything those distinctions entail under the algebra's operations, but nothing more.

This locality is what makes [fragment-preserving](./fragment-preserving.md) operations meaningful: an operation that respects fragments does not drag in commitments from outside the current reasoning context. It is also what makes [fusion](./fusion.md) possible — two syntactic operators can be identified when they agree on all fragments, because fragmentwise agreement is the strongest operational equality available.

The set of all fragments F(H) is directed under inclusion and covers H: every element of H belongs to some fragment. This makes fragments the compactness tool of the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe, playing a role analogous to compact opens in topology or finitely presentable objects in [category theory](../../../categories/index.md).

## Concrete realization

In the ASR, a fragment corresponds to a bounded interpretive context: a directory with its own vocabulary, methodological commitments, and reasoning style. A per-directory agent instruction file (AGENTS.md) is the concrete marker of a fragment boundary — it declares which distinctions are active in this part of the repository and how they close under the operations that matter locally.

This correspondence is not metaphorical. A discipline module's AGENTS.md defines a finite seed set (the central terms and interpretive commitments of that discipline) and asks agents to reason within the closure of that seed. The fragment-preserving property translates directly: an agent working within one discipline's fragment should not drag in commitments from outside that interpretive context unless the reasoning requires it.

The concept connects to several convergent ideas in adjacent fields. Lotman's semiosphere describes cultural spaces as bounded regions where signs interact and meaning is generated through relationships and boundaries. In domain-driven design, a bounded context is a modular region owning its own data and language, able to evolve independently. The fragment is the mathematical structure that unifies these: a finitely generated, locally closed, compositional unit of meaning.


---

<!-- source: archive/domains/universes/semiotic-universe/terms/fragment.md -->

## Imported source: archive/domains/universes/semiotic-universe/terms/fragment.md

---
title: "Fragment"
aliases:
  - "fragment"
  - "fragments"
date-created: 2025-12-31
type: term
tags: []
defines:
  - "Fragment"
  - "fragments"
---

A fragment is a finitely generated modal-temporal [Heyting](../../../../../general/people/arend-heyting.md) subalgebra of the semantic domain H.

Concretely, a fragment F ⊆ H is the smallest subset of H that contains some finite seed set S and is closed under all the structure of the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe: meets (∧), joins (∨), implication (⇒), top (⊤), bottom (⊥), the [modality](./modality.md) j, and the [trace comonad](./trace-comonad.md) G. Starting from finitely many elements and closing under all operations produces a fragment — a self-contained local reasoning context.

Fragments formalize the idea that reasoning is always local. No agent operates on the entire [Heyting algebra](../../../../concepts/heyting-algebra/index.md) at once. Instead, each context of inquiry — a proof, a measurement, a design decision — generates a fragment from the finite set of distinctions it actually uses. The fragment contains everything those distinctions entail under the algebra's operations, but nothing more.

This locality is what makes [fragment-preserving](./fragment-preserving.md) operations meaningful: an operation that respects fragments does not drag in commitments from outside the current reasoning context. It is also what makes [fusion](./fusion.md) possible — two syntactic operators can be identified when they agree on all fragments, because fragmentwise agreement is the strongest operational equality available.

The set of all fragments F(H) is directed under inclusion and covers H: every element of H belongs to some fragment. This makes fragments the compactness tool of the [semiotic](../../../../../linguistics/topics/semiotics/index.md) universe, playing a role analogous to compact opens in topology or finitely presentable objects in [category theory](../../../categories/index.md).

## Concrete realization

In the ASR, a fragment corresponds to a bounded interpretive context: a directory with its own vocabulary, methodological commitments, and reasoning style. A per-directory agent instruction file (AGENTS.md) is the concrete marker of a fragment boundary — it declares which distinctions are active in this part of the repository and how they close under the operations that matter locally.

This correspondence is not metaphorical. A discipline module's AGENTS.md defines a finite seed set (the central terms and interpretive commitments of that discipline) and asks agents to reason within the closure of that seed. The fragment-preserving property translates directly: an agent working within one discipline's fragment should not drag in commitments from outside that interpretive context unless the reasoning requires it.

The concept connects to several convergent ideas in adjacent fields. Lotman's semiosphere describes cultural spaces as bounded regions where signs interact and meaning is generated through relationships and boundaries. In domain-driven design, a bounded context is a modular region owning its own data and language, able to evolve independently. The fragment is the mathematical structure that unifies these: a finitely generated, locally closed, compositional unit of meaning.
