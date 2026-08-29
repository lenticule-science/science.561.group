---
type: example
status: verified
depends-on: [predication-settling, four-regime-dichotomy, settling-cohomology, d-frame-cohomology-comparison, strong-mld-via-composed-duality, conflation-strong-mld]
instantiates: [four-regime-dichotomy]
---

# Benchmark: graph-as-E, the 4-cycle $C_4$

A test of predication categories' framework with **non-ordinal $E$**, addressing the [non-ordinal-entity-sets question](questions/non-ordinal-entity-sets.md). Demonstrates that the framework's main theorems (regime classification, cohomology, d-frame structure, strong-MLD orbit type) apply uniformly when $E$ is a graph rather than an ordinal.

The graph: $C_4$ — four vertices $\{a, b, c, d\}$ with edges $a$-$b$, $b$-$c$, $c$-$d$, $d$-$a$ (a 4-cycle). Adjacency: each vertex has exactly 2 neighbors.

## Step 1: Specification

- **Lattice** $\mathbf{L} = \mathbf{2}$.
- **Entity set** $E = V(C_4) = \{a, b, c, d\}$ (a 4-element non-ordinal set with graph structure).
- **Predicate set** $\Pi = \{P\}$, $\mathrm{dom}(P) = E \times E$.
- **Predicate category** $\mathcal{C}$: discrete on $\{P\}$.
- **Closure rule** (graph-adjacency knowledge propagation):

$$\sigma_{\mathrm{adj}} : v(P)(s, x) = \mathbf{t} \;\wedge\; (x, y) \in E(C_4) \;\Longrightarrow\; v(P)(s, y) \geq_k \mathbf{t}.$$

— "Knowledge of $(s, x)$ propagates to graph-neighbors of $x$."

- **Initial increment** $u_0(P)(a, a) = \mathbf{t}$, all other cells $\bot$.
- **Settling bound** $\lambda$ = $4$ (more than enough for closure on a 4-vertex graph).

## Step 2: Regime classification

**Strict regime**, $\kappa = 3$.

Forward trajectory:
- $v_0$: $\{(a,a): \mathbf{t}\}$.
- $v_1 = T(v_0)$: rule fires from $(a,a)$ along edges $a$-$b$ and $a$-$d$: adds $(a,b): \mathbf{t}$ and $(a,d): \mathbf{t}$.
- $v_2 = T(v_1)$: rule fires from $(a,b)$ along $b$-$c$ adding $(a,c): \mathbf{t}$, and from $(a,d)$ along $d$-$c$ adding $(a,c)$ (already added). Also from $(a,b)$ along $b$-$a$ adding $(a,a)$ (already there). Net new: $(a,c): \mathbf{t}$.
- $v_3 = T(v_2)$: rule fires from $(a,c)$ along $c$-$b$ and $c$-$d$ — both targets already $\mathbf{t}$. No new firings. $T(v_2) = v_2$. So $\kappa = 2$, not $3$.

Recompute: $\kappa = 2$, with NSC firings at $\tau = 1$ (adding $(a,b), (a,d)$) and $\tau = 2$ (adding $(a,c)$).

## Step 3: $\mathbf{Ab}$-valued cohomology

Strict regime $\Rightarrow$ $H^{\geq 1}(\mathcal{F}_v) = 0$ by the [strict-regime cohomology vanishing theorem](../theorems/strict-regime-cohomology-vanishing.md). Non-trivial content lives in $H^0$, the post-quiescence settled-cell set:

$$H^0(\mathcal{F}_v) \;=\; \{(a,a), (a,b), (a,c), (a,d)\}.$$

Four cells settled, twelve cells permanently $\bot$. The void cone's apex is the 12 unsettled cells.

## Step 4: d-frame cohomology

Since $H^1 = 0$ in the strict regime, the d-frame $H^1_{\mathbf{dFrm}} = 0$ trivially. The non-trivial d-frame content is at $H^0$: the per-cell d-frame structure.

Per-cell d-frame value (with default labeling: a cell with truth-positive content gets $L_+$ rank 1):
- 4 cells in $H^0$ with $\mathbf{t}$-values: $(a,a), (a,b), (a,c), (a,d)$ all give $D = (\mathbb{Z}, 0, \mathrm{trivial}, \mathrm{trivial})$.
- 12 cells with $\bot$-values: $D = (0, 0, \mathrm{trivial}, \mathrm{trivial})$ (zero d-frame).

Firing-type counts (NSC firings):
- $\tau = 1$: 2 firings, both truth-only ($(a,b)$ and $(a,d)$).
- $\tau = 2$: 1 firing, truth-only ($(a,c)$).

Total: 3 truth-only firings, 0 falsity-only, 0 $\top$, 0 $\bot$ firings.

