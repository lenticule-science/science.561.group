---
type: concept
class: classifier
depends-on: [bitopological-settling-site, paired-priestley-space, d-frame-valued-sheaf]
see-also: [anderson-putnam-direct-limit, q-enriched-cohomology, lawvere-laplacian-grothendieck-sites, cohomological-framework-2category, cohomological-framework-comparison, framework-1-2-strict-agreement, framework-2-3-strict-agreement, framework-3-4-disagreement, framework-4-vanishing-transfer]
---

# Cohomological framework

A **cohomological framework** is a choice of: (i) what category-theoretic object the per-base-point fiber of the [bitopological settling site](../../../../../bitopological-settling-site/bitopological-settling-site.md) is treated as, (ii) which cohomology theory is computed on that object, (iii) which value category the sheaf takes values in.
Different frameworks compute different invariants, even when they all carry the name "cohomology of $\mathbb F_v$."

The corpus has theorems and tools spanning **four** distinct cohomological frameworks.
Each is internally consistent within its scope.
The relationships between them are partial; several agreements that downstream theorems implicitly assume have not been proved.

## The four frameworks

### Framework 1: substitution-matrix Anderson-Putnam

**Fiber reading:** none — the underlying paired-Priestley space is replaced by a substitution dynamical system's tile space. **Cohomology theory:** classical Čech cohomology of the [Anderson-Putnam direct limit](../objects/anderson-putnam-direct-limit.md), $\check H^n(\Omega_\omega) = \varinjlim \check H^n(\Gamma_\omega)$ for substitution self-map $\omega$. **Value category:** $\mathbb Z$-modules (with d-frame "side" structure added via per-letter bilattice valuations). **Implementation:** [`tools/predication_categories/examples/benchmark_1_fibonacci.py`](../tools/predication_categories/examples/benchmark_1_fibonacci.py), [`tools/predication_categories/theorems/strong_mld_via_composed_duality.py`](../tools/predication_categories/theorems/strong_mld_via_composed_duality.py). **Coverage:** the [benchmark suite](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-suite-summary.md) — 7 specific substitution-shaped settlings. **Status:** computational, working.

This framework does not compute the bitopological settling site's cohomology directly.
It computes Anderson-Putnam cohomology of substitution tile spaces, which predication categories' [aperiodic-regime cohomology via direct limit](../../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) theorem identifies with the bitopological-site cohomology in the aperiodic regime.
The identification is structural, not computational.

### Framework 2: Tarski-Laplacian on discrete-points fiber

**Fiber reading:** discrete-points — the per-base-point fiber is the paired-Priestley space $X_q^\tau$ as a 0-dim discrete topological space (2 cells for the standard Belnap setting $\{+, -\}$, no higher cells). **Cohomology theory:** Tarski-Laplacian fixed-point cohomology, with cochain group $C^0$ = product of stalk values at the points and $C^n = 0$ for $n \geq 1$ trivially. **Value category:** d-frames. **Coverage:** [strict-regime d-frame cohomology](../../references/strict-regime-d-frame-cohomology.md) (proved); [Scott-continuous regime d-frame cohomology](../../references/scott-continuous-regime-d-frame-cohomology.md) (proved). **Status:** proved within scope (strict and Scott-continuous regimes only).

This framework relies on the underlying paired-Priestley space being topologically discrete — true for finite $\mathbf L$, less obvious for the transfinite regimes.
The transfinite-bounded and aperiodic d-frame cohomology theorems do not live in this framework.

### Framework 3: cellular-sheaf-on-clopen-lattice (Q-enriched, parallel-pair)

**Fiber reading:** order complex of the lattice of pairwise-Stone clopens of $X_q^\tau$.
For the standard Belnap setting, the 4-element clopen lattice gives the contractible Δ¹ — 4 vertices, 5 edges, 2 triangles. **Cohomology theory:** cellular sheaf cohomology in the parallel-pair convention, with Curry equivalence for the cosheaf side via [@lopez2024]'s fuzzy adjoints. **Value category:** $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, including d-frames as a special case. **Coverage:** the per-fiber Curry equivalence chain — [q-enriched-curry-2-cell](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell.md), [q-enriched-curry-2-cell-fuzzy](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell-fuzzy.md), [q-enriched-curry-finite-graph](../theorems/q-enriched-curry-finite-graph.md), [q-enriched-curry-2-dim-degree-0](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-dim-degree-0.md) (all proved); [q-enriched-curry-cw-complex](../theorems/q-enriched-curry-cw-complex.md), [q-enriched-curry-transfinite-cw](../theorems/q-enriched-curry-transfinite-cw.md), [q-enriched-curry-grothendieck-site](../theorems/q-enriched-curry-grothendieck-site.md) (all sketch). **Status:** base cases proved on graphs and 2-dim degree-0; higher dimensions and Grothendieck-site assembly are sketch.
Per-fiber Curry on the d-frame-valued sheaf for the standard Belnap fiber is the working question [per-fiber Curry on the clopen lattice fiber](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/per-fiber-curry-on-clopen-lattice-fiber.md).

