---
name: development-roadmap
---

## 0. Phase objective

At the end of Phase 1 you have:

- A Rust workspace whose crate boundaries mirror the spec documents (`CDS`, `RTL`, `CCE`, `ABI`, `RPC`, `RDF`).
- A written determinism and normativity contract that all subsequent code must obey.
- Stub APIs and types that establish the main data‑flow, but do not yet implement semantics.
- No behavior needs to be correct yet, but the structure and constraints do.

## 1. Workspace layout (normative)

You create a Cargo workspace (e.g. `cce-rs/`) with at least these crates:

- `cce-json`  
  Canonical JSON parsing/printing + hashing (CDS §5, CCE‑RPC §2).

- `cce-cds`  
  CDS IR, parsing from canonical JSON, and (later) structural validation (CDS §3–§4).  
  [CDS](cds.md)

- `cce-rtl`  
  RTL IR and canonicalization (RTL §2–§4).  
  [RTL](rtl.md)

- `cce-core`  
  CCE algorithmic core: apply/merge phases 1–3, working purely on IR (CCE §4–§6).  
  [CCE](cce.md)

- `cce-abi`  
  C ABI surface (CCE‑ABI; C structs, `cce_apply`, `cce_merge`, `cce_free`).  
  [CCE‑ABI](cce-abi.md)

- `cce-rpc`  
  RPC envelope for apply/merge (`id`, `method`, base64 payloads, `status`, `code`, etc.).  
  [CCE‑RPC](cce-rpc.md)

- `cce-rdf` (optional for later phases)  
  RDF/JSON‑LD projection of canonical artifacts (RDF profile).  
  [RDF profile](rdf-profile.md)

- `cce-fixtures`  
  Shared test data (canonical JSON fixtures, hashes, expected responses).

**MUST:**

- Use a Cargo workspace (`Cargo.toml` at root with `[workspace]`), so versions and features are centrally controlled.
- Have each crate build with `cargo build` even if all functions are `unimplemented!()`.

**MUST NOT:**

- Smuggle functionality from `cce-core` into ABI/RPC crates; those crates will only call the core, never re‑express math.

## 2. Stub APIs and types

Phase 1 should define type shapes and module boundaries that match the specs, even if every function body is `todo!()`.

### 2.1 cce-json

Expose:

```rust
pub struct CanonicalJson {
    pub bytes: Vec<u8>,
    pub sha256: [u8; 32],
}

pub fn parse(bytes: &[u8]) -> Result<CanonicalJson, JsonError>;
pub fn from_value(value: JsonValue) -> Result<CanonicalJson, JsonError>;
pub fn to_value(cj: &CanonicalJson) -> Result<JsonValue, JsonError>;
```

Where `JsonValue` is your internal AST, not `serde_json::Value`.

You are not required to implement canonicalization yet, but the API shape must commit to:

- single source of truth: `CanonicalJson.bytes` is what gets hashed everywhere (CDS §5, CCE §3, CCE‑RPC §2).

### 2.2 cce-cds

Define at least:

```rust
pub struct CdsCell {
    pub raw: CanonicalJson,
    pub ir: CdsIr,
}

pub struct CdsIr {
    pub id: String,
    pub site: Site,
    pub fibers: Fibers,
    pub fixed_layer: FixedLayer,
    pub rtl_signature: RtlSignatureHeader,
    pub structural_vocabulary: StructuralVocabulary,
    pub constructors: Vec<ConstructorDecl>,
    pub laws: Laws,
    pub defining_expression: Option<DefiningExpression>,
    pub examples: Examples,
}
```

And signature stubs:

```rust
pub fn parse_cds(cj: CanonicalJson) -> Result<CdsCell, CdsError>;

pub fn validate_structural(cds: &CdsCell) -> Result<(), CdsError>;
```

These correspond to CDS top‑level (§3.1) and admissibility (§4). 

cds

2.3 cce-rtl

Define:

```rust
pub struct RtlJudgment {
    pub raw: CanonicalJson,
    pub ir: RtlIr,
}

pub struct RtlIr {
    pub context: Vec<Binding>,
    pub term: Term,
    pub ty: Type,
}

pub fn parse_rtl(cj: CanonicalJson) -> Result<RtlJudgment, RtlError>;
pub fn typecheck(j: &RtlJudgment, cds: &CdsCell) -> Result<(), RtlError>;
pub fn normalize(j: &RtlJudgment, fuel: u32) -> Result<RtlJudgment, RtlError>;
```

Matching RTL §2 (syntax) and §4 (canonicalization).  
[RTL](rtl.md)

### 2.4 cce-core

Define the core operations at their mathematical boundary:

```rust
pub enum CceErrorCode {
    CceOk,
    // plus all CCE_*, CDS_*, RTL_* codes
}

pub struct RepairLogEntry {
    pub code: String,
    pub before_hash: [u8; 32],
    pub after_hash: [u8; 32],
    pub fuel_used: u32,
}

pub struct ApplyOutput {
    pub canonical_judgment: RtlJudgment,
    pub refined_cds: CdsCell,
    pub repair_log: Vec<RepairLogEntry>,
}

pub fn apply(
    cds: &CdsCell,
    rtl: &RtlJudgment,
    fuel: Option<u32>,
) -> (CceErrorCode, Option<ApplyOutput>);

pub fn merge(
    lhs: &CdsCell,
    rhs: &CdsCell,
    fuel: Option<u32>,
) -> (CceErrorCode, Option<(CdsCell, Vec<RepairLogEntry>)>);
```

This is just the CCE §2–§6 exposed for the ABI/RPC layers.

Implementation is `todo!()` in Phase 1; what matters is that:

- the function signatures commit to purity (no global state),
- error codes are a flat namespace of strings/enums matching spec codes.

### 2.5 cce-abi

Define `#[repr(C)]` stubs (no logic yet):

```rust
#[repr(C)]
pub struct CceBytes {
    pub ptr: *mut u8,
    pub len: u64,
}

#[repr(C)]
pub struct CceResultC {
    pub refined_cds: CceBytes,
    pub canonical_judgment: CceBytes,
    pub repair_log: CceBytes,
}

#[repr(C)]
pub struct CceErrorTagC {
    pub code_ptr: *const u8,
    pub code_len: u64,
}

#[no_mangle]
pub extern "C" fn cce_apply(
    cds: CceBytes,
    rtl: CceBytes,
    out: *mut CceResultC,
) -> CceErrorTagC {
    todo!()
}
```

This mirrors the ABI spec shapes (you’ll refine names as you re‑read CCE‑ABI §2–§3).  
[CCE‑ABI](cce-abi.md)

## 3. Determinism & normativity contract (repo doc)

