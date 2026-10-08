---
title: "A Fragment Calculus for Claims"
type: text
authors:
  - emsenn
date-created: 2025-12-14T00:00:00
keywords:
  - epistemology
  - methodology
date-updated: 2026-03-09
part-of: mathematics/concepts/fragment-calculus/texts
description: A lightweight formalism for managing claims across fragmented knowledge domains — preventing the silent conversion of results from one mode of reasoning into another.
---

A lightweight formalism for managing claims across fragmented knowledge domains — preventing the silent conversion of results from one mode of reasoning into another.

## Primitives

**1) Fragment (primitive, local scope)**

A fragment is a container for reasoning under controlled assumptions.

- **F := ⟨A, K, Π⟩**
  - **A**: assumptions (axioms, constraints, conventions)
  - **K**: claims currently admitted in the fragment
  - **Π**: provenance map, Π(c) = minimal support record for claim c (sources, derivations, or trusted inputs)

Assumption dependence is not optional: every non-axiom claim must have a provenance record.

**2) Support edge (primitive, local scope)**

A support edge is a directed relation $S \longrightarrow c$ where $S$ is a set of claims/assumptions and $c$ is a claim. It is the atomic unit of "why."

**3) Compatibility predicate (primitive, local scope)**

$\mathrm{Compat}(F, G)$ answers whether fragments can be combined without immediate contradiction under declared assumptions.

## Derived operators

**4) Closure (derived, local scope)**

$\mathrm{Cl}(F)$ adds all claims derivable from $A \cup K$ using the allowed inference rules $R$ in that fragment.

$\mathrm{Cl}(F)$ depends on the rule set $R$ (explicit) and optional resource bounds (depth, time, or permitted theory). Closure is never global by default — it is scoped and parameterized.

**5) Minimal support extraction (derived, local scope)**

For $c \in \mathrm{Cl}(F)$, define $\mathrm{MS}_F(c)$ as the smallest (by set inclusion) support set that still entails $c$ according to $\Pi + R$. If there are multiple minima, keep the set of minima.

**6) Delta (derived, cross-fragment)**

$\Delta(F \to G)$ is the smallest set of assumption/claim changes required so that $\mathrm{Compat}(\mathrm{Cl}(F), \mathrm{Cl}(G))$ holds, plus the induced provenance edits.

This is debugging at the level of model boundaries rather than sentences.

**7) Tension index (heuristic)**

A number or ordering estimating how expensive it is to merge fragments: contradictions, support overlap, and closure explosion. Not truth — a steering function.

## Worked example: illicit globalism

Suppose a research program constantly switches among math, architecture, and implementation. The classic failure mode is *illicit globalism*: something proven in math mode quietly becomes a design invariant in runtime mode, then becomes a test oracle in implementation mode, even though each move silently changed assumptions.

Model each mode as a fragment:

- **$F^M$ (math)**: $A^M$ includes axioms/definitions; $R^M$ includes proof rules.
- **$F^A$ (architecture)**: $A^A$ includes design constraints (latency, ergonomics, versioning); $R^A$ includes refinement rules.
- **$F^I$ (implementation)**: $A^I$ includes language/tool constraints; $R^I$ includes operational semantics, testability constraints.

The useful question is not "is claim $c$ true?" It is:

> In which fragments does $c$ survive closure, and what is the delta cost to make it survive elsewhere?

### Example claim

Let $c$ := "Normalization is confluent."

- In $F^M$, $\mathrm{Cl}(F^M)$ includes $c$ with support $\mathrm{MS}_{F^M}(c) = \{\text{termination, local confluence}\}$ (Newman's lemma), plus precise definitions.
- In $F^A$, the same sentence might mean "canonicalization yields unique normal forms," which additionally needs determinism of the strategy, stability under version changes, and a representation invariant compatible with serialization.
- In $F^I$, the chosen strategy may not terminate on some inputs (resource bounds, recursion limits), so $c$ fails.

### Delta analysis instead of argument

Compute $\Delta(F^M \to F^I)$:

- Add a restriction on the term language (exclude constructs causing divergence), or
- Add a fuel/step bound and weaken $c$ to "confluent up to $k$ steps," or
- Change implementation strategy and update provenance.

The point: don't debate $c$ — refine it into fragment-compatible variants with explicit cost.

## Closure is the silent killer

In practice, most incoherence comes from uncontrolled closure:

- Import a powerful rule set $R$ into a fragment meant to be lightweight.
- $\mathrm{Cl}(F)$ explodes and drags in commitments never priced in.
- Later fragments inherit those commitments as axioms.

An operationally useful invariant:

> Every fragment must declare its closure regime (rule set + bounds). Otherwise "what follows" is undefined, and provenance becomes theater.

If a claim is used as an invariant across modes, it must come with (i) fragment labels, (ii) minimal supports, and (iii) the delta plan if the claim fails under another closure regime.

## Extensions

Two natural directions that stay coherent:

1. **Typed claims**: distinguish semantic claims (about objects) from governance claims (about allowed rules/assumptions). Governance claims should not be imported casually.
2. **Bidirectional deltas**: $\Delta(F \to G)$ is not symmetric. The asymmetry encodes where you pay the complexity tax.

## Appendix: test for situating claims

Given a claim $C$ and a context $X$:

1. Enumerate the operations $O$ that $X$ actually performs.
2. For each $o \in O$, ask: does $C$ constrain $o$?
3. If $C$ constrains nothing, mark $C$ = decorative.
4. If $C$ constrains $o$ but is never consulted, mark $C$ = ceremonial.
5. If $C$ is consulted but violations are tolerated, mark $C$ = aspirational.
6. If violations cause repair, mark $C$ = operative.
7. If repair changes $X$'s future structure, mark $C$ = structural.
8. Only structural claims may be exported. All others decay locally.