### Framework 4: Lawvere-Laplacian-on-Grothendieck-site (Q-enriched, weighted-meet)

**Fiber reading:** the Grothendieck site as a whole; cohomology lives directly on the bitopological settling site without explicit per-fiber factoring. **Cohomology theory:** Q-enriched cohomology with weighted-meet coboundary, kernel = where the meet equals the unit element, per [q-enriched-cohomology](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md).
Specializes to Lawvere Laplacian fixed-point cohomology in degree 0. **Value category:** $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. **Coverage:** [Lawvere Laplacian extension theorem](../theorems/lawvere-laplacian-grothendieck-sites.md) (sketch); [Q-enriched cohomology higher-degree vanishing theorem](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) (proved). **Status:** scaffolding only; not concretely computed against any specific settling.
The structural disagreement with Framework 3 — that the weighted-meet kernel condition $\bigwedge^W r^*_i (x_i) = \mathbf 1$ is strictly stronger than the parallel-pair equality kernel condition $r^*_x(x_x) = r^*_y(x_y)$ on the same lifted data — is established in Lemma D1 of the [framework-3↔4 disagreement theorem](../theorems/framework-3-4-disagreement.md) (`status: sketch`).
The corresponding concrete $H^0$ witness on the standard Belnap fiber is gap D-G2 of that theorem and remains open.
(Earlier corpus drafts referred to a "verify-zero-dim-curry tool" empirical check; that tool was never implemented as named — the only Belnap-fiber Curry computation in `computations/examples/per_fiber_d_frame_curry_on_belnap_fiber.py` verifies the F2 ↔ F3 rank-2 instance, not the F3 ↔ F4 disagreement.
The structural disagreement claim is now carried by Lemma D1, not by any numerical empirical check.)

## Cross-framework agreements that aren't proved

The corpus has theorems whose stated downstream claims (e.g., "the d-frame cohomology of an aperiodic settling has the orbit-type stratification given by the strong-MLD theorem") implicitly assume that Frameworks 1–4 agree where they overlap.
None of the agreements have been explicitly proved:

- **Framework 1 ↔ 2** on substitution settlings in strict / Scott-continuous regimes: substitution-matrix Anderson-Putnam computation should equal the Tarski-Laplacian-on-discrete-fiber computation.
  The [Framework 1↔2 strict agreement theorem](../theorems/framework-1-2-strict-agreement.md) (`status: sketch`) now contains a substantial partial proof — Lemma C1 establishes per-fiber strict-regime agreement unconditionally, and Lemma C2 lifts this to the Scott-continuous regime via filtered-colimit commutation — leaving two identified gaps (C-G1: formalization of the side-structure-completion functor $\Phi^{12}_{\mathcal V} : \mathbf{Ab}_{\mathrm{AP}} \to \mathbf{dFrm}$ as a typed corpus object; C-G2: identification of the F1 substitution-induced transition maps $\omega^*$ with the cell-index inclusions that drive the F2 filtered colimit on the Scott-continuous subdomain — Lemma C2 is conditional on this identification).
- **Framework 2 ↔ 3** on regime cohomology: Tarski-Laplacian-on-discrete-fiber result for strict/Scott-continuous regimes (proved) should equal what cellular-sheaf-on-clopen-lattice would give.
  The [Framework 2↔3 strict agreement theorem](../theorems/framework-2-3-strict-agreement.md) (`status: sketch`) now contains a substantial partial proof — Lemma B1 establishes per-fiber $H^0$ agreement unconditionally — but the full per-settling claim awaits promotion of the sketch Q-enriched Curry CW-complex (for higher-degree per-fiber vanishing at rank > 2) and Q-enriched Curry on Grothendieck sites (for per-settling assembly across fibers).
  The [verified Belnap-fiber instance](../examples/per-fiber-d-frame-curry-on-belnap-fiber.md) is the rank-2 unconditional case; the [per-fiber Curry working question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/per-fiber-curry-on-clopen-lattice-fiber.md) remains open for the assembly direction.
