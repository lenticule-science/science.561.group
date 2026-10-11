---
id: workflow
description: "A directed graph of tasks — edges represent dependencies or information flow, the graph structure is the plan."
aliases: [workflows]
composed-of: task
structure: directed-graph
edges: dependency, information-flow
properties: reachability, boundedness, liveness
models: petri-net, directed-graph, partial-order
executable-by: process, procedure, agent
date-created: 2026-03-29
---

A workflow is a composition of [work](./work.md) units with one algebraic constraint: the initial input type equals the final output type.
The workflow takes something of type X and produces something of type X, regardless of what happens internally.
The internal structure is unconstrained — flat sequence, branching web, parallel paths, nested sub-workflows.
What matters is the boundary: same type in, same type out.

This constraint is what makes workflows composable.
Two workflows on the same type can be chained.
A workflow can be nested inside another workflow as a single step.
A workflow can replace any work unit that has the same input and output type.
The algebraic boundary makes substitution safe.

The simplest workflow is a sequence: A then B then C.
The simplest branching workflow adds a condition: after A, do B if X, else do C.
The simplest parallel workflow runs B and C simultaneously after A, then joins at D.
All workflows are combinations of these three patterns — sequence, branch, and parallel — composed into a directed graph.

A workflow is not the same thing as a [task](./task.md), though they overlap.
A workflow is an algebraic concept — it specifies a composition of work with a type boundary.
A task is a planning concept — it specifies a named container with a completion condition.
A task may contain a workflow.
A workflow may serve as a task when given a name and completion condition.
But a workflow without a name or completion condition is still a valid composition of work; it just has no place in a plan.
And a task containing a single work unit is a valid planning container but not a workflow in the algebraic sense.

A workflow is a directed graph, and directed graphs have computable properties.
Reachability: can every task be reached from the start?
Boundedness: can any intermediate queue grow without limit?
Liveness: can every task eventually execute, or are there deadlocks?
These properties are checkable before execution — you can analyze a workflow's structure to find problems without running it.

Petri nets formalize workflow analysis.
A Petri net is a bipartite graph of places (which hold tokens representing state) and transitions (which consume and produce tokens).
A transition fires when its input places have the required tokens.
Workflow soundness — every case that starts eventually completes without leftover tokens — is a Petri net reachability property.

A workflow is a partial order on its tasks.
The dependency edges define a precedence relation: A must complete before B starts.
This relation is reflexive (every task depends on itself trivially), antisymmetric (if A depends on B and B depends on A, they are the same task or there is a cycle, which is a design error), and transitive (if A before B before C, then A before C).
A workflow without cycles is a directed acyclic graph — a DAG — and the dependency relation is a [partial order](../math/domains/order/terms/partial-order.md).

Tasks in a workflow may be any of the four work types.
A workflow of pure [processes](./process.md) is deterministic — run it and the outcome is fixed.
A workflow containing [procedures](./procedure.md) branches on conditions.
A workflow containing [inquiry](./inquiry.md) is adaptive — the graph may be modified during execution as inquiry reveals new information.
The most rigid workflows are pure process chains.
The most flexible are inquiry-containing workflows that rewrite their own structure.
