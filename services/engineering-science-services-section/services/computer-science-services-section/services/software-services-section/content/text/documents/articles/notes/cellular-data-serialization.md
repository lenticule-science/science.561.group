Cellular Data Serialization (CDS)

**Specification – Version 0.x (normative)**

--------------------------------------------------------------------------------

1. Purpose and Scope

Cellular Data Serialization (CDS) provides a canonical JSON carrier for the structural state of a single local universe (**cell**) in a Generative Fibered Relational Trace Universe (GFRTU). A CDS serialization:

- encodes the cell site and restricted Grothendieck topology;
- encodes recognition fibers and their candidate fixed layer;
- binds the Recognition Term Language (RTL) to cell objects and operations;
- enumerates structural vocabulary and generative constructors;
- records admissibility, canonicalization, and invariant laws; and
- may include defining RTL judgments that operationally generate the cell.

CDS is **closed‑world**: every input required by the Cellular Closure Engine (CCE) to test admissibility or build closure MUST appear in a single CDS JSON object. Whether a CDS is closure‑complete is a semantic property determined by CCE, not an alternate file format.

--------------------------------------------------------------------------------

2. Conformance and Terminology

The key words **MUST**, **MUST NOT**, **REQUIRED**, **SHOULD**, and **MAY** follow RFC 2119.

- A **structural CDS serialization** satisfies all MUST‑level schema constraints but may violate closure‑generated invariants.
- A **closure‑complete CDS serialization** is structural and satisfies all invariants declared under `"laws.invariants"` after CCE refinement.

Implementations MUST accept any serialization satisfying MUST‑level requirements and reject those that do not.

--------------------------------------------------------------------------------

3. Canonical JSON Schema Fragments

Implementers MUST validate CDS payloads using machine‑checkable fragments. The schema fragments below illustrate the required JSON shape. Canonicalization is defined in §5: implementations MUST sort all JSON object keys lexicographically; the examples reflect one valid instance of that order but are not themselves normative about key order. The filename stem MUST equal the canonical hash in `id`.

3.1 Top-level object

```
{
  "id": "sha256-hex",
  "kind": "cds",                 // literal
  "site": { ... },
  "fibers": { ... },
  "fixed_layer": { ... },
  "rtl_signature": { ... },
  "structural_vocabulary": { ... },
  "constructors": [ ... ],
  "laws": { ... },
  "defining_expression": { ... }, // optional
  "examples": { ... }             // optional
}
```

Required fields: `id`, `kind`, `site`, `fibers`, `fixed_layer`, `rtl_signature`, `structural_vocabulary`, `constructors`, and `laws`. Unknown extra keys MUST be rejected.

3.2 Site

```
{
  "objects": [ {"id": "string", "cover": ["string", ...]} , ...],
  "morphisms": [ {"src": "string", "tgt": "string", "id": "string"}, ...],
  "topology": [ ["string", ...], ... ],
  "heyting_table": {"meet": ["string"]("string"), "join": ["string"]("string"), "imp": ["string"]("string")}
}
```

- `objects.id` MUST be unique and total.
- `topology` is a list of sieves. Each inner array is a sieve specified by morphism identifiers drawn from `site.morphisms[*].id`. All morphisms in a single sieve MUST share the same codomain object, and that codomain is the object covered by the sieve. A CDS validator MUST reject sieves containing morphisms with different codomains or unknown morphism identifiers.
- `heyting_table` MUST present closed Heyting operations on finite joins and meets. Any missing or asymmetric table entry is an error `CDS_SITE_HEYTING_GAP`.
- Morphisms MUST form a small category: identity and associativity violations trigger `CDS_SITE_CATEGORY_FAIL`.

3.3 Fibers and Fixed Layer

```
{
  "recognition": {
    "carrier": "string",          // e.g., Discrete, Boolean, Heyting
    "sigma": {"table": ["string"]("string")},
    "delta": {"table": ["string"]("string")},
    "heyting": {"meet": ["string"]("string"), "join": ["string"]("string"), "imp": ["string"]("string")}
  },
  "sections": [
    {"object": "string", "elements": ["string", ...]}
  ]
}
```

- `sections` MUST supply at least one section per site object.
- Sections MUST obey `sigma`/`delta` closure tables; violations MUST trigger `CDS_FIBER_SIGMA_DELTA_VIOLATION`.
- The **fixed layer** is encoded identically but represents stabilized sections; sheaf gluing failures MUST trigger `CDS_FIXED_LAYER_SHEAF_FAIL`.

