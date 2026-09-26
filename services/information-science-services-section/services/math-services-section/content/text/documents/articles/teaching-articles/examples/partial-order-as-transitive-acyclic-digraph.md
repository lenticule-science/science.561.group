---
type: example
status: verified
instantiates: [dag, directed-graph, transitive-closure, acyclicity, reachability]
depends-on: [dag, directed-graph, transitive-closure, reachability, acyclicity]
title: Partial order as transitive acyclic digraph
description: A strict partial order $(P, <)$ is a transitive antisymmetric DAG on $P$, and its Hasse-diagram presentation is the unique edge-minimal DAG whose transitive closure recovers the partial order.
---

# Partial order as transitive acyclic digraph

A strict [partial order](../../../../glossary/terms/partial-order.md) $(P, <)$ *is* a transitive antisymmetric [DAG](../../../../glossary/terms/dag.md) on $P$, and its Hasse-diagram presentation is the unique edge-minimal DAG whose [transitive closure](../../../../glossary/terms/transitive-closure.md) recovers the partial order. This example walks through the correspondence in both directions and verifies it on the small partial order $\{1, 2, 3, 4\}$ ordered by divisibility.

## Step 1: Pick a small partial order

Take $P = \{1, 2, 3, 4\}$ with $a < b$ iff $a$ properly divides $b$:

$$1 < 2, \quad 1 < 3, \quad 1 < 4, \quad 2 < 4.$$

(No edge between 3 and 2 or 3 and 4: 3 does not divide either, and neither divides 3.)

This is a strict partial order — transitive (1 < 2 and 2 < 4 gives 1 < 4, which is in the set), antisymmetric (no $a, b$ with both $a < b$ and $b < a$), and irreflexive.

## Step 2: Present as a digraph

Take $V = P$ and $E = \{(a, b) : a < b\}$:

$$E = \{(1, 2), (1, 3), (1, 4), (2, 4)\}.$$

The resulting [directed graph](../../../../glossary/terms/directed-graph.md) $D = (V, E)$.

## Step 3: Verify $D$ is a DAG

Walk through possible cycles. A directed cycle $a \to b \to \cdots \to a$ would by transitivity force $a < a$, contradicting irreflexivity. So $D$ has no directed cycle, i.e. $D$ is a [DAG](../../../../glossary/terms/dag.md). ✓

## Step 4: Take the Hasse-diagram (edge-minimal) presentation

The *Hasse diagram* of $(P, <)$ keeps only the *cover* edges — those $(a, b)$ for which there is no intermediate $c$ with $a < c < b$. From $E$:

- $(1, 2)$: no intermediate. **Cover edge.**
- $(1, 3)$: no intermediate. **Cover edge.**
- $(1, 4)$: 2 is intermediate (1 < 2 < 4). **Not a cover edge.**
- $(2, 4)$: no intermediate. **Cover edge.**

Hasse digraph: $E_H = \{(1, 2), (1, 3), (2, 4)\}$, three edges.

## Step 5: Verify [transitive closure](../../../../glossary/terms/transitive-closure.md) recovers the order

Compute $E_H^+$:
- length-1: $(1,2), (1,3), (2,4)$
- length-2: $(1,2) \cdot (2,4) = (1,4)$
- length-$\geq 3$: none.

So $E_H^+ = \{(1,2), (1,3), (2,4), (1,4)\} = E$. ✓

## Step 6: Verify the [reachability](../../../../glossary/terms/reachability.md) relation is the partial order

The reachability digraph of $E_H$ is the transitive closure plus the diagonal (since reachability is reflexive). Its strict-relation part (excluding the diagonal) is exactly the partial order $<$ on $P$. ✓

## Output / Verification

**Witness:** the strict partial order on $\{1, 2, 3, 4\}$ by divisibility is the transitive closure of its 3-edge Hasse digraph; the Hasse digraph is the edge-minimal DAG whose closure is the order; the reachability relation on the Hasse digraph is the partial order itself.

**Reproducibility:** Hasse-diagram construction and transitive-closure computation are both straightforward. The result generalizes to any finite partial order.

## What this exemplifies

This is the *correspondence* this directory's downstream `depends-on:` edge to [partial-order](../../../../glossary/terms/partial-order.md) records typographically. A partial order is a transitive antisymmetric DAG; the Hasse diagram is the edge-minimal DAG witnessing the order; the partial order is recovered by transitive closure of the Hasse diagram. The correspondence runs in both directions, and is what makes graph theory the structural underlayer of order theory in the corpus's layering of the math directory. See [graphs-underneath-categories-and-orders](../explanations/graphs-underneath-categories-and-orders.md) for the broader narrative.
