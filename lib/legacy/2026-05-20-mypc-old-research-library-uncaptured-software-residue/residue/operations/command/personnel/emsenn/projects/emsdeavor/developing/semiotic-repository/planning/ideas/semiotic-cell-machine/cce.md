---
title: "Cellular Closure Engine (CCE)"
date-created: 2026-03-06T00:00:00
---
# Cellular Closure Engine (CCE)

**Specification – Version 0.x (normative)**

---

## Layer Declaration — CCE (Layer 3: Operational Closure)

This document occupies **Layer 3 (CCE)** of the GFRTU stack:

- **Role:** defines the deterministic closure operator over CDS cells and RTL judgments, including normalization, invariant checking, repair strategies, and refinement of structural state.
- **Depends on:** GFRTU mathematics (`gfrtu.md`) for the three fixed‑point principles, and on the structural encodings in CDS/RTL (Layer 2: `cds.md`, `rtl.md`).
- **Provides to higher layers:** canonical closure behavior, error surface, and repair/evidence logs consumed by ABI (Layer 4), RPC (Layer 5), and RDF projection (Layer 6).
- **Must not do:** introduce new wire formats, binary layouts, or network semantics beyond those delegated to `cce-abi.md` and `cce-rpc.md`.

Whenever this specification mentions canonical JSON hashes, repair logs, or evidence vectors, those duties are **owned by CCE as the operational reflection of GFRTU closure**; ABI/RPC layers are required only to preserve them transparently.

## 1. Purpose and Scope

The Cellular Closure Engine (CCE) operationalizes **generative closure** for a
single cell of a Generative Fibered Relational Trace Universe (GFRTU). Given a
structural CDS serialization and an RTL judgment, CCE decides admissibility and
returns a refined, closure‑complete cell or a rejection code.

---

## 2. Interface

CCE exposes two pure functions:

```text
apply : (CDS_cell, RTL_judgment) → Reject(error, repair_log) | Accept(canonical_judgment, refined_cds, repair_log)
merge : (CDS_cell, CDS_cell) → CDS_cell | Reject(error)
```

In both cases, `repair_log` is a canonical JSON array recording repairs or
partial progress. It MUST be present even on failure (possibly empty).

Implementations MUST be deterministic for fixed inputs and MUST canonicalize all
outputs before hashing and returning identifiers.

---

## 3. Inputs and Outputs

- **CDS_cell**: canonical JSON conforming to CDS §3 with `kind = "cds"`.
- **RTL_judgment**: canonical JSON per RTL §2–4.
- **canonical_judgment**: normalized RTL judgment with canonical hashing aligned
  to CDS `laws.canonicalization`.
- **refined_cds**: closure‑complete CDS after running Phase 3 (below) and fixing
  any repairable invariants.

Error signals are the textual codes defined in CDS §4 and RTL §5; CCE adds
additional codes in §7. These codes are the canonical surface for all bindings;
implementations MUST NOT substitute numeric classifications on the wire.

CCE-RPC MAY additionally return an `evidence` array that records the Closure
Event Record (CER) for the invocation. When present, `evidence` MUST be a JSON
array of SHA-256 hex digests ordered as: input CDS hash; input RTL judgment hash
(apply only); repair-log entry hashes in order; output CDS hash (when
`status = "ok"`); output canonical judgment hash (successful apply only). Any
omission, insertion, or reordering MUST raise `CCE_RPC_EVIDENCE_INVALID`.
Replaying this sequence alongside the canonical request/response payloads and
the repair log MUST suffice for an independent verifier to attest that the
closure computation obeyed this specification and the GFRTU fixed-point laws.

---

## 4. Phase Structure

CCE executes three phases on `apply`:

1. **Phase 1 – Structural validation**: validate CDS against schema fragments and
   hash, validate RTL judgment shape, and ensure `rtl_signature` alignment. Hard
   failures: `CCE_CDS_INVALID`, `CCE_RTL_INVALID`, `CDS_ID_MISMATCH`.
2. **Phase 2 – Judgment checking**: type‑check and normalize the RTL judgment per
   RTL §4. Produce `canonical_judgment`. Hard failures propagate RTL errors.
3. **Phase 3 – Closure construction**: build the closure‑complete cell using the
   deterministic procedure in §5. Repairable failures attempt correction; hard
   failures abort.