- **Framework 3 ↔ 4** at the Grothendieck-site level: cellular-sheaf assembly should equal the Lawvere-Laplacian-on-Grothendieck-site direct computation.
  The [Framework 3↔4 disagreement theorem](../theorems/framework-3-4-disagreement.md) (`status: sketch`) now contains a substantial partial proof — Lemma D1 establishes structurally and unconditionally (under the standard meet-semantics reading of the weight $W$) that the F4 weighted-meet kernel is strictly contained in the F3 parallel-pair equality kernel wherever the joint-image hypothesis is non-vacuous; D2 (a witness blueprint, explicitly not a lemma) records attempted Belnap-fiber candidates and identifies routes for closing the existential gap — leaving two identified gaps (D-G1: formalize $\alpha_{34}$ as a typed graded natural transformation including the F3 ↔ F4 sheaf-direction convention bridge; D-G2: exhibit a concrete Belnap-fiber witness intrinsic to the comparison transformation rather than artifactual to $\mathbb F_3$-assembly choice).
- **Framework 4 vanishing transfer to Frameworks 2/3.** The "$H^{\geq 2} = 0$" claim is in Framework 4 but cited by theorems in Frameworks 2/3.
  Transfer not justified.

### Typed home for the agreements

The four agreements above are each the claim that a specific 1-cell of the [2-category $\mathbf{CohFr}$](../objects/cohomological-framework-2category.md) is an agreement comparison — i.e., its [comparison transformation](../morphisms/cohomological-framework-comparison.md) $\alpha$ is a natural isomorphism on a specified subdomain.
The four corresponding theorem files state these claims precisely (statuses: three `sketch` with substantial partial proofs, one `draft`):

- [framework-1-2 strict agreement](../theorems/framework-1-2-strict-agreement.md) — $\mathbb F_1 \to \mathbb F_2$ on substitution settlings in strict / Scott-continuous regime; **substantial partial proof** (Lemma C1 establishes degree-0 agreement unconditionally on the strict subdomain, Lemma C2 lifts this to the Scott-continuous subdomain conditional on gap C-G2, and higher-degree vanishing follows on both sides from the named regime-vanishing theorems; outstanding gaps are C-G1 (formalize $\Phi^{12}_{\mathcal V}$ as a typed corpus object) and C-G2 (identify F1 transition maps with F2 cell-index inclusions on the Scott-continuous subdomain)).
- [framework-2-3 strict agreement](../theorems/framework-2-3-strict-agreement.md) — $\mathbb F_2 \to \mathbb F_3$ on the strict regime; **substantial partial proof** (Lemma B1 establishes per-fiber $H^0$ agreement unconditionally for any finite distributive bilattice $\mathbf L$; the full per-settling claim remains conditional on the sketch Q-enriched Curry CW-complex / Grothendieck-site assembly chain — the verified Belnap-fiber instance is the rank-2 unconditional case).
- [framework-3-4 disagreement](../theorems/framework-3-4-disagreement.md) — $\mathbb F_3 \to \mathbb F_4$ at the Grothendieck-site level; the comparison is *not* an agreement (positive negative result); **substantial partial proof** (Lemma D1 establishes the structural source unconditionally — the F4 weighted-meet-equals-unit kernel is strictly contained in the F3 parallel-pair equality kernel under the standard reading of $W$; D2 is a witness blueprint, not a lemma — the concrete Belnap-fiber existential is open under D-G2; outstanding gaps are D-G1 (typing $\alpha_{34}$ including the F3 ↔ F4 sheaf-direction convention bridge) and D-G2 (concrete Belnap-fiber witness intrinsic to the comparison transformation)).
- [framework-4 vanishing transfer](../theorems/framework-4-vanishing-transfer.md) — $\mathbb F_4 \to \mathbb F_3/\mathbb F_2$ restricted to the $H^{\geq 2} = 0$ subdomain; trivial agreement that justifies dimensional-vanishing transfer despite the lower-degree disagreement.

## Why the framework distinction matters

Once frameworks are explicit, several theorems' statuses get reconsidered:

- **[strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md)** — demoted to `sketch` (chain depends on multiple sketches across Frameworks 2/3).
- **[Q-enriched cohomology higher-degree vanishing](../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md)** — `proved` (Framework 4 scaffolding sufficient for the abstract higher-degree-vanishing statement, independent of concrete-settling computation).
- **The four regime cohomology theorems** split across frameworks: strict + Scott-continuous proved in Framework 2; transfinite-bounded + aperiodic sketch in Framework 3.

These are real differences in epistemic standing that the corpus needs to be explicit about.

## Position in predication categories

This concept names what the corpus has implicitly been doing across multiple frameworks.
It does not introduce new mathematics; it makes the framework structure legible enough that cross-framework dependencies become visible.

The concrete next moves are not "add framework annotations everywhere" (premature scaffolding) but "settle one of the framework agreements concretely on a worked example" (real math).
The [per-fiber Curry working question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/per-fiber-curry-on-clopen-lattice-fiber.md) is the potential worked-example for the Framework 2 ↔ 3 agreement.
