---
type: narrative
status: current
discusses: [closure-2-monad, settling-endofunctor, four-bilattice, four-regime-dichotomy, settling-cohomology, aperiodic-classifying-invariant, internal-z2-gauge, strong-mld-via-composed-duality, d-frame-verdier-composition]
---

# Geometries of failure, dynamics of the void

A clarifying narrative reframing predication categories' content under the lens of *failure-geometry* and *void-dynamics*. The [cone-and-apex narrative](cone-and-apex-structure.md) named the universal vertices the corpus accumulates toward; this narrative names what's *not* at the apex — the structural content of unsettled, indeterminate, undetermined, void content.

Together with the cone-apex view, this gives a complementary reading of predication categories' structural skeleton.

## Where the void lives in the corpus

The bilattice $\mathbf{FOUR}$ has $\bot$ — the apex of the *least*-information cone, the void. $\bot$ is the bilattice element representing "no evidence, no determination, not-yet-phenomenal." As the [cone-and-apex narrative](cone-and-apex-structure.md) notes, $\top$ is the apex of the knowledge-order cone (max information). $\bot$ is its dual — the apex of the dual cone, the *minimum*-information universal vertex.

The corpus's [Klein-four bilattice symmetry](../questions/bilattice-klein-four-symmetry.md) splits the bilattice's involutions cleanly:

- **Negation** ($\mathbf{t} \leftrightarrow \mathbf{f}$) acts on the *truth axis*, fixing the void/fullness axis. Used extensively in strong-MLD and d-frame-Verdier-composition.
- **Conflation** ($\bot \leftrightarrow \top$) acts on the *void/fullness axis*, fixing the truth axis. Now formalized via the [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md): conflation-self-dual settlings are exactly those whose firings live on the truth axis $\{\mathbf{t}, \mathbf{f}\}$, complementary to the negation-self-dual stratum.

Both involutions sit inside the [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md): the order-swap $\sigma$ extends Klein-four to the 8-element group $G_8 = \langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$, exchanging $\leq_k$- and $\leq_t$-closure theories. So both axes — *determination* (truth vs. falsity) and *void/fullness* (no-information vs. over-determination) — now have structural results, with the conflation axis the more recently developed.

## The four-regime dichotomy as void-shrinkage taxonomy

Read the [four-regime dichotomy](../theorems/four-regime-dichotomy.md) under the void-dynamics lens:

- **Strict** ($\kappa < \omega$): the void empties in finite time. Closure terminates fast; every cell is determinate within finitely many stages.
- **Scott-continuous** ($\kappa = \omega$): the void empties at the natural countable limit. Settling stages converge at $\omega$.
- **Transfinite-bounded** ($\omega < \kappa < \omega_1$): the void empties at some countable but transfinite ordinal. Slowly, but it does empty.
- **Aperiodic** ($\kappa \geq \omega_1$): **the void never fully empties at any countable ordinal**. There's always residual undetermined content at every $\tau < \omega_1$.

So the four regimes are four taxa of void-shrinkage rate. The aperiodic regime is precisely the regime of *persistent void* — settlings whose unsettled content remains uncountable at every countable stage. This is predication categories' most distinctive regime, and the one where most structural content lives.

## Cohomology as failure-geometry

The corpus's cohomology has a clean failure-geometric reading:

- $H^1(\mathcal{F}_v) = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$, with one generator per non-Scott-continuous firing.
- Each $\mu \in L_{\mathrm{ns}}$ is a *point where Scott-continuity fails* — a discontinuity in the determination-dynamics.
- The cohomology classifies the *geometry of these failure-points*.

Aperiodic settlings have uncountable cohomological complexity precisely because their void has uncountably many discontinuities. The corpus's [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is, structurally, a *complete invariant of the failure-geometry of void-shrinkage*.

