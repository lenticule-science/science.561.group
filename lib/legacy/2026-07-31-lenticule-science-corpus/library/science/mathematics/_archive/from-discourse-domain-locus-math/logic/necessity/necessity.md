---

title: "Necessity"
aliases:
  - "necessity"
  - "necessary"
  - "box"
date-created: 2025-12-26
tags: []
mathematical-object: heyting-algebra
references:
  - id: ref1
    type: document
    title: Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001
defines:
  - "Necessity"
  - "necessary"
  - "requires"
  - "box"
---

Necessity is the modality of what must be the case — what holds not just as things happen to be, but in every relevant way things could be. "2 + 2 = 4" is necessarily true: there is no [possible world](./possible-world.md) in which it fails. "It is raining in London" is contingently true (or false): it depends on circumstances that could have been otherwise. The concept of necessity, and its dual [possibility](./possibility.md), are the central subjects of modal logic.

Aristotle discussed necessity and contingency in *De Interpretatione*, most famously in the sea-battle problem: is it necessarily true or necessarily false *now* that there will be a sea battle tomorrow? Aristotle argued that future contingents are neither, raising questions about the scope of necessity that philosophers have debated ever since. The modern formal treatment begins with Clarence Irving Lewis, who introduced the strict conditional and the hierarchy of modal systems S1 through S5 in *Symbolic Logic* (1932, with Cooper Harold Langford). But Lewis's systems lacked a clear semantics — you could prove things in them without knowing exactly what the symbols meant. Saul Aaron Kripke provided that semantics in 1963.

In a [Kripke model](../objects/kripke-model.md) $(W, R, V)$, necessity has a precise definition: $\Box\varphi$ (read "necessarily $\varphi$") holds at a world $w$ if and only if $\varphi$ holds at every world accessible from $w$:

$$M, w \models \Box\varphi \quad \text{iff} \quad \forall v\,(wRv \Rightarrow M, v \models \varphi).$$

The [accessibility relation](../morphisms/accessibility-relation.md) $R$ determines what "every relevant alternative" means. If $R$ is reflexive, then $\Box\varphi \to \varphi$ holds (the T axiom): if something is necessary, it is actually true, because the current world is among the accessible ones. In the system S5, where $R$ is an equivalence relation, $\Box\varphi$ holds at $w$ if and only if $\varphi$ holds throughout $w$'s entire equivalence class — necessity is absolute within each cluster of worlds.

Necessity and possibility are duals: $\Box\varphi = \neg\Diamond\neg\varphi$. A proposition is necessary if and only if its negation is not possible. This duality mirrors the relationship between universal and existential quantification — $\Box$ is "for all accessible worlds" and $\Diamond$ is "there exists an accessible world."

In the algebraic setting, necessity corresponds to a [closure operator](../../teaching/explanations/closure-operator/index.md) $j: H \to H$ on a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) $H$ (extensive, monotone, and idempotent). A [proposition](proposition.md) $a$ is necessary when $j(a) = a$ — it is already $j$-closed and necessitation adds nothing to it. The set of necessary elements $H^j = \{a \in H : j(a) = a\}$ is closed under conjunction and contains $\top$. When $j$ is a nucleus (meaning $j(a \wedge b) = j(a) \wedge j(b)$), the necessary elements themselves form a Heyting algebra with implication $a \Rightarrow_j b = j(a \to b)$.

This algebraic perspective connects modal logic to topology. On the open-set lattice $\mathcal{O}(X)$ of a topological space, a Lawvere-Tierney topology $j$ defines a nontrivial [modal system](../objects/modal-system.md) on the [subobject classifier](../../topology/objects/subobject-classifier.md) — the necessity operator becomes a topological closure operation, and the necessary propositions are those that survive closure.
