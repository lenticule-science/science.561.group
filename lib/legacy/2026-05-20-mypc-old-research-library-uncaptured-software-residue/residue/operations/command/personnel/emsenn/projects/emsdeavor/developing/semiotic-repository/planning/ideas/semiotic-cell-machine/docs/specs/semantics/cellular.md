---
title: "Cellular Semantics"
date-created: 2026-03-06T00:00:00
---

**Role.** Defines the abstract meaning of a GFRTU cell: sites, recognitions, fixed layers, RTL signatures, structural vocabulary, constructors, and admissibility invariants. No byte-level or JSON requirements appear here.

**Depends on.** `trace-universe.md` for the sheaf, σ/Δ stabilization, and generative closure principles.

**Provides to.** The cellular JSON carrier, closure semantics, and host runtime; representation lives in `../carriers/cellular-json.md`.

---

## 1. Purpose and Scope

A **cell** is a localized universe inside a GFRTU. Semantically it packages:

- a site \((T,J)\) with objects, morphisms, and a Grothendieck topology;
- a recognition object with stabilizer \(\sigma\) and drift \(\Delta\), plus the fixed layer \(H^\ast\);
- a Recognition Term Language (RTL) signature interpreting operators as internal morphisms;
- a structural vocabulary (objects, morphisms, relations) used by constructors; and
- a list of constructors and admissibility laws that generate the closure-fixed universe.

Cells are closed-world: every datum required for closure must be present. Whether the cell is closure-complete is determined by the closure semantics, not by alternate encodings.

## 2. Structural Components (Abstract)

- **Site.** A small category with designated covers forming a Grothendieck topology. Heyting operations on finite joins and meets must be total and symmetric; the site’s combinators must respect identities and associativity.
- **Recognition fibers and fixed layer.** Each object carries sections of the recognition algebra equipped with commuting \(\sigma\) and \(\Delta\). The fixed layer \(H^\ast\) consists of sections stable under both endomorphisms and glued across sieves.
- **RTL signature and vocabulary.** Base types and operator constructors denote internal arrows on \(H^\ast\) with declared variance and admissibility. Structural vocabulary lists objects, morphisms, and relations available to constructors.
- **Constructors and laws.** Constructors generate new structure over the vocabulary. Laws declare canonicalization strategy alignment with RTL normalization, admissibility invariants, and an ordered repair log. The defining expression (when present) lists generating RTL derivations and a closure depth fuel bound.

## 3. Admissibility Invariants (Semantic Meaning)

The following conditions must hold for a closure-complete cell; violation names align with the carrier error surface:

- **Category soundness.** Morphisms compose associatively and respect identities (`CDS_SITE_CATEGORY_FAIL`).
- **Topology stability.** Covers are closed under pullback (`CDS_SITE_TOPOLOGY_FAIL`).
- **Heyting completeness.** Heyting tables are total and symmetric (`CDS_SITE_HEYTING_GAP`).
- **σ/Δ coherence.** Tables commute with Heyting implication; sections are closed under both (`CDS_FIBER_SIGMA_DELTA_FAIL`, `CDS_FIBER_SIGMA_DELTA_VIOLATION`).
- **Fixed-layer sheafification.** Sections glue uniquely over sieves (`CDS_FIXED_LAYER_SHEAF_FAIL`).
- **Signature alignment.** Every referenced constructor exists in the RTL signature (`CDS_UNKNOWN_OPERATOR`).
- **Canonicalization alignment.** The declared canonicalization strategy matches RTL normalization (`CDS_CANONICALIZATION_MISMATCH`) and respects semantic ordering (`CDS_CANONICAL_ORDER_FAIL`).
- **Invariant catalogue.** Declared invariants must hold after closure (`laws.invariants` codes with declared severities).

Hard failures reject the cell; repairable ones may be corrected deterministically by closure while recording the repair.

## 4. Generative Construction Semantics

Closure iterates constructors in breadth-first layers up to the declared `closure_depth` fuel (default 16 when absent). Operand tuples are deduplicated by canonical identity; each layer corresponds to an iterate of the GFRTU closure operator \(UG\). After each layer:

- fixed-layer repair applies sheafification (plus construction) over the site topology;
- σ/Δ stabilization iterates until a fixed point or fuel exhaustion; and
- invariants run in declaration order, invoking deterministic repair recipes when marked repairable.

Fuel exhaustion signals incomplete closure but leaves previously validated structure intact. Merge semantics intersect fixed layers and reconcile invariants before re-running closure under the same rules.

## 5. Interpretive Duties

- **Sheaf witness.** Fixed-layer repair operationalizes sheaf completion from the GFRTU semantics; gluing choices must be deterministic and tied to the declared topology.
- **σ/Δ stabilization witness.** Stabilizer and drift iterations reflect the commuting endomorphisms on recognition fibers; recorded fuel bounds disclose the stabilization tower used.
- **Generative closure witness.** Constructor ordering is the operational presentation of \(UG^n(\emptyset)\); reordering or pruning layers changes the universe and is invalid.
- **Hash monotonicity.** Each repair step must advance the canonical hash of the payload; before/after pairs are evidence of progress and link directly to the carrier’s hashing rules.

## 6. Normativity Checklist (Abstract)

Before declaring a cell normative:

1. **Source alignment.** Operators, constructors, and invariants trace to GFRTU obligations; ad hoc extensions are disallowed.
2. **Fuel disclosure.** Closure depth and σ/Δ fuel used in stabilization are explicit so replay is possible.
3. **Deterministic repair evidence.** Every repair cites the invariant it addresses and records before/after identities in order.
4. **Topology admissibility proof.** Stability of sieves under pullback is justified by machine-checkable evidence aligned with site identifiers.
5. **Cross-document compatibility.** Canonicalization strategy matches RTL semantics; closure semantics align with `closure.md` without host reinterpretation.

Concrete encodings, key ordering, and hashing live in the carrier documents; this file describes only the mathematical structure and obligations of a cell.
