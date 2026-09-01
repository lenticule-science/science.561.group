---
type: narrative
status: current
discusses: [closure-2-monad, settling-endofunctor, four-regime-dichotomy, four-bilattice, settling-cohomology, aperiodic-classifying-invariant, internal-z2-gauge, conflation-strong-mld, d-frame-verdier-composition]
---

# The void cone: dual to the apex cone

A clarifying narrative parallel to [cone-and-apex-structure](cone-and-apex-structure.md). Where the apex cone names what predication categories' diagrams *converge to*, the void cone names what they *converge away from* — the descending family of "what's not yet settled" that mirrors the ascending family of "what's been determined."

The two cones are dual under complementation in the cell space, and together give the corpus a complete picture of *both* the geometry of universal-vertex success (apex side) *and* the geometry of persistent indeterminacy (void side).

## The void cone, formally

For a settling $v$ on a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the **void cone** is the diagram

$$\mathrm{Void}_v : \tau \mapsto V_\tau := \{(s, o, q) \in E \times E \times \mathcal{C} : v_\tau(q)(s, o) = \bot\}$$

indexed by settling stages $\tau < \kappa$, with morphisms the *reverse-inclusions* $V_\sigma \supseteq V_\tau$ for $\sigma \leq \tau$. The void shrinks as settling progresses (more cells become determinate; fewer remain $\bot$).

The diagram's *limit* (= the cone's apex below the diagram, since this is a descending diagram) is

$$V_\infty := \bigcap_{\tau < \kappa} V_\tau$$

— the cells permanently $\bot$ at the closure ordinal: the *limiting void*.

## Apex behavior, regime-by-regime

The void cone's apex $V_\infty$ behaves differently in each of the four regimes:

- **Strict regime** ($\kappa < \omega$): $V_\infty$ may be large. Closure terminates after finitely many stages with substantial cells unsettled. The trivial-settling has $V_\infty = \{(s, o, q) : (s, o, q) \neq \text{seed}\}$ — almost everything stays $\bot$.
- **Scott-continuous regime** ($\kappa = \omega$): $V_\infty$ is the limit of countably many shrinking voids. May be empty or non-empty depending on the rule.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$): $V_\infty$ is the limit of a countably-indexed shrinking family. Generally non-empty (the closure rule didn't fill the entire space).
- **Aperiodic regime** ($\kappa \geq \omega_1$): For canonical aperiodic substitution settlings on $E = \omega_1$, **$V_\infty = \emptyset$** — the substitution eventually places a letter at every position, so the void empties at the closure ordinal.

The aperiodic case has *empty apex*, but with non-trivial intermediate structure: at every $\tau < \omega_1$, $V_\tau$ has cardinality $\omega_1$ (almost-empty void = uncountably many positions still unsettled). The void cone's content is in the *descent rate*, not the apex.

## Duality with the apex cone

The void cone is dual to the [settling cone](cone-and-apex-structure.md#1-the-settling-cone) under cell-space complementation:

- Settling cone diagram: $\tau \mapsto S_\tau := \{(s, o, q) : v_\tau(q)(s, o) \neq \bot\}$ — the *determined* cells.
- Void cone diagram: $\tau \mapsto V_\tau = \{(s, o, q) : v_\tau(q)(s, o) = \bot\}$ — the *undetermined* cells.

For all $\tau$: $S_\tau \cup V_\tau = E \times E \times \mathcal{C}$ (the full cell space) and $S_\tau \cap V_\tau = \emptyset$.

The settling cone's apex $S_\infty$ and the void cone's apex $V_\infty$ are complementary in the full cell space. **The geometry of $S_\infty$ (where the corpus has done all its work) and the geometry of $V_\infty$ (largely unworked) are dual.**

## What's at the void cone's apex

For the aperiodic-substitution case, $V_\infty = \emptyset$ — the apex is structurally trivial. **But the path to that empty apex is not.** The aperiodic regime is characterised precisely by *uncountably many non-Scott-continuous firings* in the descent — uncountably many points where the void shrinks discontinuously.

The cohomology of the void cone (with appropriate sheafification — taking the void as a presheaf of "unsettled-cell information" rather than as a discrete set) would classify these descent-discontinuities. **The void cone's $H^1$ is structurally dual to the settling cone's $H^1$**, with the dual side picking up the same firing-ordinal set $L_{\mathrm{ns}}$ as descent-discontinuities rather than ascent-discontinuities.

For non-aperiodic regimes where $V_\infty \neq \emptyset$, the void cone's apex carries genuine structural content: the cells *never* settled. This is the dual of predication categories' standard $H^0$ (the eventually-settled cells); we could call it $H^0(\mathrm{Void})$.

## Connection to bilattice involutions

The bilattice's [Klein-four symmetry](../questions/bilattice-klein-four-symmetry.md) has a clean reading on the apex/void cone duality:

- **Negation** $\neg$ acts on the truth axis ($\mathbf{t} \leftrightarrow \mathbf{f}$). It commutes with the apex/void distinction — it acts on the *content* of settled cells without affecting whether cells are settled or unsettled. Negation is *cone-preserving*: it acts on each cone individually.

- **Conflation** $-$ acts on the void/fullness axis ($\bot \leftrightarrow \top$). It exchanges the bilattice's apex ($\top$) with its bottom ($\bot$). At the cone level, conflation **swaps the apex cone with the void cone** in some structural sense: cells with bilattice value $\top$ (the apex of the knowledge cone on values) and cells with value $\bot$ (the apex of the void cone on values) are exchanged.

The [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md) characterises settlings whose firing-pattern is fixed under conflation: every firing's value in $\{\mathbf{t}, \mathbf{f}\}$. Equivalently: every firing is *neither* a $\top$-firing (apex-cone-of-values content) *nor* a $\bot$-firing (void-cone-of-values content). Conflation-self-dual settlings are settlings whose firing-content stays *off the apex/void axis* of the bilattice.

This gives a clean reading of the conflation-self-dual stratum: it's exactly the stratum where settlings live entirely on the *truth axis* without touching the *void/fullness axis*. Fibonacci and Thue-Morse with default labelings are in this stratum; Padovan, Tribonacci, Tetranacci are not.

## What naming the void cone gives the corpus

Three concrete contributions:

**1. The descending dual of every existing cone.** The corpus's [eight cones](cone-and-apex-structure.md#the-principal-cones) all have void-side duals. Naming them gives a parallel structure:

| Apex cone (name) | Void cone (dual name) |
|---|---|
| Settling cone (apex $v_\kappa$) | Void cone (apex $V_\infty$) |
| Cohomology cone (apex $H^1$) | Anti-cohomology cone (apex $H_0^{\mathrm{void}}$, the never-settled cells) |
| Cosheaf-homology cone (apex $H_1$) | Anti-homology cone |
| Bilattice cone (apex $\top$) | Bilattice void cone (apex $\bot$) |
| Site cone (apex $X_q^\tau$) | Site void cone (apex $\emptyset$, the empty clopen) |
| Moduli cone (apex $\mathscr{M}^{\mathrm{SKH}}$) | Anti-moduli cone (apex = the "moduli of un-classifiable settlings") |
| Realizability cone (apex realized image) | Unrealizability cone (apex unrealized cohomology) |
| Firing-causal cone (apex new cell) | Antecedent-void cone (apex unfired antecedents) |

Each of these is a real construction the corpus has not made explicit but could.

**2. Failure-geometry as void-cone phenomenon.** The cone-and-apex narrative's [apex failures](cone-and-apex-structure.md#apex-failures-when-the-cone-has-no-apex) section noted three flavors of failure. Each is a void-cone phenomenon:

- *Settling cone has no apex* (closure ordinal too large): the void cone *also* has no apex — it never stabilises on a limiting void either. Both cones are "open" — never-converging dynamics.
- *Cohomology cone unbounded*: the anti-cohomology cone is dually unbounded — the never-settled cells form a non-stratified space.
- *Realizability cone empty*: the unrealizability cone is *full* — all of $H^1$ is unrealized; no closure rule reaches it.

The "geometry of failure" lens reads each failure as the *void cone's apex doing something interesting* (being non-empty / non-stabilising / dually full).

**3. The conflation involution as void-cone exchange.** Conflation, structurally, is the operation that swaps the bilattice's apex with its void. Lifted to settlings, conflation swaps $\top$-firings with $\bot$-firings, which corresponds to swapping content "at the apex of the knowledge order" with content "at the void of the knowledge order." So conflation is the **bilattice's natural void-cone-exchange operator**, and the [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md) characterises which settlings are conflation-fixed (i.e., settle the apex-vs-void distinction in a balanced way).

## Position in predication categories

This narrative is *clarifying and extending*: it doesn't propose new theorems but names a complementary structural picture to the cone-and-apex view. With the [void-dynamics narrative](geometries-of-failure-dynamics-of-void.md) and the [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md) now in place, the corpus has the conceptual infrastructure for a full apex-side ↔ void-side classification of settlings.

The natural research arcs that follow:

- **Anti-cohomology theorem.** State and prove a parallel to the [aperiodic-regime cohomology via direct limit theorem](../theorems/aperiodic-regime-cohomology-via-direct-limit.md), but for the void cone's anti-cohomology. The structural prediction: $H^0(\mathrm{Void}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$, where the *void* picks up a generator at each NSC firing (dually to the cohomology cone).
- **Void-cone realizability program.** Which void-cone apexes are realized? Conjecturally, the same realizability cardinality bound applies dually.
- **Void-cone classification.** Two settlings are *void-MLD-equivalent* iff their void cones agree up to settling-shift. This is a refinement of the existing MLD relation, with dual content.

These would close the apex-side ↔ void-side picture symmetrically. Currently the corpus has the apex side worked out and the void side mostly named.
