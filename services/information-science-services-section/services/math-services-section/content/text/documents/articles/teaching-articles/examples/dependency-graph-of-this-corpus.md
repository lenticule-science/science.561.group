---
type: example
status: reproducible
instantiates: [dag, directed-graph, dependency-soundness-iff-dag, topological-sort]
depends-on: [dag, directed-graph, dependency-soundness-iff-dag, topological-sort, transitive-closure, acyclicity]
---

# Dependency graph of this corpus

The corpus's own `depends-on:` graph: a [directed graph](../../../../glossary/terms/directed-graph.md) $D$ whose vertices are the typed notes of the corpus and whose edges encode the `depends-on:` declarations in note frontmatter. This example exhibits $D$ as a concrete instantiation of [dag](../../../../glossary/terms/dag.md), [directed-graph](../../../../glossary/terms/directed-graph.md), and [dependency-soundness-iff-dag](../../research-articles/dependency-soundness-iff-dag.md): the graph is required to be a DAG, the toolkit checks acyclicity, and the renderer's linear reading order is the [topological sort](../../../../glossary/terms/topological-sort.md) of $D^{\mathrm{op}}$.

## Step 1: Define the graph

- **Vertex set** $V$ — every typed note in the corpus, identified by its slug. As of this directory's authoring, $|V|$ is on the order of $10^3$ (concept, object, morphism, theorem, example, narrative, question, reference notes across all theories) with growth as the corpus matures.
- **Edge set** $E$ — for each note $u$ and each entry $v$ in $u$'s `depends-on:` frontmatter list, an edge $(u, v) \in E$. (Other relations like `realizes:`, `instantiates:`, `explores:` produce edges in their own typed sub-graphs, distinct from $D$.)

The slug-resolution rule (a `depends-on: [foo]` entry in note $u$ resolves to the note in $u$'s theory named `foo`, then upstream, then in `library/`) is what gives every edge a definite target vertex.

## Step 2: Inspect the local structure

Within this directory, the `depends-on:` edges form a small DAG. A handful of representative edges:

- `objects/graph` $\to$ `concepts/vertex`, `concepts/edge`, `concepts/incidence`
- `objects/directed-graph` $\to$ `concepts/vertex`, `concepts/edge`, `concepts/incidence`, upstream `sets/objects/ordered-pair`
- `objects/tree` $\to$ `objects/graph`, `concepts/connectivity`, `concepts/acyclicity`, `concepts/cycle`, `concepts/path`
- `theorems/dependency-soundness-iff-dag` $\to$ `objects/dag`, `objects/directed-graph`, `concepts/acyclicity`, `concepts/cycle`, `concepts/reachability`, `morphisms/topological-sort`, `morphisms/transitive-closure`, `theorems/dag-topological-sort`

Each edge is a strict logical-dependency claim: the target's content is presupposed by the source. Cycles among these edges would be a soundness diagnostic per [dependency-soundness-iff-dag](../../research-articles/dependency-soundness-iff-dag.md).

## Step 3: Verify acyclicity within this directory

The `depends-on:` edges within this directory all flow *toward* concepts (the lowest layer), and within concepts toward `vertex` and `edge` (the primitive ones). No edge goes from a concept back to an object or theorem. So the within-directory subgraph is a DAG by visible inspection. The corpus-wide check is performed by the FARS toolkit's `fars validate` machinery; the open question of binding that check to this theorem is tracked in [questions/fars-dependency-graph-binding](../../research-articles/questions/fars-dependency-graph-binding.md).

## Step 4: Topological sort

By [dag-topological-sort](../../research-articles/dag-topological-sort.md), $D^{\mathrm{op}}$ admits a topological sort. Within this directory, one valid topological reading order is:

1. The 12 `concepts/` notes (vertex, edge first, then incidence, adjacency, path, cycle, …).
2. The 14 `objects/` notes (graph, directed-graph first, then specializations).
3. The 8 `morphisms/` notes.
4. The 8 `theorems/` notes.
5. The 5 `questions/` notes.
6. The 3 `narratives/` notes (or interleaved per their `discusses:`/`introduces:` positioning).
7. The 6 `examples/` notes (placed *after* what they instantiate, per `instantiates:`).

The corpus-wide topological sort is computed by the renderer using the same algorithm.

## Output / Verification

**Witness:** the corpus's `depends-on:` graph is a DAG (by toolkit check) and admits a topological sort (by [dag-topological-sort](../../research-articles/dag-topological-sort.md)) that produces a sound reading order (by [dependency-soundness-iff-dag](../../research-articles/dependency-soundness-iff-dag.md)).

**Reproducibility:** run `fars validate library/` against the current corpus; the toolkit walks $D$, checks acyclicity, and emits the topological sort. The check is reproducible at any commit; the specific sort produced may differ across runs (linear extensions of a DAG's reachability partial order are not generally unique).

## What this exemplifies

The [dependency-soundness-iff-dag](../../research-articles/dependency-soundness-iff-dag.md) theorem is abstract until it is exhibited on the graph the corpus actually has. This example does that: it names $D$, walks through small subgraphs of it, demonstrates within-directory acyclicity by inspection, and points at the toolkit-level check for the corpus-wide claim. It also makes visible *why* the theorem matters — a corpus whose dependency graph is not a DAG cannot be linearly read, which would defeat the renderer and the whole topological-reading discipline. The corpus's commitment to typed `depends-on:` is structurally underwritten by the fact that the graph it produces happens to be a DAG, and this example is the witness.
