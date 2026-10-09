---
title: RTL JSON Carrier
description: Role.
---
# RTL JSON Carrier

**Role.** Defines the canonical JSON encoding of RTL judgments and the validation rules required before hashing or transport.

**Depends on.** `../semantics/language.md` for the term calculus and normalization order; `canonicalization.md` for byte-level rules.

**Provides to.** Closure, CDS embedding, ABI, and RPC layers.

---

## 1. Judgment Encoding

An RTL judgment is a JSON object with lexicographically sorted keys:

```jsonc
{
  "context": [ {"name": "x", "type": {"ref": "Ob U"}} ],
  "term": {"var": "x"},
  "type": {"ref": "Ob U"}
}
```

- **Context** is an array of bindings in declaration order (outermost to innermost). Reordering is invalid.
- **Term** and **type** use the constructors listed below. Unknown keys trigger `RTL_UNKNOWN_FIELD`.

### 1.1 Constructors

Term constructors (types mirror the same shapes):

- Variable: `{ "var": "name" }`
- Product: `{ "prod": [term, ...] }`
- Coproducts: `{ "inl": term }`, `{ "inr": term }`
- Lambda: `{ "lambda": {"arg": "name", "arg_type": type, "body": term} }`
- Application: `{ "app": {"fn": term, "arg": term} }`
- Modalities: `{ "sigma": term }`, `{ "delta": term }`
- Operator: `{ "op": "name", "args": [term, ...] }`
- Path: `{ "path": {"lhs": term, "rhs": term} }`

Keys inside each constructor object MUST appear in the order shown prior to global key sorting. Nested objects (e.g., inside `lambda`) also follow this order before lexicographic sorting. Unknown or reordered keys are `RTL_UNKNOWN_FIELD`.

### 1.2 Context Ordering

Contexts MUST preserve declaration order. α-equivalent reorderings are rejected; deterministic hashing depends on this order.

---

## 2. Canonicalization

- Apply the normalization strategy from `../semantics/language.md` (call-by-value, left-to-right) before hashing or embedding.
- Sort all object keys lexicographically after construction; preserve array order. See `canonicalization.md` for numeric and boolean rendering rules.
- Numeric literals MUST be canonical strings (no leading zeros, no `+`, minimal exponent when used).
- Boolean literals MAY appear only when the paired cell’s fiber carrier is Boolean.
- Canonical hashes of judgments are used inside CDS and closure evidence; mismatches after re-canonicalization yield `RTL_CANONICALIZATION_DIVERGED`.

---

## 3. Error Surface

When validating or normalizing carriers, the following codes may be emitted:

| Code                           | Condition                                                   |
|--------------------------------|-------------------------------------------------------------|
| `RTL_UNKNOWN_FIELD`            | An unrecognized key appears in term/type/context            |
| `RTL_UNKNOWN_OPERATOR`         | `op` not present in the paired CDS `rtl_signature`          |
| `RTL_VARIANCE_MISMATCH`        | Operator argument count or variance mismatch                |
| `RTL_ILLEGAL_MODAL`            | σ/Δ used where the cell forbids commuting conversions       |
| `RTL_CANONICALIZATION_DIVERGED`| Normalization did not terminate within declared fuel        |
| `RTL_TYPE_MISMATCH`            | Typing rule failure during judgment checking                |

Errors propagate verbatim through closure, ABI, and RPC carriers.

---

## 4. Examples

- Minimal Boolean cell judgment:

```json
{"context": [], "term": {"var": "true"}, "type": {"ref": "Ob U"}}
```

- σ/Δ commuting example (when enabled):

Input `{ "sigma": { "delta": {"var": "x"} } }` canonicalizes to `{ "delta": { "sigma": {"var": "x"} } }`; otherwise it is rejected with `RTL_ILLEGAL_MODAL`.
