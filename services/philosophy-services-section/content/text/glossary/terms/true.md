---
title: "True"
defines: "true"
aliases: [ truth, affirmation, relational-affirmation, "true" ]
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
    title: "Pragmatism: A New Name for Some Old Ways of Thinking"
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
arises-from: reflexivity
derives-from: reflexivity
type: "[derivation](derivation)"
derivative-stabilized-on: "[../../Relationality/triage/00-probably-redundant/20250502-relational-notes/meta/cal/2025/2025-04/2025-04-27](../../Relationality/triage/00-probably-redundant/20250502-relational-notes/meta/cal/2025/2025-04/2025-04-27)"
---

**True** is the semantic property a [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) has when what it claims to be the case is the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is, and of what is not that it is not, is true" — remains the touchstone: truth is a relation between what is claimed and what is so. The proposition "snow is white" is true when snow is white. The disagreements among the major theories of truth concern not this minimal claim but what the relation amounts to, what its bearers are, and whether it admits of degrees, gaps, or gluts.

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
- [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) — the standard truth-bearer
- [bivalence](bivalence.md) — the assumption that every proposition is true or false
- tarski-schema — the formal *T*-schema
- [judgment](../../../../../social-science-services-section/content/text/glossary/terms/judgment.md) — the act in which truth is asserted


---

<!-- source: archive/library/logic/terms/true.md -->

## Imported source: archive/library/logic/terms/true.md

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

**True** is the semantic property a [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) has when what it claims to be the case is the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is, and of what is not that it is not, is true" — remains the touchstone: truth is a relation between what is claimed and what is so. The proposition "snow is white" is true when snow is white. The disagreements among the major theories of truth concern not this minimal claim but what the relation amounts to, what its bearers are, and whether it admits of degrees, gaps, or gluts.

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
- [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) — the standard truth-bearer
- [bivalence](bivalence.md) — the assumption that every proposition is true or false
- tarski-schema — the formal *T*-schema
- [judgment](../../../../../social-science-services-section/content/text/glossary/terms/judgment.md) — the act in which truth is asserted


---

<!-- source: archive/library/relationality/archive/relationality-repo/terms/true.md -->

## Imported source: archive/library/relationality/archive/relationality-repo/terms/true.md

---
title: "True"
description: "The positive truth-axis position of a determined claim — the affirmation that follows from a reflexive derivation stabilizing a relation. Not the property of a substance-state matching a fact, but the positive presence of a relation under iteration."
defines:
  - true
aliases:
  - affirmation
  - relational-affirmation
contrasts-with: ["false"]
arises-from: reflexivity
related:
  - false
  - absurd
  - determination
  - settlement
  - relating
  - "true (logic)"
date-created: 2026-04-27
date-modified: 2026-04-28
---

Under the [relationality](../_index.md) commitment — that things exist through acts of relating, not as substances bearing properties — **true** cannot mean what it means in a correspondence theory of truth. There is no substance whose state of affairs a proposition is to match. *True* must be reformulated as a position on the truth axis of [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md): the positive case in which a relation has been *affirmed* by the witnessing structure. *True* names what a [determined](determination.md) claim looks like when its determination tilts toward presence rather than absence.

In relationality, a relation does not pre-exist as a static link between independent terms; it is constituted by the act of [relating](relating.md), and stabilizes through reflexive iteration. The minimal positive case — one reflexive act that composes a first presence of relation — is the relationality reading of *true*: the affirmation that follows from a derivation that has gone once. *True* is not a verdict imposed on a relation from outside; it is what the reflexive act produces when it goes through.

## True as positive derivational presence

A claim is true when its asserted relation has been derivationally affirmed. Affirmation is not assent (a propositional attitude an agent takes toward a sentence) but *presence* — the relation, having been reflexively iterated, is now part of what is. In a substance-relational ontology, truth would be the matching of an internal representation to an external state; here it is the settlement of a relation into the system of relations.

