# Cellular JSON Carrier (CDS)

**Role.** Defines the canonical JSON shape of a cell and the byte-level contracts for hashing, validation, and repair logging.

**Depends on.** Semantic meaning in `../semantics/cellular.md` and canonicalization rules in `canonicalization.md`.

**Provides to.** Closure, storage, ABI, RPC, and RDF projection layers.

---

## 1. Purpose and Scope

Cellular Data Serialization (CDS) is the canonical JSON carrier for a single GFRTU cell. A CDS payload is closed-world: every datum required for closure MUST appear in one JSON object. Admissibility and closure completeness are determined by closure semantics; CDS enforces the structural and hashing discipline.

---

## 2. Canonical JSON Schema Fragments

Object keys MUST be lexicographically sorted after construction; arrays preserve semantic order. The filename stem MUST equal the canonical hash in `id` (see `canonicalization.md` and `storage.md`).

### 2.1 Top-level object

```jsonc
{
  "id": "sha256-hex",
  "kind": "cds",
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

Required fields: `id`, `kind`, `site`, `fibers`, `fixed_layer`, `rtl_signature`, `structural_vocabulary`, `constructors`, `laws`. Unknown top-level keys MUST be rejected.

### 2.2 Site

```jsonc
{
  "objects": [ {"id": "string", "cover": ["string", ...]} , ...],
  "morphisms": [ {"src": "string", "tgt": "string", "id": "string"}, ...],
  "topology": [ ["string", ...], ... ],
  "heyting_table": {"meet": [["string"]], "join": [["string"]], "imp": [["string"]]}
}
```

- `objects.id` MUST be unique.
- `topology` lists sieves; all morphisms in a sieve share a codomain equal to the covered object.
- `heyting_table` MUST be total and symmetric; gaps are `CDS_SITE_HEYTING_GAP`.
- Category laws are enforced; violations trigger `CDS_SITE_CATEGORY_FAIL`.

### 2.3 Fibers and Fixed Layer

```jsonc
{
  "recognition": {
    "carrier": "string",
    "sigma": {"table": [["string"]]},
    "delta": {"table": [["string"]]},
    "heyting": {"meet": [["string"]], "join": [["string"]], "imp": [["string"]]}
  },
  "sections": [
    {"object": "string", "elements": ["string", ...]}
  ]
}
```

- `sections` MUST include at least one entry per site object.
- Sections MUST be closed under the declared σ and Δ tables (`CDS_FIBER_SIGMA_DELTA_VIOLATION` on failure).
- Fixed-layer encoding mirrors fibers; sheaf gluing failures are `CDS_FIXED_LAYER_SHEAF_FAIL`.

### 2.4 RTL Signature and Structural Vocabulary

```jsonc
{
  "rtl_signature": {
    "base_types": ["string", ...],
    "constructors": [
      {"name": "string", "arity": ["Type", ...], "variance": ["+", "-", ...], "admissible": true}
    ]
  },
  "structural_vocabulary": {
    "objects": ["string", ...],
    "morphisms": [ {"name": "string", "src": "string", "tgt": "string"} ],
    "relations": [ {"name": "string", "arity": ["string", ...]} ]
  }
}
```

Unknown operators encountered during closure produce `CDS_UNKNOWN_OPERATOR`.

### 2.5 Constructors and Laws

```jsonc
{
  "constructors": [
    {"name": "pullback", "inputs": ["object", "morphism"], "outputs": ["object"],
     "total": true, "stable_under_sigma": true, "stable_under_delta": true}
  ],
  "laws": {
    "canonicalization": {"strategy": "cbv-left-to-right", "hash": "sha256"},
    "invariants": [
      {"name": "sheaf_condition", "severity": "hard", "code": "CDS_INV_SHEAF"},
      {"name": "sigma_delta_idempotent", "severity": "repairable", "code": "CDS_INV_SIGMA_DELTA"}
    ],
    "repair_log": []
  }
}
```

`laws.canonicalization.strategy` MUST align with RTL normalization; `hash` specifies the digest algorithm (SHA-256 by default). `repair_log` MUST be present (possibly empty).

### 2.6 Defining Expression and Examples

```jsonc
{
  "defining_expression": {
    "judgments": [ {"context": [...], "term": {...}, "type": {...}} ],
    "derivation_order": "height-then-leftmost",
    "closure_depth": 8
  },
  "examples": { ... }
}
```

`closure_depth` bounds constructor layering. `examples` MUST contain canonicalized payloads obeying the top-level schema.

---

## 3. Invariants and Error Codes

Structural validation and closure use the following codes (see `../semantics/cellular.md` for meaning):

| Component        | Condition                                                        | Code                           | Severity      |
|------------------|------------------------------------------------------------------|--------------------------------|---------------|
| Site             | Morphisms compose associatively and respect identities           | `CDS_SITE_CATEGORY_FAIL`       | hard          |
| Site             | Topology covers are stable under pullback                        | `CDS_SITE_TOPOLOGY_FAIL`       | hard          |
| Site             | Heyting table is total and symmetric                             | `CDS_SITE_HEYTING_GAP`         | hard          |
| Recognition      | σ, Δ tables commute with Heyting implication                     | `CDS_FIBER_SIGMA_DELTA_FAIL`   | hard          |
| Recognition      | Section elements closed under σ and Δ                            | `CDS_FIBER_SIGMA_DELTA_VIOLATION` | hard       |
| Fixed Layer      | Sections glue uniquely over topology sieves                      | `CDS_FIXED_LAYER_SHEAF_FAIL`   | repairable    |
| RTL Signature    | Every constructor referenced by `constructors` exists in RTL     | `CDS_UNKNOWN_OPERATOR`         | hard          |
| Canonicalization | `laws.canonicalization` present and matches RTL strategy         | `CDS_CANONICALIZATION_MISMATCH`| hard          |
| Canonicalization | Tables follow section order; no host reordering                  | `CDS_CANONICAL_ORDER_FAIL`     | hard          |
| Invariants       | Declared invariants violated after closure                       | codes from `laws.invariants`   | severity tag  |

Hard violations MUST reject the payload; repairable ones MAY be corrected deterministically with corresponding repair-log entries.

---

## 4. Canonicalization and Hashing

Cells MUST follow `canonicalization.md`:

- Sort all object keys lexicographically; preserve array order.
- Normalize numbers and booleans per the shared rules.
- Normalize lattice and σ/Δ tables using the declaration order of section elements.
- Hash the canonical bytes with the declared `laws.canonicalization.hash` (SHA-256 by default). The digest MUST equal both `id` and the filename stem; mismatches raise `CDS_ID_MISMATCH`.
- `repair_log` entries are canonical JSON objects; their hashes participate in evidence vectors.

---

## 5. Generation Rules

Cells MAY be self-generated using the data they carry:

1. Seed with `structural_vocabulary.objects` and `morphisms`.
2. Apply `constructors` breadth-first in declaration order up to `defining_expression.closure_depth`.
3. After each layer, enforce `laws.invariants` and canonicalize; repairable violations MUST emit deterministic `repair_log` entries.
4. Record each layer’s judgments inside `defining_expression.judgments` using canonical RTL encodings.

CCE replays this pipeline during `apply` to guarantee reproducibility.

---

## 6. Worked Example

Minimal Boolean recognition cell (abbreviated):

```jsonc
{
  "id": "6f6c...", "kind": "cds",
  "site": {"objects": [{"id": "U", "cover": []}], "morphisms": [],
           "topology": [["U"]],
           "heyting_table": {"meet": [["U"]], "join": [["U"]], "imp": [["U"]]}},
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

CCE accepts any RTL judgment whose evaluation lies in `fixed_layer.sections`; violations trigger the error codes above.