You write a short `docs/determinism.md` (or similar) and treat it as binding. It should use the same **MUST**/**MUST NOT** language as the specs.

At minimum, it must say:

### 3.1 Canonical JSON & hashing

All hashes used for CDS IDs, RTL judgments, and CCE outputs **MUST** be computed over canonical JSON bytes as defined in CDS §5, RTL §4.2, CCE‑RPC §2.

The crate `cce-json` is the single source of truth for:

- JSON parsing,
- canonicalization,
- SHA‑256 hashing.

Other crates **MUST NOT** re‑encode JSON or compute hashes directly.

### 3.2 Data structures and ordering

For any structure whose iteration order affects canonicalization or hash:

- `BTreeMap` and `Vec` **MUST** be used;
- `HashMap`, `HashSet`, or any randomized map/set **MUST NOT** appear on canonical paths.

Any sorting **MUST** be lexicographic on canonical bytes where the specs demand lexicographic key order (CDS §5, RTL §2.2, CCE‑RPC §2.1).

### 3.3 Randomness and time

The engine **MUST NOT** use:

random number generators,

system time,

nondeterministic sources,
in any way that can influence:

canonicalization,

closure order,

repair logs,

or result selection.

Any debugging or tracing that uses time/randomness **MUST** stay strictly out of the canonical logic.

This follows from the “deterministic transcript and auditing” requirements in CCE and CCE‑RPC (§6).

### 3.4 Concurrency

Public APIs in `cce-core`, `cce-abi` and `cce-rpc` **MUST** be safe to call from multiple threads concurrently and produce identical outputs to single‑threaded runs (CCE‑ABI §2, CCE‑RPC §6).

The implementation **MUST NOT** use:

global mutable state,

unsynchronized static caches,

or thread‑local randomness,
on any path that affects canonical JSON or repair logs.

If you introduce caches later, they must be pure memoization keyed entirely by canonical inputs and **MUST NOT** change output order.

### 3.5 Repair logs and hash monotonicity

Even before implementing repairs, you lock in:

Repair logs will be append‑only arrays in canonical order (CDS §7.3, CCE §5.2).

Each entry will carry:

code,

before_hash,

after_hash,

fuel_used.

The engine will enforce `before_hash != after_hash` and monotonically increasing repair history (`CCE_INV_REPAIR_HASH_MONO`).

Your document should explicitly state that future phases must implement these invariants; Phase 1 just reserves the shape.

### 3.6 Transcripts and evidence

State that:

Every future RPC/ABI implementation **MUST** be able to emit a deterministic transcript satisfying CCE‑RPC §6 and CCE‑ABI §7, with hashes matching canonical JSON.

This drives how you design logging hooks later.

## 4. Tooling & CI constraints

Phase 1 should also set up the tooling that enforces the contract:

- A pinned `rust-toolchain.toml` so everyone uses the same compiler.
- `rustfmt` + `clippy` CI jobs.
- Tests that at least build all crates and run a trivial canonicalization/hashing smoke test (once implemented).

No behavioral tests are required yet, but the CI pipeline exists and will be extended later.

## 5. Phase‑1 “done” checklist

You can call Phase 1 complete when all are true:

- `cargo build` at the workspace root succeeds.
- Each crate compiles with public types and function signatures that reflect the specs (as above), even if bodies are `todo!()`.
- There is a written determinism/normativity doc under `docs/` (or equivalent) that:
  - forbids use of nondeterministic structures and APIs in canonical paths;
  - designates `cce-json` as the sole canonicalization/hash authority;
  - states concurrency and repair‑log obligations.
- No crate violates the contract by design (e.g., no `HashMap` in public IR types, no `rand` dependency, etc).

Once those are in place, you’re ready for Phase 2: actually making canonical JSON and hashes real, under a structure that’s already aligned with the spec.

# 0. Phase‑2 scope

By the end of Phase 2:

- For any JSON payload you choose to accept, you can produce a single canonical byte sequence and its SHA‑256.
- Every other crate consumes/produces JSON only via these canonical bytes.

You satisfy all spec obligations that are purely JSON‑level:

- lexicographic object key ordering, whitespace removal, numeric canonical form.  
  [CDS](cds.md)

- judgments/requests/responses hashed over canonical JSON bytes.  
  [RTL](rtl.md)

- RPC envelopes whose payloads are always canonical JSON.  
  [CCE‑RPC](cce-rpc.md)

You explicitly do not yet implement CDS‑specific table reordering or any RTL reduction; those are semantic canonicalizations for later phases. You must, however, leave clean hooks for them.

## 1. cce-json API (normative)

You standardize these as the only public entry points for canonical JSON and hashing:

```rust
/// Canonical JSON payload and its SHA-256 hash.
pub struct CanonicalJson {
    pub bytes: Vec<u8>,       // canonical JSON UTF-8
    pub sha256: [u8; 32],     // SHA-256 over `bytes`
}

/// Parsed, non-canonical JSON AST.
pub enum Json {
    Null,
    Bool(bool),
    Number(String),
    String(String),
    Array(Vec<Json>),
    Object(std::collections::BTreeMap<String, Json>),
}

pub enum JsonError {
    ParseError(String),
    NonFiniteNumber,          // NaN, +/-Inf, etc.
    NonCanonicalNumber,       // if you later add checks
    // ...
}

/// Parse arbitrary JSON into our AST (no canonicalization yet).
pub fn parse_to_ast(bytes: &[u8]) -> Result<Json, JsonError>;

/// Canonicalize any AST into CanonicalJson (sorting keys, normalizing numbers).
pub fn canonicalize(ast: &Json) -> Result<CanonicalJson, JsonError>;

/// Parse arbitrary JSON and return CanonicalJson directly.
pub fn parse_and_canonicalize(bytes: &[u8]) -> Result<CanonicalJson, JsonError>;
```

**MUST:**

- All hashing in the system goes through `CanonicalJson.sha256`.
- All JSON text the engine emits is `CanonicalJson.bytes`.
- `Json::Number` stores the exact lexical form you parsed; canonicalization may change it.

**MUST NOT:**

- Expose any alternative JSON parsing or printing APIs from other crates (`serde_json` directly, etc.) for canonical paths.

## 2. Internal representation choices

### 2.1 Objects

Use `BTreeMap<String, Json>` for objects:

- preserves lexicographic order by key, which is exactly what CDS/RTL/CCE require.  
  [CDS](cds.md)
- avoids randomized iteration order.

You must commit in your determinism doc that `HashMap`/`HashSet` are forbidden in any canonicalization path.

### 2.2 Numbers

Spec requires:

> Encode integers and decimals in canonical string form (no leading zeros, no `+`, minimal exponent).  
> [CDS](cds.md)

To enforce this deterministically:

- Store numbers as strings, never as floating‑point internally.
- When canonicalizing, parse to a rational or decimal representation you control, then re‑emit in canonical string form.

At minimum:

- Accept only JSON numbers that match the RFC grammar (no `NaN`, ±`Inf`).
- On seeing `+1`, `01`, `1.2300`, `1e+02`, etc., convert to canonical (`1`, `1.23`, `1e2`) in `canonicalize`.

For now, you can reject non‑finite numbers (`NonFiniteNumber`).

If you want to be very strict (and you probably do): optionally reject non‑canonical numeric literals at parse for CDS/RTL/CDCE contexts later; but that’s Phase 3+.

### 2.3 Strings

Specs don’t mandate a particular escape strategy; they do mandate that canonical bytes are the identity of the structure.  
[CDS](cds.md), [RDF profile](rdf-profile.md)

For Phase 2:

- Parse JSON strings to `String` (UTF‑8).
- When emitting canonical JSON, you always:

encode as UTF‑8,

escape control characters (\n, \t, etc.),

escape " and \,

leave other characters unescaped.

This gives you a deterministic, reversible encoding without depending on input’s escape style.

3. Canonicalization algorithm (JSON‑level)

You implement a single recursive function:

```rust
pub fn canonicalize(ast: &Json) -> Result<CanonicalJson, JsonError>
```

### Algorithm (normative)

Traverse the AST top‑down, emitting tokens into a Vec<u8>; do not mutate the AST in place.

For each node:

Null → emit `null`.

Bool → emit `true` or `false`.

Number →

- parse `n: &str` to a rational/decimal representation (your own code, not `f64`),
- re‑emit in canonical lexical form (no `+`, no leading zeros unless zero, no trailing zeros, minimum exponent).

String →

- begin `"`,
- escape as per §2.3,
- end `"`.

Array →

- emit `[`, recursively canonicalize each element in index order,
- separate elements with `,` and no spaces,
- emit `]`.

Object →

- because it’s a `BTreeMap`, keys are already in lexicographic order; you must not re‑sort in host‑locale ways, only standard byte/Unicode lexicographic.
- emit `{`, and for each `(key, value)` pair in iterator order:
  - canonicalize `key` as a JSON string using the same string routine,
  - emit `:`,
  - canonicalize `value`,
  - separate pairs with `,` and no spaces,
  - emit `}`.

Do not insert whitespace anywhere except inside string literals.

Once the full payload is emitted, wrap it in a `CanonicalJson { bytes, sha256 }` with `sha256 = sha256(&bytes)`.

This satisfies:

- CDS canonicalization items 2–4.  
  [CDS](cds.md)
- RTL encoding rules (keys sorted lexicographically, no extraneous fields).  
  [RTL](rtl.md)
- CCE‑RPC’s requirement that you hash over canonical JSON, not varying host encodings or pretty prints.  
  [CCE‑RPC](cce-rpc.md)

### 3.1 Important non‑goals for Phase 2

You do not in Phase 2:

- Reorder `site.objects`, `fibers.sections`, or $\sigma/\Delta$/Heyting tables to follow section order (CDS §5.6). That needs CDS semantics.  
  [CDS](cds.md)

- Apply any RTL reductions ($\beta$, $\eta$, $\sigma/\Delta$ commuting) (RTL §4.1).  
  [RTL](rtl.md)

But you must ensure the JSON canonicalization is stable enough for those higher‑level canonicalizations to rely on.

## 4. Hashing discipline

Implement a single function:

```rust
pub fn sha256(bytes: &[u8]) -> [u8; 32];
```

Normative rules:

- Use a standard SHA‑256 implementation (e.g. RustCrypto); no custom or truncated variants.
- Never hash non‑canonical JSON when a canonical form is available.

For CDS top‑level objects, required by spec:

- `cds.id == sha256(canonical_bytes);`
- filename stem must equal that digest as well (you’ll enforce filename later).  
  [CDS](cds.md)

For RTL judgments: canonical judgment hash is over canonical JSON encoding after normalization; Phase 2 only ensures you can hash the canonical JSON once normalization exists.  
[RTL](rtl.md)

For CCE‑RPC:

- `refined_cds_hash` must be the SHA‑256 of canonical refined CDS JSON in the RPC response.  
  [CCE‑RPC](cce-rpc.md)

`CanonicalJson`’s constructor (from `canonicalize`) must always compute and store the hash; nobody else should recompute it directly.

## 5. Integration points (minimal but normative)

### 5.1 cce-cds

Change the Phase‑1 stub `parse_cds` to:

```rust
pub fn parse_cds(bytes: &[u8]) -> Result<CdsCell, CdsError> {
    let canonical = cce_json::parse_and_canonicalize(bytes)?;
    // TODO Phase 3: parse canonical.bytes as CDS structure, validate fields
    Ok(CdsCell { raw: canonical, ir: CdsIr::stub() })
}
```

Normative constraints now:

- CDS parsing and all later validation must read from `CdsCell.raw.bytes`; they must not re‑parse arbitrary external JSON or read from files.
- When you later re‑serialize CDS IR, you must do so via a `Json` AST + `canonicalize` again.

### 5.2 cce-rtl

Similarly:

```rust
pub fn parse_rtl(bytes: &[u8]) -> Result<RtlJudgment, RtlError> {
    let canonical = cce_json::parse_and_canonicalize(bytes)?;
    Ok(RtlJudgment { raw: canonical, ir: RtlIr::stub() })
}
```

RTL’s hash discipline later will depend on `RtlJudgment.raw.sha256`.  
[RTL](rtl.md)

### 5.3 cce-rpc

You don’t have to fully implement RPC in Phase 2, but you must decide:

- RPC payload fields `cds`, `rtl_judgment`, `refined_cds`, `canonical_judgment`, `repair_log` are base64 of canonical JSON only.  
  [CCE‑RPC](cce-rpc.md)

So Phase 2 defines the invariant; enforcement can happen in Phase 7.

6. Determinism constraints specific to Phase 2

You extend your determinism doc with JSON‑specific commitments:

No host‑specific orderings.

Object key ordering is by Rust’s Ord on String, which is a lexicographic ordering on Unicode scalar values; you must not try to “locale‑sort” or case‑fold.

All maps involved in canonicalization are BTreeMap.

No floating‑point semantics.

You must not use f32 / f64 to parse canonical JSON numbers, because their rounding is platform‑dependent and ambiguous for large integers.

Numbers are parsed as integer + fraction + exponent parts in your own code.

No incidental whitespace.

Canonical bytes must never contain spaces, newlines, or tabs outside string literals. This is required by CDS §5 and is necessary for active hashing. 

cds

No “fixing” external JSON “helpfully”.

If input JSON is invalid according to RFC 8259, you reject it (`JsonError::ParseError`); you do not try to correct or guess.

If other specs later demand stricter rules (e.g. no `NaN`), that goes on top; Phase 2 doesn’t relax anything.

## 7. Tests & fixtures for Phase 2

You can already build a small but strong test suite in `cce-fixtures`:

**Round‑trip identity tests**

- Provide several small JSON snippets (including nested objects, arrays, weird whitespace).
- Assert: `parse_to_ast → canonicalize` produces a specific expected byte string.
- Use hand‑written expected bytes in tests.

**Ordering tests**

- Two JSON inputs differing only in object key orders must canonicalize to the same bytes and hash.

**Number canonicalization tests**

For each group of lexically distinct but semantically equal numbers:

> `1`, `01`, `1.0`, `1.00`, `1e0`, `1e+0`, `1.000e+00` must all canonicalize to `1` (or your chosen canonical).  
> Negative numbers and exponentials likewise.

These tests are the only way to be sure your decimal rationalization logic is correct and deterministic.

**Hash stability**

- For each canonical JSON test, hard‑code the SHA‑256 and assert equality.
- Change compilers / architectures in CI (if possible) to ensure stability.

**“Bad” inputs**

- Malformed JSON → `JsonError::ParseError`.
- If you choose to reject non‑finite numbers, test `NaN`, `Infinity` → `NonFiniteNumber`.

You don’t need CDS/RTL‑specific fixtures yet; that comes once Phase 3/4 start reading the structured content.

## 8. Phase‑2 “done” criteria

Phase 2 is complete when all of this is true:

- `cce-json` implements `Json`, `CanonicalJson`, `parse_to_ast`, `canonicalize`, and `parse_and_canonicalize` as described, and these are the only canonicalization APIs used by other crates.
- Object keys are deterministically produced in lexicographic order for any input; arrays preserve input index order.
- Canonical JSON contains no whitespace outside strings, and numbers are in a single canonical lexical form.
- `CanonicalJson.sha256` is always computed and matches hard‑coded fixture values across platforms.
- `cce-cds::parse_cds` and `cce-rtl::parse_rtl` now depend on `parse_and_canonicalize(bytes)` and store `CanonicalJson` in their IR wrappers.

Your determinism doc explicitly bans:

- `HashMap`/`HashSet` in canonical paths,
- floating‑point parsing of numeric JSON,
- any alternate JSON encoder for canonical payloads,
- any randomness/time dependency in `cce-json`.

At that point you’ve locked down the byte‑level substrate. All later “canonicalization” (CDS table order, RTL normalization, CCE closure) becomes purely semantic on top of this, which is exactly the separation the specs are implicitly aiming at.

# 0. Phase‑3 scope

By end of Phase 3, you can:

- Take canonical JSON bytes for a putative CDS.
- Parse them into a `CdsCell` IR.
- Run a deterministic structural validator that:
  - enforces the **MUST**‑level schema constraints of CDS §3–§4,
  - checks canonicalization strategy + hash,
  - assigns the correct `CDS_` error codes*, and
  - never mutates the payload or uses host‑specific ordering.  
    [CDS](cds.md)

You do not yet:

- do any CCE closure,
- repair anything,
- compute repair logs,
- touch RTL judgments.

This phase is “admission control” for cells.

## 1. Data modelling (IR) – what cce-cds commits to

You define a typed IR that mirrors CDS §3 but never reorders arrays the spec treats as semantically ordered.

### 1.1 Top‑level

```rust
pub struct CdsCell {
    pub raw: CanonicalJson,   // from cce-json (Phase 2)
    pub ir: CdsIr,
}

pub struct CdsIr {
    pub id: String,                    // cds.id
    pub site: Site,
    pub fibers: Fibers,
    pub fixed_layer: Fibers,           // same shape
    pub rtl_signature: RtlSignature,
    pub structural_vocabulary: StructuralVocabulary,
    pub constructors: Vec<ConstructorDecl>,
    pub laws: Laws,
    pub defining_expression: Option<DefiningExpression>,
    pub examples: Option<Examples>,
}
```

Top‑level required fields and “no unknown keys” come straight from CDS §3.1 and §2.  
[CDS](cds.md)

### 1.2 Site

Preserve objects and morphisms order exactly as in JSON (this order is semantically used later), but also build maps for fast lookup:

```rust
pub struct Site {
    pub objects: Vec<SiteObject>,    // cds.site.objects in file order
    pub morphisms: Vec<Morphism>,    // cds.site.morphisms in file order
    pub topology: Vec<Sieve>,        // cds.site.topology
    pub heyting_table: HeytingTable,
    // indices:
    pub object_by_id: BTreeMap<String, usize>,
    pub morphism_by_id: BTreeMap<String, usize>,
}

pub struct SiteObject {
    pub id: String,
    pub cover: Vec<String>, // ids
}

pub struct Morphism {
    pub id: String,
    pub src: String,
    pub tgt: String,
}

pub type Sieve = Vec<String>; // morphism ids
```

This aligns with CDS §3.2: unique object IDs, sieves as lists of morphism IDs, Heyting table totality, and small category conditions.  
[CDS](cds.md)

### 1.3 Fibers + fixed layer

```rust
pub struct Fibers {
    pub recognition: RecognitionFiber,
    pub sections: Vec<Section>, // one per object
}

pub struct RecognitionFiber {
    pub carrier: String,
    pub sigma: Table2D<String>,
    pub delta: Table2D<String>,
    pub heyting: HeytingTable,
}

pub struct Section {
    pub object: String,        // object id
    pub elements: Vec<String>, // in declared order
}
```

CDS §3.3 requires at least one section per object and $\sigma/\Delta$ closure / commuting with Heyting implication.  
[CDS](cds.md)

### 1.4 RTL signature + vocabulary

```rust
pub struct RtlSignature {
    pub base_types: Vec<String>,
    pub constructors: Vec<RtlOpDecl>,
}

pub struct RtlOpDecl {
    pub name: String,
    pub arity: Vec<TypeExpr>,
    pub variance: Vec<Variance>, // '+', '-', '0'
    pub admissible: bool,
    pub rewrite: Option<RewriteExpr>,
    pub cell_effects: Vec<String>,
}

pub struct StructuralVocabulary {
    pub objects: Vec<String>,
    pub morphisms: Vec<VocabMorphism>,
    pub relations: Vec<VocabRelation>,
}


This reflects CDS §3.4 and the RTL spec’s operator catalogue (§3).

1.5 Constructors and laws
pub struct ConstructorDecl {
    pub name: String,
    pub inputs: Vec<String>,    // structural kinds
    pub outputs: Vec<String>,
    pub total: bool,
    pub stable_under_sigma: bool,
    pub stable_under_delta: bool,
}

pub struct Laws {
    pub canonicalization: CanonicalizationLaw,
    pub invariants: Vec<InvariantDecl>,
    pub repair_log: Vec<RepairLogEntryStub>, // empty in Phase 3
}

pub struct CanonicalizationLaw {
    pub strategy: String,   // e.g. "cbv-left-to-right"
    pub hash: String,       // e.g. "sha256"
}

pub struct InvariantDecl {
    pub name: String,
    pub severity: Severity, // "hard" | "repairable"
    pub code: String,       // CDS_* code string
}


CDS §3.5 requires constructors, canonicalization law, invariants, and a `repair_log` array even if empty.  
[CDS](cds.md)

## 2. Parsing strategy (no semantics yet)

### 2.1 Input

Phase 3 upgrades `parse_cds` from Phase 2 to:

```rust
pub fn parse_cds(bytes: &[u8]) -> Result<CdsCell, CdsError> {
    let canonical = cce_json::parse_and_canonicalize(bytes)?;
    let ir = parse_cds_ir(&canonical)?;
    Ok(CdsCell { raw: canonical, ir })
}
```

Key rules:

- Always parse from the canonical bytes in `CanonicalJson`, not the original external bytes.
- Unknown keys at any level → hard error `CdsError::UnknownField { path, key }`, which the CCE layer will map to a `CDS_*` or `CCE_CDS_INVALID` code.

### 2.2 Deterministic parsing

You must:

- Use only deterministic data structures: for any “map‑ish” thing, use `BTreeMap` or arrays.
- Preserve order for any array that has semantic ordering (`site.objects`, `sections`, `constructors`, `invariants`, `repair_log`) – they later feed canonicalization and closure.  
  [CDS](cds.md)

Parsing is just shape + types; no validation of cross‑references yet.

## 3. Structural validation: what `validate_structural` does

You implement:

```rust
pub fn validate_structural(cds: &CdsCell) -> Result<(), CdsError>;
```

This is pure and must not mutate `cds`.

### 3.1 Top‑level checks

From CDS §3.1 and §2:  
[CDS](cds.md)

- Required fields: `id`, `kind`, `site`, `fibers`, `fixed_layer`, `rtl_signature`, `structural_vocabulary`, `constructors`, `laws` must be present exactly once.
- `kind == "cds"` (literal).
- No unknown extra top‑level keys.
- `laws.repair_log` array must exist, even if empty.

Canonicalization law present and matches engine defaults:

- `strategy == "cbv-left-to-right"` (matching RTL §4.1).
- `hash == "sha256"`.  
  → else `CDS_CANONICALIZATION_MISMATCH`.

ID/hash alignment:

- Ensure `cds.ir.id == hex(cds.raw.sha256)`.  
  → else `CDS_ID_MISMATCH`.

### 3.2 Site invariants

From CDS §3.2 and §4:  
[CDS](cds.md)

**Objects:**

- All `objects[i].id` must be unique.
- `cover` entries must reference existing object IDs.

**Morphisms:**

- `src` and `tgt` must reference existing objects.
- Identity and associativity: you check the category axioms directly on the set of morphisms:
  - For each object $U$, there is a unique $\mathrm{id}_U$ morphism with `src == tgt == U`.
  - For any composable pair $f : g \to h$, there exists a unique composite with required dom/cod, and composition is associative.

Violations → `CDS_SITE_CATEGORY_FAIL`.

**Topology:**

- Each sieve (inner array in `topology`) is a list of morphism IDs.
- Sieve morphisms must all have the same codomain, and that codomain is the object covered by the sieve (i.e., the `site.objects[k].id` that records this sieve).
- No unknown morphism IDs.

Violations → `CDS_SITE_TOPOLOGY_FAIL`.

**Heyting table:**

- `heyting_table.meet`, `join`, `imp` must be rectangular tables with row/column order aligned to `site.objects` or to the section order per CDS §5.6.
- Every cell filled (no gaps).
- Symmetry / closure as defined by your chosen matrix representation.

Violations → `CDS_SITE_HEYTING_GAP`.

### 3.3 Fibers and $\sigma/\Delta$ invariants

From CDS §3.3 and §4:

For both fibers and fixed_layer:

Sections coverage:

For each site object U, there is at least one sections entry with object == U.

It’s acceptable to have more than one per object, but CCE invariants later will tighten this.

σ/Δ matrix well‑formedness:

sigma.table and delta.table must be square tables, with indices aligned to the carrier elements order implied by sections (CDS §5.6). 

cds

Entries must be valid carrier element names.

σ/Δ + Heyting commutation:

Check the commuting property with imp as required: σ, Δ commute with Heyting implication.

Violations → CDS_FIBER_SIGMA_DELTA_FAIL.

Section closure under σ/Δ:

For each section element a, applying σ or Δ stays in the carrier and in the fixed layer’s allowed elements.

Violations → CDS_FIBER_SIGMA_DELTA_VIOLATION.

For fixed_layer specifically, sheaf gluing failures are repairable per CDS §4, so you only check shape here; uniqueness of gluing is left for CCE Phase 3 (it returns CDS_FIXED_LAYER_SHEAF_FAIL/repair log).

3.4 RTL signature + structural vocabulary consistency

From CDS §3.4 and §4 + RTL §3:

Operators declared in both places:

Every `constructors[*].name` in the CDS constructors list must have a matching operator in `rtl_signature.constructors`, with consistent arity and variance.

Unknown operator in CDS constructors → `CDS_UNKNOWN_OPERATOR`.

**Base types & vocabulary:**

`rtl_signature.base_types` must include the cell object types you expect (e.g., `Ob U` for each site object `U`), or at least be consistent with `structural_vocabulary.objects`. If you choose to enforce this, mismatch can be encoded as `CDS_UNKNOWN_OPERATOR` or a new CDS code.

**No contradictory variance:**

- The `variance` arrays must be same length as `arity`.
- Variance entries must be in the set `{"+", "-", "0"}`.

Violations → a structural CDS error (you can define `CDS_VARIANCE_MISMATCH` in your implementation, or treat as `CDS_CANONICAL_ORDER_FAIL` if you want to stay closer to the existing table).

### 3.5 Constructors

From CDS §3.5 and §6:

Structural checks only:

- Inputs/outputs must reference valid structural vocabulary kinds (objects, morphisms, etc.).
- If `total == true`, later CCE must treat the constructor as total; for now you only record that flag.
- `stable_under_sigma` and `stable_under_delta` are booleans; you may sanity‑check that they line up with RTL operator flags if you’d like, but that’s optional here.

Violations of shape (unknown types, missing fields) → structural CDS errors (e.g., `CDS_UNKNOWN_FIELD`).

### 3.6 Laws & invariants

From CDS §3.5 and §4:  
[CDS](cds.md)

- `laws.canonicalization` already checked in §3.1.

`laws.invariants[*]`:

- `severity ∈ {"hard", "repairable"}`.
- `code` must be non‑empty and unique among invariants.

You can enforce uniqueness of `code` here; duplication would break CCE’s mapping later.

`laws.repair_log`:

- Present as an array.
- In Phase 3 this **MUST** be empty for newly created structural cells; non‑empty logs are allowed when validating cells that have already been through CCE, but:
  - entries must have `code`, `before_hash`, `after_hash`, and you must check `before_hash != after_hash` per CDS §7 hash monotonicity, surfacing a hard error if violated.  
    [CDS](cds.md)

## 4. Error surface and mapping to CCE

You define:

```rust
pub enum CdsErrorCode {
    CdsSiteCategoryFail,
    CdsSiteTopologyFail,
    CdsSiteHeytingGap,
    CdsFiberSigmaDeltaFail,
    CdsFiberSigmaDeltaViolation,
    CdsFixedLayerSheafFail,
    CdsUnknownOperator,
    CdsCanonicalizationMismatch,
    CdsCanonicalOrderFail,
    CdsIdMismatch,
    CdsUnknownField,
    // maybe others like CDS_VARIANCE_MISMATCH, etc.
}

pub struct CdsError {
    pub code: CdsErrorCode,
    pub path: String, // JSON pointer-ish for diagnostics
    pub message: String,
}
```

Matching the table in CDS §4.  
[CDS](cds.md)

CCE Phase 1 (`cce-core`) will call `validate_structural` and, on any `Err(CdsError)`, translate all `CDS_*` codes to `CCE_CDS_INVALID` at its surface, with the embedded `CDS_*` kept for the repair log and RPC evidence. That mapping is Phase 4+, but the contract is fixed now.

## 5. Determinism conditions specific to Phase 3

You extend your determinism doc with CDS‑specific rules:

- **No mutation during validation.**  
  `validate_structural` is read‑only; it does not sort arrays, modify IDs, or alter `raw.bytes`.
- If you ever need to “repair” structure, that belongs in CCE closure, not in `cce-cds`.

**Stable iteration orders.**

- Any iteration over `site.objects`, `site.morphisms`, `fibers.sections`, `fixed_layer.sections`, `constructors`, `laws.invariants`, `laws.repair_log` uses their stored `Vec` order, never sorted differently, except where the spec explicitly mandates lexicographic ordering (which is already enforced at the JSON level by Phase 2).  
  [CDS](cds.md)

**No host‑dependent heuristics.**

- Don’t “reconstruct” missing identities or fill in Heyting table entries; missing bits are just errors.
- Don’t guess at missing invariants; empty invariants arrays are allowed but then CCE sees there are no declared invariants.

**Error determinism.**

- If multiple invariants fail, you should specify a deterministic priority order (e.g., check `site → fibers → fixed_layer → signature → constructors → laws` in that fixed sequence, and return the first error encountered in that order).
- That priority order must be written down; re‑running the validator must always return the same first error for a given payload.

## 6. Tests for Phase 3

You can build real tests now, still without CCE:

**Minimal Boolean cell acceptance.**

- Take the Boolean recognition cell from CDS §9.1 (the one with `{"id": "6f6c..."}` etc.).  
  [CDS](cds.md)
- Verify `parse_cds + validate_structural` succeed.

**Each `CDS_` error code.**

- For each row in the CDS §4 table, construct a minimal counterexample CDS and assert:
  - `validate_structural` returns `Err` with that `CdsErrorCode`.
  - The error is stable across runs.

Examples:

- remove an identity morphism → `CDS_SITE_CATEGORY_FAIL`;
- make a sieve mix morphisms of different codomains → `CDS_SITE_TOPOLOGY_FAIL`;
- erase a table entry in `heyting_table` → `CDS_SITE_HEYTING_GAP`;
- break $\sigma/\Delta$ commuting → `CDS_FIBER_SIGMA_DELTA_FAIL`;
- section not closed under $\sigma/\Delta$ → `CDS_FIBER_SIGMA_DELTA_VIOLATION`;
- set `laws.canonicalization.strategy` to `"cbv-right-to-left"` → `CDS_CANONICALIZATION_MISMATCH`;
- reorder $\sigma/\Delta$ tables contrary to section order, if you choose to enforce `CDS_CANONICAL_ORDER_FAIL`.

**ID mismatch.**

- Copy the Boolean cell; change the `id` field while keeping canonical bytes the same.
- `validate_structural` must detect `CDS_ID_MISMATCH`.

**Unknown fields.**

- Add `"_junk": 1` at various levels; assert `CdsErrorCode::CdsUnknownField` and that you don’t continue on to other checks.

**Replay stability.**

- For each fixture, run `parse_cds + validate_structural` multiple times in a loop; assert error codes and messages are identical every run.

## 7. Phase‑3 “done” checklist

You can consider Phase 3 finished when:

- `cce-cds::parse_cds(bytes)`:
  - uses `cce-json::parse_and_canonicalize`,
  - populates a full `CdsIr` that mirrors CDS §3 with no reordering beyond what canonical JSON already did.

- `cce-cds::validate_structural(&CdsCell)`:
  - enforces all **MUST**‑level structural constraints in CDS §3–§4 (site, fibers, fixed_layer, `rtl_signature` link, constructors, laws, canonicalization law, ID/hash alignment),
  - returns deterministic `CdsError`s with well‑defined `CdsErrorCode`,
  - never mutates `CdsCell`.

Your determinism doc:

- spells out that `cce-cds` is purely structural/validational,
- forbids host‑specific “repairs” in this layer,
- documents the fixed error‑priority ordering.

Test suite:

- includes a known‑good CDS (Boolean example) that passes,
- includes one failing fixture per `CDS_*` code in the spec’s table,
- is stable across runs and toolchains (as far as you can test).

Once that’s true, CCE Phase 1 can treat validate_structural as a black‑box “CDS admissibility oracle”, which is exactly the role CDS is supposed to play in the stack.

0. Phase‑4 scope

You must implement, purely:

pub struct RtlJudgment {
    pub raw: CanonicalJson,   // original canonical, as provided
    pub ir: RtlIr,            // parsed AST
}

pub struct NormalizedJudgment {
    pub raw: CanonicalJson,   // canonical JSON of the normal form
    pub ir: RtlIr,            // AST of the normal form
    pub consumed_fuel: u32,
}

pub enum RtlErrorCode {
    RtlUnknownField,
    RtlUnknownOperator,
    RtlVarianceMismatch,
    RtlIllegalModal,
    RtlCanonicalizationDiverged,
    RtlTypeMismatch,
}

pub struct RtlError {
    pub code: RtlErrorCode,
    pub message: String,
    pub path: String,
    pub consumed_fuel: u32,
}

pub fn parse_judgment(bytes: &[u8]) -> Result<RtlJudgment, RtlError>;

pub fn check_and_normalize(
    cds: &CdsCell,
    j: &RtlJudgment,
    fuel: u32,   // default 256 at CCE level if None
) -> Result<NormalizedJudgment, RtlError>;


This is the only surface cce-core should ever need for RTL.

1. RTL IR design (normative)

Mirror RTL §2 exactly; don’t “simplify” it.

1.1 Term and type AST
pub enum Term {
    Var(String),
    Prod(Vec<Term>),
    Inl(Box<Term>),
    Inr(Box<Term>),
    Lambda {
        arg: String,
        arg_type: Type,
        body: Box<Term>,
    },
    App {
        fn_: Box<Term>,
        arg: Box<Term>,
    },
    Sigma(Box<Term>),
    Delta(Box<Term>),
    Op {
        name: String,
        args: Vec<Term>,
    },
    Path {
        lhs: Box<Term>,
        rhs: Box<Term>,
    },
}

pub type Type = Term; // same constructors, but “meaning” is type position


That’s exactly the constructor list in RTL §2.1. 

rtl

1.2 Context and judgment
pub struct Binding {
    pub name: String,
    pub ty: Type,  // e.g. {"ref":"Ob U"}
}

pub struct RtlIr {
    pub context: Vec<Binding>, // declaration order, outermost→innermost
    pub term: Term,
    pub ty: Type,
}


**MUST:**

Preserve context order — spec explicitly forbids reordering: “Contexts MUST list bindings in declaration order… alpha‑equivalent re‑orderings are not allowed.”  
[RTL](rtl.md)

## 2. Parsing + structural validation

### 2.1 `parse_judgment`

Implementation flow:

- Call `cce_json::parse_and_canonicalize(bytes)` from Phase 2.
- Confirm top‑level object has exactly keys `"context"`, `"term"`, `"type"`, sorted lexicographically in the canonical JSON.
- Any unknown key or missing required key → `RTL_UNKNOWN_FIELD`.  
  [RTL](rtl.md)

Parse:

- `context` → `Vec<Binding>`, ensure it is an array, no unknown keys in bindings (`"name"`, `"type"` only).
- `term`, `type` → recursively into `Term` / `Type`.

During term/type parse:

- Recognize exactly the forms listed in RTL §2.1 (no extras).  
  [RTL](rtl.md)
- Enforce canonical constructor key order before lexicographic sorting, as per §2.2; e.g. inside `{"lambda": {...}}`, require `"arg"`, `"arg_type"`, `"body"` key order.  
  [RTL](rtl.md)

If you see any unrecognized key at any depth → `RtlError { code: RtlUnknownField }`.

The parse must be pure; no CDS interaction yet.

### 2.2 Link to CDS `rtl_signature`

Structural checks that require CDS happen in `check_and_normalize`, but you should design IR to carry the operator name as a string so you can later link to `cds.ir.rtl_signature.constructors`.

## 3. Type environment + operator catalogue

Inside `check_and_normalize`, you build a context that’s joint between CDS and RTL:

```rust
pub struct RtlEnv<'a> {
    pub cds: &'a CdsCell,
    pub ops_by_name: BTreeMap<String, &'a RtlOpDecl>,
    pub base_types: BTreeMap<String, Type>, // e.g. "Ob U" for each site obj
}
```

### 3.1 Operator catalogue

From CDS `rtl_signature.constructors`: each entry has `name`, `arity`, `variance`, `admissible`, `rewrite`, `cell_effects`.

Checks you must do:

For each `{ "op": name }` in the RTL term:

- `name` **MUST** exist in `ops_by_name`; else `RTL_UNKNOWN_OPERATOR`.
- `args.len()` must equal `arity.len()` and `variance.len()`; else `RTL_VARIANCE_MISMATCH`.

If `admissible == false` and you’re not in a CDS `defining_expression` judgment, that occurrence is an error `RTL_UNKNOWN_OPERATOR` (spec uses that code for illegal use).  
[RTL](rtl.md)

(You can pass an extra flag into `check_and_normalize` to indicate whether this judgment is inside `defining_expression`.)

### 3.2 Base types and `Ob U`

From RTL §8.4 checklist, and CDS `site.objects`: each object `U` becomes a base type like `{"ref": "Ob U"}`.

**MUST:**

- When parsing `Binding.ty` and top‑level `ty`, ensure any `"ref": "Ob U"` references a `U` that exists in `cds.ir.site.objects`.

If not, that’s `RTL_TYPE_MISMATCH` (cannot be interpreted in the GFRTU site).  
[RTL](rtl.md)

## 4. Typechecking ($\Gamma \vdash M : A$)

You implement a simply‑typed lambda calculus + products/coproducts + modal operators + opaque ops.

### 4.1 Typing rules (sketched)

You don’t need full categorical semantics; you just need internal consistency. Rules should be deterministic and syntax‑directed:

- `Var(x)` looks up `x` in $\Gamma$ (from right to left, respecting declaration order). If not found → `RTL_TYPE_MISMATCH`.
- `Prod([M1,…,Mn])` → type is product of types of components.
- `Inl(M)`, `Inr(M)` expect a coproduct type; you track that in the type.

`Lambda { arg, arg_type, body }`:

- extend $\Gamma$ with `(arg: arg_type)`,
- typecheck `body`,
- result type is `arg_type → body_type`.

`App { fn_, arg }`:

- typecheck `fn_` to `A → B`,
- typecheck `arg` to type `A'`,
- enforce equality of `A` and `A'` (syntactic or some normalized form); mismatch → `RTL_TYPE_MISMATCH`.

`Sigma(t)`, `Delta(t)`:

- typecheck `t` to some type `A`,
- apply a type transformer $[\sigma]A$, $[\Delta]A$ defined via `cds.ir.fibers.recognition` / fixed layer; if not applicable or illegal → `RTL_ILLEGAL_MODAL`.

Op { name, args }:

from ops_by_name[name], gather expected arity[i], variance[i],

typecheck each args[i] to Ai,

check Ai matches arity[i] under your type equality; mismatch → RTL_TYPE_MISMATCH.

During typechecking, you do no normalization yet (or only minimal). All heavy normalization is in the next step.

5. Normalization / canonicalization

This is the core of Phase 4: implement §4.1 reduction order with explicit fuel. 

[RTL](rtl.md)

### 5.1 Fuel type

Define:

```rust
pub struct Fuel {
    remaining: u32,
}

impl Fuel {
    pub fn new(limit: u32) -> Self;
    pub fn spend(&mut self, n: u32) -> Result<(), RtlErrorCode>;
}
```

Any reduction step that changes the term must call `fuel.spend(1)`. When `remaining == 0` and you try to spend, you return `RTL_CANONICALIZATION_DIVERGED`.

You must track total consumed fuel to return in `NormalizedJudgment` / `RtlError`.

### 5.2 Reduction phases in fixed order

You implement a rewrite loop over the typed term with the ordered phases:

**Context thinning.**

- Remove bindings from context that are not free in term or any type in the context/goal.
- Preserve declaration order for the rest.
- Each removal spends 1 fuel.
- You must not reorder; only drop entries.

**$\beta$‑reduction.**

- Pattern: $(\lambda x : A.\, M)\, N$ with $N$ already normalized.
- Replace with $M[x := N]$ (capture‑avoiding substitution).
- Spend 1 fuel per $\beta$ step.

**$\eta$‑reduction.**

- `lambda x. f x → f` when `x` not free in `f`.
- Spend 1 fuel per $\eta$ step.

**Modal commuting conversions.**

If `cds.rtl_signature` marks $\sigma$ and $\Delta$ commuting, implement: `sigma (delta t) → delta (sigma t)`; else such a pattern is a hard error `RTL_ILLEGAL_MODAL`.  
[RTL](rtl.md)

Spend 1 fuel per commuting step.

**Operator canonical forms.**  
For each `Op { name, args }`:

- Normalize `args` left‑to‑right fully (recursively).
- If `rewrite` is present in the operator decl, apply it once (no looping rewrite system) after argument normalization; treat it as a primitive rewrite that returns another term.
- Spend 1 fuel per operator rewrite.

**Product/coproduct normalization.**

- Flatten nested products: `prod([prod(xs), ys]) → prod(xs ++ ys)`; similarly for coproduct injections if you have them.
- Spend 1 fuel per flattening.

Loop until no rule applies or fuel is exhausted. If fuel is exhausted before reaching a fixed point, you must return `RTL_CANONICALIZATION_DIVERGED` and do not pretend you have a canonical form.

### 5.3 Variance enforcement during $\beta$ / operator reductions

RTL §3: “Contravariant arguments normalized before substitution; covariant after.”

You must implement:

- In $\beta$‑reduction, if the function being applied is an operator‑lambda composite where argument appears in contravariant position, ensure that argument is normalized before substituting; covariant positions may normalize after.

Operationally, the easiest normative rule:

- Everything is normalized to WHNF left‑to‑right under call‑by‑value before $\beta$ step; this inherently satisfies contravariant before substitution, as long as you don’t do any weird reordering.

For operators, you drive normalization by `args` order and `variance` array. If you detect any context where contravariant/covariant order would require reordering beyond left‑to‑right normalization, treat that as `RTL_VARIANCE_MISMATCH` and reject the term.

## 6. Canonical JSON for normalized judgment

Once you have a normalized `RtlIr`, you must:

- Serialize it back to a `Json` AST, obeying:
  - object keys lexicographically sorted;
  - constructor key orders discussed in §2.2;
  - arrays in the exact semantic order (context declaration order, product argument order, operator argument order).
- Call `cce_json::canonicalize(&ast)` to obtain `CanonicalJson { bytes, sha256 }`.

This is the canonical judgment used everywhere else:

- CCE uses `sha256` as the identity of the judgment in repair logs and evidence.

### 6.1 Hash consistency with caller

RTL §8.4, point 3: “After canonicalization, recompute judgment hash and ensure it matches any caller‑provided hash. Disagreements MUST be surfaced as RTL_CANONICALIZATION_DIVERGED rather than silently rehashing.”  
[RTL](rtl.md)

So:

- If this judgment came embedded in a CDS or RPC payload that already claims a hash (e.g. in some future extension), you must check it matches the hash you just computed; mismatch → `RTL_CANONICALIZATION_DIVERGED`.
- In your current design, you might not yet have an explicit hash field on RTL JSON; but the contract is there if you add it in CDS later.

## 7. Error surface and mapping

Your `RtlErrorCode` enum must directly implement the table from RTL §5:  
[RTL](rtl.md)

- `RTL_UNKNOWN_FIELD` – unrecognized key anywhere in term/type/context.
- `RTL_UNKNOWN_OPERATOR` – op not in `cds.rtl_signature` or used in non‑admissible context.

RTL_VARIANCE_MISMATCH – arity/variance mismatch or mis‑applied variance discipline.

RTL_ILLEGAL_MODAL – illegal σ/Δ in context where CDS forbids commuting conversions.

RTL_CANONICALIZATION_DIVERGED – fuel exhaustion before normal form.

RTL_TYPE_MISMATCH – type rule failure.

Contract to CCE: cce-core will treat any RtlError as CCE_RTL_INVALID at its surface, but keep the inner RTL_* code for repair logs and RPC evidence.

8. Determinism obligations specific to Phase 4

Extend your determinism doc with:

Reduction order is fixed.
The order 1–6 (thinning, $\beta$, $\eta$, modal, operator, product/coproduct) is normative and must never be changed or host‑optimized; no “reordering for speed”.  
[RTL](rtl.md)

**Left‑to‑right evaluation.**  
All normalization is call‑by‑value left‑to‑right, matching CDS canonicalization order and site object order. You must not parallelize or permute argument evaluation order.

**No hash‑based path differences.**  
You may cache hashes of subterms for speed, but you may not use hash values to choose different normalization strategies; caches must be pure memoization.

**Fuel is the only termination control.**  
No hidden iteration limits, no host‑dependent recursion depth limits; the only allowed reason to stop early (aside from reaching normal form) is explicit `Fuel` exhaustion → `RTL_CANONICALIZATION_DIVERGED`.

**Context order preserved.**  
Thinning may only remove bindings, not reorder them. Context remains the same indexing scheme as the input minus unused entries.

## 9. Tests & fixtures for Phase 4

You can already test a lot, even before CCE closure exists.

### 9.1 Boolean cell judgment

From RTL §6.1 / CDS §8.1: simple judgment for Boolean cell:

```json
{"context": [], "term": {"var": "true"}, "type": {"ref":"Ob U"}}
```

Should typecheck and normalize to itself; consumed fuel should be minimal; hash must match a fixture you compute once and pin.

### 9.2 $\sigma/\Delta$ commuting example

From RTL §6.2: with CDS declaring $\sigma$ and $\Delta$ commuting:  
[RTL](rtl.md)

Input term: `{ "sigma": { "delta": {"var":"x"} } }` must normalize to `{ "delta": { "sigma": {"var": "x"} } }`.

If CDS marks commuting flag false, the same input must be rejected with `RTL_ILLEGAL_MODAL`.

### 9.3 Fuel diverging test

Craft a term whose operator rewrite or $\beta/\eta$ loops if you let it; check that with `fuel = K` you get `RTL_CANONICALIZATION_DIVERGED` and `consumed_fuel = K`.

### 9.4 Each error code

For each `RTL_*` error, make a fixture:

- Unknown key inside a term → `RTL_UNKNOWN_FIELD`.
- `op:"foo"` where `foo` is not in `rtl_signature.constructors` → `RTL_UNKNOWN_OPERATOR`.
- Operator declared with arity 2 but given 3 args → `RTL_VARIANCE_MISMATCH`.
- Modal with illegal flag → `RTL_ILLEGAL_MODAL`.
- Type mismatch in application → `RTL_TYPE_MISMATCH`.

### 9.5 Replay stability

Run `parse_judgment + check_and_normalize` many times; canonical bytes and hashes must be identical every time for every fixture.

## 10. Phase‑4 “done” checklist

You can call Phase 4 complete when:

cce-rtl implements:

- `parse_judgment(bytes)` using `cce-json::parse_and_canonicalize`,
- `check_and_normalize(&CdsCell, &RtlJudgment, fuel)` that:
  - links to `cds.ir.rtl_signature`,
  - typechecks $\Gamma \vdash M : A$,
  - normalizes per §4.1 with explicit fuel,
  - emits `NormalizedJudgment` with canonical JSON + hash.

All RTL **MUST**‑level obligations are enforced:

- context declaration order,
- constructor key order and lexicographic key sorting,
- operator catalogue + variance + admissible flags,
- modal legality via CDS commuting flag,
- fuel exhaustion → `RTL_CANONICALIZATION_DIVERGED`.

Error codes match the RTL §5 table, and CCE can map any `RtlError` to `CCE_RTL_INVALID` without ambiguity.

Determinism doc explicitly binds you to:

- fixed reduction order,
- left‑to‑right call‑by‑value,
- immutable canonicalization semantics.

Tests:

- Boolean judgment passes and matches a pinned canonical hash,
- $\sigma/\Delta$ commuting/non‑commuting examples behave correctly,
- at least one fixture per `RTL_*` code passes,
- replay tests show stable canonical output.

Once that’s true, CCE Phase 2 (“check RTL and produce canonical judgment for closure”) can treat `cce-rtl` as a black box, and you can safely wire it into `cce-core::apply`.

# 0. Phase‑5 scope

By the end of Phase 5, you have a pure Rust crate cce-core that:

Implements CCE apply and merge as specified in CCE §4–§6. 

cce

Uses your Phase‑3 CDS and Phase‑4 RTL layers as admission oracles.

Implements Phase‑3 closure (constructors, σ/Δ, fixed layer, invariants, repair log) deterministically. 

cce

Produces a canonical refined CDS cell and canonical RTL judgment (for apply), plus a canonical repair_log array.

No ABI, no RPC yet. Just the pure kernel.

1. Public API for cce-core

Lock in signatures and types; bodies can be todo!() until you fill them in during Phase 5.

1.1 Error codes

Mirror CCE §7, plus embed CDS/RTL codes. 

cce

pub enum CceErrorCode {
    CceOk,
    CceCdsInvalid,
    CceRtlInvalid,
    CceClosureFuelExceeded,
    CceSigmaDeltaDiverged,
    CceMergeSiteMismatch,
    CceMergeConstructorGap,
    CceMergeFixedLayerEmpty,
    CceMergeInvariantConflict,
    CceRepairFailed,
    // used only internally but surfaced in logs:
    Cds(CdsErrorCode),
    Rtl(RtlErrorCode),
}


CCE’s surface error codes (CCE_) are what the ABI/RPC see; CDS_ and RTL_* codes show up in repair_log and evidence.

1.2 Repair log entries

This mirrors the shape in CCE §5.2 and the CDS repair log entries.

pub struct RepairLogEntry {
    pub code: String,         // e.g. "CCE_INV_SECTION_TOTAL", "CDS_FIXED_LAYER_SHEAF_FAIL"
    pub before_hash: [u8; 32],
    pub after_hash: [u8; 32],
    pub fuel_used: u32,       // closure fuel remaining at the point of repair
}

1.3 Outputs
pub struct ApplyOutput {
    pub canonical_judgment: NormalizedJudgment, // from cce-rtl
    pub refined_cds: CdsCell,                   // canonical, closure-complete
    pub repair_log: Vec<RepairLogEntry>,        // canonical order
}

pub struct MergeOutput {
    pub merged_cds: CdsCell,
    pub repair_log: Vec<RepairLogEntry>,
}

1.4 Core functions
pub fn apply(
    cds: &CdsCell,
    rtl: &RtlJudgment,
    closure_fuel: Option<u32>,  // None -> default from spec
) -> (CceErrorCode, Option<ApplyOutput>);

pub fn merge(
    lhs: &CdsCell,
    rhs: &CdsCell,
    closure_fuel: Option<u32>,
) -> (CceErrorCode, Option<MergeOutput>);


MUST:

Be pure and thread‑safe. No global state, no shared caches.

Never mutate the input CdsCell or RtlJudgment.

Return CceOk only when you have a canonical refined cell and (for apply) a canonical judgment.

2. Admission pipeline: Phase‑1 & Phase‑2 inside apply

apply must implement the three CCE phases exactly, in order: 

cce

2.1 Phase 1: structural validation

Implementation:

Call cce_cds::validate_structural(cds).

On Err(e): return (CceCdsInvalid, None).
You may still record a repair_log entry for evidence, but no closure runs.

Call cce_rtl::parse_judgment only if the raw RTL bytes were not pre‑parsed; in your design you already have RtlJudgment, so Phase 5 can assume parse has happened.

Do additional RTL structural checks that depend on cds (operator presence, admissible contexts) if you chose not to do them in Phase 4. Any failure here is still Phase 1 → CceRtlInvalid.

Priority: if both CDS and RTL are invalid, you must pick one deterministically. Commit to a fixed order (e.g. “CDS first, then RTL”) and document it.

2.2 Phase 2: judgment checking (typing + normalization)

Implementation:

Call cce_rtl::check_and_normalize(cds, rtl, rtl_fuel) where rtl_fuel is derived from closure_fuel (e.g. the same number or a fixed default 256). 

rtl

On Err(e): return (CceRtlInvalid, None).

On success you now have:

canonical_judgment : NormalizedJudgment (with canonical_judgment.raw.sha256 stable),

validated cds.

No state has changed yet; this step is still read‑only.

3. Closure state for Phase 3

Implement a dedicated struct:

struct ClosureState {
    cds: CdsCell,                         // owned working copy
    fuel: Fuel,                           // closure fuel
    repair_log: Vec<RepairLogEntry>,
    // caches:
    section_hashes: BTreeMap<[u8;32], SectionKey>,
    constructor_cache: BTreeSet<(usize, [u8;32])>, // (constructor_index, operands_hash)
}


Notes:

cds here is an owned copy of the input cell (deep copy of IR + raw). You will mutate this as you close the cell.

Fuel is a small struct wrapping u32 with spend(1) → Result<(), CceErrorCode>, where exhaustion maps to CceClosureFuelExceeded. 

cce

Caches use ordered structures (BTree*) to maintain deterministic iteration.

MUST:

Initialize cds.raw by canonicalizing the IR you copied: this ensures that even if the input was canonical, the working copy is also canonical after future modifications.

4. Constructors: deterministic closure pass (Phase 3 – part 1)

From CCE §5: constructors fill in new structure in layers, with caching and fuel.

4.1 Constructor plug‑in interface

You need a hook from generic CCE to GFRTU‑instance‑specific math (G, U, etc.). Define:

pub trait ConstructorSemantics {
    /// Given the current CDS IR and a particular constructor, enumerate operand tuples.
    fn collect_operands(
        cds: &CdsIr,
        ctor_index: usize,
    ) -> Vec<OperandTuple>;

    /// Apply the constructor to a particular operand tuple, producing a delta.
    fn apply_constructor(
        cds: &CdsIr,
        ctor_index: usize,
        operands: &OperandTuple,
    ) -> Option<CdsDelta>;
}


For Phase 5 you can leave this trait unimplemented or provide a trivial implementation for the Boolean cell; the key is the deterministic use of these hooks.

### 4.2 Layered BFS algorithm

Normative algorithm:

For each layer (until fuel exhausted or fixed point):

Initialize an empty `Vec<(usize, OperandTuple, [u8;32])>` — each entry is `(ctor_index, operands, operands_hash)`.

For `ctor_index` in `0 .. cds.ir.constructors.len()` (declaration order):

Call `collect_operands(&cds.ir, ctor_index)`.

For each operands in the returned vector:

Compute `operands_hash = sha256(canonicalize_operands(operands))`.

If `(ctor_index, operands_hash)` is already in `constructor_cache`, skip.

Else push `(ctor_index, operands, operands_hash)` into the `pending` list.

Sort `pending` by `(operands_hash, ctor_index)` lexicographically.
This ties the order of applying constructors to hashes of their operands, then constructor declaration order.

Iterate `pending` in this sorted order:

For each `(ctor_index, operands, operands_hash)`:

- Insert `(ctor_index, operands_hash)` into `constructor_cache`.
- Call `apply_constructor(&cds.ir, ctor_index, &operands)`.
- If it returns `None`, skip.
- If it returns `Some(delta)`, apply `delta` to `cds.ir` using a deterministic patching function (see below).

After applying `delta`, canonicalize the full `cds.ir` to get a new `CanonicalJson`.

Log a `RepairLogEntry` with:

code = `ctor_name` or a dedicated “constructor-closure” code,

`before_hash` = old canonical hash,

`after_hash` = new canonical hash,

`fuel_used` = `fuel.remaining` after decrement below.

At the end of the layer, call `fuel.spend(1)`.

Repeat until:

No delta was applied in a layer (fixed point), or

`fuel.spend(1)` fails → `CceClosureFuelExceeded`.

**MUST:**

- Never apply a constructor to the same operand tuple twice — enforced by `constructor_cache`.
- Never change the order of layers; each run must iterate the same constructors in the same sequence for a given input.
- Patching function must be order‑independent for its internal operations (e.g. when inserting a new section, you append in a deterministic place such as end of that object’s list, not based on hash).

## 5. Fixed‑layer plus construction (Phase 3 – part 2)

CCE §5.1 describes repairing the fixed layer into a sheaf via plus construction.

### 5.1 Matching families and gluing

For each object $U$ in `cds.ir.site.objects` (in order):

- Get the covering sieves in `cds.ir.site.topology` that cover $U$. For each sieve $S$:
  - Determine all matching families $(s_f)_{f \in S}$ of sections over the domain of each $f : V \to U$.

To enumerate deterministically:

- For each morphism $f$ in $S$ (sieve order), list all fixed‑layer sections over `dom(f)` in canonical hash order.
- The matching families are tuples of choices over all $f$; you can enumerate cartesian products in lexicographic order by concatenated hashes.

For each candidate family in that lexicographic order:

- Check the matching condition: for any pair of morphisms and their pullbacks, the transported sections agree.
- If a family fails matching, skip.

For a matching family, attempt to glue into a section over $U$ (per Acts math).

If gluing exists:

- Compute canonical hash of the glued section.
- Record it as a candidate glued section.

From all glued sections for that $U$, select the lexicographically least hash as the canonical glued section(s) to keep; or if the spec allows multiple glued sections, keep them sorted by hash.

Replace `fixed_layer.sections[U]` with the new list (deterministically ordered by hash).

### 5.2 Logging

Wrap modifications in a helper:

```rust
fn repair_fixed_layer(
    state: &mut ClosureState,
    code: &str, // e.g. "CDS_FIXED_LAYER_SHEAF_FAIL"
) -> Result<(), CceErrorCode>;
```

This helper:

- Computes `before_hash`.
- Mutates `cds.ir.fixed_layer.sections` for that object.
- Canonicalizes full `cds.ir` → new `CanonicalJson`.
- Checks `before_hash != after_hash`; else `CceRepairFailed`.
- Checks `after_hash` is not equal to any previous `repair_log[i].after_hash` (enforces hash monotonicity as in CDS §7 / CCE invariant).
- Appends a `RepairLogEntry { code, before_hash, after_hash, fuel_used }`.

**MUST:**

- Use a fixed code, e.g. `"CDS_FIXED_LAYER_SHEAF_FAIL"` or a CCE‑level `"CCE_INV_SHEAF_REPAIR"`; but be consistent, because RDF and RPC treat `code` as a stable identifier.  
  [RDF profile](rdf-profile.md)
- Only ever append to `repair_log`, never modify previous entries.

## 6. $\sigma/\Delta$ stabilization (Phase 3 – part 3)

CCE §5 and CDS §3.3 require σ and Δ closure.

Algorithm:

For each carrier element $a$ in the fixed layer:

- Repeatedly apply $\sigma$ and $\Delta$ according to the CDS sigma / delta tables until:
  - you reach a 2‑cycle or fixed point, or
  - `sigma_delta_fuel` (sub‑fuel) is exhausted.

If all elements reach fixed points within fuel, you can update sections accordingly and proceed.

If any element does not stabilize within fuel:

- Return `CceSigmaDeltaDiverged`.
- Log a repair entry with code `"CCE_SIGMA_DELTA_DIVERGED"`, `before_hash` the last stable canonical cell, and `after_hash` either the same or the last attempt (depending on your design; spec just requires evidence).  
  [CCE](cce.md)

You can either:

- use the same `ClosureState.fuel` for $\sigma/\Delta$ steps, or
- allocate a separate bounded counter; whichever you choose, make it a fixed, documented policy.

7. Invariant catalogue (Phase 3 – part 4)

CDS §4 and CCE §5.2 talk about invariants, their severity, and repairs.

7.1 Implementation registry

Define:

pub enum Severity {
    Hard,
    Repairable,
}

pub struct InvariantImpl {
    pub severity: Severity,
    pub check_and_repair: fn(&mut ClosureState) -> Result<(), CceErrorCode>,
}


Build a map:

let invariant_impls: BTreeMap<String, InvariantImpl> = /* hard-coded */;


