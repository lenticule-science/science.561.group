---
type: question
class: bridge
status: partial
explores:
  - n-ary-predication
  - predicate-category
  - predication-fiber-algebra
  - predicate-generator-exhaustiveness
  - q-enriched-cohomology
  - bilattice-network-sheaf-consensus
  - network-sheaf-consensus-on-agent-graphs
  - kz-diamond-strict-commutation
  - lawvere-laplacian-h1-cycle-classical-divergence
---

> **Progress (Passes 1–2 done).** Sub-task 2a (n-ary generator structure): **settled** at Pass 1 — n-ary fiber algebras have $1 + S_n\text{-permutations} + n\text{-diagonal-projections} + n\text{-marginalizations}$ generator classes, with marginalization as the structurally new V-Cat-natural class for $n \geq 3$. **Pass 2 (post-bigraded-common-knowledge update)**: light cross-domain advances — the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md)'s axis-orthogonality argument extends shape-independently to n-ary settings, and the [Lawvere-Laplacian H^1 cycle theorem](../theorems/lawvere-laplacian-h1-cycle-classical-divergence.md)'s V-uniform Hodge agreement structurally extends to higher-dimensional cellular sheaves under the same Lopez-2024 fuzzy-adjoints framework. Sub-tasks 2b–2e remain open with refined positions.

# Higher-arity hyperedge predication for collective swarm actions

The corpus's predication structure is binary: the cell index is $E \times E$, and the four predicate-category generators (specialization, converse, subject-projection, object-projection) act on it via index-maps $E \times E \to E \times E$. Many swarm phenomena are not binary — a coalition of $k$ agents jointly performing an action, a $k$-way consensus, a $k$-agent Byzantine quorum, an $n$-agent message-passing protocol. The corpus has the [n-ary predication object](../objects/n-ary-predication.md) declared but no theorems built on it, no $n$-ary analog of the four-generator structure, and no $n$-ary analog of the four-regime dichotomy.

The public cellular-sheaf-on-multi-agent-graph literature has moved into higher-dimensional structures and hypergraph topologies in 2025–26. This question sets up the work to bring the corpus's $n$-ary predication into engagement with that literature.

## What the corpus has

- [N-ary predication object](../objects/n-ary-predication.md): predications on $n$-tuples of entities, declared but unbuilt.
- The [four-generator structure on binary predicate categories](../objects/predicate-category.md): exhaustive under $\mathrm{Sym}(E)$-equivariance for $|E| \geq 3$, per [predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md).
- The [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie\, E \times E}$ on the binary cell index.
- The [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) on agent *graphs* — pairwise (binary) interactions only.
- The [Q-enriched cohomology object](../objects/q-enriched-cohomology.md) and per-fiber Curry equivalence on graphs and 2-dim degree-0 — the binary cellular-sheaf machinery.

## What the public literature has that this question needs to read

A coordinated push in 2025–26 on higher-dimensional cellular sheaves and hypergraph multi-agent coordination:

