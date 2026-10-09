---
name: cohomological-framework
description: "A choice of (i) what category-theoretic object the per-base-point fiber of the bitopological-settling-site is treated as, (ii) which cohomology theory is computed on that object, (iii) which value category the sheaf takes values in. Four such frameworks exist in the corpus; each is internally consistent within its scope; cross-framework agreements that downstream theorems implicitly assume have NOT been proved."
depends-on: [bitopological-settling-site, paired-priestley-space, d-frame-valued-sheaf]
derives-from: docs/dev/scraps/cohomological-framework.md
---

# Cohomological framework

A **cohomological framework** is a triple of choices:

1. **Fiber reading** — what category-theoretic object the per-base-point fiber of the bitopological-settling-site is treated as.
2. **Cohomology theory** — which cohomology theory is computed on that object.
3. **Value category** — which value category the sheaf takes values in.

Different frameworks compute **different invariants** even when they all carry the name "cohomology of `F_v`." Naming alone doesn't fix the theory; the three-way choice does.

## Why this is necessary

The substrate computes cohomological invariants of a settlement's Priestley dual (see sibling `settlement-priestley-dual/`). At first glance "cohomology" sounds like one notion, but the underlying Jung–Rivieccio-dualized space carries multiple natural categorical structures, and one can compute cohomology against any of them. The choice matters because different frameworks DETECT different aperiodic invariants.

The framework distinction makes the substrate's epistemic standing legible: instead of "we've proved cohomological invariants for the aperiodic regime," one says "we've proved them in Framework 2 for the strict and Scott-continuous regimes; the transfinite and aperiodic regimes are sketch in Framework 3."

## The four frameworks

### Framework 1: substitution-matrix Anderson–Putnam

| Choice | Value |
|---|---|
| **Fiber reading** | none — paired-Priestley space replaced by a substitution dynamical system's tile space |
| **Cohomology theory** | classical Čech cohomology of the Anderson-Putnam direct limit: `Ȟ^n(Ω_ω) = lim Ȟ^n(Γ_ω)` for substitution self-map `ω` |
| **Value category** | `Z`-modules (with d-frame "side" structure added via per-letter bilattice valuations) |

**Status**: computational, working. Implementation in `tools/predication_categories/examples/benchmark_1_fibonacci.py` and `tools/predication_categories/theorems/strong_mld_via_composed_duality.py`. Coverage: the benchmark suite — 7 specific substitution-shaped settlements.

**Reading**: this framework does NOT compute the bitopological-settling-site's cohomology directly. It computes Anderson–Putnam cohomology of substitution tile spaces, which the archive theorem `aperiodic-regime-cohomology-via-direct-limit` identifies with the bitopological-site cohomology in the aperiodic regime. The identification is structural, not computational.

### Framework 2: Tarski-Laplacian on discrete-points fiber

| Choice | Value |
|---|---|
| **Fiber reading** | discrete-points — per-base-point fiber is the paired-Priestley space `X_q^τ` as a 0-dim discrete topological space (2 cells for standard Belnap setting `{+, -}`, no higher cells) |
| **Cohomology theory** | Tarski-Laplacian fixed-point cohomology: cochain `C^0 = ∏(stalk values at points)`, `C^n = 0` for `n ≥ 1` trivially |
| **Value category** | d-frames |

**Status**: **proved within scope**. Strict-regime d-frame cohomology proved; Scott-continuous regime d-frame cohomology proved. Both archive theorems are `proved` status.

**Reading**: this framework relies on the underlying paired-Priestley space being **topologically discrete** — true for finite `L`, less obvious for the transfinite regimes. The transfinite-bounded and aperiodic d-frame cohomology theorems do NOT live in this framework; they belong in Framework 3.

### Framework 3: cellular-sheaf-on-clopen-lattice (Q-enriched, parallel-pair)

| Choice | Value |
|---|---|
| **Fiber reading** | order complex of the lattice of pairwise-Stone clopens of `X_q^τ`. For standard Belnap: 4-element clopen lattice gives contractible `Δ¹` — 4 vertices, 5 edges, 2 triangles |
| **Cohomology theory** | cellular sheaf cohomology in the parallel-pair convention; Curry equivalence for the cosheaf side via López 2024's fuzzy adjoints |
| **Value category** | `Q-Cat_cwl` — includes d-frames as a special case |

**Status**: **mixed**. Base cases on graphs and 2-dim degree-0 are `proved`. Higher dimensions and Grothendieck-site assembly are `sketch`. The per-fiber Curry equivalence chain:

