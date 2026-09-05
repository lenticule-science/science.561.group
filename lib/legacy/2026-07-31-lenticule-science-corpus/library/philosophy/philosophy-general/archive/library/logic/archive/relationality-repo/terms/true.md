---
title: "True"
defines: "true"
aliases: [truth]
description: "The semantic property a sentence, proposition, or judgment has when what it claims to be the case is the case — the affirmative of the two values in classical logic and a contested subject in non-classical and philosophical accounts."
instance-of: truth-value
contrasts-with: "false"
predicate-of: proposition
date-created: 2026-04-27
references:
  - id: aristotle-metaphysics
    type: document
    title: Metaphysics
    note: Book IV (Γ), 1011b — to say of what is that it is, and of what is not that it is not, is true
    author:
      - literal: Aristotle
  - id: tarski1944
    type: document
    title: The Semantic Conception of Truth and the Foundations of Semantics
    author:
      - literal: Alfred Tarski
    container-title: Philosophy and Phenomenological Research 4(3)
    issued:
      - year: 1944
  - id: ramsey1927
    type: document
    title: Facts and Propositions
    author:
      - literal: Frank Ramsey
    container-title: Proceedings of the Aristotelian Society, Supplementary Volume 7
    issued:
      - year: 1927
  - id: bradley1893
    type: document
    title: Appearance and Reality
    author:
      - literal: F. H. Bradley
    container-title: Swan Sonnenschein
    issued:
      - year: 1893
  - id: james1907
    type: document
    title: Pragmatism: A New Name for Some Old Ways of Thinking
    author:
      - literal: William James
    container-title: Longmans, Green
    issued:
      - year: 1907
  - id: brouwer1908
    type: document
    title: The Unreliability of the Logical Principles
    note: rejection of the law of excluded middle, foundation of intuitionist logic
    author:
      - literal: L. E. J. Brouwer
    issued:
      - year: 1908
  - id: belnap1977
    type: document
    title: A Useful Four-Valued Logic
    author:
      - literal: Nuel Belnap
    container-title: in Modern Uses of Multiple-Valued Logic, ed. Dunn & Epstein, Reidel
    issued:
      - year: 1977
---

**True** is the semantic property a [proposition](../../../../../../humanities/theories/math/theories/logic/terms/proposition.md) has when what it claims to be the case is the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is, and of what is not that it is not, is true" — remains the touchstone: truth is a relation between what is claimed and what is so. The proposition "snow is white" is true when snow is white. The disagreements among the major theories of truth concern not this minimal claim but what the relation amounts to, what its bearers are, and whether it admits of degrees, gaps, or gluts.

## The major theories

**Correspondence.** Truth is a relation of agreement between a proposition and a fact, state of affairs, or feature of the world. Aristotle is the classical source; Bertrand Russell and the early Wittgenstein refined it; Alfred Tarski's 1944 semantic conception gave it a formal expression in the *T-schema*: for every sentence *p* of the object language, "*p*" is true if and only if *p*. The schema makes the relation explicit without requiring a metaphysics of facts. A correspondence theory is committed at minimum to truth being something propositions have *because of how the world is*, not because of how speakers, communities, or systems treat them.

**Coherence.** F. H. Bradley (1893) and the British idealists held that truth is constituted by the systematic coherence of a proposition with the rest of an inquirer's or community's beliefs. Where correspondence theories ground truth in a relation to the world, coherence theories ground it in a relation among propositions. The objection most often raised is that two equally coherent but mutually inconsistent systems cannot both be true, but coherentists reply that genuine coherence is more demanding than internal consistency and ultimately picks out a unique system.

**Pragmatist.** William James (1907) and the pragmatist tradition (Peirce, Dewey) take truth to be the property a belief has when acting on it leads, over time and across cases, to the consequences the belief implicitly promises. Truth is what survives inquiry; it is what is *useful in the long run*. The pragmatist account is often misread as relativizing truth to immediate convenience; the considered position is that truth is the eventual convergence of inquiry under the pressure of experience.

**Deflationary.** Frank Ramsey (1927) argued that "*p* is true" says nothing more than *p*: the truth predicate is a logical convenience for endorsing claims without naming them. Subsequent deflationary accounts (Quine, Horwich) treat the T-schema as exhausting what there is to say about truth — there is no further property the predicate names. The price of the position is that it is hard to explain why truth-talk is so generative, but its proponents take that generativity as exactly what the T-schema accommodates.

**Constructive (intuitionist).** L. E. J. Brouwer (1908) rejected the law of excluded middle: it is not the case that every proposition is either true or false. A mathematical proposition is true only when one has a constructive proof of it; one is false only when one has a constructive proof of its negation; many propositions are neither, and remain so until proof is found. This produces a logic in which truth is not a static property of propositions but a record of what has been established.

## Bivalence and its rejections

Classical logic assumes *bivalence*: every proposition is either true or false, and not both. Three families of non-classical logic depart from this:

- **Many-valued logics** (Łukasiewicz, Kleene) admit values beyond true and false — a third value for *undetermined*, or values along a continuum.
- **Paraconsistent logics** (da Costa, Priest) admit propositions that are both true and false without exploding into triviality, on the grounds that genuine contradictions can sometimes be cogently asserted (in legal systems, in inconsistent databases, at the limits of self-reference).
- **Bilattice logics** (Belnap 1977) make explicit the two-dimensional structure required when an agent may have evidence both for and against a proposition: alongside the truth ordering (false < true), a knowledge ordering (no information < contradictory information) gives four canonical values — neither, true-only, false-only, both.

Each of these rejections of bivalence is motivated by a class of cases the classical picture handles badly, not by skepticism about truth itself.

## Truth-bearers

A persistent question is what kind of thing is true: the *sentence* (a string of words in a language), the *statement* (an assertion of a sentence in a context), the *proposition* (the abstract content shared across translations and paraphrases), the *belief* (the mental state of an inquirer), or the *judgment* (the act of asserting). Different theories take different bearers as primary. The choice matters because some bearers (sentences) are language-bound while others (propositions) are not, and theories of truth that work for one may not transpose cleanly to another.

## See Also

- [false](false.md) — the contrasting truth-value
- [proposition](../../../../../../humanities/theories/math/theories/logic/terms/proposition.md) — the standard truth-bearer
- [bivalence](../../western/theories/logic/theories/classical/terms/bivalence.md) — the assumption that every proposition is true or false
- tarski-schema — the formal *T*-schema
- [judgment](../../../../sociology/theories/work/theories/governance/terms/judgment.md) — the act in which truth is asserted
