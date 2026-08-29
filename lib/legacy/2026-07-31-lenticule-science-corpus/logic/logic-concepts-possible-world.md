---

title: "Possible World"
description: "A possible world is a complete way things could be — a total state of affairs, specifying the truth value of every relevant proposition. The actual world is one possible world. A world where it rained yesterday in London but not in Paris is another. A world where the laws of physics are the same but Napoleon won at Waterloo is yet another."
aliases:
  - "possible world"
  - "possible worlds"
  - "world"
date-created: 2025-12-26
tags: []
mathematical-object: kripke-frame
references:
  - id: ref1
    type: document
    title: Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001
defines:
  - "Possible World"
  - "possible worlds"
  - "world"
---

A possible world is a complete way things could be — a total state of affairs, specifying the truth value of every relevant proposition. The actual world is one possible world. A world where it rained yesterday in London but not in Paris is another. A world where the laws of physics are the same but Napoleon won at Waterloo is yet another. Possible worlds are the semantic foundation of modal logic: they give precise meaning to words like "necessarily," "possibly," "must," and "might."

The idea originates with Gottfried Wilhelm Leibniz, who argued in *Théodicée* (1710) that God chose the actual world from among infinitely many possible worlds — the "best of all possible worlds." For Leibniz, possible worlds were a theological and metaphysical device. It took two and a half centuries before Saul Aaron Kripke turned them into a mathematical tool. In "Semantical Considerations on Modal Logic" (1963), Kripke defined a formal semantics for modal logic using relational structures now called [Kripke frames](../objects/kripke-frame.md): a set $W$ of worlds together with an [accessibility relation](../morphisms/accessibility-relation.md) $R$ that specifies which worlds are "reachable" from which.

Formally, a possible world is an element $w \in W$ in a Kripke frame $(W, R)$. Each world carries a truth assignment: given a valuation $V: \mathrm{Prop} \to \mathcal{P}(W)$, the atomic propositions true at $w$ are exactly those $p$ with $w \in V(p)$. Truth in modal logic is always truth *at a world*. The [modal operators](../morphisms/modal-operator.md) then quantify over accessible worlds: [necessity](./necessity.md) $\Box\varphi$ holds at $w$ if $\varphi$ holds at every world $v$ accessible from $w$ (every $v$ with $wRv$); [possibility](./possibility.md) $\Diamond\varphi$ holds at $w$ if $\varphi$ holds at some such $v$.

What a "world" means depends on the application. In epistemic logic, a world represents a state of knowledge — the accessible worlds are those the agent cannot distinguish from the actual situation. In temporal logic, each world is a moment in time, and accessibility is the future relation. In deontic logic, accessible worlds are those in which all obligations are fulfilled. The formalism is the same in every case; only the intended reading of $W$ and $R$ changes.

David Kellogg Lewis took possible worlds further than most are willing to go. In *On the Plurality of Worlds* (1986), he defended modal realism: possible worlds are not mere fictions or formal devices but concrete, spatiotemporally isolated realities as real as the actual world. Most philosophers reject this view, but it illustrates how seriously the concept must be taken — whether possible worlds are real or merely useful, they are indispensable for making modal reasoning precise.

In the algebraic semantics of modal logic, worlds correspond to ultrafilters of the modal algebra. For a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md) $H$, the prime filters form the points of its spectrum, and truth at a world corresponds to membership in the associated prime filter.
