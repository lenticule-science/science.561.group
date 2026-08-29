---
title: "Possible World"
aliases:
  - "possible world"
  - "possible worlds"
  - "world"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: kripke-frame
references:
  - "Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001"
defines:
  - "Possible World"
  - "possible worlds"
  - "world"
---

Let $\mathcal{F} = (W, R)$ be a [Kripke frame](./kripke-frame.md).

**Definition.** A *possible world* (or simply *world*) is an element $w \in W$. Each world determines a truth assignment: given a valuation $V \colon \mathrm{Prop} \to \mathcal{P}(W)$, the set $\{p : w \in V(p)\}$ is the collection of atomic propositions true at $w$.

In the semantics of [modal logic](../index.md), truth is relative to a world. The [modal operators](./modal-operator.md) quantify over worlds linked by the [accessibility relation](./accessibility-relation.md) $R$: [necessity](./necessity.md) $\Box\varphi$ holds at $w$ iff $\varphi$ holds at every $v$ with $wRv$; [possibility](./possibility.md) $\Diamond\varphi$ holds at $w$ iff $\varphi$ holds at some such $v$.

**Proposition.** *Each world $w \in W$ induces a Boolean algebra homomorphism $\mathrm{ev}_w \colon \mathcal{P}(W) \to \{0, 1\}$ defined by $\mathrm{ev}_w(S) = 1$ iff $w \in S$. These homomorphisms separate points: $w \neq v$ iff there exists $S \subseteq W$ with $\mathrm{ev}_w(S) \neq \mathrm{ev}_v(S)$.*

*Proof sketch.* $\mathrm{ev}_w$ is a characteristic function and hence preserves $\cap$, $\cup$, and complementation. For separation, take $S = \{w\}$. $\square$

**Proposition (Algebraic counterpart).** *In the algebraic semantics of [modal logic](../index.md), worlds correspond to ultrafilters (equivalently, prime filters) of the modal algebra. For a [Heyting algebra](../../../concepts/heyting-algebra/index.md) $H$, the prime filters of $H$ form the points of its spectrum, and truth at a world $w$ corresponds to membership in the prime filter associated with $w$.*

**Examples.**

- In epistemic logic, a world $w$ represents a state of knowledge; the set $\{v : wRv\}$ contains all states the agent considers compatible with $w$.
- In temporal logic, each world is a moment in time, and $wRv$ means $v$ is in the future of $w$.
- In a finite [Kripke frame](./kripke-frame.md) $(W, R)$ with $|W| = n$, there are $2^n$ possible valuations on a single propositional variable, giving $2^n$ distinct [Kripke models](./kripke-model.md) for one atom.