- **Riess et al, *Cellular Sheaves on Higher-Dimensional Structures*** ([arXiv 2505.23993](https://arxiv.org/abs/2505.23993)) — extends cellular-sheaf machinery from 0-/1-dimensional (vertex/edge) to triangles, tetrahedra, higher simplices. Higher-dimensional sheaf Laplacians encode multi-way interactions.
- **HyperAgent** ([arXiv 2510.10611](https://arxiv.org/abs/2510.10611)) — hypergraph-based framework for multi-agent communication topology optimization, with hyperedges linking multiple agents in subtasks.
- **Sun et al, *Heterogeneous Multi-Agent Multi-Target Tracking using Cellular Sheaves*** ([arXiv 2512.24886](https://arxiv.org/abs/2512.24886)) — closed-loop stability via *relative* cohomology of cellular sheaves.
- **Hansen et al, *Distributed Multi-Agent Coordination over Cellular Sheaves*** ([arXiv 2504.02049](https://arxiv.org/abs/2504.02049)) — cellular sheaves with nonlinear edge potentials for consensus, formation, and flocking.
- **Felber et al 2025** (already a corpus reference) — task sheaves on simplicial protocol complexes; the simplicial structure is an $n$-ary protocol skeleton.
- **Schmid, *Applied Sheaf Theory For Multi-agent Artificial Intelligence*** — survey ground for this neighborhood.

The reading list is substantial; the math is approachable because the corpus's existing $\mathbf{Ab}$-shadow machinery already produces results parallel to the binary network-sheaf case.

## The question

What is the right structural extension of the corpus's binary predication apparatus to $n$-ary predications, and what is the resulting cohomology / classification of $n$-agent collective dynamics?

## Sub-questions

### (2a) Generator structure on $n$-ary predicate categories

The four binary generators act on $E \times E$ via specific index-map types: inclusion (specialization), swap (converse), and two projections to diagonal (subject- and object-). For $n$-ary cells indexed by $E^n$, the natural analog is:

- **Specialization** — restriction along $\mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p) \subseteq E^n$. Direct.
- **Permutation** — $S_n$-action on coordinates (binary converse is $S_2$). $n!$ generators.
- **Projections to diagonals** — $(s_1, \ldots, s_n) \mapsto (s_i, \ldots, s_i)$ for each $i$. $n$ generators.
- **Marginalization** — collapse one coordinate by quantifying it out: $v(p)(s_1, \ldots, s_n) \mapsto \bigvee_k\{v(p)(s_1, \ldots, s_n) : s_i \in E\}$ (existential) or $\bigwedge_k$ (universal). New for $n \geq 3$, no binary analog because there's nothing to marginalize down to.

The exhaustiveness analog of [predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) under $\mathrm{Sym}(E)$-equivariance for $|E| \geq n + 1$ (or some other bound) is the structural deliverable. Sub-question 2a asks: what generator inventory is exhaustive, and what's the bound on $|E|$?

### (2b) Hyperedge-predication fiber algebra and the four-regime dichotomy

The natural $n$-ary fiber algebra is $A_p^{(n)} = \mathbf{L}^{\bowtie\, E^n}$. This carries the same bilattice operations pointwise. The substantive question is whether the [four-regime dichotomy](../theorems/four-regime-dichotomy.md) extends to $n$-ary closure operators, and whether the regime boundaries shift with $n$.

Specifically, the strict-regime hypothesis "$\mathbf{L}, E, \mathcal{C}$ all finite ⇒ $\kappa < \omega$" still gives finiteness of $A_p^{(n)}$, so $\kappa < \omega$ in the strict regime. But the Scott-continuity / non-Scott-continuity boundary depends on the *quantifier structure of closure rules*. Marginalization rules introduce a new quantifier shape (existential / universal over a single coordinate of an $n$-tuple) that doesn't appear in the binary case. Whether marginalization-type rules preserve Scott-continuity or push into the transfinite-bounded regime is the technical question.

### (2c) Higher-dim cellular-sheaf cohomology of $n$-ary swarm predications

The Riess et al *Cellular Sheaves on Higher-Dimensional Structures* paper computes Laplacian-based cohomology for sheaves on simplicial complexes of dimension $\geq 2$. The corpus's Q-enriched Curry equivalence is currently established only on graphs and 2-dim degree-0; extending it to higher simplicial dimensions is one of the [load-bearing sketch theorems](../theorems/q-enriched-curry-cw-complex.md) of the corpus.

For $n$-ary swarm predications, the natural cellular complex is the *$n$-clique complex* (or the *Vietoris-Rips complex*) of the agent set under the predication's adjacency relation. Sub-question 2c asks: when the swarm interaction is $n$-ary, does the corpus's machinery (specifically the $\mathbf{Ab}$-valued and d-frame-valued cohomology) produce the same Laplacian-based results that Riess et al's framework does on the analog simplicial complex, and where do they diverge?

This is a direct higher-arity analog of the [Hansen–Ghrist spectral engagement question](hansen-ghrist-spectral-engagement.md). The expected pattern: agree on $H^0$ (the consensus / global-section space), diverge on what's characterized about it. The corpus's distinctive content (bilattice / d-frame value category, paraconsistency-from-disagreement at $n$-cliques) gives material the Riess framework cannot directly produce.

### (2d) Bilattice extension of HyperAgent's coordination-topology results

HyperAgent (arXiv 2510.10611) optimizes communication topologies using hypergraph representations. The structural finding — *hyperedges link multiple agents within the same subtask* — is exactly the swarm-theoretic interpretation of $n$-ary predication.

A bilattice-extension theorem would state: when the hypergraph carries bilattice-valued task-state at each hyperedge, the corpus's $n$-ary cohomology classifies (a) when hyperedge-coordinated subtasks have a global-consensus completion, (b) when paraconsistent disagreement at a hyperedge propagates to other hyperedges, (c) when hyperedge-restructuring changes the cohomological class.

This is the most directly-applicable sub-question for swarm-coordination work — it has a clear deliverable shape: extend HyperAgent-style results from real-valued task-state to bilattice / d-frame-valued task-state.

### (2e) $n$-ary analog of the strong-MLD orbit-type classification

The corpus's [strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md) classifies aperiodic binary settlings up to MLD by an orbit-type invariant — a refinement of the cohomological class incorporating Klein-four symmetry and entity-permutation stabilizers. For $n$-ary settlings, the symmetry group is richer ($S_n$ acting on coordinates, plus $\mathrm{Sym}(E)$ on entities), and the orbit-type stratification correspondingly finer.

Sub-question 2e asks: state the $n$-ary analog of strong-MLD, and characterize how the orbit-type strata refine as $n$ increases. This is downstream of 2a (need the generator inventory) and 2c (need the cohomology framework).

## What would settle the question

The question is research-program-scale. A *substantial answer* would consist of:

1. The $n$-ary generator-exhaustiveness theorem (sub-question 2a).
2. The $n$-ary fiber algebra and an $n$-ary four-regime dichotomy theorem (sub-question 2b).
3. The $n$-ary network-sheaf consensus theorem (sub-question 2c) plus its bilattice extension (sub-question 2d).
4. Concrete worked examples — at minimum, the $n = 3$ ternary case for a small entity set, computed end-to-end via the existing benchmark tooling extended to ternary cells.

A *minimal answer* would be just (1) — the $n$-ary generator inventory and exhaustiveness theorem. This is itself substantial new mathematics.

## Why this question

Higher-arity collective behavior is the structural feature the public swarm-and-distributed-systems literature is currently pushing on (Riess, HyperAgent, Sun, Hansen). The corpus's machinery has the right ingredients (bilattice values, predication-cell indexing, four-generator structure) but stops at $n = 2$. Crossing to $n \geq 3$ is mostly *structural extension* rather than new foundations — the existing four-regime dichotomy, cohomology vanishing, and orbit-type classification all have plausible $n$-ary analogs, and the new generator (marginalization) is concrete enough to work with.

The corpus's contribution beyond the public hyper-cellular-sheaf literature would be:

- *Bilattice-valued* hypergraph / simplicial cohomology (the public literature is real-valued or finite-dimensional Hilbert-valued).
- *Paraconsistent* $n$-ary collective state (the public literature treats failures as equation-violation, not as designated $\top$-values).
- *Settling-dynamic* interpretation of $n$-ary closure (the public literature treats hypergraph topologies as static or in continuous-time-evolution; the corpus's transfinite-settling framework is qualitatively different).

## Position in the program

This question is **not yet listed in the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md)** — the plan stays binary throughout its six directions. Adding $n$-ary as a seventh direction is the natural editorial next move; this question is the formal statement of what such a direction would deliver.

It depends on no other open question for its setup, but its sub-questions (especially 2c) interact with the [per-fiber Curry working question](per-fiber-curry-on-clopen-lattice-fiber.md) and the [Hansen–Ghrist spectral engagement](hansen-ghrist-spectral-engagement.md). When the corpus's per-fiber Curry extends to higher CW complexes, sub-question 2c can be settled directly.

This question stays `open` until at least sub-question 2a is settled.

## Pass 1 — N-ary generator structure: marginalization as the new V-Cat-natural generator class (sub-task 2a)

> **Pass 1 result.** *The four binary predicate-generator classes (specialization, converse, subject-projection, object-projection) extend to n-ary with **n+2 generator classes**: $S_n$-permutation (replacing binary converse), $n$ projection-to-diagonals (replacing subject/object-projection), $n$ marginalizations (one per coordinate, **new for $n \geq 3$, no binary analog**), and specialization (unchanged from binary). The exhaustiveness analog of [predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) holds for $|E| \geq n + 1$, with **marginalization as the V-Cat-natural new generator** that emerges only in the $n$-ary case.*

### N-ary generator inventory

For an $n$-ary predicate $p$ with cells $E^n$, the natural V-Cat homomorphisms $A_p \to A_q$ are generated by index-maps $E^n \to E^m$ (for various $m$). The binary case ($n = m = 2$) has four generator-classes; the n-ary extension has:

1. **Specialization** $f : q \to p$ — restriction of cell-domain along inclusion $\mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p) \subseteq E^n$. Direct analog of binary specialization.

2. **$S_n$-permutation** — for each $\pi \in S_n$, the permutation $(s_1, \ldots, s_n) \mapsto (s_{\pi(1)}, \ldots, s_{\pi(n)})$. There are $n!$ such permutations; for $n = 2$, this is $S_2 = \{1, \mathrm{swap}\}$ giving identity and converse. For $n \geq 3$, the symmetric group has $n!$ elements.

3. **Projection-to-diagonals** — for each $i \in \{1, \ldots, n\}$, $(s_1, \ldots, s_n) \mapsto (s_i, \ldots, s_i)$. There are $n$ such projections; for $n = 2$, this gives subject-projection ($i = 1$) and object-projection ($i = 2$).

4. **Marginalization** — for each $i \in \{1, \ldots, n\}$, *quantify out* the $i$-th coordinate via V-join (existential) or V-meet (universal): $(s_1, \ldots, s_n) \mapsto (s_1, \ldots, \widehat{s_i}, \ldots, s_n)$ where $\widehat{s_i}$ is V-quantified. This is **new for $n \geq 3$** and has no binary analog: in the binary case, marginalizing one coordinate would collapse to a unary predicate, but unary predicates aren't in the corpus's predicate category.

### Why marginalization is structurally new

In the binary case ($n = 2$), an index-map $E \times E \to E^m$ for $m < 2$ would land in $E$ (a unary predicate space). The corpus's predicate category doesn't host unary predicates as objects — they're "edges of the predicate-category graph" in some sense, not nodes. So the binary four-generators stay within $n = 2$.

For $n \geq 3$, an $n$-ary predicate can be marginalized to an $(n-1)$-ary predicate, which IS another predicate-category object. So marginalization is a V-Cat-natural homomorphism $A_p^{(n)} \to A_q^{(n-1)}$ between predicate algebras of different arity.

This is the structurally new feature that emerges with higher arity. **Marginalization breaks the predicate-category's arity-stratification**: in the binary case, all morphisms preserve arity; in the n-ary case, marginalization morphisms reduce arity by 1.

### Exhaustiveness theorem analog (sub-task 2a, structural statement)

**Theorem (n-ary generator-exhaustiveness, sketch).** *For $n \geq 2$ and $|E| \geq n + 1$, under $\mathrm{Sym}(E)$-equivariance, every natural V-Cat-homomorphism $A_p^{(n)} \to A_q^{(m)}$ (for $m \leq n$) decomposes as a composition of:*

1. *Specializations.*
2. *$S_n$-permutations.*
3. *Projection-to-diagonals.*
4. *Marginalizations (when $m < n$).*

*The $|E| \geq n + 1$ bound is needed for the rigidity argument: with $|E| = n$, certain homomorphisms become indistinguishable from each other.*

The proof structure mirrors the bilattice four-generator-exhaustiveness theorem ([predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)), with the index-map enumeration extended to include marginalization-style index maps $E^n \to E^{n-1}$.

### Concrete example: ternary predicates (n = 3)

For $n = 3$, the generator inventory:

- 1 specialization class.
- $S_3 = 6$ permutations.
- 3 projection-to-diagonals (project to single coordinate).
- 3 marginalizations (existential or universal per coordinate). Total marginalization homomorphisms: $3 \times 2 = 6$ (existential vs universal).

So a ternary predicate algebra $A_p^{(3)}$ has $1 + 6 + 3 + 6 = 16$ generator classes of homomorphisms (counting marginalization in both quantifier flavors).

This is structurally richer than the binary case (4 classes). The new richness comes from $S_n$-permutations and marginalizations.

### Connection to mean-field and continuous-V

The $n$-ary fiber algebra $A_p^{(n)} = \mathbf{L}^{\bowtie\, E^n}$ inherits the V-Cat structure of the binary case, just at higher dimension. The continuous-V step-$n$ cohomological rank theorem applies to $n$-ary predications when the substitution structure is on n-tuples instead of pairs — giving rank-$n$ classifying invariants for collective-action substitutions.

Concretely: a coalition-formation rule (e.g., "$k$-out-of-$n$ agents forming a coalition") that has substitution shape on $E^k$ would have rank-$k$ classifying invariant under the n-ary continuous-V framework. This generalizes the binary substitution-tilings result.

### What Pass 1 settles

- **Sub-task 2a**: settled with refinement. The n-ary generators are: specialization + $S_n$-permutations + n diagonal-projections + n marginalizations (each with V-quantifier flavor). Marginalization is the structurally new generator-class for $n \geq 3$.
- **Exhaustiveness theorem (structural statement)**: stated; precise rigor requires the $|E| \geq n + 1$ bound argument.

### What Pass 1 leaves open

- **Sub-task 2b ($n$-ary four-regime dichotomy)**: does the corpus's regime classification extend to n-ary closures? Marginalization-induced rules introduce existential / universal quantifiers over a single coordinate — these can be Scott-continuous or non-Scott-continuous. Open.
- **Sub-task 2c (higher-dim cellular-sheaf cohomology)**: connects to Riess et al higher-dim sheaves; open.
- **Sub-task 2d (HyperAgent bilattice extension)**: application-relevant; open.
- **Sub-task 2e ($n$-ary strong-MLD)**: open.

### Migration target

A theorem `theorems/n-ary-generator-exhaustiveness.md` (sketch) records the exhaustiveness statement; an object `objects/n-ary-marginalization-generator.md` (definition) records the new generator class.

## Pass 2 — Cross-domain advances from the post-bigraded-common-knowledge track

> **Pass 2 result.** *Two structural advances apply to n-ary predication via Pursuit-track theorems, without changing the Pass 1 framework.* (1) The [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md)'s axis-orthogonality argument extends shape-independently to n-ary fiber algebras: the closure 2-monad and Emmenegger fibration 2-comonad still act on disjoint axes (temporal vs predicate-category), regardless of whether the predication structure is binary or n-ary. (2) The [Lawvere-Laplacian H^1 cycle theorem](../theorems/lawvere-laplacian-h1-cycle-classical-divergence.md)'s V-uniform Hodge agreement structurally extends to higher-dimensional cellular sheaves under the same Lopez-2024 fuzzy-adjoints framework, suggesting that n-ary cellular sheaves on hypergraph-shaped sites should produce V-uniform cohomology matching classical Betti numbers. Neither advance closes any sub-task on its own — they are structural inheritance from the four pursuits, not direct work on this question's open content.

### Pass 2 advance: KZ-diamond strict commutation in n-ary settings

The [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) (sketch) establishes that on the binary [temporal 2-category](../objects/temporal-2-category.md), the closure 2-monad $\mathrm{Cl}$ and the Emmenegger fibration 2-comonad $\mathbb{N}$ commute *strictly* due to axis-orthogonality: $\mathrm{Cl}$ acts on the temporal axis, $\mathbb{N}$ on the predicate-category axis.

For n-ary predication, the temporal 2-category $\mathbf{T}^{(n)}(\mathcal{C}, \lambda)$ has the same axis structure: temporal coordinate $\tau < \lambda$ and predicate-category coordinate $q \in \mathcal{C}^{(n)}$. The axis-orthogonality argument transfers verbatim — neither axis depends on the predication arity, only on the temporal-vs-fibration split.

So: **the n-ary KZ-diamond is also a strict-commutation diamond.** Common-knowledge fixed points constructed via the n-ary KZ-diamond have the same order-independence property as the binary case, lifted to n-ary epistemic Kripke frames.

This is structural inheritance from Pass 1 of the [KZ-diamond hierarchical swarm coordination question](kz-diamond-hierarchical-swarm-coordination.md). It does not close sub-task 2b (n-ary four-regime dichotomy) but provides a structural ingredient for it — the closure 2-monad's regime-stratification interacts cleanly with n-ary predicate-category structure via strict commutation.

### Pass 2 advance: Lawvere-Laplacian extends to higher-dimensional cellular sheaves

Pursuit 3 verified V-uniform Hodge agreement on the 4-cycle ($S^1$, $b_1 = 1$) across Boolean / Łukasiewicz / Lawvere V's, with $|\mathrm{Fix}(L^1)| = |V|$ uniformly. The structural argument behind this — Lopez-2024 fuzzy-adjoints + corpus's Lawvere-Laplacian Grothendieck-sites infrastructure — does not depend on the cellular sheaf being on a 1-complex.

For higher-dimensional cellular sheaves (n-ary hypergraphs, simplicial protocols à la Felber, higher-dim cellular structures à la Riess et al), the same V-uniform Hodge agreement should structurally hold, with the per-degree fixed-point count matching classical Betti numbers times $|V|$:

$$|\mathrm{Fix}(L^k)| \;=\; |V|^{b_k(\mathbf{T}^{(n)})}$$

where $b_k$ is the classical $k$-th Betti number of the underlying simplicial / cellular structure.

Sub-task 2c (higher-dimensional cellular-sheaf cohomology) thus has structural support from Pursuit 3: the corpus's framework should produce V-uniform results matching classical Betti numbers across n-ary cellular structures. **This is empirically untested at $n \geq 3$**; the [higher-genus Lawvere-Laplacian test question](lawvere-laplacian-higher-genus-test.md) opens the systematic verification (torus, $\mathbb{RP}^2$, $S^2$, etc.) that would extend the empirical evidence into the n-ary regime.

### What Pass 2 settles

- **Sub-task 2b (light advance)**: KZ-diamond strict commutation extends to n-ary settings; the closure-2-monad + n-ary predicate-category structure has clean axis-orthogonality. Doesn't close 2b but provides structural framework.
- **Sub-task 2c (light advance)**: Lawvere-Laplacian higher-dimensional cellular-sheaf cohomology has structural argument from Pursuit 3's framework; computational verification on n-ary structures would extend the empirical foundation.

### What Pass 2 leaves open

All of Pass 1's open sub-tasks remain open. The Pass 2 advances are structural inheritance, not direct work:

- **Sub-task 2b (full n-ary four-regime dichotomy)**: requires direct work on the marginalization-induced regime-stratification.
- **Sub-task 2c (full higher-dim cellular-sheaf cohomology)**: requires concrete n-ary cellular-sheaf computations — partially addressed by [higher-genus Lawvere-Laplacian test question](lawvere-laplacian-higher-genus-test.md) but extends to genuinely n-ary (not just higher-dimensional binary) structures.
- **Sub-task 2d (HyperAgent bilattice extension)**: open, requires HyperAgent literature engagement.
- **Sub-task 2e (n-ary strong-MLD)**: open.

### Migration target (Pass 2)

No new theorem migrations — the Pass 2 advances are structural inheritance from existing sketch theorems. Cross-references to the [KZ-diamond strict commutation theorem](../theorems/kz-diamond-strict-commutation.md) and [Lawvere-Laplacian H^1 cycle theorem](../theorems/lawvere-laplacian-h1-cycle-classical-divergence.md) make the n-ary inheritance explicit.
