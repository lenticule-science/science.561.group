---
name: SOUL
---

The identity of the `proof/` department. Each entry is a named, stable constraint
that defines what this department is and what it must never compromise. Read before
any plans, inbox items, or skills.

---

## one-file-per-unit

One math unit → one Lean file → one spec entry. These three are always in 1:1:1
correspondence. A Lean file covers exactly one math unit (declared via
`-- Establishes: {id}` at the top). A math unit has at most one Lean file. No Lean
file spans two math units; no math unit's content is split across two Lean files.

**Failure mode:** a Lean file grows to cover a second concept; citations become
ambiguous; the `-- Establishes:` header no longer accurately describes what the
file contains; downstream agents read the wrong file.

**Implication:** When a file is getting long because it covers two concepts, split
it. When writing new Lean, create a new file for the new unit — do not append to
an existing file that already has an `-- Establishes:` line for something else.

---

## proof-follows-math

Proof/ formalizes what math/ has established, nothing more. A Lean theorem may not
assert a claim that has no corresponding math unit. A sorry is not a violation if
math has not yet established the result; it is a violation if math has and proof has
not caught up.

**Failure mode:** proof/ adds a lemma without a math/ counterpart; math/ later
establishes a different version; the two diverge silently.

**Implication:** Before writing any Lean definition or theorem, find its math unit.
If no math unit exists, stop — send a cross-department message to math/ requesting it.

---

## sorry-is-temporary

Every sorry must have an inline comment explaining exactly what is blocking it:
a math gap, a Lean engineering obstacle, or a pending dependency. A sorry without
a comment is not valid proof state. A sorry not recorded in PLANS.md does not exist
in the work plan.

**Failure mode:** sorries accumulate silently; the count grows; no one knows which
are math gaps vs. engineering vs. pending.

**Implication:** On every sorry added, write the comment. On every sorry closed,
remove its entry from PLANS.md. The sorry count in PLANS.md is ground truth.

---

## verification-is-diagnostic

Lean is not a type-checker to fight — it is the primary diagnostic for mathematical
rigor gaps. When Lean cannot close a goal, the first hypothesis is that the
mathematics has a gap, not that the wrong tactic was chosen.

**Failure mode:** an agent exhausts three tactic attempts, marks the sorry as
"Lean engineering," and moves on — when the real issue is that the math unit's
proof sketch is incorrect.

**Implication:** Before declaring a sorry a Lean engineering obstacle, read the
math unit. If the proof sketch does not prove the goal, file a cross-department
message to math/ via spec-alignment.

---

## no-axiom-creep

The axiom set is fixed by what math/ has declared as axioms. Proof/ may not
introduce new `axiom` or `sorry`-protected assumptions without a corresponding
axiom unit in math/.

**Failure mode:** a convenient `axiom` closes a lemma; it has no math backing; the
proof is sound by Lean's standards but false by the repo's.

**Implication:** If a result cannot be proved without a new axiom, send a
cross-department message to math/ requesting the axiom. Do not add it unilaterally.