- `q-enriched-curry-2-cell` (proved)
- `q-enriched-curry-2-cell-fuzzy` (proved)
- `q-enriched-curry-finite-graph` (proved)
- `q-enriched-curry-2-dim-degree-0` (proved)
- `q-enriched-curry-cw-complex` (sketch)
- `q-enriched-curry-transfinite-cw` (sketch)
- `q-enriched-curry-grothendieck-site` (sketch)

The potential working question is per-fiber Curry on the d-frame-valued sheaf for the standard Belnap fiber.

### Framework 4: Lawvere-Laplacian on Grothendieck site (Q-enriched, weighted-meet)

| Choice | Value |
|---|---|
| **Fiber reading** | the Grothendieck site as a whole — cohomology lives directly on the bitopological-settling-site without explicit per-fiber factoring |
| **Cohomology theory** | Q-enriched cohomology with weighted-meet coboundary; kernel = where the meet equals the unit; specializes to Lawvere Laplacian fixed-point cohomology in degree 0 |
| **Value category** | `Q-Cat_cwl` |

**Status**: **scaffolding only**. The Lawvere Laplacian extension theorem is `sketch`. Q-enriched cohomology higher-degree vanishing theorem is `sketch`. Not concretely computed against any specific settlement.

**Empirical check** (in `verify-zero-dim-curry` tool): the weighted-meet convention does NOT reduce to standard cellular sheaf cohomology even in trivial cases. **Framework 4 is genuinely a different theory from Framework 3** — not just a stylistic variant.

## Cross-framework agreements that have NOT been proved

Several downstream theorems implicitly assume Frameworks 1–4 agree where they overlap. None of the agreements have been explicitly proved. The corpus's epistemic situation is therefore weaker than it appears:

**Framework 1 ↔ 2 (on substitution settlements in strict / Scott-continuous regimes).** Substitution-matrix Anderson–Putnam computation should equal the Tarski-Laplacian-on-discrete-fiber computation. Currently *assumed* via the Anderson–Putnam direct-limit identification.

**Framework 2 ↔ 3 (on regime cohomology).** Tarski-Laplacian-on-discrete-fiber result for strict/Scott-continuous regimes (proved) should equal what cellular-sheaf-on-clopen-lattice would give. This is the potential investigation; Pass 1 of the per-fiber Curry working question showed agreement on the `L_+` component of `H^0` for the simplest Belnap placement.

**Framework 3 ↔ 4 (at the Grothendieck-site level).** Cellular-sheaf assembly should equal Lawvere-Laplacian-on-Grothendieck-site direct computation. **Empirical evidence suggests Frameworks 3 and 4 are genuinely different cohomology theories** — the agreement claim is currently false in the literal sense; the relationship is more subtle.

**Framework 4 vanishing transfer to Frameworks 2/3.** The "`H^{≥2} = 0`" claim is in Framework 4 but cited by theorems in Frameworks 2/3. Transfer not justified.

## Consequence for theorem status

Once frameworks are explicit, several theorems' statuses get reconsidered:

- **`strong-MLD via composed duality`** — demoted to `sketch` (chain depends on multiple sketches across Frameworks 2/3).
- **`Q-enriched cohomology higher-degree vanishing`** — demoted to `sketch` (depends on Framework 4's sketch foundation).
- **The four regime cohomology theorems** split across frameworks: strict + Scott-continuous `proved` in Framework 2; transfinite-bounded + aperiodic `sketch` in Framework 3.

These are real differences in epistemic standing that the corpus needs to be explicit about.

## What this concept does NOT do

This concept names what the corpus has implicitly been doing across multiple frameworks. It does NOT introduce new mathematics; it makes the framework structure legible enough that cross-framework dependencies become visible.

The concrete next moves are not "add framework annotations everywhere" (premature scaffolding) but "settle one of the framework agreements concretely on a worked example" (real math). The per-fiber Curry working question is the potential worked-example for the Framework 2 ↔ 3 agreement.

## Position

`finite-settlement-algebra/hacking/library/cohomological-framework/`. Settling tier — the framework is the meta-structure that classifies which cohomology one is computing on a settlement's Priestley dual. The aperiodic regime is where cohomological invariants become *necessary* (no fixed-point alternative); lower regimes can extract them too but rarely need to.

## Derivation source

Adapted from `predication-categories/concepts/cohomological-framework.md`, preserved verbatim at `docs/dev/scraps/cohomological-framework.md`. The scrap is in essentially current grammar.
