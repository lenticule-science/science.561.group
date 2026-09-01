---
title: "Language Semantics (RTL)"
date-created: 2026-03-06T00:00:00
---

**Role.** Defines the abstract Recognition Term Language (RTL) used to express judgments over recognition fibers. This document covers syntax, typing, normalization, and admissibility without prescribing JSON encodings.

**Depends on.** `trace-universe.md` for interpretation of judgments as arrows in the GFRTU topos, and `cellular.md` for the cell vocabulary and operator catalogue.

**Provides to.** The language JSON carrier and closure semantics. Representation rules live in `../carriers/language-json.md`.

---

## 1. Purpose and Scope

RTL expresses judgments \(\Gamma \vdash M : A\) internal to the recognition object of a cell. It supplies the constructors, typing rules, and deterministic normalization strategy that closure relies on for admissibility and hashing.

## 2. Syntax and Constructors (Abstract)

Judgments consist of:

- **Context** \(\Gamma\): ordered bindings \(x : A\) respecting the site vocabulary.
- **Terms** \(M\) built from:
  - variables,
  - products and coproduct injections,
  - lambdas and applications,
  - modalities \(\sigma\) and \(\Delta\),
  - cell-provided operators with explicit arity and variance,
  - path/equality witnesses.
- **Types** mirror the term constructors and include references to base types declared in the cell’s RTL signature.

Unknown constructors or mismatched arities/variance are inadmissible (`RTL_UNKNOWN_OPERATOR`, `RTL_VARIANCE_MISMATCH`).

## 3. Typing and Normalization

RTL uses call-by-value, left-to-right normalization with explicit fuel accounting (default fuel 256 unless overridden by closure):

1. Context thinning removes unused bindings (fuel –= 1 per removal).
2. β-reduction substitutes normalized arguments (fuel –= 1 per step).
3. η-reduction eliminates trivial abstractions (fuel –= 1).
4. Modal commuting conversions apply only when the cell declares σ/Δ commuting (fuel –= 1).
5. Operator canonical forms normalize arguments left-to-right; optional rewrites run once after argument normalization (fuel –= 1 per operator reduction).
6. Product/coproduct flattening normalizes injections (fuel –= 1 per flattening).

Reduction halts when no rule applies or fuel is exhausted; exhaustion is `RTL_CANONICALIZATION_DIVERGED`. Context order is preserved throughout; α-equivalent reordering is not permitted.

## 4. Operator Catalogue Semantics

Each operator declared in the cell specifies:

- **name** (referenced by terms),
- **arity** (types of arguments),
- **variance** (`+`, `-`, `0` controlling substitution timing),
- **admissible** flag (false restricts use to defining expressions),
- **rewrite** (optional canonical rewrite),
- **cell_effects** (invariants the operator triggers).

Variance governs substitution: contravariant arguments normalize before substitution; covariant after. Violations are deterministic errors.

## 5. Determinism Obligations

- The reduction order is prioritized and fuel-bounded; each step strictly decreases syntactic measure or consumes fuel.
- Modal commuting conversions rely on the cell’s commuting flag to avoid critical-pair cycles.
- Memoizing subterm identities at constructor boundaries ensures identical reduction traces for identical inputs.

Consequently, RTL normalization yields a unique normal form for fixed cell data.

## 6. Admissibility Surface

Errors surfaced during checking/normalization:

- `RTL_UNKNOWN_FIELD` for unrecognized syntactic constructs in the carrier,
- `RTL_UNKNOWN_OPERATOR` for operators absent from the cell signature,
- `RTL_VARIANCE_MISMATCH` for arity/variance disagreements,
- `RTL_ILLEGAL_MODAL` when commuting conversions are disallowed,
- `RTL_CANONICALIZATION_DIVERGED` when fuel is exhausted,
- `RTL_TYPE_MISMATCH` for typing failures.

These codes are consumed by closure and host layers; their JSON projection is defined in the carrier document.

## 7. Interpretive Constraints

- **Context as sieve.** Contexts represent matching families over sieves; thinning enforces that unused components do not inject phantom evidence into sheaf gluing.
- **Modal naturality.** σ and Δ are natural transformations on the recognition sheaf; commuting conversions respect Beck–Chevalley conditions when enabled.
- **Operators as internal morphisms.** Operator variance mirrors adjunctions in the ambient topos; misuse signals violation of internal hom structure.
- **Hash witness.** Normalized judgments serve as evidence objects; altering representation changes their identity and invalidates the witness carried through closure.

## 8. Normativity Checklist

Before emitting or accepting a judgment:

1. Confirm operators come from the paired cell signature with provenance in the Acts.
2. Declare and consume explicit fuel; record fuel when normalization feeds closure.
3. Recompute judgment identity after normalization; mismatches are errors rather than silent rehashes.
4. Ensure free variables align with the cell’s site vocabulary.
5. Enforce variance ordering for deterministic substitution.

This file captures the meaning of RTL; encoding and canonical ordering of concrete judgments appear in `../carriers/language-json.md`.