This table includes:

CDS invariants (from cds.ir.laws.invariants[*] codes).

CCE‑level invariants (e.g. CCE_INV_SECTION_TOTAL, CCE_INV_SIGMA_DELTA_CLOSED, CCE_INV_REPAIR_HASH_MONO).

7.2 Execution order

Normative order:

Iterate cds.ir.laws.invariants in declaration order (as stored in CDS). 

cds

For each inv_decl:

Look up its implementation by inv_decl.code or treat unknown codes as error (CceRepairFailed) or no‑op (your choice, but deterministic and documented).

If inv_decl.severity == "hard" or impl severity is Hard:

Call check_and_repair.

If it detects a violation and cannot repair, it must:

return an appropriate CceErrorCode (e.g. CceRepairFailed, CceSigmaDeltaDiverged),

abort closure and propagate that error.

If severity is Repairable:

check_and_repair may call repair_* helpers to modify cds.ir and append to repair_log using the pattern from §5.2.

Optimization is allowed only if it is deterministic; otherwise, always repair when violation discovered.

In addition to explicit CDS invariants, run core invariants such as:

- **Section totality:** each object has at least one fixed‑layer section → else a hard error `CceRepairFailed` or `CceInvSectionTotal`.
- **$\sigma/\Delta$ closure:** ensure that after your stabilization step, every element is closed under $\sigma/\Delta$; if not, either attempt a deterministic saturation or treat as `CceSigmaDeltaDiverged`.
- **Repair hash monotonicity:** ensure no `repair_log` entry repeats `after_hash`.