## Step 5: Verdier dual

Strict regime: $H_1 = 0$, Verdier duality trivial.

## Step 6: Strong-MLD orbit type

All 3 firings are truth-only. By the [strong-MLD theorem](../theorems/strong-mld-via-composed-duality.md): the settling is in a **truth-only orbit** under negation (orbit size 2 — pairs with the negation-image settling, which would be the same graph propagation but starting from $(a,a) = \mathbf{f}$).

By the [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md): all firings are conflation-fixed (every firing's value is $\mathbf{t}$, which is conflation-fixed). So the settling is **conflation-firing-pattern self-dual**.

This is structurally the same Klein-four orbit type as Fibonacci and Thue-Morse: conflation-self-dual but not negation-self-dual. The graph-as-E benchmark joins predication categories' collection of conflation-self-dual settlings.

## Step 7: Literature comparison

This kind of graph closure (transitive closure under adjacency) is well-studied in graph theory and message-passing algorithms. The framework's classification — strict regime, $\kappa = 2$, $H^0$ = 4-cell-set, conflation-self-dual orbit — is consistent with the standard "BFS from $a$ on $C_4$" computation: the BFS reaches all vertices in 2 steps, with depths $0 \to 1 \to 2$ matching $\kappa = 2$.

The corpus's framework adds: cohomological classification (trivial here, but the framework is the same), Klein-four orbit-type structure (the conflation-self-dual stratum), and the d-frame value-category content. None of these are visible in the standard graph-BFS treatment.

## Step 8: What's new

Three substantive findings:

1. **The framework computes correctly with non-ordinal $E$.** The [non-ordinal-entity-sets question](questions/non-ordinal-entity-sets.md) asked which framework results survive when $E$ isn't an ordinal. For the strict regime with graph-E: the answer is "all of them" — regime classification, cohomology, d-frame structure, strong-MLD orbit type all carry over without modification.

2. **The closure ordinal here is graph-diameter-determined.** $\kappa = \mathrm{eccentricity}_a(C_4) = 2$. For other start-vertex / graph combinations, $\kappa$ would be the eccentricity. This is a *clean structural prediction*: for graph-as-E with edge-adjacency closure, $\kappa$ equals the eccentricity of the seed vertex, and the regime is always strict (since graphs have finite diameter).

3. **Conflation-self-duality is generic for graph-E with truth-valued seeds.** Because graph-adjacency closure produces only truth-only firings (no $\top$ or $\bot$ during propagation), the resulting settling is automatically in the conflation-self-dual stratum. **For graph-E with single-evidence-value closure rules, conflation-self-duality is the default.** This is a structural pattern complementing the substitution-case observations.

The framework's content is the *uniform applicability* — graph-E doesn't require special-case theorems. The closure operator $T$ on the graph-presheaf category behaves like any other strict-regime closure operator; the framework's classification machinery applies as-is.

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable by hand or via a small Python script computing the BFS-style closure on $C_4$. (Tool: `tools/predication_categories/theorems/strong_mld_via_composed_duality.py` could be extended with graph-E support; not currently in the canonical-substitutions list.)
- [x] **Triangulation**: BFS-on-graph + corpus closure-operator + eccentricity argument all give $\kappa = 2$ consistently.
- [x] **Literature alignment**: matches standard graph-theoretic BFS from a single vertex.
- [x] **Distinctness or admission**: framework recovers the standard graph computation; the *new* content is the Klein-four orbit-type classification (conflation-self-dual). Genuine, but minimal — the graph case doesn't exercise the framework's distinctive aperiodic / paraconsistent content. To exercise that content, would need a graph closure with paraconsistent-valued initial state or a closure rule that produces $\top$-firings.

## Position in predication categories

First non-ordinal-E benchmark. Verifies that the framework's strict-regime theorems apply uniformly. Identifies *graph-E with edge-adjacency closure* as a structural class within the corpus: characterized by strict regime, eccentricity-determined $\kappa$, conflation-self-dual orbit type.

Open extensions:
- **Graph-E with paraconsistent initial state.** Start with $u_0(P)(a, a) = \top$; the closure propagates $\top$-content through the graph, producing $\top$-firings. Different orbit type.
- **Graph-E with non-strict regime.** Closure rules that don't terminate at finite $\kappa$ — e.g., a rule that depends on the *cardinality* of certain cell sets, which can give limit-ordinal closure on infinite graphs.
- **Other graph examples**: $K_4$ (κ = 1, instant closure), $C_5$ (κ = 2 from any vertex), $P_n$ paths (κ = $n-1$ from one endpoint).

The graph-E benchmark establishes the framework's reach beyond ordinal-E; further graph cases would explore the structural content this opens up.
