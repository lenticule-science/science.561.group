---
title: "A Fragment Calculus for Cross-Discipline Claims"
description: "A formal framework for managing claims across disciplinary contexts — fragments contain reasoning under controlled assumptions, with explicit provenance, scoped closure, and delta analysis for cross-fragment coherence."
date-created: 2026-04-05
text-type: paper
claim: "Cross-disciplinary incoherence comes not from contradictions in claims but from uncontrolled closure — importing rules across disciplinary fragments without pricing in the assumption changes."
---

## The problem

Research programs that move between math, architecture, and implementation suffer from **illicit globalism**: something proven "in math mode" quietly becomes a design invariant in "runtime mode," then becomes a test oracle in "implementation mode," even though each move silently changed assumptions. The question is not "is claim $c$ true?" but "in which fragments does $c$ survive closure, and what's the delta cost to make it survive elsewhere?"

## Primitives

**Fragment.** A fragment is a container for reasoning under controlled assumptions:

$$F := \langle A, K, \Pi \rangle$$

- $A$: assumptions (axioms, constraints, conventions)
- $K$: claims currently admitted in the fragment
- $\Pi$: provenance map, $\Pi(c) =$ minimal support record for claim $c$ (sources, derivations, or trusted inputs)

Assumption dependence is not optional: every non-axiom claim must have a provenance record.

**Support edge.** A directed relation $S \to c$ where $S$ is a set of claims/assumptions and $c$ is a claim. The atomic unit of "why."

**Compatibility predicate.** $\mathrm{Compat}(F, G)$ answers whether fragments can be combined without immediate contradiction under declared assumptions.

## Derived operators

**Closure.** $\mathrm{Cl}(F)$ adds all claims derivable from $A \cup K$ using the allowed inference rules $R$ in that fragment. Closure depends on the rule set $R$ (explicit) and optional resource bounds (depth, time, or permitted theory). Closure is never global by default — it is scoped and parameterized.

**Minimal support extraction.** For a claim $c \in \mathrm{Cl}(F)$, define $\mathrm{MS}_F(c)$ as the smallest (w.r.t. set inclusion) support set that still entails $c$, according to $\Pi + R$. If there are multiple minima, keep the set of minima. This gives explainability with edge-case handling (non-uniqueness) without pretending supports are canonical.

**Delta.** $\Delta(F \to G)$ is the smallest set of assumption/claim changes required so that $\mathrm{Compat}(\mathrm{Cl}(F), \mathrm{Cl}(G))$ holds, plus the induced provenance edits. This is debugging at the level of model boundaries rather than sentences.

**Tension index** (heuristic). A number estimating how expensive it is to merge fragments: contradictions, support overlap, and closure explosion. Not truth — a steering function.

## Worked example

Model each disciplinary mode as a fragment:

- $F^M$ (math): $A^M$ includes axioms/definitions; $R^M$ includes proof rules
- $F^A$ (architecture): $A^A$ includes design constraints (latency, ergonomics, versioning); $R^A$ includes refinement rules
- $F^I$ (implementation): $A^I$ includes language/tool constraints; $R^I$ includes operational semantics, testability constraints

Consider the claim $c :=$ "Normalization is confluent."

- In $F^M$, $\mathrm{Cl}(F^M)$ may include $c$ with support $\mathrm{MS}_{F^M}(c) = \{\text{termination}, \text{local confluence}\}$ (Newman's lemma).
- In $F^A$, the same English sentence requires additionally: determinism of the normalization strategy, stability under version changes, and a representation invariant compatible with serialization.
- In $F^I$, the chosen strategy may not terminate on some inputs (resource bounds, recursion limits), so $c$ fails.

**Delta analysis instead of argument.** Compute $\Delta(F^M \to F^I)$: typical minimal deltas are restricting the term language (excluding divergence-causing constructs), adding a fuel/step bound and weakening $c$ to "confluent up to $k$ steps," or changing implementation strategy with updated provenance. The point: you don't debate $c$; you refine it into fragment-compatible variants with explicit cost.

## The sharp insight: closure is the silent killer

Most incoherence is not from contradictions in $K$ but from uncontrolled closure:

- You import a powerful rule set $R$ into a fragment meant to be lightweight
- $\mathrm{Cl}(F)$ explodes and drags in commitments you never priced in
- Later fragments inherit those commitments as if they were axioms

The operationally useful invariant: **every fragment must declare its closure regime** (rule set + bounds). Otherwise "what follows" is undefined, and provenance becomes theater.

If a claim is used as an invariant across modes, it must come with (i) fragment labels, (ii) minimal supports, and (iii) the delta plan if the claim fails under another closure regime.

## Extensions

**Typed claims.** Distinguish semantic claims (about objects) from governance claims (about allowed rules/assumptions). Governance claims should not be casually imported across fragments.

**Bidirectional deltas.** $\Delta(F \to G)$ is not symmetric. The asymmetry encodes where you pay the complexity tax. Converting mathematical truth to implementation requires different work than lifting implementation constraints into mathematical assumptions.
