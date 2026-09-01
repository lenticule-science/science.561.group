---
name: "False"
aliases: [falsity, falsehood]
description: "The semantic property a sentence, proposition, or judgment has when what it claims to be the case is not the case — the negation of true in classical logic, with distinct philosophical and logical treatments under non-classical accounts."
instance-of: truth-value
contrasts-with: "true"
predicate-of: proposition
date-created: 2026-04-27
references:
  - id: aristotle-metaphysics
    type: document
    title: Metaphysics
    note: Book IV (Γ), 1011b — to say of what is that it is not, or of what is not that it is, is false
    author:
      - literal: Aristotle
  - id: frege1892
    type: document
    title: Über Sinn und Bedeutung (On Sense and Reference)
    note: the True and the False as the references of sentences
    author:
      - literal: Gottlob Frege
    container-title: Zeitschrift für Philosophie und philosophische Kritik 100
    issued:
      - year: 1892
  - id: popper1959
    type: document
    title: The Logic of Scientific Discovery
    note: falsifiability as the criterion of demarcation
    author:
      - literal: Karl Popper
    container-title: Hutchinson
    issued:
      - year: 1959
  - id: kleene1938
    type: document
    title: On Notation for Ordinal Numbers
    note: three-valued logic with an undefined value
    author:
      - literal: Stephen Cole Kleene
    container-title: Journal of Symbolic Logic 3(4)
    issued:
      - year: 1938
  - id: priest1979
    type: document
    title: The Logic of Paradox
    author:
      - literal: Graham Priest
    container-title: Journal of Philosophical Logic 8
    issued:
      - year: 1979
  - id: belnap1977
    type: document
    title: A Useful Four-Valued Logic
    author:
      - literal: Nuel Belnap
    container-title: in Modern Uses of Multiple-Valued Logic, ed. Dunn & Epstein, Reidel
    issued:
      - year: 1977
---

**False** is the semantic property a [proposition](../../../../../humanities/theories/math/theories/logic/terms/proposition.md) has when what it claims to be the case is not the case. Aristotle's formulation in *Metaphysics* Γ — "to say of what is that it is not, or of what is not that it is, is false" — gives the classical sense, and remains the reference point against which non-classical accounts position themselves. Falsity is not merely the absence of truth; it is the positive ascription of a contrary, and on most accounts it stands in a structured relation to the operations of negation and refutation.

## False as the negation of true

In classical logic, falsity is exhaustively defined as the negation of truth: *p* is false if and only if not-*p* is true. This makes falsity derivative — there is no further fact of the matter than the failure of truth. Gottlob Frege (1892) gave this its sharpest expression by treating *the True* and *the False* as the two abstract objects that sentences refer to: every declarative sentence picks out one or the other, and negation maps one to the other.

The simplicity of this definition depends on [bivalence](../../western/theories/logic/theories/classical/terms/bivalence.md) — the assumption that every proposition is either true or false. Where bivalence is rejected, the relation between truth and falsity becomes more interesting.

## Falsification and the demarcation of science

Karl Popper (1959) made falsity a methodological category as well as a semantic one. A scientific hypothesis is one for which some possible observation would render it false; falsifiability is what distinguishes scientific claims from metaphysical ones. The asymmetry Popper insists on is that no finite body of confirming observations can establish the truth of a universal claim, but a single counterexample can establish its falsity. Whether or not one accepts the demarcation thesis in the strong form, the asymmetry between confirmation and refutation has remained a structural feature of how the natural sciences treat their hypotheses.

## Non-classical falsity

**Truth-value gaps.** Stephen Kleene (1938) introduced a three-valued logic in which propositions can be *undefined* — neither true nor false. Gaps appear naturally for propositions that fail to refer (the present king of France), for vague predicates at the borderline (a man with exactly one less hair than would make him bald), and for self-referential cases that produce no determinate verdict. In a gap-tolerant logic, falsity is *not* the negation of truth: the negation of the undefined is also undefined.

**Truth-value gluts.** Graham Priest (1979) and the dialetheist tradition argue that some propositions are *both* true and false. The motivating cases are paradoxes (the Liar: "this sentence is false"), inconsistent legal codes, and inconsistent empirical theories that are nonetheless reasoned with productively. In a paraconsistent logic, the inference *from a contradiction, anything follows* is rejected, and falsity coexists with truth at certain propositions without trivializing the system.

**Bilattice falsity.** Nuel Belnap (1977) made explicit the structure required when a reasoner may have, for the same proposition, evidence in favor, evidence against, both, or neither. The four values arrange along two orthogonal orderings: a *truth ordering* (none < true; none < false) and a *knowledge ordering* (none < both; true < both; false < both). On this picture, *false* is not the negation of *true* but a sibling truth-value with its own knowledge-order behavior. *Both* is not a contradiction to be eliminated but a register of conflicting evidence to be reasoned with.

## Falsity and refutation

In a constructive setting (Brouwer, Heyting), a proposition is false when one has a constructive proof of its negation, not merely when no proof of it exists. The intuitionist refusal of double-negation elimination — *not-not-p* does not entail *p* — is the formal mark of this stance: showing that a proposition cannot be false is not the same as showing it is true. The refutation of *p* is a positive achievement, not a default.

This has practical consequences in computer-checked proof and in [research](../../../../sociology/theories/work/terms/inquiry.md) more broadly: failing to confirm a hypothesis is not the same as refuting it; refutation is its own deliverance.

## See Also

- [true](true.md) — the contrasting truth-value
- negation — the operation that swaps truth and falsity in bivalent settings
- [bivalence](../../western/theories/logic/theories/classical/terms/bivalence.md) — the assumption that every proposition is true or false
- refutation — the constructive establishment of falsity
- [proposition](../../../../../humanities/theories/math/theories/logic/terms/proposition.md) — the standard truth-bearer