Cones can fail to have apexes (per the [cone-and-apex narrative](cone-and-apex-structure.md)'s "apex failures" section): when the diagram doesn't terminate, when the colimit is unbounded, when the realizable image is empty. Each is a flavor of structural failure — places where universality fails to converge. The corpus's [four-regime dichotomy](../theorems/four-regime-dichotomy.md) and [realizability program](realizability-program.md) are essentially *characterizations of when cone-apex existence is well-behaved*.

## What's there to look at, under this lens

The lens originally made three under-developed pieces visible. All three now have at least partial development:

### 1. Conflation as a structural operation on void/fullness

The Klein-four symmetry's *conflation* involution is the natural void-dynamics operation: $\bot \leftrightarrow \top$ exchanges $\bot$-cells with $\top$-cells. The [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md) characterizes the conflation-self-dual stratum: settlings whose firings are entirely on the truth axis $\{\mathbf{t}, \mathbf{f}\}$, never producing $\bot$-firings or $\top$-firings. This is complementary to the negation-self-dual stratum (firings entirely on $\{\bot, \top\}$). Empirical Klein-four classification on named substitutions is in the [Klein-four self-duality benchmark](../examples/klein-four-self-duality-on-named-substitutions.md).

### 2. The void cone explicitly

Each cone in the [cone-and-apex narrative](cone-and-apex-structure.md) has a dual: the void cone — the descending family $\{V_\tau\}$ where $V_\tau = \{(s, o, q) : v_\tau(q)(s, o) = \bot\}$. The [void-cone-structure narrative](void-cone-structure.md) develops this explicitly; the [void-cone cohomology theorem](../theorems/void-cone-cohomology.md) gives $H^0(\mathrm{Void}_v) \cong \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$, dually paired with apex $H^1$ via firing-ordinal indexing. The [Lorentzian apex/void as timelike/spacelike theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md) gives a physics-flavored realization: the void cone's apex $V_\infty$ records spacelike-separated event pairs in causal-set settlings.

### 3. Backward dynamics as void-creation

Forward closure shrinks $|V_\tau|$; the [cosettling object](../objects/cosettling.md) gives the corresponding backward-running construction, with the [backward-closure-recovers-forward-trajectory theorem](../theorems/backward-closure-recovers-forward-trajectory.md) showing backward iteration reconstructs the forward trajectory's initial-state space. The "co-cohomology of stratification" that forward void-shrinkage suggested is still open — what backward iteration's cohomology classifies remains a sub-question of [cosettling-backward-direction](../questions/cosettling-backward-direction.md).

## Connection to agentics and agential reality

Under this lens, agents are naturally read as **dynamics of the void**:

- An agent is the closure operator that organizes void into apex.
- Agential disagreement = different void-shapes in the multi-observer setting.
- The four regimes classify agents by void-shrinkage rate: strict agents settle fast (and therefore "stop"); aperiodic agents have $\omega_1$-persistent void (and therefore *keep going*).
- **Aperiodic agents are precisely those with continuing agency.** Finite agents end; transfinite-bounded agents end (eventually); aperiodic agents persist. The aperiodic regime is structurally what "ongoing agency" looks like.

Conflation, technically, is the involution $\bot \leftrightarrow \top$ on cell values — exchanging $\bot$-cells (no information) with $\top$-cells (paraconsistent information). At the firing-pattern level, conflation swaps a settling's $\bot$-firings with its $\top$-firings while fixing truth-only firings. The Klein-four group structure means agents have access to four primitive transformations (identity, negation, conflation, both); most agential models work only with negation, the corpus accommodates all four. Agential interpretation of the conflation orbit — what an agent's behavior looks like as it crosses a conflation involution — is a sub-question of the [tunneling-and-agential-dynamics narrative](tunneling-and-agential-dynamics.md), where it would correspond to a *rule perturbation* mapping the closure operator to its conflation-conjugate.

The strong-MLD theorem's self-dual orbit (every firing is $\top$) is, agentially, the *radically paraconsistent* stratum: every closure step adds simultaneously-affirmed-and-negated content. The complementary stratum (every firing is $\bot$) is the *unrelieved-uncertainty* extreme — closure progresses through stages but never resolves any cell. Most actual agents sit between these poles.

## Position in predication categories

This narrative is *clarifying*, not *generative* — it doesn't propose new theorems but reorganizes predication categories' existing content under a complementary lens. Together with the [cone-and-apex narrative](cone-and-apex-structure.md), it provides two paired readings of predication categories' structural skeleton:

- **Cone-and-apex**: where universality converges to. The geometry of *success* — what's well-defined, what stabilizes, what classifies.
- **Failure / void**: where universality fails to converge, what stays unsettled, what dynamics the void itself has. The geometry of *the apex's complement*.

Most of predication categories' content lives at the intersection: the aperiodic regime, where apex-having behavior is most subtle (cones converge at $\omega_1$ but with non-trivial cohomological obstruction), and where void-dynamics is most persistent (the void doesn't fully empty at any countable stage).

The framework's distinctive content — paraconsistency, four-regime classification, cohomological invariants of failure-points, Klein-four-equivariant structure — all sits naturally under this lens. Under the apex lens it looks like "structures that classify $\omega_1$-bounded universal-cone limits"; under the void lens it looks like "structures that classify $\omega_1$-bounded void-dynamics"; the two are dual and the framework is doing both.
