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
  ref1:
    title: "Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001"
defines:
  - "Possible World"
  - "possible worlds"
  - "world"
type: term
---

A possible world is a complete way things could be — a total state of affairs, specifying the truth value of every relevant proposition. The actual world is one possible world. A world where it rained yesterday in London but not in Paris is another. A world where the laws of physics are the same but Napoleon won at Waterloo is yet another. Possible worlds are the semantic foundation of modal logic: they give precise meaning to words like "necessarily," "possibly," "must," and "might."

The idea originates with Gottfried Wilhelm Leibniz, who argued in *Théodicée* (1710) that God chose the actual world from among infinitely many possible worlds — the "best of all possible worlds." For Leibniz, possible worlds were a theological and metaphysical device. It took two and a half centuries before Saul Aaron Kripke turned them into a mathematical tool. In "Semantical Considerations on Modal Logic" (1963), Kripke defined a formal semantics for modal logic using relational structures now called [Kripke frames](./kripke-frame.md): a set $W$ of worlds together with an [accessibility relation](./accessibility-relation.md) $R$ that specifies which worlds are "reachable" from which.

Formally, a possible world is an element $w \in W$ in a Kripke frame $(W, R)$. Each world carries a truth assignment: given a valuation $V: \mathrm{Prop} \to \mathcal{P}(W)$, the atomic propositions true at $w$ are exactly those $p$ with $w \in V(p)$. Truth in modal logic is always truth *at a world*. The [modal operators](./modal-operator.md) then quantify over accessible worlds: [necessity](./necessity.md) $\Box\varphi$ holds at $w$ if $\varphi$ holds at every world $v$ accessible from $w$ (every $v$ with $wRv$); [possibility](./possibility.md) $\Diamond\varphi$ holds at $w$ if $\varphi$ holds at some such $v$.

What a "world" means depends on the application. In epistemic logic, a world represents a state of knowledge — the accessible worlds are those the agent cannot distinguish from the actual situation. In temporal logic, each world is a moment in time, and accessibility is the future relation. In deontic logic, accessible worlds are those in which all obligations are fulfilled. The formalism is the same in every case; only the intended reading of $W$ and $R$ changes.

David Kellogg Lewis took possible worlds further than most are willing to go. In *On the Plurality of Worlds* (1986), he defended modal realism: possible worlds are not mere fictions or formal devices but concrete, spatiotemporally isolated realities as real as the actual world. Most philosophers reject this view, but it illustrates how seriously the concept must be taken — whether possible worlds are real or merely useful, they are indispensable for making modal reasoning precise.

In the algebraic semantics of modal logic, worlds correspond to ultrafilters of the modal algebra. For a [Heyting algebra](./heyting-algebra.md) $H$, the prime filters form the points of its spectrum, and truth at a world corresponds to membership in the associated prime filter.

## Additional material from the Google Drive library

Let $\mathcal{F} = (W, R)$ be a [Kripke frame](./kripke-frame.md).

**Definition.** A *possible world* (or simply *world*) is an element $w \in W$. Each world determines a truth assignment: given a valuation $V \colon \mathrm{Prop} \to \mathcal{P}(W)$, the set $\{p : w \in V(p)\}$ is the collection of atomic propositions true at $w$.

In the semantics of modal logic, truth is relative to a world. The [modal operators](./modal-operator.md) quantify over worlds linked by the [accessibility relation](./accessibility-relation.md) $R$: [necessity](./necessity.md) $\Box\varphi$ holds at $w$ iff $\varphi$ holds at every $v$ with $wRv$; [possibility](./possibility.md) $\Diamond\varphi$ holds at $w$ iff $\varphi$ holds at some such $v$.

**Proposition.** *Each world $w \in W$ induces a Boolean algebra homomorphism $\mathrm{ev}_w \colon \mathcal{P}(W) \to \{0, 1\}$ defined by $\mathrm{ev}_w(S) = 1$ iff $w \in S$. These homomorphisms separate points: $w \neq v$ iff there exists $S \subseteq W$ with $\mathrm{ev}_w(S) \neq \mathrm{ev}_v(S)$.*

*Proof sketch.* $\mathrm{ev}_w$ is a characteristic function and hence preserves $\cap$, $\cup$, and complementation. For separation, take $S = \{w\}$. $\square$

**Proposition (Algebraic counterpart).** *In the algebraic semantics of modal logic, worlds correspond to ultrafilters (equivalently, prime filters) of the modal algebra. For a [Heyting algebra](./heyting-algebra.md) $H$, the prime filters of $H$ form the points of its spectrum, and truth at a world $w$ corresponds to membership in the prime filter associated with $w$.*

**Examples.**

- In epistemic logic, a world $w$ represents a state of knowledge; the set $\{v : wRv\}$ contains all states the agent considers compatible with $w$.
- In temporal logic, each world is a moment in time, and $wRv$ means $v$ is in the future of $w$.
- In a finite [Kripke frame](./kripke-frame.md) $(W, R)$ with $|W| = n$, there are $2^n$ possible valuations on a single propositional variable, giving $2^n$ distinct [Kripke models](./kripke-model.md) for one atom.
