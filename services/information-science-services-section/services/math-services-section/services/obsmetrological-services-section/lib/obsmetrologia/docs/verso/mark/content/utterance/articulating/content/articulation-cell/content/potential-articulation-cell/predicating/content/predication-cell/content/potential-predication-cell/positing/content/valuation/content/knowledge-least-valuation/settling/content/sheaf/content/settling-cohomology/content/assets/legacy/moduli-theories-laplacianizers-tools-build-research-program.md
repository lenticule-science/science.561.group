# Research-program report

Generated from the frontmatter graph of 78 notes. Each section is a flag for the mathematician to consider — not a directive. The graph proposes; the mathematician disposes.

## Question readiness

Each open question, classified by the maturity of its `explores:` entities. *Answerable* = every explored entity is a proved theorem or a definition / concept / morphism with at least one characterizing theorem. *Blocked* = some explored entity is at sketch / draft status, or is a definition / concept / morphism with no characterizing theorems yet. *Needs construction* = some explored entity has no note in laplacianizers.

**Tally:** 1 answerable · 0 blocked · 0 need new construction.

### Answerable now

- `obstruction-to-laplacianization`

## Question clusters

Connected components of the open-question graph where two questions are linked iff they share a not-firm explored entity. Multi-question components are roadmap *spines* — clusters of questions gated by the same upstream work. Singletons are independent questions in the parallel *fan*.

### Independent (1 questions)

Open questions sharing no not-firm blockers with any other open question — answerable or advanceable in parallel.

- `obstruction-to-laplacianization`

## Enablement frontier

Entities explored by open questions but loosely characterized (fewer than 3 proven theorems pointing at them). Writing theorems on these would unblock the listed questions. Sorted by unblock-count.

### `laplacianizability` (concept, 1 characterizing theorem)

- explored by `obstruction-to-laplacianization`

## Demand clusters (bottleneck entities)

Entities shared across multiple open questions, leverage-weighted. Leverage = (questions exploring it) × firmness-weight: 1.0 if the entity is itself not firm (sketch theorem / loose definition / missing slug), 0.3 if firm. A not-firm bottleneck shared by many questions is the highest leverage move on the board.


## Realization graph

The `realizes:` relation is the convention's bridge between concepts (roles) and objects/morphisms (realizations of those roles). A concept without realizers is a role nobody has constructed; a construction without a `realizes:` declaration is unanchored conceptually.

**Concepts without realizers (2):** roles described but no declared realization in laplacianizers. Either implicit demand for an object/morphism that realizes them, or the concept is currently aspirational.

`hodge-laplacian`, `laplacianizer`

**Constructions without `realizes:` (0):** objects/morphisms not declaring which concept they realize. Either they don't realize a named concept (legitimate — not every construction needs to), or they realize one but the link is undeclared (implicit demand to declare it).

**Concepts with multiple realizations** (robust concepts earning their cross-construction keep):

- `laplacianizability` realized by: `cellular-sheaf-on-tetrahedron-boundary`, `gauge-fiber-structure`, `moduli-of-triangle-boundary`, `moduli-strata-classification`, `sheaf-laplacian-on-poset`

## Concept-splitting candidates

Concepts whose body has 4+ distinct named sections AND a depends-on chain of 4+ entries — both signals together suggest the body is doing structurally-distinct work that may want splitting into finer concepts.

*(no candidates surfaced this run)*

## Possible unnamed common ancestors

Pairs of open questions whose `explores:` sets overlap moderately (Jaccard 0.2–0.5). The intersection may be a missing entity that would unify the questions and reframe both.

*(no candidates surfaced this run)*

## Concepts without characterizing theorems

Primitives (notional anchors, expected to be loose): *(none)*.

Every non-primitive concept has at least one characterizing theorem.

## Load-bearing pillars

Definitions, concepts, and morphisms depended on by 5+ proven theorems — the structural center of gravity. Changes here ripple through laplacianizers.


## Morphisms without characterizing theorems

0 morphisms have no proven theorem about them. A morphism without theorems is a definition without consequences — either the consequences are baked into theorems about its source/target instead, or the morphism is awaiting characterization.

