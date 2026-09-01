---
type: concept
class: classifier
depends-on: [bitopological-settling-site, paired-priestley-space, d-frame-valued-sheaf]
see-also: [anderson-putnam-direct-limit, q-enriched-cohomology, lawvere-laplacian-grothendieck-sites]
---

# Cohomological framework

A **cohomological framework** is a choice of: (i) what category-theoretic object the per-base-point fiber of the [bitopological settling site](../objects/bitopological-settling-site.md) is treated as, (ii) which cohomology theory is computed on that object, (iii) which value category the sheaf takes values in. Different frameworks compute different invariants, even when they all carry the name "cohomology of $\mathbb F_v$."

The corpus has theorems and tools spanning **four** distinct cohomological frameworks. Each is internally consistent within its scope. The relationships between them are partial; several agreements that downstream theorems implicitly assume have not been proved.

## The four frameworks

### Framework 1: substitution-matrix Anderson-Putnam

**Fiber reading:** none — the underlying paired-Priestley space is replaced by a substitution dynamical system's tile space.
**Cohomology theory:** classical Čech cohomology of the [Anderson-Putnam direct limit](../objects/anderson-putnam-direct-limit.md), $\check H^n(\Omega_\omega) = \varinjlim \check H^n(\Gamma_\omega)$ for substitution self-map $\omega$.
**Value category:** $\mathbb Z$-modules (with d-frame "side" structure added via per-letter bilattice valuations).
**Implementation:** [`tools/predication_categories/examples/benchmark_1_fibonacci.py`](../tools/predication_categories/examples/benchmark_1_fibonacci.py), [`tools/predication_categories/theorems/strong_mld_via_composed_duality.py`](../tools/predication_categories/theorems/strong_mld_via_composed_duality.py).
**Coverage:** the [benchmark suite](../examples/benchmark-suite-summary.md) — 7 specific substitution-shaped settlings.
**Status:** computational, working.

This framework does not compute the bitopological settling site's cohomology directly. It computes Anderson-Putnam cohomology of substitution tile spaces, which predication categories' [aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md) theorem identifies with the bitopological-site cohomology in the aperiodic regime. The identification is structural, not computational.

### Framework 2: Tarski-Laplacian on discrete-points fiber

**Fiber reading:** discrete-points — the per-base-point fiber is the paired-Priestley space $X_q^\tau$ as a 0-dim discrete topological space (2 cells for the standard Belnap setting $\{+, -\}$, no higher cells).
**Cohomology theory:** Tarski-Laplacian fixed-point cohomology, with cochain group $C^0$ = product of stalk values at the points and $C^n = 0$ for $n \geq 1$ trivially.
**Value category:** d-frames.
**Coverage:** [strict-regime d-frame cohomology](../theorems/strict-regime-d-frame-cohomology.md) (proved); [Scott-continuous regime d-frame cohomology](../theorems/scott-continuous-regime-d-frame-cohomology.md) (proved).
**Status:** proved within scope (strict and Scott-continuous regimes only).

This framework relies on the underlying paired-Priestley space being topologically discrete — true for finite $\mathbf L$, less obvious for the transfinite regimes. The transfinite-bounded and aperiodic d-frame cohomology theorems do not live in this framework.

### Framework 3: cellular-sheaf-on-clopen-lattice (Q-enriched, parallel-pair)

**Fiber reading:** order complex of the lattice of pairwise-Stone clopens of $X_q^\tau$. For the standard Belnap setting, the 4-element clopen lattice gives the contractible Δ¹ — 4 vertices, 5 edges, 2 triangles.
**Cohomology theory:** cellular sheaf cohomology in the parallel-pair convention, with Curry equivalence for the cosheaf side via [@lopez2024]'s fuzzy adjoints.
**Value category:** $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, including d-frames as a special case.
**Coverage:** the per-fiber Curry equivalence chain — [q-enriched-curry-2-cell](../theorems/q-enriched-curry-2-cell.md), [q-enriched-curry-2-cell-fuzzy](../theorems/q-enriched-curry-2-cell-fuzzy.md), [q-enriched-curry-finite-graph](../theorems/q-enriched-curry-finite-graph.md), [q-enriched-curry-2-dim-degree-0](../theorems/q-enriched-curry-2-dim-degree-0.md) (all proved); [q-enriched-curry-cw-complex](../theorems/q-enriched-curry-cw-complex.md), [q-enriched-curry-transfinite-cw](../theorems/q-enriched-curry-transfinite-cw.md), [q-enriched-curry-grothendieck-site](../theorems/q-enriched-curry-grothendieck-site.md) (all sketch).
**Status:** base cases proved on graphs and 2-dim degree-0; higher dimensions and Grothendieck-site assembly are sketch. Per-fiber Curry on the d-frame-valued sheaf for the standard Belnap fiber is the working question [per-fiber Curry on the clopen lattice fiber](../questions/per-fiber-curry-on-clopen-lattice-fiber.md).

