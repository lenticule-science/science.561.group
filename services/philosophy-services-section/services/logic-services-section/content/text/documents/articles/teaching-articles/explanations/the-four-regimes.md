---
title: The Four Regimes
description: How closures over predicated content are classified into exactly four regimes — strict, Scott-continuous, transfinite-bounded, and aperiodic — by where their closure ordinal falls, which stage of the language each regime belongs to, and what each regime buys an engineer.
date-created: 2026-06-19
date-modified: 2026-09-25
keywords: ["aperiodic", "closure-ordinal", "four-regimes", "scott-continuity", "articulating", "predicating", "positing", "settling"]
---


This is an explanation. It tells you why a closure over predicated content can always be sorted into exactly one of four kinds, what distinguishes the kinds, which stage of the language (articulating, predicating, positing, settling) each kind belongs to, and why that classification is the single most useful parameter you can know about such content before you try to compute with it.

## The problem: when does inference stop?

A predicated computer runs by *closure*. You begin with some initial body of established predications and a set of closure rules — each rule a stated condition under which existing predications entail another. Applying every applicable rule once produces a new, larger body; applying them again produces another; and so on. Closure is the repeated application of this inference step until nothing new appears. The question that governs everything else is: *when does it stop, and is "when" even a finite number?*

For a closure treated as an endofunctor iterated from an initial state, the answer is captured by a single object: the **closure ordinal**. It is the least ordinal at which iterating the closure produces nothing new — the first stage that is equal to its own successor. If the body is finite and the rules are simple, that ordinal is some finite number, and the closure is the familiar fixpoint computation of databases and finite knowledge graphs. But predicated content need not be finite, and its rules need not be finitary. When the content is infinite, or when a rule's premise quantifies over an infinite range, the closure can run past every finite stage and only stabilize at a transfinite ordinal — or fail to stabilize at any ordinal a countable observer can reach. The existence of such a least stabilizing ordinal is guaranteed in general by the Knaster–Tarski fixpoint principle together with transfinite induction; what varies, and what matters, is *how far up* it sits.

The four-regime classification is the claim that the height of the closure ordinal is not a continuum of equally awkward cases but a sharp partition into four bands, each with its own tractable engineering character.

## The four bands

Exactly one of four regimes holds for any closure over predicated content, determined by where its closure ordinal falls. Each regime is the regime of one stage of the language, named with it below.

**Strict**, the regime of settling — the closure ordinal is finite (below $\omega$). The value-domain, the entity set, and the predicate category are all finite, and the closure operator is strict-idempotent: apply it, apply it again, nothing changes. This is the classical comfort zone — relational databases, finite description logics, finite Kripke frames, finite knowledge graphs. Everything is polynomial and deterministic; the closure terminates in a bounded number of steps; equivalence between two such computers is cheaply decidable. Most engineered content starts here and never needs to leave.

**Scott-continuous**, the regime of positing — the closure ordinal is exactly $\omega$. At least one of the three components is now infinite, but the closure operator is *Scott-continuous*: it commutes with directed joins, meaning the result of closing the whole is the directed union of the results of closing each finite prefix. This is the regime of infinite *content* with finitary *inference* — logic programming over an infinite Herbrand base, description logics over an infinite domain, any knowledge base whose entity space is countable but whose rules look back only a finite distance. Each finite prefix behaves like a strict computer, and the global answer is their limit. Cohomologically nothing new happens; the inconsistency cohomology is computable by ordinary finite means.

**Transfinite-bounded**, the regime of predicating — the closure ordinal lies strictly between $\omega$ and the first uncountable ordinal $\omega_1$. Here closure is no longer Scott-continuous: some rule fires only at a limit stage, contributing content that no finite prefix could have produced, because its premise quantifies over an entire infinite range that only becomes complete at the limit. The state space still has countable cofinality, so the whole thing is reachable by transfinite iteration of Scott-continuous techniques. This is the first regime in which inconsistency carries nontrivial first cohomology: each non-Scott-continuous firing ordinal contributes one generator. The smallest natural example arises from a single universally-quantified rule and closes at $\omega + 1$.

**Aperiodic**, the regime of articulating — the closure ordinal is $\omega_1$ or larger. Non-Scott-continuous firings recur at countable limit ordinals without end; cohomology never stabilizes at any countable stage, because each such firing keeps contributing fresh first-cohomology generators. The content has uncountable closure depth. It is reachable in full only as a direct limit assembled over bounded countable truncations, never by a countable-stage computation taken whole. This is the regime that carries the theory's sharpest invariants and its hardest engineering.

## Each band is one stage's

The four regimes are not four kinds of settling. Each is the regime of one stage of the language spine, and the spine descends through them in order: articulate, predicate, posit, settle.

