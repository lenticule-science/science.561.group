---
title: Recognition Term Language (RTL)
description: "This document occupies Layer 2 (RTL) of the GFRTU stack:"
---
# Recognition Term Language (RTL)

**Specification – Version 0.x (normative)**

---

## Layer Declaration — RTL (Layer 2: Structural Judgments)

This document occupies **Layer 2 (RTL)** of the GFRTU stack:

- **Role:** defines the JSON encoding of judgments $\Gamma \vdash M : A$ and the internal term calculus for recognition fibers over a GFRTU cell.
- **Depends on:** the GFRTU mathematics (`gfrtu.md`) for the interpretation of judgments as arrows in the sheaf topos, and on CDS (`cds.md`) for the structural context in which judgments live.
- **Provides to higher layers:** canonical judgment payloads and normalization rules that CCE (Layer 3) applies when deciding admissibility.
- **Must not do:** redefine closure/repair processes, logging, or transport behavior specified in `cce.md`, `cce-abi.md`, or `cce-rpc.md`.

Determinism and fuel accounting are specified here only as **properties of RTL normalization**; the *use* of fuel, repair logs, and evidence vectors is owned by CCE (Layer 3) and its ABI/RPC surfaces (Layers 4–5).

## 1. Purpose and Scope

The Recognition Term Language (RTL) encodes judgments $\Gamma \vdash M : A$
for recognition fibers over a GFRTU cell. RTL defines the syntax, typing,
canonicalization, and admissibility checks required by the Cellular Closure
Engine (CCE) to evaluate recognition claims.

---

## 2. Syntax and Constructors

### 2.1 Core Forms

A judgment is encoded as a JSON object with lexicographically sorted keys:

```jsonc
{
  "context": [ {"name": "x", "type": {"ref": "Ob U"}} ],
  "term": {"var": "x"},
  "type": {"ref": "Ob U"}
}
```

Terms and types support the following constructors (all keys MUST appear exactly
as shown; unknown keys MUST be rejected):

- Variables: `{ "var": "name" }`
- Products: `{ "prod": [term, ...] }`
- Coproduct injections: `{ "inl": term }`, `{ "inr": term }`
- Arrows: `{ "lambda": {"arg": "name", "arg_type": type, "body": term} }`
- Application: `{ "app": {"fn": term, "arg": term} }`
- Modalities: `{ "sigma": term }`, `{ "delta": term }`
- Cell‑provided operators: `{ "op": "name", "args": [term, ...] }`
- Equality witness: `{ "path": {"lhs": term, "rhs": term} }`

Types mirror term constructors with `"type"` replacing `"term"` keys. For
operators from `rtl_signature.constructors`, types MUST state variance for each
argument using `"variance": ["+", "-", ...]` and MUST include `"admissible":
true|false` flags. Key order is normative: inside each constructor object, the
keys MUST appear as listed above before canonicalization so independent engines
serialize the same byte sequence.

### 2.2 Canonical Key Order

Implementations MUST serialize each constructor with the following key order
before applying overall JSON key sorting:

- Variable: `var`
- Product: `prod`
- Coproducts: `inl` or `inr`
- Arrow: `lambda` with nested keys `arg`, `arg_type`, `body`
- Application: `app` with nested keys `arg`, `fn`
- Modalities: `delta`, `sigma`
- Operator: `op`, `args`
- Path: `lhs`, `rhs`

Nested objects MUST themselves use lexicographic ordering (e.g., inside
`arg_type`, the key `ref` precedes any operator keys). Unknown keys or altered
ordering MUST be rejected with `RTL_UNKNOWN_FIELD` to prevent non‑deterministic
hashes.

### 2.3 Deterministic Context Ordering

Contexts MUST list bindings in declaration order from outermost to innermost.
When normalizing, implementations MUST preserve this order; alpha‑equivalent
re‑orderings are not allowed. The ordering corresponds to the presheaf index in
the Acts and anchors the hashing of $\Gamma \vdash M : A$ judgments.

---

## 3. Operator Catalogue (from CDS `rtl_signature`)

Each operator entry in `rtl_signature.constructors` MUST map to a typing rule
and a canonical encoding:

| Field          | Meaning                                                                 |
|----------------|-------------------------------------------------------------------------|
| `name`         | Identifier referenced by `{ "op": name }` in terms                     |
| `arity`        | List of type expressions for arguments; length MUST equal `args` length |
| `variance`     | Parallel list of `+`/`-`/`0` indicating covariance/contravariance/fixed |
| `admissible`   | If false, operator may appear only in contexts marked `defining`        |
| `rewrite`      | Optional canonical rewrite used in §4.1(5)                              |
| `cell_effects` | Optional list of invariants triggered (e.g., `"sigma_delta_closed"`)   |

Encodings for operator applications MUST be `{ "op": name, "args": [ ... ] }` with
`args` sorted only by source order (no host re‑ordering). If `admissible` is
false, the operator MUST appear only inside `defining_expression.judgments` of
the CDS; occurrence elsewhere is `RTL_UNKNOWN_OPERATOR`.

CCE MUST reject any term referencing an operator not present in the CDS. Variance
controls substitution during β‑reduction: contravariant arguments are normalized
before substitution; covariant arguments normalize after substitution.

---

## 4. Canonicalization and Normalization

### 4.1 Reduction Order

Canonicalization MUST be deterministic and terminating. Engines MUST implement
call‑by‑value, left‑to‑right normalization with explicit fuel accounting
(`fuel_default = 256` unless overridden by CCE fuel):

1. **Context thinning**: remove unused bindings (fuel −= 1 per removal).
2. **β-reduction**: `(lambda x. M) N → M[x := N]` after `N` is normalized; fuel
   decreases by 1 per β‑step.
3. **η-reduction**: `lambda x. f x → f` when `x` not free in `f`; fuel −= 1.
4. **Modal commuting conversions**: `sigma (delta t) → delta (sigma t)` iff
   the cell marks σ, Δ commuting in `rtl_signature`; fuel −= 1.
5. **Operator canonical forms**: normalize arguments left to right; when
   `rewrite` is present, apply it once after argument normalization. Fuel −= 1
   per operator reduction.
6. **Product/Coproduct**: flatten nested products, normalize injections; fuel −=
   1 per flattening.

This ordering is **semantically anchored**: left‑to‑right evaluation follows the
site object ordering declared in the CDS sections, ensuring that modal moves
(`sigma`, `delta`) respect the same presheaf index order used by the fixed layer.
Runtimes MUST NOT reorder arguments or contexts based on host heuristics; doing
so would sever the correspondence between normalization traces and the GFRTU
closure iteration $UG^n$.

Reduction proceeds until no rule applies or fuel is exhausted. Fuel exhaustion
MUST be signalled with `RTL_CANONICALIZATION_DIVERGED` and results in rejection
by CCE. Engines MUST expose consumed fuel to CCE for repair logging.

### 4.2 JSON Encoding Rules

- Keys MUST be sorted lexicographically during canonicalization before hashing.
- Optional fields are forbidden unless listed in §2; extraneous fields trigger
  `RTL_UNKNOWN_FIELD`.
- Numeric literals MUST be strings in canonical form (no `+`, no trailing zeros).
- Boolean literals are allowed only when the fiber carrier is Boolean and MUST be
  encoded as JSON booleans.

### 4.3 Determinism Proof Sketch

Given finite terms and the prioritized reduction order, each step strictly
reduces either syntactic height or the multiset of redex positions while
consuming fuel. Modal commuting conversions are guarded by the CDS‑declared
commuting flag, ensuring no critical pair cycles. Memoizing subterm hashes on
constructor boundaries forces identical byte outputs because any two reduction
paths share the same ordered list of consumed fuel values and the same
topologically sorted redex positions. Therefore normalization terminates and
yields a unique normal form for fixed CDS data.

---

## 5. Admissibility and Error Surface

CCE uses the following errors while consuming RTL:

| Code                           | Condition                                                   |
|--------------------------------|-------------------------------------------------------------|
| `RTL_UNKNOWN_FIELD`            | A term/type contains an unrecognized key                    |
| `RTL_UNKNOWN_OPERATOR`         | `op` not present in CDS `rtl_signature`                     |
| `RTL_VARIANCE_MISMATCH`        | Operator argument count or variance mismatch                |
| `RTL_ILLEGAL_MODAL`            | σ/Δ applied where CDS forbids commuting conversions         |
| `RTL_CANONICALIZATION_DIVERGED`| Normalization did not terminate within declared fuel        |
| `RTL_TYPE_MISMATCH`            | Typing rule failure during judgment checking                |