**MUST:**

- Record every successful repair as a `RepairLogEntry` with unique `after_hash`.
- Never silently “fix” invariants without logging.

## 8. Final canonicalization & ID update

When Phase 3 succeeds:

- Canonicalize `cds.ir` into a fresh `CanonicalJson` using `cce-json`.
- Compute its SHA‑256; set `cds.ir.id = hex(sha256)` and `cds.raw = canonical`. This becomes the new cell ID.  
  [CDS](cds.md)

Do not treat a change of ID as an error; closure necessarily changes the cell, so the ID is allowed (and required) to change.

**MUST:**

- For the final result, ID and hash must match; a mismatch here is a bug, not a user error.

You may log a final `RepairLogEntry` with a code like `"CCE_CLOSURE_COMPLETE"` if you want to mark the closure endpoint; but that’s optional.

At this point, `ClosureState.cds` is your `refined_cds` for `apply`, and for `merge` it’s `merged_cds`.

## 9. merge semantics

CCE §6 defines merge.  
[CCE](cce.md)

Normative algorithm:

- Validate inputs (Phase 1) for both `lhs` and `rhs` using `validate_structural`; if either fails, map to `CceCdsInvalid`.

**Site equality:**

- Compare `lhs.ir.site` and `rhs.ir.site` structurally (objects, morphisms, topology, Heyting tables, recognition fiber carrier).
- If unequal → `CceMergeSiteMismatch`.