- Settling proper is finite: it runs over a finite reading lattice and stops by step three, which Obsmetrologia proves for the spine.
- Positing is Scott-continuous: evidence is admitted along directed finite prefixes, and the limit is the union of what the prefixes established.
- Predicating is transfinite-bounded: a premise that quantifies over an infinite range is discharged only when the whole range is in, at a limit stage.
- Articulating is aperiodic: articulated traces carry the aperiodic order of substitution recurrences, whose cohomology never stabilizes at a countable stage.

So the regime of a closure tells you which stage's work it is doing. A rule system run as settling whose premises carry universal-quantifier blocks is doing predicating work, and one whose rules are step-$n$ recurrences is articulating.

## Why the boundaries fall where they do

The bands are not arbitrary cut-points on an ordinal line. Each boundary marks the failure of a specific computational assumption.

The strict / Scott-continuous boundary is the move from finite to infinite content. Below it, the closure terminates outright; above it, it only *converges*, but it converges in the well-behaved Scott sense where the limit is the union of the prefixes. The Scott-continuous / transfinite-bounded boundary is the failure of Scott-continuity itself: once a rule can fire at a limit stage on the strength of having quantified over a completed infinity, the limit is no longer just the union of prefixes, and inconsistency acquires genuine first cohomology. The transfinite-bounded / aperiodic boundary is the failure of countable reach: while the cofinality stays countable you can climb to the closure ordinal by transfinite iteration, but once it is uncountable no countable climb arrives, and you must descend to bounded truncations and take a direct limit.

There is a clean syntactic shadow of all this. Whether a closure is below or above the Scott-continuous line is determined by the *language of its rules*: quantifier-free rule premises realize the strict and Scott-continuous regimes, while premises with universal-quantifier blocks are what push you into transfinite-bounded and aperiodic territory. The regime is thus a *function* of declarable facts — base finiteness, rule-language fragment, and state-space cofinality jointly determine it — not something one must discover by running the computation to completion.

## The aperiodic regime borrows from substitution dynamics

The aperiodic regime has structure beyond mere "very tall." A recurring source of aperiodic closures is the *step-$n$* closure rule, whose premise looks back at the prior $n$ stages and whose conclusion is produced by an $n$-term recurrence. Such a rule carries a substitution matrix of non-negative integers, and its growth is governed by that matrix's dominant Perron–Frobenius eigenvalue — the golden ratio for the step-2 Fibonacci rule, the plastic number for the step-3 Padovan rule, and so on. Two rules of the same look-back depth but different matrices are genuinely distinct: Fibonacci and Thue–Morse are both step-2 yet inequivalent.

This is exactly the shape of Anderson and Putnam's analysis of substitution tilings. There, an aperiodic tiling is presented as the inverse limit of a finite complex under its own substitution map, and the tiling's Čech cohomology is the direct limit of the induced maps — yielding, for a primitive $n$-letter substitution, a first cohomology of rank $n$. The aperiodic regime inherits this framework structurally: the iterates of the closure play the role of the substitution map, the cohomology of bounded sub-stages plays the role of the finite complex, and the direct limit at the closure ordinal assembles the classifying first cohomology. The correspondence is conceptual, not technical — it transfers the direct-limit picture without importing the operator-algebraic and $K$-theoretic machinery specific to tilings. The payoff is a finite classifying invariant of rank $n$ for an object whose raw closure history has uncountably many firing ordinals: after quotienting by settling-shift equivalence, those firings collapse to exactly $n$ classes, one per letter of the underlying substitution. Rank $n$ is necessary but not sufficient to identify two such systems; finer invariants — matrix conjugacy and Bratteli–Vershik data — separate them further.

## What the classification buys

The reason to know a closure's regime before computing is that the regime *is* the engineering envelope. It tells you, in advance, what your machinery may assume and what it must provide.

In the strict and Scott-continuous regimes, inconsistency has no first cohomology, so auditing reduces to counting overdetermined cells; the closure terminates or converges by finite prefixes; you may ship and snapshot endpoint state alone, and trajectory-keeping would be over-engineering. In the transfinite-bounded regime, first cohomology is real and generated by the limit-stage firings, so auditing must traverse those firing ordinals, the engine must admit transfinite stages, and snapshots must record the firing-ordinal pattern rather than just the endpoint. In the aperiodic regime, cohomology is a direct limit at $\omega_1$ scale, so the machinery must either work to a declared bound or summarize by pattern, and everything — federation, snapshots, audit — is organized around bounded truncations.

Because the four regimes exhaust the possibilities, declaring one is a complete commitment. It lets independent tools query a body of content and adjust their behavior; it makes crossing a regime boundary — extending the rule language until the closure ordinal jumps a band — a recordable, detectable event rather than silent drift; and it gives a principled discipline for federating content of different regimes, by scoping the higher-regime side down to a prefix the lower-regime side can admit. The four regimes are, in the end, the organizing answer to a single question: how do you build a computer over transfinite content that is still tractable to engineer? Classify the content by its closure ordinal, declare the regime, and build to that regime's envelope.
