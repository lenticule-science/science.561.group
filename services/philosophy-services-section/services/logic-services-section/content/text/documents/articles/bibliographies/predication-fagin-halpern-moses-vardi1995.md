---
type: reference
authors: [Fagin, Ronald, Halpern, Joseph Y., Moses, Yoram, Vardi, Moshe Y.]
year: 1995
title: "Reasoning About Knowledge"
venue: "MIT Press"
description: R.
---

## Full citation

R. Fagin, J. Y. Halpern, Y. Moses, M. Y. Vardi. *Reasoning About Knowledge*. MIT Press, Cambridge, MA, 1995.

## Status

Pending direct access. Standard textbook in the field; key claims sourced from secondary literature and the authors' related papers.

## Annotation

The standard textbook on **multi-agent epistemic logic**. Develops the semantics of knowledge for multiple agents via Kripke structures with per-agent indistinguishability relations; characterizes the modal axioms (K, T, 4, 5 for S5; K45 for belief; common-knowledge axioms) and their soundness/completeness properties; develops the dynamic and runs-and-systems frameworks for knowledge changing over time; relates knowledge to action, agreement, common knowledge, distributed knowledge, communication.

For the corpus, this is the canonical standard against which any paraconsistent-multi-agent-epistemic-logic work in the corpus must situate itself — the reference for **Direction 4 (paraconsistent multi-agent epistemic logic)** of the agentic-swarm-theory study plan. Specifically:

- Their **Kripke structures with per-agent indistinguishability** are the standard setting; the corpus's [multi-agent epistemic settling example](../research/2026/07/31/lenticule-import/examples/multi-agent-epistemic-settling.md) and [benchmark 5: epistemic Kripke frame](../notes/undated/benchmark-5-epistemic-kripke.md) instantiate this setting in the corpus's bilattice-valued framework.
- Their **soundness/completeness for S5 multi-agent**: $\Box_a \phi \to \phi$ (T), $\Box_a \phi \to \Box_a \Box_a \phi$ (4), $\neg \Box_a \phi \to \Box_a \neg \Box_a \phi$ (5). The corpus's natural extension is to bilattice-valued K-axioms — soundness/completeness with respect to a class of paraconsistent multi-agent Kripke frames, with the strong-MLD orbit-type machinery as the classification of refined epistemic equivalence. *Stating and proving this is the headline novel theorem of Direction 4*; it has not been done.
- Their **distributed knowledge** $D_G \phi$ (the group $G$ jointly knows $\phi$ via pooled per-agent knowledge): the corpus's [multi-observer disagreement benchmark](../notes/undated/benchmark-multi-observer-disagreement.md) and [bilattice network-sheaf consensus theorem](../research/2026/07/31/lenticule-import/theorems/bilattice-network-sheaf-consensus.md)'s d-frame consensus are the corpus's analog. The bilattice extension distinguishes positively-pooled knowledge ($\mathbf t$) from positively-pooled negation ($\mathbf f$) from disagreement ($\top$) from absence ($\bot$); the classical FHMV setting collapses these to a binary "$\phi$ holds in all $D_G$-indistinguishable worlds" or not.
- Their **common knowledge** $C_G \phi$ (everyone knows that everyone knows … $\phi$ ad infinitum): captured cohomologically in the corpus by the *higher-degree cohomology* of the multi-agent network sheaf. The relationship — common knowledge as a higher-cohomology invariant — would be a substantive bridge result; not in the corpus.

The paraconsistent / dynamic epistemic extensions (Baltag–Moss–Solecki) build on this textbook; the corpus would engage them via Direction 4's literature review.

## Where used

- [Toward agentic swarm theory narrative](../notes/undated/toward-agentic-swarm-theory.md) — Direction 4 literature reference; also generally the standard reference for the multi-agent epistemic side of the program.
- [Multi-agent epistemic settling example](../research/2026/07/31/lenticule-import/examples/multi-agent-epistemic-settling.md) — instantiates FHMV's Kripke setting in the corpus.
- [Benchmark 5: epistemic Kripke frame example](../notes/undated/benchmark-5-epistemic-kripke.md) — concrete worked instance of FHMV-style multi-agent knowledge with paraconsistent witness.