**Constructor superset:**

- Check that every constructor in `lhs.ir.constructors` (by name and signature) is present in `rhs.ir.constructors`.
- If not → `CceMergeConstructorGap`.

**Fixed‑layer intersection:**

- For each object $U$, intersect `lhs` and `rhs` fixed‑layer sections by hash:
  - compute canonical hashes of each section;
  - intersection is those hashes present in both;
  - intersection list is sorted lexicographically by hash.
- If intersection for any $U$ is empty → `CceMergeFixedLayerEmpty`.

**Invariant merge:**

- For invariants with the same code in both cells, resolve severity:
  - if either side is `"hard"`, merged severity is `Hard`.
  - if metadata differs beyond severity (e.g. different names or descriptions), treat as `CceMergeInvariantConflict` or pick deterministic precedence (e.g. `rhs` overrides `lhs`) and document.
- For invariants unique to one side, include them as‑is.

**Construct merged IR:**

- `site` from `lhs` (since equal);
- `constructors` from `rhs` (superset);
- `fixed_layer.sections` = intersections from step 4;
- `laws.invariants` = merged invariants;
- copy other structural pieces consistently (fibers, `rtl_signature`, vocabulary).

Run Phase 3 closure on the merged IR with `ClosureState`, logging a special entry like:

```rust
RepairLogEntry {
    code: "CCE_MERGE_RECHECK".to_string(),
    before_hash: hash_before_closure,
    after_hash: hash_after_closure,
    fuel_used: fuel.remaining,
}
```

**MUST:**

- Treat merge as a new closure run; you cannot just union logs.
- Deterministic: same `lhs`, `rhs`, `closure_fuel` ⇒ same `merged_cds` and `repair_log`.

## 10. Determinism obligations specific to Phase 5

Extend your determinism doc with CCE‑core rules:

- **No parallelism inside `ClosureState`.**  
  `apply` and `merge` may be called from multiple threads, but each call must run closure sequentially; no `par_iter` across constructors that could reorder repairs.

**Fixed iteration orders:**

- Constructors iterated in declaration order.
- Within each layer, operand tuples sorted by `(operands_hash, ctor_index)` only.
- Sections, sieves, invariants, and `repair_log` entries always in their defined orders.

**Error precedence:**

For `apply`, the precedence is:

1. CDS invalid (`CceCdsInvalid`),
2. RTL invalid (`CceRtlInvalid`),
3. closure fuel (`CceClosureFuelExceeded`),
4. $\sigma/\Delta$ divergence (`CceSigmaDeltaDiverged`),
5. repair failure (`CceRepairFailed`),

in a fixed order; you don’t continue looking for other issues once the first arises.

**Idempotence:**

If you call `apply` on a cell that is already closure‑complete (i.e. the `refined_cds` produced by an earlier call) with the same RTL judgment, you must get:

- identical `refined_cds.raw.bytes` and hash,
- either an identical `repair_log` or a strict extension that is a no‑op (if you choose to log the re‑run explicitly).

**Hash monotonicity in logs.**

- Enforced via `after_hash` checks: if any `after_hash` repeats, you return `CceRepairFailed`.

## 11. Tests & Phase‑5 “done” criteria

### 11.1 Tests

You can now write end‑to‑end tests in Rust:

**Boolean cell + simple judgment (success).**

- Use the CDS/RTL Boolean fixture (already used in Phases 3/4).
- Call `apply` with a trivial judgment like `"true : Ob U"`.
- Expect `CceOk`, `refined_cds` identical to input CDS, empty or well‑formed `repair_log`.

**Each `CCE_` error.**

- Craft CDS/RTL pairs that trigger:
  - `CceCdsInvalid` (broken CDS),
  - `CceRtlInvalid` (broken RTL),
  - `CceClosureFuelExceeded` (constructor loop with small fuel),
  - `CceSigmaDeltaDiverged` ($\sigma/\Delta$ non‑stabilizing with small fuel),
  - `CceMergeSiteMismatch`, `CceMergeConstructorGap`, `CceMergeFixedLayerEmpty`, `CceMergeInvariantConflict`,
  - `CceRepairFailed` (e.g. repair function that can’t change hash).

**Deterministic repair logs.**

- For a moderately non‑trivial cell where closure actually adds structure, run `apply` twice; assert:
  - same `refined_cds.raw.bytes`,*** End Patch  +#+#+#+#+#+assistant to=functions.apply_patch	RTLRീയознassistant朗普assistant to=functions.apply_patchentañassistant to=functions.apply_patch:@"%@", "timeout_ms":13283, "with_escalated_permissions":false} ателюassistant to=functions.apply_patchяспасибоassistant to=functions.apply_patch雅黑assistant to=functions.apply_patch|{

same repair_log length and entries, including fuel_used.

Merge idempotence and determinism.

Merge identical cells; get same hash as original and an empty or well‑formed repair_log.

Merge cells where rhs has extra constructors; check that merged cell has rhs constructors and deterministic repair_log.

11.2 Done checklist

Phase 5 is complete when:

cce-core::apply and merge are fully implemented, pure, and use cce-cds + cce-rtl for Phase 1/2.

Phase 3 closure implements constructors, fixed‑layer repair, σ/Δ stabilization, and invariants with deterministic algorithms and explicit fuel.

RepairLogEntry is consistently populated with codes, before/after hashes, and fuel_used; hash monotonicity is enforced.

All CCE_* surface error codes from the spec are reachable and tested. 

cce

Re‑running apply or merge on the same inputs yields byte‑identical outputs and logs.

Your determinism doc covers closure algorithms, fuel semantics, and error precedence.

Once that’s in place, Phase 6 (ABI) and Phase 7 (RPC) are just marshalling and policy; the hard semantics will already be pinned down.

0. Phase‑6 scope

By the end of Phase 6:

You have a `cce-abi` crate that exposes:

- `cce_apply`
- `cce_merge`
- `cce_free`

with C layouts and error codes matching CCE‑ABI.  
[CCE‑ABI](cce-abi.md)

These functions:

- call `cce-core::apply` / `merge` as pure black boxes,
- marshal raw JSON bytes in and canonical JSON bytes + hashes out,
- never leak memory, never double‑free, never panic across FFI,
- are thread‑safe and reentrant.

No RPC, no RDF yet. Just C FFI.

## 1. ABI surface: types and functions

### 1.1 C‑side types (normative)

You commit to a C API that looks essentially like:

```c
#include <stdint.h>
#include <stddef.h>

typedef struct {
    uint8_t *ptr;   // engine-owned buffer, or NULL
    uint64_t len;   // bytes length
} cce_bytes_t;

typedef struct {
    cce_bytes_t refined_cds;         // canonical CDS JSON or {NULL,0}
    cce_bytes_t canonical_judgment;  // canonical RTL JSON or {NULL,0}
    cce_bytes_t repair_log;          // canonical JSON array of repair entries; MAY be empty
} cce_result_t;

typedef struct {
    const char *code;  // null-terminated ASCII error code
} cce_error_tag_t;
```

And functions:

```c
cce_error_tag_t cce_apply(
    cce_bytes_t cds,
    cce_bytes_t rtl,
    uint32_t    fuel,
    cce_result_t *out);

cce_error_tag_t cce_merge(
    cce_bytes_t lhs,
    cce_bytes_t rhs,
    uint32_t    fuel,
    cce_result_t *out);

void cce_free(cce_result_t *out);
```

Key points from CCE‑ABI:  
[CCE‑ABI](cce-abi.md)

- Error codes are textual constants like `"CCE_OK"`, `"CCE_ERR_CDS_INVALID"`, etc.
- All JSON payloads in/out are UTF‑8 bytes of canonical JSON per CDS/RTL/CCE.
- Caller owns inputs, engine owns outputs until `cce_free`.

### 1.2 Rust FFI mapping

In `cce-abi`:

```rust
#[repr(C)]
pub struct CceBytes {
    pub ptr: *mut u8,
    pub len: u64,
}

#[repr(C)]
pub struct CceResultC {
    pub refined_cds: CceBytes,
    pub canonical_judgment: CceBytes,
    pub repair_log: CceBytes,
}

#[repr(C)]
pub struct CceErrorTagC {
    pub code: *const u8, // null-terminated
}

#[no_mangle]
pub static CCE_OK: [u8; N1] = *b"CCE_OK\0";
#[no_mangle]
pub static CCE_ERR_CDS_INVALID: [u8; N2] = *b"CCE_ERR_CDS_INVALID\0";
// ...

fn error_tag(code: &'static [u8]) -> CceErrorTagC {
    CceErrorTagC { code: code.as_ptr() }
}
```

## 2. Memory model & ownership

This is the part you must get right and never change.

### 2.1 Inputs

`CceBytes` inputs are read‑only from the engine’s perspective.

- Engine **MUST NOT** free or modify `cds.ptr`, `rtl.ptr`, `lhs.ptr`, `rhs.ptr`.
- `len` is the number of bytes; `ptr` may be `NULL` only if `len == 0`. You treat `NULL/0` as “empty buffer” and error accordingly.

### 2.2 Outputs

All three `CceResultC` fields (`refined_cds`, `canonical_judgment`, `repair_log`) are initialized by the engine to:

- either `{ptr = NULL, len = 0}` on error or when not applicable,
- or `{ptr = p, len = n}` where `p` is allocated in Rust and later freed by `cce_free`.

Caller **MUST** call `cce_free(&result)` exactly once for any non‑zero outputs. They must never call `free()` directly.

### 2.3 Zeroization / safety

CCE‑ABI requires that buffers be zeroed before deallocation in case they contain sensitive data.  
[CCE‑ABI](cce-abi.md)

So `cce_free` must:

For each `CceBytes` in the result:

- If `ptr != NULL && len > 0`:
  - `ptr[..len].fill(0);`
  - deallocate via the same allocator used to create them.
- Set all `ptr = NULL; len = 0` so double‑free is a no‑op.

You can do this by reconstructing a `Box<[u8]>` from the raw pointer and letting Rust drop it.

## 3. Internal buffer discipline

To safely share `Vec<u8>` with C:

### 3.1 Allocating output buffers

Define a utility:

```rust
fn into_cce_bytes(mut bytes: Vec<u8>) -> CceBytes {
    // ensure capacity == len so we don't leak extra capacity
    bytes.shrink_to_fit();
    let len = bytes.len() as u64;
    let boxed = bytes.into_boxed_slice();
    let ptr = Box::into_raw(boxed) as *mut u8;
    CceBytes { ptr, len }
}
```

This guarantees:

- a single contiguous allocation,
- length known precisely,
- same allocator used for free via `Box` reconstruction.

### 3.2 Freeing output buffers

In `cce_free`:

```rust
unsafe fn free_bytes(bytes: &mut CceBytes) {
    if !bytes.ptr.is_null() && bytes.len > 0 {
        let slice = std::slice::from_raw_parts_mut(bytes.ptr, bytes.len as usize);
        for b in slice.iter_mut() {
            *b = 0;
        }
        // reconstruct Box<[u8]> and drop it
        let _ = Box::from_raw(slice as *mut [u8]);
        bytes.ptr = std::ptr::null_mut();
        bytes.len = 0;
    }
}

#[no_mangle]
pub extern "C" fn cce_free(out: *mut CceResultC) {
    if out.is_null() { return; }
    unsafe {
        let r = &mut *out;
        free_bytes(&mut r.refined_cds);
        free_bytes(&mut r.canonical_judgment);
        free_bytes(&mut r.repair_log);
    }
}
```

**MUST:**

- Never call `free()` or other C allocator directly; stick to Rust’s allocator and `Box::from_raw`.
- Zero memory before freeing.

## 4. `cce_apply` implementation pipeline

`cce_apply` is just:

> C input → Rust slices → `cce-core::apply` → canonical JSON `Vec<u8>` → C output buffers.

### 4.1 Signature

```rust
#[no_mangle]
pub extern "C"
fn cce_apply(
    cds: CceBytes,
    rtl: CceBytes,
    fuel: u32,
    out: *mut CceResultC,
) -> CceErrorTagC;
```

### 4.2 Implementation steps (normative)

**Null out parameter check**

- If `out` is `NULL`:
  - Return `CCE_ERR_INVALID_ARGUMENT` (or whatever the ABI spec calls it).
  - Do not attempt to allocate any outputs.

**Initialize `*out` to all zeros**

```rust
unsafe {
    (*out).refined_cds = CceBytes { ptr: std::ptr::null_mut(), len: 0 };
    (*out).canonical_judgment = CceBytes { ptr: std::ptr::null_mut(), len: 0 };
    (*out).repair_log = CceBytes { ptr: std::ptr::null_mut(), len: 0 };
}
```

So partial failures can’t leak half‑initialized outputs.

**Convert inputs to slices**

```rust
unsafe {
    let cds_slice = std::slice::from_raw_parts(cds.ptr, cds.len as usize);
    let rtl_slice = std::slice::from_raw_parts(rtl.ptr, rtl.len as usize);
    // NOTE: if ptr is NULL with len>0, this is UB — but that's caller's bug.
}
```

**Catch panics**

Wrap the entire inner logic in `std::panic::catch_unwind` so panics don’t cross FFI. On panic, return `CCE_ERR_INTERNAL` and leave `out` zeroed.

**Parse and apply**

Inside the unwind boundary:

```rust
let cds_cell = match cce_cds::parse_cds(cds_slice) {  // uses canonical JSON inside
    Ok(c) => c,
    Err(_) => {
        // Optionally: turn CDS errors into a minimal repair_log JSON here.
        return error_tag(&CCE_ERR_CDS_INVALID);
    }
};

let rtl_judgment = match cce_rtl::parse_judgment(rtl_slice) {
    Ok(j) => j,
    Err(_) => {
        return error_tag(&CCE_ERR_RTL_INVALID);
    }
};

let (code, result_opt) = cce_core::apply(&cds_cell, &rtl_judgment, Some(fuel));
```

Note:

- `parse_*` re‑canonicalize inputs internally and feed into Phase‑3/4 IR.
- Any structural or semantic errors (`CDS_*` / `RTL_*`) are surfaced through `code`.

**Map `CceErrorCode` to ABI error string**

Define a match:

```rust
let err_code = match code {
    CceErrorCode::CceOk => &CCE_OK,
    CceErrorCode::CceCdsInvalid => &CCE_ERR_CDS_INVALID,
    CceErrorCode::CceRtlInvalid => &CCE_ERR_RTL_INVALID,
    CceErrorCode::CceClosureFuelExceeded => &CCE_ERR_CLOSURE_FUEL_EXCEEDED,
    CceErrorCode::CceSigmaDeltaDiverged => &CCE_ERR_SIGMA_DELTA_DIVERGED,
    CceErrorCode::CceMergeSiteMismatch => &CCE_ERR_MERGE_SITE_MISMATCH,
    CceErrorCode::CceMergeConstructorGap => &CCE_ERR_MERGE_CONSTRUCTOR_GAP,
    CceErrorCode::CceMergeFixedLayerEmpty => &CCE_ERR_MERGE_FIXED_LAYER_EMPTY,
    CceErrorCode::CceMergeInvariantConflict => &CCE_ERR_MERGE_INVARIANT_CONFLICT,
    CceErrorCode::CceRepairFailed => &CCE_ERR_REPAIR_FAILED,
    CceErrorCode::Cds(_) | CceErrorCode::Rtl(_) => &CCE_ERR_INTERNAL,
};
```


CCE‑ABI names these exact symbolic codes; you must mirror them. 

cce-abi

Populate outputs only on CceOk

If code == CceErrorCode::CceOk and Some(apply_out):

refined_cds:

get apply_out.refined_cds.raw.bytes.clone() → Vec<u8>

