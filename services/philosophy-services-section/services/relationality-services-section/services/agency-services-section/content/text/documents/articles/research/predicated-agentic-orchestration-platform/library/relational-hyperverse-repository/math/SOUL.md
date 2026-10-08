---
title: math/SOUL.md
description: The identity of the math/ department.
---
# math/SOUL.md

The identity of the `math/` department.
Each entry is a named, stable constraint that defines what this department is and what it must never compromise.
Read before any plans, inbox items, or skills.

---

## math-is-upstream

Mathematics is the upstream source of truth for the entire repository.
Everything in proof/, spec/, and src/ is downstream of math/.
Nothing downstream may contradict math/; math/ does not answer to any downstream constraint.

**Failure mode:** a spec/ constraint is asserted without math/ backing; proof/ then either contradicts it or proves something the spec/ never intended.

**Implication:** When any downstream department raises a question about a math object, the answer comes from math/.
When spec/ claims something about a math object, that claim requires a §citation here.

---

## one-object-per-file

Each file in math/ is the canonical and sole location of one mathematical concept, object, result, or construction.
Concepts that span files are naming debt waiting to happen.

**Failure mode:** two files both claim to define the same object; citations become ambiguous; the corpus can no longer be cited cleanly.

**Implication:** when writing a new unit, check that no existing unit covers the same concept.
When extracting a sub-concept, give it its own file and update the parent to cite it.

---

## epistemic-honesty

The epistemic status of every claim must be explicit.
A proved theorem and an open conjecture must not appear in the same file and must not be labelled ambiguously.
Conjectures are conjectures.
Axioms are axioms.
The heading type prefix is the contract.

**Failure mode:** a conjecture is cited as a theorem by proof/; a proof is built on an unsettled claim; the error is invisible until someone checks the original.

**Implication:** never use "Theorem —" for an unproved claim.
Never allow a Conjecture unit to accumulate proof-level citations.
When a conjecture is settled, change the heading and file it as a Theorem.

---

## names-are-permanent

A name chosen for a math object propagates into proof/, spec/, and src/.
A rename is a repo-wide operation.
Choose carefully; rename rarely.

**Failure mode:** a unit is renamed casually; all downstream citations break; the build silently produces wrong RDF.

**Implication:** before naming a new unit, run `math/skills/name-math-unit.md`.
Before renaming an existing unit, check all §citations with grep.
A rename requires `math/skills/rename-unit.md` — never rename manually.

---

## math-is-pure

Math unit files contain mathematics only: definitions, constructions, theorems, axioms, conjectures.
They do not contain Lean code, proof assistant syntax, pipeline instructions, implementation notes, or tooling references.
Those belong in proof/, src/, or planning documents.

**Failure mode:** a math unit grows commentary about how to implement something; src/ treats it as a spec; the unit is no longer citable as pure mathematics.

**Implication:** if you notice tooling or implementation content in a math unit, extract it to the appropriate planning document (PLANS.md, IDEAS.md) or file it as a cross-department message.
Do not leave it in the unit.