### Framework 4: Lawvere-Laplacian-on-Grothendieck-site (Q-enriched, weighted-meet)

**Fiber reading:** the Grothendieck site as a whole; cohomology lives directly on the bitopological settling site without explicit per-fiber factoring.
**Cohomology theory:** Q-enriched cohomology with weighted-meet coboundary, kernel = where the meet equals the unit element, per [q-enriched-cohomology](../objects/q-enriched-cohomology.md). Specializes to Lawvere Laplacian fixed-point cohomology in degree 0.
**Value category:** $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
**Coverage:** [Lawvere Laplacian extension theorem](../theorems/lawvere-laplacian-grothendieck-sites.md) (sketch); [Q-enriched cohomology higher-degree vanishing theorem](../theorems/q-enriched-cohomology-higher-degree-vanishing.md) (sketch — see status note in that file).
**Status:** scaffolding only; not concretely computed against any specific settling. Empirical check (in [verify-zero-dim-curry tool](../tools/predication_categories/examples/per_fiber_d_frame_curry_on_belnap_fiber.py/)) shows the weighted-meet convention does not reduce to standard cellular sheaf cohomology even in trivial cases — Framework 4 is genuinely a different theory from Framework 3.

## Cross-framework agreements that aren't proved

The corpus has theorems whose stated downstream claims (e.g., "the d-frame cohomology of an aperiodic settling has the orbit-type stratification given by the strong-MLD theorem") implicitly assume that Frameworks 1–4 agree where they overlap. None of the agreements have been explicitly proved:

- **Framework 1 ↔ 2** on substitution settlings in strict / Scott-continuous regimes: substitution-matrix Anderson-Putnam computation should equal the Tarski-Laplacian-on-discrete-fiber computation. Currently *assumed* via the Anderson-Putnam direct-limit identification.
- **Framework 2 ↔ 3** on regime cohomology: Tarski-Laplacian-on-discrete-fiber result for strict/Scott-continuous regimes (proved) should equal what cellular-sheaf-on-clopen-lattice would give. The [per-fiber Curry working question](../questions/per-fiber-curry-on-clopen-lattice-fiber.md) is the potential investigation here; Pass 1 of that work showed agreement on the $L_+$ component of $H^0$ for the simplest Belnap placement.
- **Framework 3 ↔ 4** at the Grothendieck-site level: cellular-sheaf assembly should equal the Lawvere-Laplacian-on-Grothendieck-site direct computation. Empirical evidence suggests Frameworks 3 and 4 are genuinely different cohomology theories.
- **Framework 4 vanishing transfer to Frameworks 2/3.** The "$H^{\geq 2} = 0$" claim is in Framework 4 but cited by theorems in Frameworks 2/3. Transfer not justified.

## Why the framework distinction matters

Once frameworks are explicit, several theorems' statuses get reconsidered:

- **[strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md)** — demoted to `sketch` (chain depends on multiple sketches across Frameworks 2/3).
- **[Q-enriched cohomology higher-degree vanishing](../theorems/q-enriched-cohomology-higher-degree-vanishing.md)** — demoted to `sketch` (depends on Framework 4's sketch foundation).
- **The four regime cohomology theorems** split across frameworks: strict + Scott-continuous proved in Framework 2; transfinite-bounded + aperiodic sketch in Framework 3.

These are real differences in epistemic standing that the corpus needs to be explicit about.

## Position in predication categories

This concept names what the corpus has implicitly been doing across multiple frameworks. It does not introduce new mathematics; it makes the framework structure legible enough that cross-framework dependencies become visible.

The concrete next moves are not "add framework annotations everywhere" (premature scaffolding) but "settle one of the framework agreements concretely on a worked example" (real math). The [per-fiber Curry working question](../questions/per-fiber-curry-on-clopen-lattice-fiber.md) is the potential worked-example for the Framework 2 ↔ 3 agreement.
