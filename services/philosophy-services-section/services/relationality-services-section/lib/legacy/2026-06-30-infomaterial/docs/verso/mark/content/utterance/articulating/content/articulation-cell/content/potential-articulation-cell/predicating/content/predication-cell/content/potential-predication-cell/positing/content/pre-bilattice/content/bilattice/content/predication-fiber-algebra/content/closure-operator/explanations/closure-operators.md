---
title: Closure Operators and Fixed Points
aliases:
- Closure Operators and Fixed Points
- closure-operators
date-created: 2026-03-01 00:00:00
tags:
- order-theory
depends-on:
- /mathematics/objects/posets/curricula/lattices.md
- /mathematics/objects/posets/curricula/heyting-algebras.md
introduces:
- Closure Operators and Fixed Points
references:
  - id: tarski_LatticeTheoreticalFixpointTheorem_1955
    type: document
    title: A Lattice-Theoretical Fixpoint Theorem and Its Applications
    author:
      - literal: Tarski
    issued:
      - year: 1955
  - id: davey_IntroductionLatticesOrder_2002
    type: document
    title: Introduction to Lattices and Order
    author:
      - literal: Davey
    issued:
      - year: 2002
  - id: erne_ClosureOperators_2009
    type: document
    title: Closure Operators
    author:
      - literal: Erne
    issued:
      - year: 2009
type: overview
status: current
---
## Entry conditions

Use [closure operators](../../../teaching/explanations/closure-operator/index.md) when you have:

- A [partially ordered](../objects/partial-order.md) set (or complete [lattice](../objects/lattice.md)) of structures.
- A process that enlarges or completes a structure in a canonical way.
- A need to find the smallest structure that is "closed" — stable under the process.

## Definitions

A **[closure operator](../../../teaching/explanations/closure-operator/index.md)** on a [partially ordered](../objects/partial-order.md) set $(P, \leq)$ is a function $c : P \to P$ satisfying three properties [@davey_IntroductionLatticesOrder_2002; @erne_ClosureOperators_2009]:

1. **Extensive** (inflationary): $x \leq c(x)$ for all $x$. The closure of $x$ is at least as large as $x$.
2. **Monotone**: if $x \leq y$ then $c(x) \leq c(y)$. Larger inputs produce larger outputs.
3. **Idempotent**: $c(c(x)) = c(x)$ for all $x$. Closing a closed element does nothing further.

An element $x$ is **closed** (or **stable**) if $c(x) = x$. The set of closed elements is denoted $\mathrm{Fix}(c) = \{x \in P : c(x) = x\}$.

A [closure operator](../../../teaching/explanations/closure-operator/index.md) that is monotone and extensive (but not necessarily idempotent) is called an **inflationary operator**. Such operators become idempotent in the limit when iterated — which is where fixed-point theory enters.

## Vocabulary (plain language)

- **Closure**: the result of applying $c$ to an element — the smallest closed element above it.
- **Closed element**: one that the operator leaves unchanged.
- **Fixed point**: an element $x$ where $c(x) = x$. For [closure operators](../../../teaching/explanations/closure-operator/index.md), the [fixed points](../../../teaching/explanations/fixed-point/index.md) are exactly the closed elements.
- **Least fixed point**: the smallest fixed point — the minimal structure that is stable under the operator.

## Standard examples

**Topological closure.** Given a topological space, the closure of a set $A$ is the smallest closed set containing $A$. This operator is extensive (adding limit points makes $A$ larger), monotone (if $A \subseteq B$ then $\overline{A} \subseteq \overline{B}$), and idempotent ($\overline{\overline{A}} = \overline{A}$).

**Transitive closure.** Given a relation $R$ on a set, the transitive closure $R^+$ is the smallest transitive relation containing $R$. It adds all paths: if $aRb$ and $bRc$, then $aR^+c$.

**Deductive closure.** Given a set of formulas $\Gamma$ and a proof system, the deductive closure $\mathrm{Cn}(\Gamma)$ is the set of all formulas provable from $\Gamma$. It is extensive ($\Gamma \subseteq \mathrm{Cn}(\Gamma)$), monotone, and idempotent.

**Span and linear closure.** Given a set of vectors $S$ in a vector space, $\mathrm{span}(S)$ is the smallest subspace containing $S$.

Each of these shares the same pattern: start with an incomplete structure, add what is missing according to a rule, and stop when nothing further needs adding.

## The Knaster-Tarski fixed-point theorem

The central result connecting [closure operators](../../../teaching/explanations/closure-operator/index.md) to complete [lattices](../objects/lattice.md):

**Theorem (Knaster-Tarski).** Let $(L, \leq)$ be a complete [lattice](../objects/lattice.md) and $f : L \to L$ a monotone function. Then the set of [fixed points](../../../teaching/explanations/fixed-point/index.md) of $f$ is non-empty and forms a complete [lattice](../objects/lattice.md) under the inherited order [@tarski_LatticeTheoreticalFixpointTheorem_1955]. In particular, $f$ has a **[least fixed point](../../../teaching/explanations/fixed-point/index.md)**:

$$
\mathrm{lfp}(f) = \bigwedge \{x \in L : f(x) \leq x\}
$$

