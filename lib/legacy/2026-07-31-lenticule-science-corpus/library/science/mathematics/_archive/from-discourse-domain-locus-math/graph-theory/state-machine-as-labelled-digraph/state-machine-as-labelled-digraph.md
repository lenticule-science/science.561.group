---
type: example
status: reproducible
instantiates: [labelled-graph, directed-graph, reachability]
depends-on: [labelled-graph, directed-graph, vertex, edge, reachability, transitive-closure]
---

# State machine as labelled digraph

A finite state machine is a [labelled directed graph](../objects/labelled-graph.md): vertices are states, edges are transitions, edge labels are inputs. This example exhibits the corpus's own task-state lifecycle — `dispatched | in-progress | blocked | merged | abandoned` — as a concrete labelled digraph, and computes its [reachability](teaching/explanations/reachability.md) relation to answer "which states can a task ever reach from `dispatched`?".

## Step 1: Define the state set

The corpus's task-orchestration spec (per the work-orchestration discipline) commits to five task states:

$$V = \{\texttt{dispatched}, \texttt{in-progress}, \texttt{blocked}, \texttt{merged}, \texttt{abandoned}\}.$$

## Step 2: Define the labelled transitions

Each transition is an edge with a label naming the trigger event:

| Edge | Label |
|---|---|
| dispatched $\to$ in-progress | `start` |
| in-progress $\to$ blocked | `block` |
| in-progress $\to$ merged | `merge` |
| in-progress $\to$ abandoned | `abandon` |
| blocked $\to$ in-progress | `unblock` |
| blocked $\to$ abandoned | `abandon` |
| dispatched $\to$ abandoned | `abandon-before-start` |

So $|E| = 7$, with `merged` and `abandoned` as terminal states (no outgoing edges).

## Step 3: Identify the underlying [directed graph](../objects/directed-graph.md)

Strip the labels: vertices and edges form a 5-vertex 7-edge digraph. There is a 2-cycle on $\{$ in-progress, blocked $\}$ (transitions in both directions); the digraph is *not* a [DAG](../objects/dag.md). The two terminal states `merged` and `abandoned` are sinks (out-degree 0).

## Step 4: Compute reachability

The [reachability](teaching/explanations/reachability.md) relation $\rightsquigarrow$ is computed by [transitive closure](../morphisms/transitive-closure.md):

| From \ To | dispatched | in-progress | blocked | merged | abandoned |
|---|---|---|---|---|---|
| dispatched | reflexive | ✓ | ✓ | ✓ | ✓ |
| in-progress | – | reflexive | ✓ | ✓ | ✓ |
| blocked | – | ✓ | reflexive | ✓ | ✓ |
| merged | – | – | – | reflexive | – |
| abandoned | – | – | – | – | reflexive |

So from `dispatched` every state is reachable; from `merged` only `merged`; the strongly connected component is $\{$ in-progress, blocked $\}$.

## Output / Verification

**Witness:** the corpus's task-lifecycle state machine, exhibited as a 5-vertex 7-edge labelled digraph with the reachability table above. The reachability table is reproducible by Warshall's algorithm or by hand from the transition table.

**What it shows:** a state machine is *not* in general a DAG — `in-progress` and `blocked` cycle freely. So topological-sort arguments do not apply to state machines; instead the relevant structural facts are reachability, strongly connected components, and which states are terminal.

## What this exemplifies

This example demonstrates [labelled directed graph](../objects/labelled-graph.md) as a load-bearing object: the labels are not decoration, they identify the trigger event for each transition. It also demonstrates the limits of acyclicity arguments: a digraph that *isn't* a DAG still admits useful structural analysis via reachability and strongly connected components. The corpus's own engineering uses this kind of analysis whenever it asks "can a task in state $X$ ever reach state $Y$?" — and the answer is read off the reachability table.
