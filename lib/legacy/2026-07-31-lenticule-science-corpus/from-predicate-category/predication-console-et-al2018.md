---
type: reference
authors: [Console, Marco, Guagliardo, Paolo, Libkin, Leonid]
year: 2018
title: "Propositional and Predicate Logics of Incomplete Information"
venue: "Principles of Knowledge Representation and Reasoning (KR 2018)"
---

## Full citation

M. Console, P. Guagliardo, L. Libkin. "Propositional and Predicate Logics of Incomplete Information." Principles of Knowledge Representation and Reasoning (KR 2018), 2018.

## Status

Read locally; PDF at `sources/console-et-al2018.pdf` (10 pp). §§1–3 read in detail.

## Annotation

Database-focused study of many-valued first-order logic over relational databases with nulls. The central technical result is a **collapse**: many-valued FO collapses to classical FO under database-with-nulls semantics, in a precise sense.

For our program this paper functions as a **warning**, not a positive resource: the collapse is what we explicitly do not want. The the framework does not collapse to classical first-order — partial information ($\bot$) and inconsistency ($\top$) are first-class epistemic states rather than implementation conveniences. The hyperdoctrinal layer cites this paper as the contrast that needs to be exhibited: any the FOL on the predication hyperdoctrine successor must show non-collapse, e.g., via an explicit pair of databases where many-valued and classical interpretations diverge in observable ways.