This makes the relationality reading of *true* close to what process and constructive traditions call *truth-as-establishment* (Brouwer's intuitionist reading: a proposition is true when one has a constructive proof of it) but with a different ontology underneath. In intuitionism the substrate is mathematical and the proof is what establishes; in relationality the substrate is relations and the reflexive act is what establishes. Both reject the idea that truth is a property a proposition has independently of the inquirer's act.

## True on the truth axis

True is one position on one of the two axes that compose the four-cornered [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md). The truth axis runs from [false](false.md) (denial) at one extreme to true (affirmation) at the other, with intermediate positions where a claim has not yet tilted to either extreme. The truth axis is *independent* of the knowledge axis (which runs from [absurd](absurd.md) to [determination](determination.md)) — a claim can be true and absurd (affirmed but un-witnessed by other claims; *axiomatically* true), true and determined (affirmed and structurally witnessed; *settled* true), or anywhere in between.

The four extremal corners of the joint structure — true-only (true and determined toward affirmation), false-only (false and determined toward denial), both (determined with evidence in both directions), neither (absurd, neither affirmed nor denied) — are the four positions a claim can reach. True-only is the corner the classical correspondence theory of truth recognizes; the other three are positions classical bivalence collapses or refuses, and which relationality treats as positive structural data.

## Distinction from logical *true*

The relationality reading is not the same as the [classical truth-value](../../logic/terms/true.md) of bivalent logic, even when the two coincide in the well-behaved cases. Three differences are structural:

- *Bivalence is not assumed.* A relation may be neither affirmed nor denied without that being a defect. The classical commitment that every proposition takes one of two values is replaced by the four-cornered structure.
- *Truth is positional, not propositional.* Because identity is constituted by relations, the truth of a claim is the position the asserted relation occupies in the graph of relations — not a verdict on a free-floating proposition.
- *Truth is achieved, not discovered.* The reflexive act is what produces the affirmation. There is no antecedent fact about whether the relation is true that the act tracks; the act constitutes the affirmation.

## Distinction from mere belief

A relationality reading of truth is not a relativist or subjectivist reading. The reflexive act that produces affirmation is not "agent X decides the relation holds"; it is the structured derivational move that stabilizes the relation under continued iteration. Two agents who perform the reflexive act on the same relation arrive at the same affirmation — not because their beliefs converged but because the act has the structure it has. The relationality commitment relativizes the ontology (no substances), not the standard for affirmation.

## True and the math layer

Mathematically, *true* corresponds to the truth-order top $\mathbf{t}$ in the [predication fiber algebra](../../../../math/theories/voidmath/terms/predication-fiber-algebra.md). A claim's settlement value at a [predication cell](../../../../math/theories/voidmath/terms/predication-cell.md) sits somewhere in the bilattice; its truth-axis position is the projection onto the truth order, with $\mathbf{t}$ as the affirming pole. The fact that the truth axis is one of two independent orders, rather than the unique axis of bivalent logic, is what gives the four-cornered structure its room.

## See also

- [False](false.md) — the corresponding negation pole on the truth axis.
- [Absurd](absurd.md) — the un-witnessed mode on the knowledge axis; orthogonal to true.
- [Determination](determination.md) — the witnessed mode on the knowledge axis; the structural pair to absurd.
- [Settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md) — the joint four-cornered structure.
- [Relating](relating.md) — the reflexive act that produces affirmation.
- [True (logic)](../../logic/terms/true.md) — the classical bivalent truth-value.
- [Predication fiber algebra](../../../../math/theories/voidmath/terms/predication-fiber-algebra.md) — the math articulation.


---

<!-- source: archive/library/relationality/terms/true.md -->

## Imported source: archive/library/relationality/terms/true.md

---
title: "True"
description: "The positive truth-axis position of a determined claim — the affirmation that follows from a reflexive derivation stabilizing a relation. Not the property of a substance-state matching a fact, but the positive presence of a relation under iteration."
defines:
  - true
aliases:
  - affirmation
  - relational-affirmation
contrasts-with: ["false"]
arises-from: reflexivity
related:
  - false
  - absurd
  - determination
  - settlement
  - relating
  - "true (logic)"
date-created: 2026-04-27
date-modified: 2026-04-28
---

Under the [relationality](../_index.md) commitment — that things exist through acts of relating, not as substances bearing properties — **true** cannot mean what it means in a correspondence theory of truth. There is no substance whose state of affairs a proposition is to match. *True* must be reformulated as a position on the truth axis of [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md): the positive case in which a relation has been *affirmed* by the witnessing structure. *True* names what a [determined](determination.md) claim looks like when its determination tilts toward presence rather than absence.

In relationality, a relation does not pre-exist as a static link between independent terms; it is constituted by the act of [relating](relating.md), and stabilizes through reflexive iteration. The minimal positive case — one reflexive act that composes a first presence of relation — is the relationality reading of *true*: the affirmation that follows from a derivation that has gone once. *True* is not a verdict imposed on a relation from outside; it is what the reflexive act produces when it goes through.

## True as positive derivational presence

A claim is true when its asserted relation has been derivationally affirmed. Affirmation is not assent (a propositional attitude an agent takes toward a sentence) but *presence* — the relation, having been reflexively iterated, is now part of what is. In a substance-relational ontology, truth would be the matching of an internal representation to an external state; here it is the settlement of a relation into the system of relations.

This makes the relationality reading of *true* close to what process and constructive traditions call *truth-as-establishment* (Brouwer's intuitionist reading: a proposition is true when one has a constructive proof of it) but with a different ontology underneath. In intuitionism the substrate is mathematical and the proof is what establishes; in relationality the substrate is relations and the reflexive act is what establishes. Both reject the idea that truth is a property a proposition has independently of the inquirer's act.

## True on the truth axis

True is one position on one of the two axes that compose the four-cornered [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md). The truth axis runs from [false](false.md) (denial) at one extreme to true (affirmation) at the other, with intermediate positions where a claim has not yet tilted to either extreme. The truth axis is *independent* of the knowledge axis (which runs from [absurd](absurd.md) to [determination](determination.md)) — a claim can be true and absurd (affirmed but un-witnessed by other claims; *axiomatically* true), true and determined (affirmed and structurally witnessed; *settled* true), or anywhere in between.

The four extremal corners of the joint structure — true-only (true and determined toward affirmation), false-only (false and determined toward denial), both (determined with evidence in both directions), neither (absurd, neither affirmed nor denied) — are the four positions a claim can reach. True-only is the corner the classical correspondence theory of truth recognizes; the other three are positions classical bivalence collapses or refuses, and which relationality treats as positive structural data.

## Distinction from logical *true*

The relationality reading is not the same as the [classical truth-value](../../logic/terms/true.md) of bivalent logic, even when the two coincide in the well-behaved cases. Three differences are structural:

- *Bivalence is not assumed.* A relation may be neither affirmed nor denied without that being a defect. The classical commitment that every proposition takes one of two values is replaced by the four-cornered structure.
- *Truth is positional, not propositional.* Because identity is constituted by relations, the truth of a claim is the position the asserted relation occupies in the graph of relations — not a verdict on a free-floating proposition.
- *Truth is achieved, not discovered.* The reflexive act is what produces the affirmation. There is no antecedent fact about whether the relation is true that the act tracks; the act constitutes the affirmation.

## Distinction from mere belief

A relationality reading of truth is not a relativist or subjectivist reading. The reflexive act that produces affirmation is not "agent X decides the relation holds"; it is the structured derivational move that stabilizes the relation under continued iteration. Two agents who perform the reflexive act on the same relation arrive at the same affirmation — not because their beliefs converged but because the act has the structure it has. The relationality commitment relativizes the ontology (no substances), not the standard for affirmation.

## True and the math layer

Mathematically, *true* corresponds to the truth-order top $\mathbf{t}$ in the [predication fiber algebra](../../../../math/theories/voidmath/terms/predication-fiber-algebra.md). A claim's settlement value at a [predication cell](../../../../math/theories/voidmath/terms/predication-cell.md) sits somewhere in the bilattice; its truth-axis position is the projection onto the truth order, with $\mathbf{t}$ as the affirming pole. The fact that the truth axis is one of two independent orders, rather than the unique axis of bivalent logic, is what gives the four-cornered structure its room.

---

## Additional formulation

```yaml
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
```

**True** is the semantic property a [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) has when what it claims to be the case is the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is, and of what is not that it is not, is true" — remains the touchstone: truth is a relation between what is claimed and what is so. The proposition "snow is white" is true when snow is white. The disagreements among the major theories of truth concern not this minimal claim but what the relation amounts to, what its bearers are, and whether it admits of degrees, gaps, or gluts.

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
- [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) — the standard truth-bearer
- [bivalence](bivalence.md) — the assumption that every proposition is true or false
- tarski-schema — the formal *T*-schema
- [judgment](../../../../../social-science-services-section/content/text/glossary/terms/judgment.md) — the act in which truth is asserted

---

## Supplementary formulation

```yaml
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
```

**True** is the semantic property a [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) has when what it claims to be the case is the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is, and of what is not that it is not, is true" — remains the touchstone: truth is a relation between what is claimed and what is so. The proposition "snow is white" is true when snow is white. The disagreements among the major theories of truth concern not this minimal claim but what the relation amounts to, what its bearers are, and whether it admits of degrees, gaps, or gluts.

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
- [proposition](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) — the standard truth-bearer
- [bivalence](bivalence.md) — the assumption that every proposition is true or false
- tarski-schema — the formal *T*-schema
- [judgment](../../../../../social-science-services-section/content/text/glossary/terms/judgment.md) — the act in which truth is asserted

---

## Supplementary formulation

```yaml
---
name: "True"
description: "The positive truth-axis position of a determined claim — the affirmation that follows from a reflexive derivation stabilizing a relation. Not the property of a substance-state matching a fact, but the positive presence of a relation under iteration."
aliases:
  - affirmation
  - relational-affirmation
contrasts-with: ["false"]
arises-from: reflexivity
date-created: 2026-04-27
date-modified: 2026-04-28
---
```

Under the [relationality](../_index.md) commitment — that things exist through acts of relating, not as substances bearing properties — **true** cannot mean what it means in a correspondence theory of truth. There is no substance whose state of affairs a proposition is to match. *True* must be reformulated as a position on the truth axis of [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md): the positive case in which a relation has been *affirmed* by the witnessing structure. *True* names what a [determined](determination.md) claim looks like when its determination tilts toward presence rather than absence.

In relationality, a relation does not pre-exist as a static link between independent terms; it is constituted by the act of [relating](relating.md), and stabilizes through reflexive iteration. The minimal positive case — one reflexive act that composes a first presence of relation — is the relationality reading of *true*: the affirmation that follows from a derivation that has gone once. *True* is not a verdict imposed on a relation from outside; it is what the reflexive act produces when it goes through.

## True as positive derivational presence

A claim is true when its asserted relation has been derivationally affirmed. Affirmation is not assent (a propositional attitude an agent takes toward a sentence) but *presence* — the relation, having been reflexively iterated, is now part of what is. In a substance-relational ontology, truth would be the matching of an internal representation to an external state; here it is the settlement of a relation into the system of relations.

This makes the relationality reading of *true* close to what process and constructive traditions call *truth-as-establishment* (Brouwer's intuitionist reading: a proposition is true when one has a constructive proof of it) but with a different ontology underneath. In intuitionism the substrate is mathematical and the proof is what establishes; in relationality the substrate is relations and the reflexive act is what establishes. Both reject the idea that truth is a property a proposition has independently of the inquirer's act.

## True on the truth axis

True is one position on one of the two axes that compose the four-cornered [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md). The truth axis runs from [false](false.md) (denial) at one extreme to true (affirmation) at the other, with intermediate positions where a claim has not yet tilted to either extreme. The truth axis is *independent* of the knowledge axis (which runs from [absurd](absurd.md) to [determination](determination.md)) — a claim can be true and absurd (affirmed but un-witnessed by other claims; *axiomatically* true), true and determined (affirmed and structurally witnessed; *settled* true), or anywhere in between.

The four extremal corners of the joint structure — true-only (true and determined toward affirmation), false-only (false and determined toward denial), both (determined with evidence in both directions), neither (absurd, neither affirmed nor denied) — are the four positions a claim can reach. True-only is the corner the classical correspondence theory of truth recognizes; the other three are positions classical bivalence collapses or refuses, and which relationality treats as positive structural data.

## Distinction from logical *true*

The relationality reading is not the same as the [classical truth-value](true.md) of bivalent logic, even when the two coincide in the well-behaved cases. Three differences are structural:

- *Bivalence is not assumed.* A relation may be neither affirmed nor denied without that being a defect. The classical commitment that every proposition takes one of two values is replaced by the four-cornered structure.
- *Truth is positional, not propositional.* Because identity is constituted by relations, the truth of a claim is the position the asserted relation occupies in the graph of relations — not a verdict on a free-floating proposition.
- *Truth is achieved, not discovered.* The reflexive act is what produces the affirmation. There is no antecedent fact about whether the relation is true that the act tracks; the act constitutes the affirmation.

## Distinction from mere belief

A relationality reading of truth is not a relativist or subjectivist reading. The reflexive act that produces affirmation is not "agent X decides the relation holds"; it is the structured derivational move that stabilizes the relation under continued iteration. Two agents who perform the reflexive act on the same relation arrive at the same affirmation — not because their beliefs converged but because the act has the structure it has. The relationality commitment relativizes the ontology (no substances), not the standard for affirmation.

## True and the math layer

Mathematically, *true* corresponds to the truth-order top $\mathbf{t}$ in the [predication fiber algebra](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-fiber-algebra.md). A claim's settlement value at a [predication cell](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) sits somewhere in the bilattice; its truth-axis position is the projection onto the truth order, with $\mathbf{t}$ as the affirming pole. The fact that the truth axis is one of two independent orders, rather than the unique axis of bivalent logic, is what gives the four-cornered structure its room.

## See also

- [False](false.md) — the corresponding negation pole on the truth axis.
- [Absurd](absurd.md) — the un-witnessed mode on the knowledge axis; orthogonal to true.
- [Determination](determination.md) — the witnessed mode on the knowledge axis; the structural pair to absurd.
- [Settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md) — the joint four-cornered structure.
- [Relating](relating.md) — the reflexive act that produces affirmation.
- [True (logic)](true.md) — the classical bivalent truth-value.
- [Predication fiber algebra](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-fiber-algebra.md) — the math articulation.

---

## Supplementary formulation

```yaml
---
name: "True"
description: "The positive truth-axis position of a determined claim — the affirmation that follows from a reflexive derivation stabilizing a relation. Not the property of a substance-state matching a fact, but the positive presence of a relation under iteration."
aliases:
  - affirmation
  - relational-affirmation
contrasts-with: ["false"]
arises-from: reflexivity
date-created: 2026-04-27
date-modified: 2026-04-28
---
```

Under the [relationality](../_index.md) commitment — that things exist through acts of relating, not as substances bearing properties — **true** cannot mean what it means in a correspondence theory of truth. There is no substance whose state of affairs a proposition is to match. *True* must be reformulated as a position on the truth axis of [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md): the positive case in which a relation has been *affirmed* by the witnessing structure. *True* names what a [determined](determination.md) claim looks like when its determination tilts toward presence rather than absence.

In relationality, a relation does not pre-exist as a static link between independent terms; it is constituted by the act of [relating](relating.md), and stabilizes through reflexive iteration. The minimal positive case — one reflexive act that composes a first presence of relation — is the relationality reading of *true*: the affirmation that follows from a derivation that has gone once. *True* is not a verdict imposed on a relation from outside; it is what the reflexive act produces when it goes through.

## True as positive derivational presence

A claim is true when its asserted relation has been derivationally affirmed. Affirmation is not assent (a propositional attitude an agent takes toward a sentence) but *presence* — the relation, having been reflexively iterated, is now part of what is. In a substance-relational ontology, truth would be the matching of an internal representation to an external state; here it is the settlement of a relation into the system of relations.

This makes the relationality reading of *true* close to what process and constructive traditions call *truth-as-establishment* (Brouwer's intuitionist reading: a proposition is true when one has a constructive proof of it) but with a different ontology underneath. In intuitionism the substrate is mathematical and the proof is what establishes; in relationality the substrate is relations and the reflexive act is what establishes. Both reject the idea that truth is a property a proposition has independently of the inquirer's act.

## True on the truth axis

True is one position on one of the two axes that compose the four-cornered [settlement](../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settlement.md). The truth axis runs from [false](false.md) (denial) at one extreme to true (affirmation) at the other, with intermediate positions where a claim has not yet tilted to either extreme. The truth axis is *independent* of the knowledge axis (which runs from [absurd](absurd.md) to [determination](determination.md)) — a claim can be true and absurd (affirmed but un-witnessed by other claims; *axiomatically* true), true and determined (affirmed and structurally witnessed; *settled* true), or anywhere in between.

The four extremal corners of the joint structure — true-only (true and determined toward affirmation), false-only (false and determined toward denial), both (determined with evidence in both directions), neither (absurd, neither affirmed nor denied) — are the four positions a claim can reach. True-only is the corner the classical correspondence theory of truth recognizes; the other three are positions classical bivalence collapses or refuses, and which relationality treats as positive structural data.

## Distinction from logical *true*

The relationality reading is not the same as the [classical truth-value](true.md) of bivalent logic, even when the two coincide in the well-behaved cases. Three differences are structural:

- *Bivalence is not assumed.* A relation may be neither affirmed nor denied without that being a defect. The classical commitment that every proposition takes one of two values is replaced by the four-cornered structure.
- *Truth is positional, not propositional.* Because identity is constituted by relations, the truth of a claim is the position the asserted relation occupies in the graph of relations — not a verdict on a free-floating proposition.
- *Truth is achieved, not discovered.* The reflexive act is what produces the affirmation. There is no antecedent fact about whether the relation is true that the act tracks; the act constitutes the affirmation.

## Distinction from mere belief

A relationality reading of truth is not a relativist or subjectivist reading. The reflexive act that produces affirmation is not "agent X decides the relation holds"; it is the structured derivational move that stabilizes the relation under continued iteration. Two agents who perform the reflexive act on the same relation arrive at the same affirmation — not because their beliefs converged but because the act has the structure it has. The relationality commitment relativizes the ontology (no substances), not the standard for affirmation.

## True and the math layer

Mathematically, *true* corresponds to the truth-order top $\mathbf{t}$ in the [predication fiber algebra](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-fiber-algebra.md). A claim's settlement value at a [predication cell](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) sits somewhere in the bilattice; its truth-axis position is the projection onto the truth order, with $\mathbf{t}$ as the affirming pole. The fact that the truth axis is one of two independent orders, rather than the unique axis of bivalent logic, is what gives the four-cornered structure its room.

## Earlier material

This historical formulation was consolidated from `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/emsenn-services-section/content/text/triage/true.md`. It is retained where its wording, links, provenance, or uncertainty differs from the active entry.

<details>
<summary>Recorded source metadata</summary>

</details>

- [[postulate]]:: A single reflexive derivation must induce the minimal affirmation of relational presence.
- [[derivation]]:: Reflexing once derives the affirmation that relationality is present. This is because inducing one reflexive act composes a first positive presence of relation, which is the most minimal unit of affirmation.
- [[example]]::
    - true(n) is reflect(1, n)
    - reflex(reflex(0)) induces presence of relation, so reflect(1, n) derives true.
- [[relational expression]]:: [[true]](../../../../services/relationality-services-section/content/text/glossary/terms/n) is [[oldreflect]](1, n)

- [postulate](../../documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-slop-2025-04-28/postulate):: A single reflexive derivation must induce the minimal affirmation of relational presence.
- [derivation](../../documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-slop-2025-04-28/derivation):: Reflexing once derives the affirmation that relationality is present. This is because inducing one reflexive act composes a first positive presence of relation, which is the most minimal unit of affirmation.
- [example](../../documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-slop-2025-04-28/example)::
    - true(n) is reflect(1, n)
    - reflex(reflex(0)) induces presence of relation, so reflect(1, n) derives true.
- [relational expression](relational expression):: [true](../../documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-slop-2025-04-28/true)(n) is [derivations/oldreflect](../../documents/articles/research/2026/07/31/lenticule-import/library/philosophy/relationality/archive/triage/relationality-slop-2025-04-28/derivations/oldreflect)(1, n)

- [postulate](../../../../services/relationality-services-section/content/text/triage/relationality-slop-2025-04-28/postulate):: A single reflexive derivation must induce the minimal affirmation of relational presence.
- [derivation](../../../../services/relationality-services-section/content/text/triage/relationality-slop-2025-04-28/derivation):: Reflexing once derives the affirmation that relationality is present. This is because inducing one reflexive act composes a first positive presence of relation, which is the most minimal unit of affirmation.
- [example](../../../../services/relationality-services-section/content/text/triage/relationality-slop-2025-04-28/example)::
    - true(n) is reflect(1, n)
    - reflex(reflex(0)) induces presence of relation, so reflect(1, n) derives true.
- [relational expression](relational expression):: [true](../../../../services/relationality-services-section/content/text/triage/relationality-slop-2025-04-28/true.md)(n) is [derivations/oldreflect](../../../../services/relationality-services-section/content/text/triage/relationality-slop-2025-04-28/derivations/oldreflect)(1, n)

- [postulate](../../../../services/relationality-services-section/content/text/triage/postulate):: A single reflexive derivation must induce the minimal affirmation of relational presence.
- [derivation](../../../../services/relationality-services-section/content/text/triage/derivation):: Reflexing once derives the affirmation that relationality is present. This is because inducing one reflexive act composes a first positive presence of relation, which is the most minimal unit of affirmation.
- [example](../../../../services/relationality-services-section/content/text/triage/example)::
    - true(n) is reflect(1, n)
    - reflex(reflex(0)) induces presence of relation, so reflect(1, n) derives true.
- [relational expression](relational expression):: [true](../../../../services/relationality-services-section/content/text/triage/true)(n) is [derivations/oldreflect](../../../../services/relationality-services-section/content/text/triage/derivations/oldreflect)(1, n)