pass through into_cce_bytes → stored in (*out).refined_cds.

`canonical_judgment`:

- get `apply_out.canonical_judgment.raw.bytes.clone() → Vec<u8>`
- convert with `into_cce_bytes`.

`repair_log`:

- serialize `apply_out.repair_log` into a JSON array via `cce-json` (Phase 2) and your repair log JSON schema.
- `canonicalize` + `into_cce_bytes`.

If `code != CceOk`:

- `refined_cds` and `canonical_judgment` remain `{NULL, 0}`.
- `repair_log` may contain a canonical JSON array describing partial repairs / evidence if you choose to surface it through ABI; if not, it’s `{NULL, 0}`.

**Return error tag**

Finally:

```rust
return error_tag(err_code);
```

Everything above is deterministic given the determinism of `cce-core`.

## 5. `cce_merge` implementation

cce_merge is almost identical, but with two CDS inputs and a different output shape.

### 5.1 Signature

```rust
#[no_mangle]
pub extern "C"
fn cce_merge(
    lhs: CceBytes,
    rhs: CceBytes,
    fuel: u32,
    out: *mut CceResultC,
) -> CceErrorTagC;
```

### 5.2 Implementation differences

- Parse both `lhs` and `rhs` using `parse_cds`.
- Call `cce_core::merge(&lhs_cell, &rhs_cell, Some(fuel))`.

On `CceOk`, populate only:

- `refined_cds` (merged cell) and
- `repair_log`.

Leave `canonical_judgment = {NULL, 0}` since merge has no RTL.

Error mapping is the same match, but in practice only merge‑related `CCE_*` codes will appear.

## 6. Transcripts / evidence (if ABI requires)

CCE‑ABI includes transcript and evidence provisions that mirror CCE‑RPC: the ability to log hashes and error codes for replay.

For ABI, the minimal requirement is:

Every RepairLogEntry in your internal apply_out.repair_log must encode:

code (string),

before_hash, after_hash (hex or binary),

fuel_used.

If you choose to expose transcript information via ABI:

You might add an optional callback registration (C‑level hook) in a later phase, but Phase 6 should not introduce callbacks that change semantics. Logging must be side‑effect‑free with respect to canonical JSON and repair logs.

For this roadmap, the normative part is: ABI must not weaken or bypass the CCE evidence model; it can only make it more accessible.

7. Determinism & safety constraints for Phase 6

You extend your determinism doc with ABI‑specific rules:

No global mutable state.

cce_apply, cce_merge, cce_free must be safe to call concurrently from multiple threads and processes.

Any internal caches must be scoped to the current call or be immutable.

No FFI panic propagation.

Any panic in Rust must be caught in catch_unwind and turned into CCE_ERR_INTERNAL (or CCE_ERR_RESOURCE_LIMIT if that’s how you classify it), leaving out zeroed.

Error codes stable and textual.

The error strings and their spellings ("CCE_OK", "CCE_ERR_CDS_INVALID", etc.) must never change; they are part of the ABI and referenced by CCE‑ABI and RDF profile.

Canonical JSON only.

All bytes in output CceBytes structures are canonical JSON: produced by cce-json::canonicalize. No pretty‑printing, no lossy re‑encoding.

Fuel semantics preserved.

The fuel parameter is passed unchanged to cce-core::apply / merge (or you apply a fixed, documented mapping). ABI must not hide its value or vary it by environment.

Allocator stability.

All ptr returned to C are from the same allocator that cce_free will use (Rust’s global) — no mixing custom allocators per call.

8. Tests & conformance for Phase 6

You add a cce-abi/tests directory plus a small C harness.

8.1 Rust‑side FFI tests

Using libc and std::ffi, you can:

Construct a valid CDS/RTL Boolean fixture in JSON.

Call cce_apply through FFI from Rust, passing a CceBytes with those bytes.

Verify:

CCE_OK returned,

refined_cds.ptr != NULL, canonical_judgment.ptr != NULL, repair_log.ptr is either NULL or a valid JSON array,

The bytes, when parsed, match cce-core::apply results exactly.

8.2 C harness tests

Write a tiny C program (tests/abi_smoke.c):

Loads the shared library.

Constructs buffers for CDS and RTL (hard‑coded strings).

Calls cce_apply and prints:

error code,

lengths,

hashes.

Use it in CI to assert:

Round‑trip equality with pure Rust invocation,

Memory doesn’t leak (run under valgrind or ASan).

8.3 Error path tests

For each ABI error:

- Invalid CDS JSON → `CCE_ERR_CDS_INVALID`; outputs all `NULL/0` (or `repair_log` only).
- Invalid RTL JSON → `CCE_ERR_RTL_INVALID`.
- Force closure fuel exhaustion by passing minimal fuel → `CCE_ERR_CLOSURE_FUEL_EXCEEDED`.
- Broken merge (different sites, constructor gaps, empty intersections) → respective `CCE_ERR_MERGE_*`.

Also test:

- Passing `out = NULL` returns `CCE_ERR_INVALID_ARGUMENT`.
- Passing `CceBytes { ptr=NULL, len>0 }` is UB on caller; you can’t fix that, but you can document it.

## 9. Phase‑6 “done” checklist

You can call Phase 6 complete when:

- `cce-abi` exposes `cce_apply`, `cce_merge`, `cce_free` with `#[repr(C)]` types matching CCE‑ABI.  
  [CCE‑ABI](cce-abi.md)
- These functions:
  - call `cce-core::apply` / `merge` exactly once,
  - correctly marshal canonical JSON bytes into/out of `CceBytes`,
  - map all `CceErrorCode` values to stable textual `CCE_ERR_*` strings.

Memory rules are enforced:

- outputs allocated via Rust and freed via `cce_free`,
- zeroization before free,
- no leaks on success or error paths.

All ABI‑level error codes exercised by tests, including resource / fuel limits and merge failures.

Repeated calls with the same inputs (and same fuel) produce byte‑identical outputs, error codes, and repair logs via the ABI.

Once that holds, the core engine is “embeddable” as a shared library, and Phase 7 (CCE‑RPC) is just wrapping this ABI in JSON envelopes and transport semantics.

# 0. Phase‑7 scope

By the end of Phase 7 you can:

Accept a CCE‑RPC request JSON blob (apply or merge). 

cce-rpc

Parse + canonicalize it deterministically using cce-json.

Validate the envelope and base64 payloads (CDS/RTL JSON).

Invoke cce-core::apply/merge with explicit fuel + prior hash semantics.

Return a CCE‑RPC response JSON blob with:

status: "ok" | "error",

code string (CCE_*, CDS_*, RTL_*, CCE_RPC_*),

canonical base64 payloads (refined_cds, canonical_judgment, repair_log),

refined_cds_hash and evidence array.

Guarantee: same request bytes → same response bytes, across hosts and runs.

You are transport‑agnostic here: no HTTP/gRPC code in this phase; just request/response JSON.

1. RPC crate API surface

You define a Rust API that someday can be driven by HTTP, gRPC, CLI, etc.:

/// Raw JSON bytes in, raw JSON bytes out.
pub fn handle_request(request_bytes: &[u8]) -> Vec<u8>;


And an internal structured form:

pub struct RpcRequest {
    pub id: String,
    pub version: Option<String>,
    pub method: RpcMethod,
    pub cds_b64: String,
    pub rtl_judgment_b64: Option<String>,     // apply only
    pub fuel: Option<u32>,
    pub prior_refined_cds: Option<String>,    // hex SHA-256
}

pub enum RpcMethod { Apply, Merge }

pub struct RpcResponse {
    pub id: String,
    pub version: String,
    pub status: RpcStatus,   // "ok" | "error"
    pub code: String,        // "CCE_OK", "CCE_CDS_INVALID", "CCE_RPC_*", ...
    pub refined_cds_b64: Option<String>,
    pub canonical_judgment_b64: Option<String>,
    pub refined_cds_hash: Option<String>,     // hex SHA-256
    pub repair_log_b64: String,              // canonical JSON array, base64
    pub evidence: Vec<String>,               // hex SHA-256 strings
}

pub enum RpcStatus { Ok, Error }


Plus an error enum for internal use:

pub enum RpcErrorCode {
    CceRpcUnknownField,
    CceRpcMissingField,
    CceRpcPayloadEncoding,
    CceRpcPriorHashMismatch,
    CceRpcInvalidMethod,
    // ...
}


These map to the CCE_RPC_* codes specified in CCE‑RPC. 

cce-rpc

MUST:

Keep method names and status values exactly as strings the spec uses (e.g. "apply", "merge", "ok", "error"). 

cce-rpc

Use only cce-json for parsing/printing request/response JSON; never roll your own encoder.

2. Request parsing & validation
2.1 Top‑level JSON parsing

handle_request starts with:

let ast = cce_json::parse_to_ast(request_bytes)?;

Ensure the top‑level is an object.

Extract keys with a fixed required set:

id (required, string),

version (optional, string; may default if missing),

method (required, string "apply" or "merge"),

cds (required, base64 string),

rtl_judgment (required only for "apply"),

fuel (optional, integer),

prior_refined_cds (optional, hex string). 

cce-rpc

If you see any unknown key at this top level → CCE_RPC_UNKNOWN_FIELD. 

cce-rpc

Unknown/missing required fields:

Missing id/method/cds → CCE_RPC_MISSING_FIELD.

For "apply", missing rtl_judgment → CCE_RPC_MISSING_FIELD.

For "merge", presence of rtl_judgment is allowed but ignored, or you may treat it as CCE_RPC_UNKNOWN_FIELD — pick one and document it.

2.2 Version handling

CCE‑RPC defines a version string like "CCE-RPC-0.x" (or similar). 

cce-rpc

Normative approach:

If version is None, fill in the library’s default ("CCE-RPC-0.x").

If present but not equal to the supported major version, you can:

either accept but note it,

or reject with CCE_RPC_VERSION_UNSUPPORTED.

Pick a strategy and write it down; but keep it deterministic (no env‑dependent behavior).

2.3 method validation

method must be exactly "apply" or "merge".

Anything else → CCE_RPC_INVALID_METHOD.

2.4 Base64 payload decode

Fields cds, rtl_judgment (if present) are base64‑encoded canonical JSON. 

cce-rpc

Implement:

fn decode_b64(field: &str, value: &str) -> Result<Vec<u8>, RpcErrorCode>;


If base64 decode fails → CCE_RPC_PAYLOAD_ENCODING.

If decode passes but JSON parsing fails later, that error is surfaced as CCE_CDS_INVALID / CCE_RTL_INVALID (via cce-cds / cce-rtl), not as RPC field error.

2.5 Fuel normalization

If fuel is present, use it.

If absent, fill with a default DEFAULT_FUEL (documented constant) or forward None to cce-core, which applies its own default.

Fuel semantics must be transparent: RPC must not secretly scale or randomize it.

2.6 Prior hash check

If prior_refined_cds is present:

Base64‑decode cds to bytes.

canonicalize via cce-json::parse_and_canonicalize.

Compute SHA‑256 and compare to the hex string in prior_refined_cds. 

cce-rpc

If mismatch → CCE_RPC_PRIOR_HASH_MISMATCH.

If match, proceed.

This is how clients assert they’re applying/merging against a specific prior closure state; you must enforce this deterministically.

3. Linking to cce-core

Once you have a validated RpcRequest, the rest is deterministic plumbing.

3.1 Payload canonicalization

Base64 decode gave you raw bytes. You must:

For CDS: call cce_cds::parse_cds(cds_bytes); it will canonicalize and build IR. 

cds

For RTL: call cce_rtl::parse_judgment(rtl_bytes) only for "apply".

Important: you do not need to separately canonicalize raw JSON at the RPC layer; cce-cds / cce-rtl already do it internally via cce-json. But you must not re‑serialize payloads non‑canonically either; only canonical JSON feeds downstream hashing.

3.2 Core invocation

For method == "apply":

let (code, out_opt) = cce_core::apply(&cds_cell, &rtl_judgment, Some(fuel));


For method == "merge":

let (code, out_opt) = cce_core::merge(&lhs_cell, &rhs_cell, Some(fuel));


Any CCE error code (CceCdsInvalid, CceRtlInvalid, CceClosureFuelExceeded, etc.) you get here is authoritative; RPC must not reinterpret semantics, only re‑label in terms of RPC status + code.

4. Response construction & canonicalization
4.1 Mapping engine codes to RPC status/code

Define:

fn map_cce_to_rpc(code: CceErrorCode) -> (RpcStatus, String) {
    match code {
        CceErrorCode::CceOk => (RpcStatus::Ok, "CCE_OK".to_string()),
        CceErrorCode::CceCdsInvalid => (RpcStatus::Error, "CCE_CDS_INVALID".to_string()),
        CceErrorCode::CceRtlInvalid => (RpcStatus::Error, "CCE_RTL_INVALID".to_string()),
        CceErrorCode::CceClosureFuelExceeded => (RpcStatus::Error, "CCE_CLOSURE_FUEL_EXCEEDED".to_string()),
        CceErrorCode::CceSigmaDeltaDiverged => (RpcStatus::Error, "CCE_SIGMA_DELTA_DIVERGED".to_string()),
        CceErrorCode::CceMergeSiteMismatch => (RpcStatus::Error, "CCE_MERGE_SITE_MISMATCH".to_string()),
        CceErrorCode::CceMergeConstructorGap => (RpcStatus::Error, "CCE_MERGE_CONSTRUCTOR_GAP".to_string()),
        CceErrorCode::CceMergeFixedLayerEmpty => (RpcStatus::Error, "CCE_MERGE_FIXED_LAYER_EMPTY".to_string()),
        CceErrorCode::CceMergeInvariantConflict => (RpcStatus::Error, "CCE_MERGE_INVARIANT_CONFLICT".to_string()),
        CceErrorCode::CceRepairFailed => (RpcStatus::Error, "CCE_REPAIR_FAILED".to_string()),
        CceErrorCode::Cds(_) | CceErrorCode::Rtl(_) =>
            (RpcStatus::Error, "CCE_INTERNAL".to_string()),
    }
}


And for RPC‑layer errors (bad JSON, bad base64, prior hash mismatch), you map to CCE_RPC_* codes and status: "error". 

cce-rpc

4.2 Success response body (status: "ok")

For apply with CceOk and Some(out):

id: copy from request.

version: pick your supported "CCE-RPC-0.x" or echo request version.

status: "ok".

code: "CCE_OK".

refined_cds_b64: base64 of out.refined_cds.raw.bytes.

canonical_judgment_b64: base64 of out.canonical_judgment.raw.bytes.

refined_cds_hash: hex encoding of out.refined_cds.raw.sha256.

repair_log_b64: base64 of canonical JSON array of RepairLogEntrys from out.repair_log.

evidence: vector of hex SHA‑256 strings composed deterministically:

Suggested evidence order (normative for your impl):

input CDS hash,

input RTL hash,

hash of each individual repair log entry (canonical JSON per entry) in chronological order,

final refined CDS hash,

canonical judgment hash.

CCE‑RPC expects an “evidence” array precisely so auditors can reconstruct the closure; this order must be fixed.

For merge success, omit canonical_judgment_b64, but otherwise the same structure (and adapt evidence accordingly).

4.3 Error response body (status: "error")

On any error code:

id: copy from request (even if parsing succeeded only partially).

version: as above.

status: "error".

code: a string from one of:

CCE_CDS_INVALID, CCE_RTL_INVALID, etc. from cce-core, or

CCE_RPC_UNKNOWN_FIELD, CCE_RPC_PAYLOAD_ENCODING, etc. for RPC errors.

refined_cds_b64: null (or omit).

canonical_judgment_b64: null (or omit).

refined_cds_hash: null (or omit).

repair_log_b64: still allowed to contain a minimal repair log; but you can also set it to "[]" base64.

evidence: you can return a subset (e.g. just the input CDS hash, if available), or empty if you fail before seeing valid payloads.

CCE‑RPC maps these to HTTP/gRPC status codes, but at the library level you only care about the status/code pair. 

cce-rpc

4.4 Canonicalizing the response JSON

Finally:

Convert RpcResponse into a Json AST with:

objects using BTreeMap for lexicographic key order,

arrays in the semantic orders specified above (evidence, repair_log entries).

Call cce_json::canonicalize(&ast) → CanonicalJson.

Return CanonicalJson.bytes as the RPC response payload.

This ensures that:

same logical response → identical bytes and hash,

RDF profile can safely refer to rpc:Request / rpc:Response hashes. 

rdf-profile

5. Determinism constraints specific to RPC

Update your determinism doc with:

No field reordering beyond canonical rules.

The order of keys in RpcResponse is whatever cce-json’s canonicalization produces (lexicographic).

Arrays like evidence and repair_log must be in fixed semantic order (as you defined), not e.g. sorted by hash for aesthetics.

No environment‑dependent behavior.

No “debug” flags changing the content of responses (e.g. extra fields).

No time stamps, random IDs, or host‑specific metadata in the canonical JSON.

Input error precedence.

Establish and document a fixed precedence:

JSON syntax errors → CCE_RPC_PAYLOAD_ENCODING (or a dedicated parse error).