3.4 RTL Signature and Vocabulary

```
{
  "rtl_signature": {
    "base_types": ["string", ...],
    "constructors": [
      {"name": "string", "arity": ["Type", ...], "variance": ["+", "-", ...],
       "admissible": true}
    ]
  },
  "structural_vocabulary": {
    "objects": ["string", ...],
    "morphisms": [ {"name": "string", "src": "string", "tgt": "string"} ],
    "relations": [ {"name": "string", "arity": ["string", ...]} ]
  }
}
```

Unknown operators MUST be rejected during CCE admission with `CDS_UNKNOWN_OPERATOR`.

3.5 Constructors and Laws

```
{
  "constructors": [
    {"name": "pullback", "inputs": ["object", "morphism"], "outputs": ["object"],
     "total": true, "stable_under_sigma": true, "stable_under_delta": true}
  ],
  "laws": {
    "canonicalization": {
      "strategy": "cbv-left-to-right",
      "hash": "sha256"
    },
    "invariants": [
      {"name": "sheaf_condition", "severity": "hard", "code": "CDS_INV_SHEAF"},
      {"name": "sigma_delta_idempotent", "severity": "repairable",
       "code": "CDS_INV_SIGMA_DELTA"}
    ],
    "repair_log": []
  }
}
```

Constructors MUST be total over declared vocabulary unless marked otherwise. `laws.canonicalization.strategy` MUST match the RTL normalization plan (§5) and MUST be applied before hashing. The `repair_log` array MUST be present (possibly empty) to receive deterministic repair entries from CCE.

3.6 Defining Expression and Examples

`defining_expression` encodes the generating RTL derivations that constructed the cell. The JSON shape is:

```
{
  "judgments": [ {"context": [...], "term": {...}, "type": {...}} ],
  "derivation_order": "height-then-leftmost",
  "closure_depth": 8
}
```

CCE MUST emit `CDS_DEF_EXPR_OVERRUN` if the closure_depth is insufficient to reconstruct the fixed layer. `examples` MUST contain only canonicalized payloads obeying the top-level schema.

--------------------------------------------------------------------------------

4. Admissibility Invariants and Error Codes

Implementations MUST check the following invariants and return the listed codes on violation:

|Component|Condition|Code|Severity|
|---|---|---|---|
|Site|Morphisms compose associatively and respect identities|`CDS_SITE_CATEGORY_FAIL`|hard|
|Site|Topology covers are stable under pullback|`CDS_SITE_TOPOLOGY_FAIL`|hard|
|Site|Heyting table is total and symmetric|`CDS_SITE_HEYTING_GAP`|hard|
|Recognition|σ, Δ tables commute with Heyting implication|`CDS_FIBER_SIGMA_DELTA_FAIL`|hard|
|Recognition|Section elements closed under σ and Δ|`CDS_FIBER_SIGMA_DELTA_VIOLATION`|hard|
|Fixed Layer|Sections glue uniquely over topology sieves|`CDS_FIXED_LAYER_SHEAF_FAIL`|repairable|
|RTL Signature|Every constructor referenced by `constructors` exists in RTL|`CDS_UNKNOWN_OPERATOR`|hard|
|Canonicalization|`laws.canonicalization` present and matches RTL strategy|`CDS_CANONICALIZATION_MISMATCH`|hard|
|Canonicalization|Tables follow section order; no host reordering|`CDS_CANONICAL_ORDER_FAIL`|hard|
|Invariants|Any declared invariant is violated after closure|code from `laws.invariants`|severity tag|

Hard violations MUST cause rejection by CDS validators and by CCE `apply`. If an invariant is marked `repairable`, CCE MAY attempt a deterministic repair; failure of that repair MUST escalate to the same code with severity `hard`.

--------------------------------------------------------------------------------

7. Implementation Checklist and Mathematical Alignment

Implementers MUST follow this sequence to produce interoperable CDS payloads that witness the GFRTU mathematics rather than host conventions:

1. **Ingest against the Acts**: load the site, recognition fibers, and RTL signature strictly as a presheaf over the Act objects. Reject any field that cannot be located in the Act vocabulary.
2. **Canonicalize tables**: emit `heyting_table`, `sigma`, and `delta` entries in the object order declared under `site.objects`; do not sort by host locale. When hashing, serialize exactly this order to ensure hashes witness the presheaf element order mandated by the Acts.
3. **Validate closure intent**: ensure `laws.canonicalization.strategy` matches the RTL reduction order and that `defining_expression.closure_depth` is sufficient to cover all constructor layers. Emit `CDS_DEF_EXPR_OVERRUN` if it cannot.
4. **Record provenance**: include `examples` only after canonicalization and capture their hashes in `laws.repair_log` when used as repair seeds. Each log entry MUST cite `before_hash` and `after_hash` so replay reconstructs the sheaf repairs deterministically.
5. **Hash and name**: compute the SHA‑256 of the fully canonical JSON and set both `id` and the filename stem to that digest. Any divergence signals failure to respect the categorical ordering and MUST halt publication.

The checklist is interpretive: it relates presheaf elements, sheafification, and σ/Δ stabilization directly to the GFRTU Acts so that every serialized cell is a reproducible witness of the mathematics.

5. Canonicalization and Hashing

Canonicalization MUST be deterministic:

1. Normalize RTL judgments using the strategy declared in `laws.canonicalization.strategy` (see RTL §4).
2. Sort the keys of every JSON object lexicographically and remove redundant whitespace. Arrays preserve their semantic order; only object keys are sorted.
3. Encode integers and decimals in canonical string form (no leading zeros, no `+`, and minimal exponent form for scientific notation).
4. Hash the canonicalized bytes with `laws.canonicalization.hash` (SHA‑256 by default). The resulting hex digest MUST equal `id` and the filename stem.
5. Any mismatch MUST surface as `CDS_ID_MISMATCH`.
6. Normalize lattice tables (`heyting_table`, `fibers.recognition.heyting`, `fixed_layer.recognition.heyting`) and `sigma`/`delta` matrices so rows and columns follow the **declaration order of elements inside** **sections**. This ties the tabulation of operations to the presheaf indexing order from `acts/recognition.md` and prevents host runtimes from re‑ordering truth values. Any other ordering MUST be rejected as `CDS_CANONICAL_ORDER_FAIL`.

When CCE repairs invariants, it MUST append entries to `laws.repair_log = [{"code": ..., "before_hash": ..., "after_hash": ...}]` and recompute `id` after each repair to ensure reproducibility.

--------------------------------------------------------------------------------

6. Generation Rules

A CDS MAY be produced by enumerating the constructors and laws inside the serialization itself. The generation pipeline is:

1. Seed with `structural_vocabulary.objects` and `morphisms`.
2. Apply `constructors` in the declared order with breadth‑first layering up to `defining_expression.closure_depth`.
3. After each layer, enforce `laws.invariants` and canonicalize. Repairable invariants MUST use deterministic recipes recorded in `laws.repair_log`.
4. Record each layer’s judgments inside `defining_expression.judgments` using RTL canonical encodings.

CCE MUST re‑execute this pipeline during `apply` when a defining expression is present to guarantee the caller’s payload is reproducible.

--------------------------------------------------------------------------------

7. Interpretive Semantics and Reproducibility Duties

CDS data are not merely encodings: they are **material witnesses** of the three GFRTU fixed points introduced in `gfrtu.md` §0.1. Implementations MUST respect the following interpretive constraints to keep CDS normative and reproducible:

1. **Sheaf completion witness.** `site.topology` and `fixed_layer.sections` jointly represent the sheafified recognition object. Any repair to the fixed layer MUST correspond to a canonical plus‑construction on the presheaf of sections; repair hashes therefore stand for explicit sheafification steps.
2. **σ/Δ stabilization witness.** `fibers.recognition.sigma` and `.delta` tables encode commuting endomorphisms. Stabilization fuel in `defining_expression.closure_depth` bounds the number of σ/Δ iterations and MUST be recorded verbatim in the repair log when saturation is required to reach a fixed point.
3. **Generative closure witness.** `constructors` enumerate the generative operators for the least fixed point of the closure operator (UG). The breadth‑first layering in §6 is not optional bookkeeping—it is the discrete presentation of the closure iteration (UG^n(\emptyset)). Deviating from this order invalidates the intended universe and MUST be rejected.
4. **Hash monotonicity.** Every repair log entry MUST satisfy `before_hash != after_hash` and MUST be produced by hashing the canonical payload immediately before and after the repair. This monotonicity proves that each corrective step strictly advances the closure without hidden state or nondeterministic rewrites.

These duties ensure that a CDS serialization can be replayed as a faithful derivation of the GFRTU cell rather than a loose description.

--------------------------------------------------------------------------------

8. Cross‑References to RTL and CCE