`merge` executes Phase 1 on both inputs, then performs the merge semantics in §6.

---

## 5. Deterministic Closure Construction (Phase 3)

Given a structural cell and (optionally) a defining RTL judgment, CCE MUST
execute the following algorithm. The order of every comparison is normative and
MUST NOT be reinterpreted by host runtimes:

1. **Initialization**
   - Seed a worklist with `constructors` ordered exactly as they appear in the
     CDS payload (no host‑side sorting). This order defines the layering of the
     closure operator \(UG\).
   - Initialize two caches keyed by canonical JSON: (a) `section_cache` for
     fixed‑layer sections; (b) `constructor_cache` for operand tuples. Cache
     keys MUST be SHA‑256 digests of canonical payloads to guarantee width is
     bounded by the number of distinct digests that can appear under the fuel
     bound.
2. **Layered expansion**
   - Iterate breadth‑first by constructor depth. Within a layer, operands are
     sorted lexicographically by their canonical hashes; ties break by the
     deterministic order of constructors in the worklist.
   - Apply each constructor once per unique operand tuple; hits in
     `constructor_cache` MUST skip execution. Constructors yielding existing
     hashes MUST NOT re‑emit duplicates.
   - This breadth‑first sweep is the operational presentation of the closure
     operator \(UG\): each layer is the next iterate of \(UG\) on the
     presheaf object, so halting after `fuel` layers computes the bounded
     sequence \(x, UG(x), UG^2(x), \dots\) without host‑side reinterpretation.
3. **Fuel bounds**
   - Use `defining_expression.closure_depth` when provided; otherwise default to
     16. Each breadth‑first layer decrements fuel by 1. Exceeding fuel triggers
     `CCE_CLOSURE_FUEL_EXCEEDED` and MUST leave the CDS unchanged except for a
     final `repair_log` entry explaining the exhaustion.
4. **Fixed-layer repair** (details in §5.1)
   - After each layer, repair the fixed layer via the plus construction: for
     each sieve in `site.topology`, compute matching families of sections and
     glue them; replace `fixed_layer.sections` with the glued result. Failures to
     glue uniquely trigger `CDS_FIXED_LAYER_SHEAF_FAIL` (repairable).
5. **σ/Δ stabilization**
   - Apply σ then Δ tables to every section until a fixed point is reached or
     fuel is exhausted. Non‑convergence yields `CCE_SIGMA_DELTA_DIVERGED` with a
     `repair_log` entry recording consumed fuel and the last stable hash.
6. **Invariant check** (catalogue in §5.2)
   - Evaluate `laws.invariants` in declaration order. Hard invariants abort;
     repairable ones call their deterministic repair recipe. All repairs MUST be
     recorded in `refined_cds.laws.repair_log` as `{code, before_hash,
     after_hash, fuel_used}` with `before_hash` taken prior to canonicalization
     of the repair output.
7. **Hash and return**
   - Canonicalize the refined CDS and ensure its `id` matches the canonical
     hash. Mismatch triggers `CDS_ID_MISMATCH` and MUST clear all outputs except
     the error code.

The procedure is terminating: the breadth‑first iteration consumes finite fuel,
constructor caching bounds the width, and each repair either reduces the number
of outstanding violations or aborts with an explicit code.

### 5.1 Fixed-layer Repair Recipe

Let \(C\) be the presheaf of sections. For each object \(U\) and sieve \(S\) in
`site.topology`, compute the matching family set
\(M(S) = \{ (s_f) \mid f: V → U, f \in S, s_f \in C(V) \}\). The plus
construction glues \(M(S)\) to a section \(s \in C^+(U)\) when for every
\(f: V→U\) and \(g: W→V\) we have \(s_f \circ g = s_{f \circ g}\). CCE MUST:

1. Enumerate \(M(S)\) in lexicographic order of the canonical hashes of
   participating sections.
2. Attempt gluing; if multiple gluings exist, choose the lexicographically least
   canonical hash. Absence of a glue emits `CDS_FIXED_LAYER_SHEAF_FAIL`.
3. Replace `fixed_layer.sections[object]` with the glued section list sorted by
   canonical hash. Emit a `repair_log` entry capturing before/after hashes.