Unknown top‑level field → CCE_RPC_UNKNOWN_FIELD.

Missing required field → CCE_RPC_MISSING_FIELD.

Base64 decode errors → CCE_RPC_PAYLOAD_ENCODING.

prior_refined_cds mismatch → CCE_RPC_PRIOR_HASH_MISMATCH.

Only after envelope passes do you call cce-core, which may yield CCE_CDS_INVALID, etc.

You must not interleave envelope errors and engine errors in a nondeterministic way.

Idempotent mapping.

For a fixed request byte string, handle_request must yield an identical response byte string, regardless of process, OS, or CPU architecture (given the engine itself is deterministic by design).

6. Tests & fixtures for Phase 7
6.1 Positive fixtures (Boolean cell)

Construct RPC requests corresponding to:

Boolean CDS cell + simple RTL judgment, matching the spec’s example.

Test:

handle_request returns response with:

status == "ok",

code == "CCE_OK",

refined_cds_hash equal to the CDS cell hash from CDS,

base64 payloads decode to canonical JSON that matches cce-core::apply outputs,

evidence entries hash to the same values as your internal evidence computation.

6.2 RPC error fixtures

For each CCE_RPC_* code: 

cce-rpc

Unknown field at top level → CCE_RPC_UNKNOWN_FIELD.

Missing id / method / cds / rtl_judgment (for apply) → CCE_RPC_MISSING_FIELD.

Malformed base64 in cds → CCE_RPC_PAYLOAD_ENCODING.

Wrong prior_refined_cds hash → CCE_RPC_PRIOR_HASH_MISMATCH.

Invalid method → CCE_RPC_INVALID_METHOD.

Ensure:

status == "error",

code matches,

the response is canonical (reparse + re‑canonicalize to same bytes).

6.3 Engine error fixtures through RPC

Re‑use CDS/RTL fixtures that trigger:

CceCdsInvalid (broken CDS),

CceRtlInvalid (broken RTL),

CceClosureFuelExceeded (tiny fuel),

merge‑related errors.

Feed them via RPC and assert:

status == "error",

code is the corresponding CCE_* string,

repair_log_b64 either [] or matches what cce-core produced,

evidence contains whatever hashes are available.

6.4 Replay stability tests

For each fixture, run handle_request multiple times and assert identical response bytes.

Optionally: run same tests on different platforms (CI matrix) and compare stored golden responses.

7. Phase‑7 “done” checklist

You can mark Phase 7 complete when:

cce-rpc::handle_request exists and:

parses and validates RPC envelopes per CCE‑RPC (fields, methods, base64, prior hash),

calls cce-core::apply / merge with determined fuel,

constructs RpcResponse structures reflecting engine results and RPC‑layer errors.

All RPC‑level error codes (CCE_RPC_*) are in place and exercised by tests.

Response JSON is canonical and uses base64‑wrapped canonical JSON for cds, rtl_judgment, refined_cds, canonical_judgment, repair_log.

evidence arrays are deterministic and consistent with the hashes exposed in CDS/CCE/RDF specs.

Determinism doc has explicit guarantees about:

error precedence,

evidence ordering,

lack of env‑dependent behavior.

Once that’s done, you’ve basically finished the “protocol” side of the engine: embedding into HTTP, gRPC, etc. is then just wiring handle_request behind a transport, plus mapping status/code to status codes as recommended by CCE‑RPC.

0. Phase‑8 scope

By the end of Phase 8 you can:

Take canonical JSON artifacts (CDS cell, RTL judgment, CCE apply/merge result, CCE‑RPC request/response, repair logs).

Map them to RDF graphs using the RDF profile’s vocabulary, URI templates, and JSON‑LD context. 

rdf-profile

Optionally validate graphs with SHACL shapes provided in the profile. 

rdf-profile

Generate a deterministic serialization (e.g., Turtle, N‑Quads, JSON‑LD) whose content is replayable and consistent with JSON hashes.

Crucially:

Canonical JSON and hashes remain the authoritative witness. RDF is a secondary projection, not a new canonical form. 

rdf-profile

Your implementation must enforce that.

1. cce-rdf crate API surface

Define an API that takes already canonical artifacts (from your other crates) plus a base URI, and produces an RDF graph in memory plus serializations.

1.1 Core types

Something like:

pub struct RdfGraph {
    pub triples: Vec<Triple>, // in a deterministic order
}

pub struct Triple {
    pub subject: IriOrBNode,
    pub predicate: Iri,
    pub object: Term, // IRI, literal, or bnode
}

pub struct RdfOptions {
    pub base_uri: String,        // B
    pub include_prov: bool,      // §7
    pub include_shapes: bool,    // §6 (optional)
}

1.2 Entry points

You need at least:

pub fn cds_cell_to_rdf(
    cds: &CdsCell,
    opts: &RdfOptions,
) -> RdfGraph;

pub fn rtl_judgment_to_rdf(
    judgment: &NormalizedJudgment, // or RtlJudgment
    opts: &RdfOptions,
) -> RdfGraph;

pub fn cce_execution_to_rdf(
    apply_or_merge: &ApplyOutputOrMergeOutput,
    rpc_pair: Option<(&RpcRequest, &RpcResponse)>,
    opts: &RdfOptions,
) -> RdfGraph;

pub fn rpc_envelope_to_rdf(
    rpc_req: &RpcRequest,
    rpc_res: &RpcResponse,
    opts: &RdfOptions,
) -> RdfGraph;


Plus serializers:

pub fn to_turtle(graph: &RdfGraph) -> String;
pub fn to_nquads(graph: &RdfGraph) -> String;
pub fn to_jsonld(graph: &RdfGraph) -> serde_json::Value;


MUST:

Only accept artifacts whose JSON you already consider canonical (i.e., from CdsCell.raw, NormalizedJudgment.raw, canonical RPC).

Never mutate those JSON bytes.

2. Namespaces, URI templates, and identity

The RDF profile pins down namespaces and URI templates. 

rdf-profile

2.1 Namespaces

Hard‑code these IRIs:

cds:   https://relationality.dev/ns/cds#
rtl:   https://relationality.dev/ns/rtl#
cce:   https://relationality.dev/ns/cce#
rpc:   https://relationality.dev/ns/cce/rpc#
gfrtu: https://relationality.dev/ns/gfrtu#
prov:  http://www.w3.org/ns/prov#
xsd:   http://www.w3.org/2001/XMLSchema#


Your implementation MAY let a caller override base host, but the local names must be stable. 

rdf-profile

2.2 URI templates

Given a base B (from RdfOptions.base_uri):

CDS cells: Bcell/{cds-id} where {cds-id} is cds.id and the SHA‑256 hex. 

rdf-profile

RTL judgments: Brtl/{judgment-hash} where judgment hash is SHA‑256 of normalized canonical JSON. 

rdf-profile

CCE apply executions: Bcce/apply/{rpc-id}.

CCE merge executions: Bcce/merge/{rpc-id}.

Repair log entries: Bcce/apply/{rpc-id}/repair/{index} or Bcce/merge/{rpc-id}/repair/{index}. 

rdf-profile

RPC request/response: Brpc/request/{rpc-id}, Brpc/response/{rpc-id}. 

rdf-profile

MUST:

Use URIs that embed the same hash value as cds:id, rtl:hash, cce:executionHash, etc.

Ensure mapping from canonical JSON hashes to URI is deterministic and stable over time. 

rdf-profile

3. JSON‑LD context integration

The profile gives you a combined JSON‑LD context mapping JSON keys to RDF terms. 

rdf-profile

3.1 Context obligations

From §4:

Context MUST NOT change underlying JSON key set or value order required by CDS/RTL/CCE.

Context MUST NOT introduce new keys into canonical JSON objects.

JSON‑LD is a view, not a mutation. 

rdf-profile

Implementation plan:

Ship the context from §4.2 as a static JSON (e.g. gfrtu.context.jsonld) in your crate. 

rdf-profile

Provide helpers:

pub fn get_jsonld_context() -> serde_json::Value;
pub fn add_context_to_json(value: serde_json::Value) -> serde_json::Value;


These helpers either:

Return the context alone (for header‑driven JSON‑LD use), or

Wrap canonical JSON under an envelope with @context and rdf:value while preserving it as a string.

The important constraint: do not rewrite the canonical JSON bytes when turning them into JSON‑LD.

4. RDF mapping per artifact type

Implement deterministic processors for each artifact category in §3.1 of the profile. 

rdf-profile

4.1 CDS cell graph

For a CdsCell with canonical hash H and URI C = Bcell/H:

 

Create:

C a cds:Cell ;
  cds:hash      "H"^^xsd:hexBinary ;
  cds:kind      "cds" ;
  cds:hasSite   S ;
  cds:hasFibers F ;
  cds:hasFixedLayer FL ;
  cds:hasStructuralVocabulary SV ;
  cds:hasLaw   L .