- `rtl_signature` MUST match the RTL operator catalogue (RTL §3) and its canonical JSON encodings (RTL §4).
- `laws.canonicalization` MUST match the RTL normalization strategy (RTL §4.2).
- CCE uses `constructors`, `fixed_layer`, and `laws.invariants` during Phase 3 closure (CCE §5) and MUST emit the error codes defined here.

--------------------------------------------------------------------------------

9. Worked Examples

9.1 Minimal Boolean Recognition Cell

```
{
  "id": "6f6c...", "kind": "cds",
  "site": {"objects": [{"id": "U", "cover": []}], "morphisms": [],
           "topology": ["U"]("U"),
           "heyting_table": {"meet": ["U"]("U"), "join": ["U"]("U"), "imp": ["U"]("U")}},
  "fibers": {"recognition": {"carrier": "Boolean",
    "sigma": {"table": [["0","1"],["1","1"]]},
    "delta": {"table": [["0","0"],["0","1"]]},
    "heyting": {"meet": [["0","0"],["0","1"]], "join": [["0","1"],["1","1"]],
                 "imp": [["1","1"],["0","1"]]}},
    "sections": [{"object": "U", "elements": ["0","1"]}]},
  "fixed_layer": {"recognition": {"carrier": "Boolean", "sigma": {...}, "delta": {...},
                                   "heyting": {...}},
    "sections": [{"object": "U", "elements": ["0","1"]}]},
  "rtl_signature": {"base_types": ["Ob U"], "constructors": []},
  "structural_vocabulary": {"objects": ["U"], "morphisms": [], "relations": []},
  "constructors": [],
  "laws": {"canonicalization": {"strategy": "cbv-left-to-right", "hash": "sha256"},
            "invariants": [{"name": "sheaf_condition", "severity": "hard", "code": "CDS_INV_SHEAF"}],
            "repair_log": []}
}
```

CCE will accept any RTL judgment `⊢ t : Ob U` whose evaluation lies in the fixed layer elements `{0,1}`; unknown elements trigger `CDS_FIBER_SIGMA_DELTA_VIOLATION`.

9.2 σ/Δ Cell with Nontrivial Topology

A richer cell may introduce two objects `U,V` with a covering `V→U`. The CDS MUST list both objects, the cover in `topology`, σ/Δ tables closed under pullback, and constructors such as `pullback` and `sigma_extension`. A sample RTL judgment can be recorded in `defining_expression.judgments` and verified by CCE; repairs to `fixed_layer` via sheafification MUST use the plus construction (CCE §6.2) and update `fixed_layer.sections` accordingly with corresponding `repair_log` entries.

--------------------------------------------------------------------------------

10. Normativity Checklist and Evidence Duties

To keep CDS payloads fully normative and reproducible, implementers MUST satisfy this checklist before emitting or accepting a serialization:

1. **Source alignment.** Verify that every operator, constructor, and invariant is justified by the Acts and their interpretation in `gfrtu.md`. Introducing ad hoc extensions, even if type‑correct, violates CDS normativity.
2. **Canonical byte witness.** Confirm that the canonicalization pipeline in §5 was executed and that `id` and the filename stem are equal to the resulting SHA‑256 digest. Any host‑level pretty‑printing MUST be rejected rather than “fixed”.
3. **Deterministic repair evidence.** If any invariant repair occurred, ensure `laws.repair_log` entries pair strictly increasing hashes (`before_hash != after_hash`) and that each entry references the invariant code that triggered it. Missing or reordered entries render the CDS non‑normative.
4. **σ/Δ fuel disclosure.** Record the exact stabilization fuel actually used, even when equal to the default, in `defining_expression.closure_depth`. A CDS lacking this disclosure is **non‑replayable** and MUST be refused by CCE.
5. **Topology admissibility proof.** Emit a machine‑checkable proof object in `examples` or `defining_expression` showing that listed sieves are stable under pullback. The proof must be hash‑stable and refer to objects/morphisms by canonical identifiers.
6. **Cross‑document compatibility.** Confirm that the canonicalization strategy matches RTL (§4.1–§4.2) and that closure semantics match CCE (§5) without host‑specific reinterpretation. Divergence here is a hard error `CDS_CANONICALIZATION_MISMATCH`.

The checklist must be encoded as deterministic metadata in `laws.repair_log` or `examples` so downstream tools can audit compliance without heuristics. A CDS that passes this checklist is a complete, replayable witness of the GFRTU cell.

--------------------------------------------------------------------------------