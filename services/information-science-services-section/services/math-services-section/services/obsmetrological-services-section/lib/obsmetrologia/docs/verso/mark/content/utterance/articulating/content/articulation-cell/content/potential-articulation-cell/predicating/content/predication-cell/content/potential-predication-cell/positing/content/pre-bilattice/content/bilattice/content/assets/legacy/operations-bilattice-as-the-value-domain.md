---
title: "Bilattice is the value domain"
description: "Belnap 2⊗2 — four values, two orders, the algebra is the substrate's logic."
kind: decision
status: accepted
---

**Decision.** Cell values are drawn from the four-element Belnap bilattice $\mathbf{2} \otimes \mathbf{2} = \{\bot, t, f, \top\}$ with the standard knowledge ($\le_k$) and truth ($\le_t$) orders.

This decision is *forced* by PredCat — but recording it explicitly in the captain's archive matters because the older specs offered alternatives (Boolean fibers, three-valued logic, distinct lattice-of-sets schemes). The captain has chosen Belnap.

**Why.**

- The world produces incomplete information ($\bot$) and contradictory information ($\top$). Two-valued logic conflates both with falsehood.
- Three-valued logic handles incompleteness but not contradiction.
- Numerical confidence (a $[0,1]$ value) loses the structural distinction between *direction* and *amount* of evidence.
- The four-valued bilattice handles all four epistemic situations as first-class. Less is information loss; more is unnecessary for the substrate's scope.

The captain's [adjoint-structure paper](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md) develops the formal foundations.

**What this rules out.**

- Storing values as Booleans (`true`/`false`).
- Storing values as confidence in $[0, 1]$.
- Storing values as null/non-null.
- Treating $\top$ as an error.

**What this does not constrain.**

- Richer fiber algebras *on top* of the four-valued substrate (residuated lattices over $[0,1]$, probability monads, interval algebras) are application-layer extensions. The substrate is four-valued; views may compute and render richer values.
- Multiple bilattice fibers (each over a different domain — Belnap for evidence, FOUR for plain truth, others for specific applications) MAY be composed as the substrate matures. The default and load-bearing fiber is Belnap 2⊗2.

**Wire form.**

The four values serialize as the named strings `"None"`, `"True"`, `"False"`, `"Both"`. Internal representation is the witness-pair `(a, b)` per [witness-pair-encoding-internal.md](witness-pair-encoding-internal.md). The wire form is the named strings (unambiguous, language-agnostic).