Example (two‑object cover \(V→U\)): the matching family `[s_U, s_V]` glues only
when `s_V` pulled back along the cover equals `s_U`. If gluing succeeds, the new
`fixed_layer.sections` entry for `U` MUST equal the glued section; otherwise the
repair log records the failure and the apply call returns the error.

### 5.2 Closure Invariant Catalogue

CCE recognizes the following invariant families in addition to CDS §4. Each
entry declares severity and repair policy:

| Code                         | Severity     | Repair recipe                                           |
|------------------------------|--------------|---------------------------------------------------------|
| `CCE_INV_SECTION_TOTAL`      | hard         | None; requires every object to have ≥1 section          |
| `CCE_INV_SIGMA_DELTA_CLOSED` | repairable   | Saturate σ/Δ tables and rehash                          |
| `CCE_INV_OPERATOR_TOTAL`     | hard         | Reject if constructors reference missing vocabulary     |
| `CCE_INV_SHEAF_UNIQUENESS`   | repairable   | Apply plus construction; fail hard on non‑uniqueness    |
| `CCE_INV_REPAIR_HASH_MONO`   | hard         | Reject if any repair would reuse a previous `after_hash`|

Implementations MAY extend the catalogue only when the CDS explicitly declares
the invariant and its severity; undeclared checks MUST NOT be inserted.

---

## 6. Merge Semantics

`merge(c1, c2)` combines two closure‑complete cells for the same site:

1. Validate that `site.objects`, `morphisms`, and `heyting_table` coincide. On
   mismatch, return `CCE_MERGE_SITE_MISMATCH`.
2. Ensure `constructors` of `c2` extend (superset) those of `c1`; otherwise
   reject with `CCE_MERGE_CONSTRUCTOR_GAP`.
3. Compute the pointwise intersection of `fixed_layer.sections` by object with
   sections ordered lexicographically by hash; if an intersection is empty,
   return `CCE_MERGE_FIXED_LAYER_EMPTY`.
4. Unite `laws.invariants` by invariant `code`. For any shared code, if
   severities differ the merged severity is `hard`. If other metadata (e.g.
   name) disagrees, the merge MUST reject with `CCE_MERGE_INVARIANT_CONFLICT`
   or `CCE_REPAIR_FAILED`. Repair recipes are fixed by the CCE specification for
   each code and are not cell-specific runtime choices.
5. Re‑run Phase 3 closure on the merged payload to produce a canonical cell. The
   resulting `repair_log` MUST include an entry with `code = "MERGE_RECHECK"`
   capturing the before/after hashes of the merged fixed layer to guarantee
   auditability.

Merge MUST be associative and idempotent when inputs share the same canonical
hash.

---

## 7. Error Codes

| Code                           | Meaning                                                         |
|--------------------------------|-----------------------------------------------------------------|
| `CCE_CDS_INVALID`              | Structural CDS validation failed                                |
| `CCE_RTL_INVALID`              | RTL validation failed                                           |
| `CCE_CLOSURE_FUEL_EXCEEDED`    | Closure depth exceeded declared bound                           |
| `CCE_SIGMA_DELTA_DIVERGED`     | σ/Δ stabilization did not reach a fixed point                   |
| `CCE_MERGE_SITE_MISMATCH`      | Sites differ during merge                                       |
| `CCE_MERGE_CONSTRUCTOR_GAP`    | Second cell lacks required constructors                         |
| `CCE_MERGE_FIXED_LAYER_EMPTY`  | Intersection of fixed layers is empty                           |
| `CCE_MERGE_INVARIANT_CONFLICT` | Invariants with the same code disagree beyond severity          |
| `CCE_REPAIR_FAILED`            | A repairable invariant could not be corrected                   |
| `CCE_RPC_EVIDENCE_INVALID`     | Closure Event Record evidence vector is missing or malformed    |

All error codes (CCE_*, CDS_*, RTL_*) MUST propagate verbatim through CCE‑RPC
(§3). Any JSON surfaces produced by ABI-based bindings (e.g., `repair_log`
entries) MUST carry these codes unmodified. ABI bindings MAY classify the codes
for host ergonomics, but the canonical surface is the textual code itself and
MUST remain intact end-to-end.

---

## 8. Repair Log Shape and Replay Obligations

Every repair performed in Phase 3 MUST emit a log entry with the following
canonical JSON shape:

```jsonc
{"code": "CDS_* or CCE_*", "before_hash": "sha256-hex", "after_hash": "sha256-hex", "fuel_used": 0}
```

- Entries MUST be ordered by the moment the repaired payload becomes
  canonical—never retroactively sorted by code or hash.
- `fuel_used` MUST equal the remaining closure fuel at the point of repair,
  permitting deterministic replay under fuel‑bounded semantics.
- When no repair is needed, `repair_log` MUST still be present as the empty
  array to testify that CCE evaluated every invariant.
- `repair_log` MUST be present (possibly empty) even when `apply` or `merge`
  return an error code; failure cases MUST NOT omit the log.
- Each entry MUST cite a law whose name appears in `laws.invariants` and whose
  mathematical provenance is traceable back to the Acts (e.g., presheaf glue or
  σ/Δ stabilization). This connects operational repairs to the sheaf completion
  and generative closure proofs and prevents host runtimes from inventing
  ad‑hoc patches.

Implementations MUST accept a CDS only if the log entries deterministically
replay the closure sequence: re‑executing the closure with the same fuel and
inputs MUST regenerate the identical log. Logs lacking `before_hash` or
`after_hash` MUST be rejected as `CCE_REPAIR_FAILED`.

---

## 9. Worked Apply Trace

For the Boolean cell (CDS §8.1):

1. Phase 1 validates the single object site and Boolean tables.
2. Phase 2 normalizes `⊢ true : Ob U` to itself.
3. Phase 3 performs no constructor expansion; fixed layer is already glued;
   σ/Δ stabilization converges in one step; invariants hold and `repair_log` is
   empty. The refined CDS hash matches `id`, so `apply` returns
   `Accept(canonical_judgment, cds)`.

For a cell with σ/Δ commuting and a nontrivial cover, the apply trace includes a
plus‑construction repair of the fixed layer; the repair log records the before
and after hashes used by downstream audit tooling.

---

## 10. Mathematical Interpretation

CCE is the operational reflection of the three closure maps in `gfrtu.md` §0.1:

- **Sheaf completion** corresponds to Phase 3 fixed‑layer repair. The
  plus‑construction is the computational witness of sheafification, so any
  attempt to short‑circuit or reorder gluing steps violates the intended
  semantics.
- **σ/Δ stabilization** is enforced by the σ/Δ fixed‑point step. The declared
  fuel bounds the height of the stabilization tower
  \(H \supseteq \sigma(H) \supseteq \sigma^2(H) \supseteq \cdots\); deterministic
  iteration ensures reproducibility of the limit object \(H^\ast\).
- **Generative closure** is realized by the constructor worklist. Because the
  GFRTU universe is the least fixed point of the closure operator, CCE MUST
  iterate constructors in breadth‑first layers and MAY NOT prune intermediate
  strata—even if later layers appear redundant—without invalidating the fixed
  point claim.

Implementations MUST preserve this interpretation in logs, telemetry, and audit
trails: diagnostic output (if any) MUST reference the relevant closure principle
and cite the repair log entries that witnessed progress. This requirement keeps
implementations accountable to the mathematics rather than host‑specific
optimizations.

---

## 11. Deterministic Implementation Checklist

To ensure interoperable realizations of CCE, implementers MUST follow this
host‑agnostic order:

1. **Schema lock**: load the CDS/RTL schemas directly from the repository and
   freeze them for the process lifetime; hot‑reloading risks non‑deterministic
   admission.
2. **Hash discipline**: canonicalize every intermediate CDS value before use in
   caches; never rely on host object identity. Cache keys MUST be the SHA‑256
   digest of canonical JSON to remain portable across runtimes.
3. **Worklist purity**: create worklists and fuel counters as immutable records
   inside the apply/merge call; no ambient state or concurrency MUST influence
   ordering.
4. **Repair logging**: emit repair log entries at the moment of change with
   canonical pre/post hashes and fuel consumed. Omit logging only when no
   mutation occurred.
5. **Trace reproducibility**: when producing audit traces, reference the three
   closure stages (sheaf completion, σ/Δ stabilization, generative closure) and
   the corresponding repair log entries so independent auditors can replay the
   steps from the mathematical definitions.

This checklist anchors the operational algorithm to the categorical description
given in `gfrtu.md` and prevents accidental host influence on the GFRTU fixed
point.