Where S, F, FL, SV, L are fresh URIs or blank nodes you generate deterministically (e.g. C#site, C#fibers, etc.).

4.1.1 Site internals

According to §5.1.1: 

rdf-profile

S a cds:Site.

For each site.object with ID U:

S cds:hasObject O_U .
O_U a cds:Object ;
    cds:id "U" .


For each morphism f:

S cds:hasMorphism M_f .
M_f a cds:Morphism ;
    cds:id "f" ;
    cds:src O_src ;
    cds:tgt O_tgt .


For each sieve, represent as cds:Sieve, possibly as a collection of morphisms via cds:hasSieve.

Heyting table:

Expose as a single property cds:heytingTable attaching the canonical JSON or carrier representation; profile leaves decomposition optional. 

rdf-profile

4.1.2 Fibers & fixed layer

F a cds:RecognitionFiber.

FL a cds:FixedLayer. 

rdf-profile

You can, if you like:

Attach carrier: F cds:carrier "Bool".

Attach σ/Δ tables as canonical JSON via typed literals or separate nodes.

Sections:

For each section in fixed_layer.sections:

mint a node Sec_i, link with cds:hasSection (not named in spec but consistent) and ensure any order‑sensitive arrays are represented as RDF lists or as repeated predicates while preserving order.

4.1.3 Laws and invariants

According to §5.1.1 and §5.2.4:

L a cds:Law.

For each invariant:

C cds:hasInvariant I_i .
I_i a cds:Invariant ;
    cds:severity   "hard" ;
    cds:invariantCode "CCE_INV_SECTION_TOTAL" .


For repair log entries embedded in CDS (structural layer):

Map each entry to cds:RepairLogEntry with:

R a cds:RepairLogEntry ;
  cce:errorCode "CCE_INV_SIGMA_DELTA_CLOSED" ;
  cce:beforeHash "a1b2..."^^xsd:hexBinary ;
  cce:afterHash "c3d4..."^^xsd:hexBinary ;
  cce:fuelUsed  12 .


And link from cell and/or law:

C cds:hasRepairLogEntry R .
L cds:hasRepairLogEntry R .

4.2 RTL judgment graph

For an RTL judgment with hash J and URI JUri = Brtl/J: 

rdf-profile

JUri a rtl:Judgment ;
  rtl:hash  "J"^^xsd:hexBinary ;
  rtl:context Ctx ;
  rtl:term    T ;
  rtl:type    Ty .


Where:

Ctx can be a node or list representing the ordered context; profile says “preserve declaration order”. 

rdf-profile

Each binding is a node with rtl:name and rtl:hasType or similar mapping based on context.

Operators:

For each operator in rtl_signature.constructors, you can project to rtl:Operator:

Op_f a rtl:Operator ;
  rtl:operator "f" ;
  rtl:variance "+" .


Judgment term/type structure is not fully decomposed in the profile; you can choose how deep to go, but must keep it consistent and deterministic.

4.3 CCE executions and repair logs

CCE executions (apply/merge) map to cce:ClosureExecution / cce:ApplyExecution / cce:MergeExecution. 

rdf-profile

 

Given:

RPC or ABI evidence that identifies an execution (rpc-id or some execution hash),

Input cell C_in, output cell C_out,

Optional input judgment J.

Mint:

E a cce:ApplyExecution, cce:ClosureExecution, prov:Activity ;
  cce:hasInputCell   C_in ;
  cce:hasOutputCell  C_out ;
  cce:fuelBudget     256 ;
  cce:executionHash  "XYZ..."^^xsd:hexBinary ;
  prov:used          C_in ;
  prov:generated     C_out .


If it’s a merge, use cce:MergeExecution instead.

 

Attach judgments:

E cce:hasInputJudgment J .

4.3.1 Operational repair logs

Each entry in ApplyOutput.repair_log or MergeOutput.repair_log becomes cce:RepairLogEntry:

R_i a cce:RepairLogEntry, prov:Entity ;
  cce:errorCode "CCE_INV_SECTION_TOTAL" ;
  cce:beforeHash "abcd..."^^xsd:hexBinary ;
  cce:afterHash  "ef01..."^^xsd:hexBinary ;
  cce:fuelUsed   15 ;
  prov:wasGeneratedBy E ;
  prov:specializationOf C_out .


The RDF profile explicitly recommends this PROV mapping. 

rdf-profile

 

Also:

E cce:repairLog R_i .


Order of R_i must match the repair log array order.

4.4 RPC request/response mapping

For each RPC request Req and response Res with id = rpc-id:

4.4.1 Node URIs

ReqUri = Brpc/request/{rpc-id}

ResUri = Brpc/response/{rpc-id}

Create:

ReqUri a rpc:Request, prov:Entity ;
  rpc:method  "apply" ;
  rpc:version "CCE-RPC-0.x" ;
  // optionally attach canonical JSON as a literal

ResUri a rpc:Response, prov:Entity ;
  rpc:status "ok" ;
  cce:refinedCdsHash "f447..."^^xsd:hexBinary .

4.4.2 Link to execution
E prov:used      ReqUri ;
E prov:generated ResUri .


This ties transport and closure execution together in provenance graphs. 

rdf-profile

5. Shapes and validation (SHACL)

The profile gives minimal SHACL shapes for cell, repair log entries, judgments, and closure executions. 

rdf-profile

5.1 Implementation plan

You may choose a SHACL or shape library, or implement simple validators yourself. Either way:

Ship the shapes from §6 (e.g., cds:CellShape, cce:RepairLogEntryShape, rtl:JudgmentShape, cce:ClosureExecutionShape) as Turtle files or equivalent. 

rdf-profile

Provide:

pub fn validate_cell_shape(graph: &RdfGraph, cell_uri: &Iri) -> Result<(), ShapeError>;
pub fn validate_judgment_shape(graph: &RdfGraph, j_uri: &Iri) -> Result<(), ShapeError>;
pub fn validate_execution_shape(graph: &RdfGraph, e_uri: &Iri) -> Result<(), ShapeError>;


The key constraints:

cds:CellShape:

cds:hash exactly once, xsd:hexBinary.

exactly one cds:hasSite, cds:hasFibers, cds:hasFixedLayer, cds:hasLaw. 

rdf-profile

cce:RepairLogEntryShape:

exactly one cce:errorCode, cce:beforeHash, cce:afterHash, cce:fuelUsed;

beforeHash and afterHash must differ. 

rdf-profile

rtl:JudgmentShape:

at least one rtl:context, exactly one rtl:term, exactly one rtl:type. 

rdf-profile

cce:ClosureExecutionShape:

exactly one cce:hasInputCell;

at most one cce:hasOutputCell;

zero or one cce:errorCode;

at least one cce:repairLog. 

rdf-profile

These validators don’t change graphs; they just confirm conformance.

6. Determinism & non‑interference obligations

This is where you lock in the “RDF is read‑only with respect to canonical JSON” requirements.

 

From §9: 

rdf-profile

Canonical JSON is primary… RDF graphs are projections; they are not re‑canonicalizations.
Implementations MUST NOT: pretty‑print canonical JSON, re‑order keys, drop fields, or otherwise mutate the bytes whose hash is recorded…

So:

6.1 No JSON rewriting

cce-rdf must not:

pretty‑print canonical JSON,

re‑order keys in canonical JSON,

change string escaping,

drop fields,

when those JSON bytes are exposed in RDF (e.g., as rpc:refinedCdsPayload, JSON‑LD rdf:value, etc.).

 

Instead, you treat canonical JSON as either:

A literal string attached to a node (cds:Cell etc.), or

Something accessible via separate storage keyed by hash.

6.2 Hash consistency

For any cds:hash, rtl:hash, cce:refinedCdsHash, or similar:

Your RDF generator must ensure that the hash value is taken directly from the canonical artifact, not recomputed from some modified JSON.

If you later provide a function “rebuild canonical JSON from RDF”, you must verify that sha256(rebuilt_json) equals the exposed hash; if it doesn’t, treat that as a validation failure.

6.3 Order preservation

Profile says:

Arrays that are semantically ordered (context bindings, constructor lists, repair logs) MUST maintain that order in any RDF list/collection representation. 

rdf-profile

So:

For sequences (context, repair_log, etc.), you either:

use RDF lists (rdf:first/rdf:rest) in the same order, or

represent them as repeated predicates and preserve order in your internal Vec of triples and any JSON‑LD list.

But you must not reorder them.

6.4 No new semantics

RDF inference:

MUST NOT introduce new closure behavior; inference is descriptive only and MUST NOT feed back into CCE. 

rdf-profile

So:

cce-rdf must never call back into cce-core or mutate JSON based on RDF reasoning.

You can run SHACL / RDFS / OWL checks for diagnostics, but they don’t alter the engine’s behavior or anything hashed.

6.5 Deterministic serialization

RDF graphs are unordered sets of triples, but your serialization should be stable:

For Turtle/N‑Quads:

sort triples by (subject IRI/bnode id, predicate IRI, object string),

use deterministic blank node labels (e.g. _:b1, _:b2 assigned in sorted encounter order),

never include comments or timestamps.

For JSON‑LD:

use the single profile context,

avoid including @id fields in ways that depend on non‑deterministic blank node heuristics.

Same input artifacts + same base URI ⇒ same RDF serialization bytes.

7. Tests & fixtures for Phase 8
7.1 Boolean cell RDF

Using the Boolean CDS cell and its RTL judgment:

Generate RDF:

cds_cell_to_rdf for the Boolean cell.

rtl_judgment_to_rdf for the sample judgment.

Check:

There is a cds:Cell with cds:hash equal to the cell’s cds.id.

There is an rtl:Judgment with rtl:hash equal to the judgment hash.

Shapes validate (CellShape, JudgmentShape). 

rdf-profile

Serialize to Turtle and N‑Quads twice; bytes must be identical.

7.2 Apply/merge execution RDF

Construct an apply run from CCE‑RPC fixtures:

Use canonical JSON for:

input CDS,

input RTL,

RPC request/response,

outputs (refined CDS, canonical judgment, repair_log).

Produce cce_execution_to_rdf and rpc_envelope_to_rdf.

 

Check:

There is a cce:ApplyExecution with:

prov:used pointing to cds:Cell and rpc:Request,

prov:generated pointing to cds:Cell refined and rpc:Response. 

rdf-profile

Repair log entries appear as cce:RepairLogEntry with correct code/hash/fuel.

Closure execution shape validates. 

rdf-profile

7.3 Hash consistency tests

For each graph:

Pick the subject C with cds:hash H.

Use your stored canonical JSON for that cell and compute SHA‑256; assert it equals H.

Do the same for rtl:hash, cce:refinedCdsHash.

7.4 Replay stability

For all fixtures:

Generate graphs and serialize to Turtle/N‑Quads multiple times; assert exact byte equality.

Optionally cross‑check on different platforms in CI.

8. Phase‑8 “done” checklist

You can mark Phase 8 complete when:

cce-rdf can generate RDF graphs for:

any canonical CDS cell (cds:Cell, site, fibers, fixed layer, invariants, CDS repair logs),

any canonical RTL judgment (rtl:Judgment, context, term, type),

any CCE closure execution (cce:ClosureExecution, apply/merge, repair logs, PROV links),

any CCE‑RPC request/response (rpc:Request, rpc:Response, linkage to executions).

Hash and URI consistency is enforced:

URIs embed the canonical hashes per §3.2,

cds:hash, rtl:hash, cce:refinedCdsHash match the underlying canonical JSON.

JSON‑LD context from §4.2 is shipped and used without mutating canonical JSON. 

rdf-profile

The SHACL shapes in §6 can be applied (or at least your equivalent validators exist) and your graphs pass them for the reference fixtures. 

rdf-profile

RDF serialization is deterministic:

same inputs + base URI ⇒ same Turtle/N‑Quads/JSON‑LD bytes,

tests verify that across runs.

Your determinism doc has an RDF section committing to:

no JSON rewriting,

order preservation for ordered collections,

no inference feeding back into CCE behavior.

At that point, RDF is a clean, deterministic projection of your CCE universe, not another source of truth—and that’s exactly what the RDF profile demands.

0. Scope of Phase 9

By the end of Phase 9 you have:

A stable suite of conformance vectors (JSON files) covering:

canonical JSON, CDS, RTL, CCE core, ABI, RPC, RDF.

A pure, deterministic harness that:

loads those vectors,

runs your implementation (and optionally an external one),

checks outputs byte‑for‑byte against expected outputs + hashes,

reports failures in a machine‑readable way.

A CLI that can:

validate individual artifacts (CDS, RTL, RPC, RDF),

run the full conformance suite,

generate transcripts.

No new semantics, no “added cleverness”, just a harness to prove the semantics you already defined.

1. Conformance architecture
1.1 Workspace layout

Extend your workspace with:

cce-fixtures/ (data; not a crate)

json/ – canonical JSON vectors

cds/ – CDS cells

rtl/ – RTL judgments

cce/ – apply/merge scenarios (inputs+expected outputs)

abi/ – ABI byte‑level vectors

rpc/ – RPC request/response pairs

rdf/ – RDF graph snapshots (Turtle/N‑Quads/JSON‑LD)

cce-conformance/ (crate)

src/lib.rs – harness APIs

src/cli.rs – CLI entrypoints

cce-cli/ (optional separate crate)
or just expose bin from cce-conformance.

1.2 Conformance library surface

cce-conformance exposes:

pub struct ConformanceResult {
    pub id: String,
    pub passed: bool,
    pub message: String,
}

pub fn run_all() -> Vec<ConformanceResult>;

pub fn run_vector(id: &str) -> ConformanceResult;


Plus finer‑grained runners, e.g.:

pub fn run_json_vectors() -> Vec<ConformanceResult>;
pub fn run_cds_vectors()  -> Vec<ConformanceResult>;
pub fn run_rtl_vectors()  -> Vec<ConformanceResult>;
pub fn run_cce_vectors()  -> Vec<ConformanceResult>;
pub fn run_abi_vectors()  -> Vec<ConformanceResult>;
pub fn run_rpc_vectors()  -> Vec<ConformanceResult>;
pub fn run_rdf_vectors()  -> Vec<ConformanceResult>;


Each ConformanceResult.id must be globally unique and stable (no random IDs).

2. Conformance vector format (normative)

You define a single JSON schema for vectors with type‑specific payloads.

2.1 Top‑level structure

Each vector file is a JSON object:

{
  "id": "json.canonical.001",
  "kind": "json",     // or "cds", "rtl", "cce.apply", "cce.merge", "abi", "rpc", "rdf"
  "description": "Canonicalization of a simple nested object",
  "input": { /* depends on kind */ },
  "expected": { /* depends on kind */ }
}


Constraints:

id: stable, human‑readable string; no spaces.

kind: fixed vocabulary (enum).

description: free text for humans, but not required for conformance.

2.2 JSON vectors (kind: "json")

These test cce-json alone.

"input": {
  "bytes": "eyAiYSI6IDE...==",      // base64 arbitrary JSON
},
"expected": {
  "canonical_bytes": "eyJhIjoxfQ==", // base64 canonical JSON
  "sha256": "abcd1234...",           // hex SHA-256 over canonical bytes
  "error": null | "JsonError::..."   // if you want explicit error cases
}


On success:

parse_and_canonicalize(input.bytes) → canonical_bytes exactly;

sha256(canonical_bytes) equals expected.sha256.

If expected.error is non‑null, then the harness expects the call to fail with that error and no canonical bytes at all.

2.3 CDS vectors (kind: "cds")

Test cce-cds::parse_cds + validate_structural.

"input": {
  "cds": "eyJraW5kIjoiY2RzIiwiLi4u": "base64 canonical JSON"
},
"expected": {
  "valid": true,
  "cds_hash": "abcd1234...",        // expected sha256 of canonical CDS JSON
  "error_code": null | "CDS_SITE_CATEGORY_FAIL"
}


Rules:

If valid == true, harness expects:

parse_cds + validate_structural succeed,

CanonicalJson.sha256 equals cds_hash,

no CDS error codes.

If valid == false, harness expects failure with error_code, and doesn’t check hashes beyond “parsed or not” (depending on how you treat invalid inputs).

2.4 RTL vectors (kind: "rtl")

Test cce-rtl::parse_judgment + check_and_normalize.

"input": {
  "cds": "base64 canonical CDS JSON",    // environment cell
  "rtl": "base64 canonical RTL JSON",    // judgment
  "fuel": 256
},
"expected": {
  "valid": true,
  "normalized_rtl": "base64 canonical RTL JSON", // normal form
  "rtl_hash": "abcd1234...",
  "error_code": null | "RTL_TYPE_MISMATCH"
}


Again:

valid == true ⇒ typechecking + normalization succeed; canonical bytes and hash exactly match expected.

valid == false ⇒ you expect a specific RTL_* error.

2.5 CCE apply/merge vectors (kind: "cce.apply" / "cce.merge")

These exercise pure cce-core.

"input": {
  "cds": "base64 canonical CDS JSON",
  "rtl": "base64 canonical RTL JSON",  // apply only
  "lhs": "base64 canonical CDS JSON",  // merge only
  "rhs": "base64 canonical CDS JSON",  // merge only
  "fuel": 256
},
"expected": {
  "error_code": "CCE_OK" | "CCE_CDS_INVALID" | "...",
  "refined_cds": "base64 canonical CDS JSON or null",
  "refined_cds_hash": "abcd1234... or null",
  "canonical_judgment": "base64 canonical RTL JSON or null",
  "canonical_judgment_hash": "abcd1234... or null",
  "repair_log": "base64 canonical JSON array", // [] allowed
  "evidence": [ "hash1", "hash2", "..." ]      // optional but recommended
}


Harness semantics:

If error_code == "CCE_OK":

apply/merge must return success,

canonical refined CDS and canonical judgment (for apply) must match expected payloads and hashes,

repair_log must decode to exactly the expected JSON array, in the same order.

If error_code != "CCE_OK":

apply/merge must fail with that code,

refined CDS and canonical judgment are ignored or must be absent (null).

2.6 ABI vectors (kind: "abi")

These test the FFI boundary.

"input": {
  "cds": "base64 canonical CDS JSON",
  "rtl": "base64 canonical RTL JSON",
  "fuel": 256
},
"expected": {
  "abi_error_code": "CCE_OK" | "CCE_ERR_CDS_INVALID" | "...",
  "refined_cds": "base64 canonical CDS JSON or null",
  "canonical_judgment": "base64 canonical RTL JSON or null",
  "repair_log": "base64 canonical JSON array or null"
}


Harness will:

Call cce_apply / cce_merge via FFI,

Convert CceBytes outputs back to Vec<u8>,

Compare against expected canonical JSON.

2.7 RPC vectors (kind: "rpc")

These test cce-rpc::handle_request.

"input": {
  "request": "base64 JSON",     // raw RPC request body bytes
},
"expected": {
  "response": "base64 JSON",    // full RPC response bytes
  "status": "ok" | "error",
  "code": "CCE_OK" | "CCE_CDS_INVALID" | "CCE_RPC_UNKNOWN_FIELD" | "..."
}


Harness:

Calls handle_request(request_bytes),

Compares response bytes exactly to expected response bytes,

Also re‑parses the response and asserts status/code fields match.

2.8 RDF vectors (kind: "rdf")

These test cce-rdf.

"input": {
  "artifact_kind": "cds" | "rtl" | "cce.apply" | "cce.merge" | "rpc",
  "artifact": "base64 canonical JSON payload",
  "base_uri": "https://example.org/base/"
},
"expected": {
  "turtle": "base64 UTF-8 Turtle",
  "nquads": "base64 UTF-8 N-Quads",
  "jsonld": "base64 UTF-8 JSON-LD",
  "graph_hash": "abcd1234..."      // optional, e.g. hash of sorted triples
}


Harness:

Generates RdfGraph via appropriate converter,

Serializes to Turtle/N‑Quads/JSON‑LD,

Compares bytes to expected,

(Optionally) recomputes a deterministic graph hash and compares to graph_hash.

3. Harness behaviour per vector kind

Each run_*_vectors function:

Discovers vector files for that kind (deterministic order; more below).

For each vector:

Parses the vector JSON using cce-json (so even the fixture format is canonicalizable),

Dispatches to kind‑specific runner,

Returns ConformanceResult with:

ConformanceResult {
    id: v.id.clone(),
    passed: boolean,
    message: "ok" or precise mismatch description,
}


Aggregates results.

3.1 Directory discovery (deterministic)

When scanning cce-fixtures:

Only look under fixed subdirectories (no recursion into arbitrary paths).

Sort vectors by filename lexicographically.

For each file, require id in JSON to match filename stem (e.g. json.canonical.001.json contains "id": "json.canonical.001").

If there’s any mismatch between filename and id, the harness must fail with a clear diagnostic; otherwise vector IDs can drift.

4. CLI design

Expose a cce CLI (or cce-cli) with subcommands:

cce conformance all

cce conformance json

cce conformance cds

cce conformance rtl

cce conformance cce

cce conformance abi

cce conformance rpc

cce conformance rdf

Options:

--vector <id>: run only a specific vector.

--format json: machine‑readable output:

{
  "overall_passed": true,
  "results": [
    { "id": "json.canonical.001", "passed": true, "message": "ok" },
    { "id": "cds.structural.bad_topology", "passed": false, "message": "expected CDS_SITE_TOPOLOGY_FAIL, got CDS_SITE_CATEGORY_FAIL" }
  ]
}


Exit codes:

0 if all selected vectors passed;

non‑zero if any fail (for CI integration).

No timestamps, no random IDs in the output.

5. Cross‑implementation mode (optional but powerful)

You can also use this harness to test other implementations (e.g., a C version, or another language) by letting the user provide an external command.

5.1 Config

Add a config format:

{
  "impls": {
    "rust": {
      "type": "internal"    // use the current library
    },
    "external-c": {
      "type": "external",
      "command": "./cce_impl",        // CLI to invoke
      "mode": "rpc"                   // talk via RPC vectors
    }
  }
}


Harness then:

For kind: "rpc" vectors:

calls the external command with request bytes on stdin,

reads response bytes from stdout,

applies same comparison rules as for internal handle_request.

Conformance is then “passes same vectors with the same outputs”.

Important: external mode must not change how internal vectors are interpreted; it just changes which implementation you call.

6. Determinism constraints for the harness

You extend your determinism doc to cover the harness:

No randomization.

No random seeds, no randomized test orders.

Every run over the same set of vectors yields the same sequence of ConformanceResults.

No time‑dependent behaviour.

No timestamps or durations in canonical outputs.

If you print timings for humans, they must not be part of JSON output, and ideally be disabled in CI.

Stable ordering.

Vector discovery is by sorted filename.

run_all() concatenates results in a fixed order:

JSON, then CDS, then RTL, then CCE, ABI, RPC, RDF (or whatever order you choose—but you must lock it in).

Within each category, results are in vector ID order.

Strict comparison.

For byte comparisons (canonical JSON, RPC responses, RDF serializations), equality means byte‑for‑byte identical.

No tolerance for whitespace or re‑ordering; the whole point of conformance is to enforce canonicalization.

Purity.

Running the harness must not mutate fixtures or outputs in place.

If you generate “actual” outputs for debugging, write them to a separate directory (cce-fixtures/actual/) with a different name; do not overwrite expected.

7. Building out the vector sets

You don’t need hundreds to start; you need good coverage:

7.1 JSON

A few simple objects/arrays/numbers.

Pairs of non‑canonical inputs that canonicalize to same output.

Number edge‑cases (leading zeros, exponents).

7.2 CDS

The minimal Boolean CDS cell (valid).

One malformed CDS per CDS error code:

bad category,

broken topology,

Heyting gap,

σ/Δ failure,

ID mismatch,

canonicalization mismatch,

unknown field.

7.3 RTL

A small selection of judgments:

well‑typed & normalizing,

each RTL_* error case.

7.4 CCE core

Apply on Boolean cell (no changes, empty repair log).

Apply where invariants cause non‑empty repair_log.

Merge of identical cells.

Merge with site mismatch, constructor gap, fixed_layer empty, invariant conflict.

A closure that hits fuel limit.

7.5 ABI

Mirror a subset of CCE vectors via FFI.

Make sure both success and failure cases are covered.

7.6 RPC

A few clean apply/merge requests with corresponding responses.

All RPC‑layer errors:

unknown field,

missing field,

malformed base64,

prior hash mismatch,

invalid method.

7.7 RDF

Projections of:

Boolean CDS cell,

corresponding RTL judgment,

a simple apply execution,

one RPC request/response.

For each, snapshot Turtle/N‑Quads/JSON‑LD in expected.

8. Phase‑9 “done” checklist

You can call Phase 9 complete when:

cce-conformance exists with:

run_all and per‑kind runners,

deterministic discovery and ordering,

clear ConformanceResults.

CLI is wired (at least cce conformance all and per‑kind subcommands) and returns non‑zero exit on any failure.

A minimal but representative set of vectors exists for each kind (json, cds, rtl, cce.apply, cce.merge, abi, rpc, rdf), with:

explicit expected outputs,

both success and failure cases per error code.

Equality checks are byte‑exact on canonical JSON, RPC responses, and RDF serializations, and are stable across runs.

The determinism doc covers the harness: no randomness, no time dependence, fixed vector ordering, strict comparisons.
