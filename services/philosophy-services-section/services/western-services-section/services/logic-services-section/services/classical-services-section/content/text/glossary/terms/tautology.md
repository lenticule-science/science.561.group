---
name: "Tautology"
description: "A formula true under every valuation — true regardless of how its atomic components are interpreted. Logical truths whose truth owes nothing to the world and everything to connective structure."
date-created: 2026-03-05T00:00:00
date-modified: 2026-03-29
aliases:
  - "tautology"
  - "logical truth"
  - "valid formula"
component-of: classical-logic
requires: bivalence
verified-by: truth-functionality
references:
  wittgenstein1921:
    authors: ["Ludwig Wittgenstein"]
    title: "Tractatus Logico-Philosophicus"
    publication: "Annalen der Naturphilosophie"
    year: 1921
  quine1951:
    authors: ["Willard Van Orman Quine"]
    title: "Two Dogmas of Empiricism"
    publication: "The Philosophical Review"
    year: 1951
---

A tautology is a formula that is true under every valuation — true regardless of how its atomic components are interpreted. In classical propositional logic, tautologies can be identified mechanically: enumerate all rows of the truth table and check that the formula evaluates to true in every one. The formula A ∨ ¬A (excluded middle) is the paradigmatic tautology; A → A is the trivial one. No matter what A is, no matter what the world is like, these formulas come out true.

Tautologies are the logical truths of classical propositional logic — the propositions whose truth owes nothing to the world and everything to the structure of the connectives. Their philosophical significance is contested. Wittgenstein in the *Tractatus* (1921) called tautologies *sinnlos* (without sense): they say nothing about the world, which is precisely why they are unconditionally true. They are the limit of what propositions can do — the point where language, by saying everything, says nothing. A tautology excludes no possible state of affairs, which is why it cannot be falsified and why it conveys no information.

Quine challenged the boundary between logical and non-logical truth in "Two Dogmas of Empiricism" (1951), arguing that the distinction between analytic truths (including tautologies) and synthetic truths is not as sharp as the tradition assumed. If no sharp line separates truths that hold by virtue of meaning from truths that hold by virtue of fact, then the special status of tautologies — their supposed immunity from empirical revision — becomes questionable.

In intuitionistic logic, the concept shifts. Not every classically valid formula is intuitionistically valid. A ∨ ¬A is not a theorem of intuitionistic propositional logic, because proving it would require either a proof of A or a proof of ¬A, and for many propositions neither is available. What counts as a logical truth depends on the logic, and the class of intuitionistic tautologies is strictly smaller than the classical class. This is the formal expression of a philosophical commitment: logical truth must be backed by constructive proof, not guaranteed by the exhaustion of truth-value assignments.