and a **greatest fixed point**:

$$
\mathrm{gfp}(f) = \bigvee \{x \in L : x \leq f(x)\}.
$$

The [least fixed point](../../../teaching/explanations/fixed-point/index.md) is the meet of all **pre-[fixed points](../../../teaching/explanations/fixed-point/index.md)** (elements $x$ where $f(x) \leq x$, meaning $f$ does not push $x$ any higher). The greatest fixed point is the join of all **post-fixed points** (elements $x$ where $x \leq f(x)$, meaning $x$ does not exceed its own closure).

For an inflationary monotone function $f$ (where $x \leq f(x)$ for all $x$), every element is a post-fixed point, so the greatest fixed point is $\top$. The interesting structure is the [least fixed point](../../../teaching/explanations/fixed-point/index.md): the smallest element that $f$ leaves alone.

## Iterative construction

When $f$ is inflationary and monotone, the [least fixed point](../../../teaching/explanations/fixed-point/index.md) can be reached by iterating $f$ from the bottom:

$$
\bot \leq f(\bot) \leq f(f(\bot)) \leq \cdots
$$

This ascending chain stabilizes at some ordinal (for a complete [lattice](../objects/lattice.md), it reaches a fixed point by taking joins at limit ordinals). The element it stabilizes at is $\mathrm{lfp}(f)$.

This iterative picture gives the fixed-point construction a dynamic reading: start with nothing, apply the operator, see what grows, keep going until nothing new appears. The result is the minimal self-sustaining structure.

## Composing [closure operators](../../../teaching/explanations/closure-operator/index.md)

When multiple [closure operators](../../../teaching/explanations/closure-operator/index.md) act on the same [lattice](../objects/lattice.md), their composition is monotone and inflationary (if each component is). However, the composite of idempotent operators is not generally idempotent — applying one closure and then another may produce new material that requires a further round of the first closure.

The standard approach: compose the operators and then take the [least fixed point](../../../teaching/explanations/fixed-point/index.md) of the composite. If $c_1, c_2, c_3$ are monotone inflationary operators on a complete [lattice](../objects/lattice.md), define

$$
\mathcal{S} = c_3 \circ c_2 \circ c_1.
$$

$\mathcal{S}$ is monotone and inflationary. By Knaster-Tarski, $\mathcal{S}$ has a [least fixed point](../../../teaching/explanations/fixed-point/index.md). This fixed point is the smallest structure that is simultaneously stable under all three operators — because if $\mathcal{S}(X) = X$, then $c_1$ through $c_3$ collectively add nothing new.

## Worked example

Consider a simple case: deductive closure over propositional logic.

Let $L$ be the complete [lattice](../objects/lattice.md) of sets of propositional formulas, ordered by inclusion. Define $c(\Gamma) = \mathrm{Cn}(\Gamma)$, the deductive closure.

- $c$ is extensive: $\Gamma \subseteq \mathrm{Cn}(\Gamma)$.
- $c$ is monotone: if $\Gamma \subseteq \Delta$ then $\mathrm{Cn}(\Gamma) \subseteq \mathrm{Cn}(\Delta)$.
- $c$ is idempotent: $\mathrm{Cn}(\mathrm{Cn}(\Gamma)) = \mathrm{Cn}(\Gamma)$.

The closed elements are the deductively closed theories. The least closed theory containing axioms $\{p, p \Rightarrow q\}$ is $\mathrm{Cn}(\{p, p \Rightarrow q\}) = \{p, q, p \Rightarrow q, p \wedge q, \ldots\}$.

Now imagine two [closure operators](../../../teaching/explanations/closure-operator/index.md): deductive closure $c_1$ and a "naming" operator $c_2$ that adds a new [symbol](../../../../linguistics/theories/semiotics/terms/symbol.md) for each derivable formula. The composite $c_2 \circ c_1$ is inflationary and monotone. Its [least fixed point](../../../teaching/explanations/fixed-point/index.md) is the smallest theory where every derivable formula has a name and every named formula is derivable.

## Common mistakes

- Conflating monotone with inflationary. A monotone function preserves order ($x \leq y \Rightarrow f(x) \leq f(y)$); an inflationary function enlarges its input ($x \leq f(x)$). Closure operators are both, plus idempotent.
- Assuming the composite of [closure operators](../../../teaching/explanations/closure-operator/index.md) is a [closure operator](../../../teaching/explanations/closure-operator/index.md). The composite of two idempotent operators is generally not idempotent. This is why you need the fixed-point construction rather than a single application.
- Expecting the [least fixed point](../../../teaching/explanations/fixed-point/index.md) to be $\bot$. The [least fixed point](../../../teaching/explanations/fixed-point/index.md) is the smallest element $x$ where $f(x) = x$, which is typically larger than $\bot$ (unless $f(\bot) = \bot$).

## Minimal data

- A complete [lattice](../objects/lattice.md) $(L, \leq)$.
- One or more monotone inflationary operators $c_i : L \to L$.
- The [least fixed point](../../../teaching/explanations/fixed-point/index.md) of their composite, given by Knaster-Tarski: $\mathrm{lfp}(\mathcal{S}) = \bigwedge\{x : \mathcal{S}(x) \leq x\}$.