CCE MUST stop evaluation on the first hard error and return it through the ABI
and RPC layers.

---

## 6. Examples

### 6.1 Boolean Cell Judgment

For the minimal CDS in CDS §8.1, a valid judgment is:

```jsonc
{"context": [], "term": {"var": "true"}, "type": {"ref": "Ob U"}}
```

Normalization is the identity; the resulting hash contributes to the CDS `id`.

### 6.2 σ/Δ Interaction

For a cell whose `rtl_signature` declares σ and Δ commuting, the term
`{ "sigma": { "delta": {"var": "x"} } }` canonicalizes to
`{ "delta": { "sigma": {"var": "x"} } }`. If commuting is false, the input is
rejected with `RTL_ILLEGAL_MODAL`.

---

## 7. Interpretive Reading inside the GFRTU

RTL is not a free‑floating term calculus; its operators are internal arrows of
the sheaf topos described in `gfrtu.md`. Implementations MUST therefore enforce
these interpretive constraints:

1. **Context as sieve.** The `context` list represents a matching family over a
   sieve in the site. Thinning (§4.1) is more than an optimization—it enforces
   that unused components do not contribute phantom evidence to sheaf gluing.
2. **Modal naturality.** σ and Δ MUST be interpreted as natural transformations
   on the recognition sheaf. The commuting conversion in §4.1(4) is valid only
   when the CDS declares naturality, ensuring that normalization respects the
   Beck–Chevalley conditions of the site.
3. **Operators as internal morphisms.** Every `{ "op": name }` stands for an
   internal morphism on the fixed layer $H^\ast$. Variance annotations mirror
   the adjunctions of the ambient topos; mismatched variance thus signals a
   failure to preserve internal hom structure and MUST be rejected determinis-
   tically.
4. **Canonical judgment hashing.** The hash of a canonical judgment is the
   witness that the internal arrow is well‑typed and normalized. Altering any
   serialization detail (spacing, key order) would change the hash and sever the
   link to the ambient mathematics; implementations MUST reject such drift by
   re‑canonicalizing and re‑hashing before use.

These requirements keep RTL judgments aligned with the GFRTU’s internal logic
rather than host‑specific term representations.

---

## 8. Normativity Checklist for Implementers

Before accepting or emitting an RTL judgment, engines MUST verify:

1. **Signature provenance.** Every referenced operator is present in the paired
   CDS `rtl_signature` and is justified by the Acts. Missing provenance is a
   hard rejection `RTL_UNKNOWN_OPERATOR`.
2. **Fuel disclosure.** Normalization MUST be performed under an explicit fuel
   bound (default 256 β/η/commuting steps). The consumed fuel MUST be recorded in
   the CCE repair log when normalization feeds into closure; implicit or
   variable fuel makes the judgment non‑replayable.
3. **Hash stability.** After canonicalization, recompute the judgment hash and
   ensure it matches any caller‑provided hash. Disagreements MUST be surfaced as
   `RTL_CANONICALIZATION_DIVERGED` rather than silently rehashing.
4. **Context/site alignment.** The free variables in `context` MUST reference
   objects declared in CDS `site.objects`; otherwise the judgment cannot be
   interpreted in the GFRTU topos and MUST be rejected.
5. **Variance enforcement.** Contravariant arguments MUST be normalized before
   substitution, covariant after. Deviations make the judgment non‑deterministic
   and MUST be rejected with `RTL_VARIANCE_MISMATCH`.

Compliance with this checklist produces RTL judgments that are deterministic
artifacts of the GFRTU mathematics and safe to embed in CDS or transport via ABI
and RPC surfaces.

---

## Earlier material

If $p$ and $q$ are recognition variables, RTL can build terms like $p\wedge q$, $p\vee q$, and $p\Rightarrow q$. In GFRTU, these are not just symbols: each term gets interpreted as an internal arrow in the sheaf topos.

The **Recognition Term Language (RTL)** is a typed formal language for recognition expressions whose semantics is interpreted in $R=\mathbf{Sh}(T,J)$.

Its interpretation maps well-formed terms and judgments to internal objects and [morphisms](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md), with naturality and sheaf-compatibility constraints inherited from the topos semantics.

- It provides a precise syntax for stating recognition claims.
- It links symbolic expressions to sheaf-theoretic semantics.
- It determines part of what generative closure must include.
