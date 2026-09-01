---
title: "Datalog as Strict-Regime Predication-Cell Substrate"
type: example
status: sketch
---

## What is being instantiated

The [predicated-knowledge-system](../objects/predicated-knowledge-system.md) object, with the substrate restricted to the *strict regime* of the [four-group-register-as-regime](../theorems/four-group-register-as-regime.md) classification, the value-domain projected to $\mathbf{2}$, and the closure-rule language restricted to *Horn clauses without negation* ([@abiteboul-hull-vianu1995]).

## The restrictions

Recovering Datalog from the full predication-cell substrate requires:

1. **Value-domain projection $\mathbf{2} \otimes \mathbf{2} \twoheadrightarrow \mathbf{2}$.** A Datalog fact is true (in the extensional database) or derivable-true (in the closure of the program); there is no representation of negative evidence, contradictory evidence, or absent information. The bilattice values $\mathbf{f}, \top, \bot$ are not native; their analogues are simulated through stratified negation (Datalog with stratified $\neg$, a Scott-continuous extension that lifts the substrate out of the strict regime).
2. **Closure-rule signature: Horn clauses.** A Datalog rule is a Horn clause $h \leftarrow b_1, \ldots, b_n$ where the head $h$ and bodies $b_i$ are atoms in the predicate vocabulary. The framing's [closure-rule-language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) restricted to Horn clauses without negation lies in the strict regime: the immediate-consequence operator $T_P$ is monotone in $\leq_t$ on the lattice of $\mathbf{2}$-valued cell-sets, and its least fixed point is reached in finitely many steps for any finite extensional database.
3. **No fibration richness.** Datalog has a single global predicate vocabulary; there is no fiber structure, no per-discourse-community assertion, no [federate](../morphisms/federate.md) operation across schemas. The framing recovers this as the predication-fibration with a *trivial* fibration index: there is one fiber, and all cells live in it.

## What the restriction makes visible

Datalog's tractability — polynomial-time evaluation in the size of the extensional database for each fixed program — is the framing's strict-regime guarantee. The [closure-as-fitting-fixpoint](../theorems/closure-as-fitting-fixpoint.md) theorem subsumes Datalog as the special case where the value-domain is $\mathbf{2}$ and the closure operator is $T_P$ on Horn clauses; Fitting's bilattice generalisation extends this to $\mathbf{2} \otimes \mathbf{2}$-valued cells with the *same* fixpoint convergence guarantee, retaining Datalog's tractability while allowing source-tracked evidence.

The Datalog $\to$ Datalog$^\neg$ $\to$ Datalog$^{\neg, \text{wf}}$ extension hierarchy in the database literature corresponds to the framing's regime hierarchy: Datalog is in the strict regime, Datalog with stratified negation is in the Scott-continuous regime, Datalog with well-founded negation is in the transfinite-bounded regime, and Datalog with arbitrary negation (whose canonical models may not exist) is in the aperiodic regime.

## Worked sketch

Consider a Datalog program with two facts and one rule:
```
parent(alice, bob).
parent(bob, carol).
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
```
The extensional database is the set of two `parent` cells. The closure-rule system's immediate-consequence operator $T_P$ on the first iteration adds `ancestor(alice, bob)` and `ancestor(bob, carol)`; on the second iteration adds `ancestor(alice, carol)`; on the third iteration produces no new cells, reaching the least fixed point. The framing reads this trajectory as a strict-regime predication-settling: monotone in $\leq_t$, convergent in finitely many steps, with the settled state being the canonical Datalog model.

## Failure modes

Practitioners often treat Datalog as a *lightweight* knowledge representation insufficient for "real" reasoning; the framing locates Datalog precisely as the substrate's most tractable corner — appropriate for any application whose closure regime is genuinely strict and whose value-domain genuinely collapses to $\mathbf{2}$. The mistake is using Datalog when the application *needs* bilattice-valued reasoning (e.g., aggregating evidence from multiple potentially-disagreeing sources) or transfinite closure (e.g., reasoning over recursively-defined data structures with general recursion); for these the substrate's richer regimes are required.
