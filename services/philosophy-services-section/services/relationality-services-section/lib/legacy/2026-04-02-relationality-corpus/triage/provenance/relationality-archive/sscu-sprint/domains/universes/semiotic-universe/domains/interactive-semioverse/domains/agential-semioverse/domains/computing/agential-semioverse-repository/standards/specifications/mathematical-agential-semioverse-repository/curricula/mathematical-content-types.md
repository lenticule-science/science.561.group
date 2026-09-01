---

title: "Mathematical Content Types in an ASR"
date-created: 2026-03-05T00:00:00
authors:
  - claude-opus-4-6
status: draft
teaches:
  - "mathematical content types"
  - "mathematical validity requirements"
  - "provability as validity principle"
requires:
  - "frontmatter"
  - "typed relations"
tags:
  - agential-semioverse
  - repository---

This lesson introduces the content types that a [Mathematical ASR](../index.md) adds to the general type vocabulary. After completing it, you should be able to identify which type a mathematical page should have and what relations it needs.

## The general types are not enough

The general ASR defines types like `term` and `concept`. A page typed `term` could define a species name, a cooking technique, or a mathematical structure — the ASR treats them identically. This is fine for organizing a general-purpose vault, but it means the system cannot distinguish a definition (which needs formal context) from an axiom (which must not claim proof) from a theorem (which must have proof).

Mathematical content types add this distinction. They exist because mathematical validity is *constitutive*: the relations a page has determine what it IS, not just what it links to.

## The validity principle: provability

Mathematical knowledge is valid when it is grounded — traceable through proofs and definitions to accepted starting points (axioms). The dependency graph is a directed acyclic graph: no cycles allowed. If A requires B and B requires A, something is wrong.

This is different from philosophical knowledge, where cycles (claim → argument → objection → response → revised claim) are expected and healthy.

## The types

### Foundational types

**definition** — establishes what a term means. MUST have `defines:`. A definition of "group" that does not specify what "set" and "binary operation" mean (either inline or via `requires:`) is ambiguous.

**axiom** — a proposition taken as given. MUST have `part-of:` (which theory does it belong to?). MUST NOT have `proven-by:` (axioms are starting points, not conclusions).

### Result types

**theorem** — a proven proposition. MUST have `proven-by:` linking to a proof. Without proof, it is a conjecture, regardless of what the `type:` field says.

**lemma** — same as theorem, but auxiliary. SHOULD have `supports:` linking to the theorem it serves.

**proposition** — same as theorem, intermediate significance.

**corollary** — follows readily from a theorem. MUST have `follows-from:`.

**conjecture** — believed true, not yet proven. MUST NOT have `proven-by:`. If proven, reclassify as theorem.

### Proof type

**proof** — demonstrates a result. MUST have `proves:` (exactly one target) and `uses:` (what it relies on). SHOULD have `technique:` (direct, contradiction, induction, etc.).

### Instance types

**example** — concrete illustration. MUST have `illustrates:`.

**counterexample** — concrete refutation. MUST have `refutes:`.

## Check for understanding

Given a page about the commutativity of addition on natural numbers:
1. What type should it be? (It states a property and proves it → `theorem`)
2. What MUST relations does it need? (`proven-by:` linking to a proof, `requires:` listing natural numbers and addition)
3. If no proof exists yet, what type should it be instead? (`conjecture`)

Given a page defining "prime number":
1. What type should it be? (`definition`)
2. What MUST relations does it need? (`defines: ["prime number"]`)
3. What SHOULD relations would strengthen it? (`requires:` linking to natural numbers and divisibility, `has-example:` linking to an example of a prime)

## Key takeaway

The type determines the obligations. If you cannot satisfy a type's MUST requirements, either the type is wrong or the page is incomplete. This is not a filing system — it is a validity system.
