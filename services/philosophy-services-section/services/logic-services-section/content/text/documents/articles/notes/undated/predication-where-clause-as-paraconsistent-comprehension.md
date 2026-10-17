---
type: conjecture
class: engineering-claim
status: sketch
depends-on: [lawvere-comprehension-paraconsistent, lawvere-comprehension-classical, predication-hyperdoctrine, knowledge-order, truth-order, four-bilattice]
see-also: [null-as-bilattice-position, transaction-isolation-as-knowledge-order-position, query-planning-via-beck-chevalley, paraconsistency-as-substrate-discipline]
title: Bilattice designations as explicit, schema-carried query projections
description: Finite FOUR support-selection semantics and the unproved bridge to SQL and Lawvere comprehension.
---

# Bilattice designations as explicit, schema-carried query projections

## Question

Can a predicate-query schema *carry the decision about which evidence readings to select*, rather than pretending every query has one Boolean notion of truth? Can that decision then become a legitimate comprehension operation on generated predication fibers?

**Qualified answer:** a designation is a precise, executable predicate on an admitted FOUR-valued fiber. A schema can carry such a designation, and a query can select its preimage without collapsing opposite evidence. But **selection alone is not a proved Lawvere adjunction**, and ordinary SQL three-valued logic is not identical to FOUR.

## Finite evidence semantics

For one exactly typed and scoped predication, use the
[canonical FOUR glossary](../../../glossary/terms/four.md).
In the truth order the readings satisfy

\[
  \mathbf f \leq_t \bot_k \leq_t \mathbf t,\qquad
  \mathbf f \leq_t \top_k \leq_t \mathbf t,
\]

with \(\bot_k\) and \(\top_k\) incomparable. Write \(\psi^{-1}(D)\) for the *set of admitted cells* whose truth-order FOUR reading belongs to a declared subset \(D\).

| Declared designation \(D\) | Reading of selected cells | Truth-upward-closed? |
| --- | --- | --- |
| \(\{\mathbf t\}\) | Affirmed and not opposed | Yes |
| \(\{\mathbf t,\top_k\}\) | Has affirmative evidence, possibly opposed | Yes |
| \(\{\top_k\}\) | Independently affirmed **and** opposed | **No** |
| \(\{\mathbf t,\mathbf f,\top_k\}\) | Has either kind of admitted evidence, excluding neither | **No** |
| \(\{\mathbf t,\bot_k,\top_k\}\) | Any position except against-only | Yes |
| All of FOUR | Every admitted position | Yes |

These are **distinct query choices**, not interchangeable definitions of true. In particular, the common archived assertion that \(\{\top_k\}\) is a truth-order principal up-set is false: \(\top_k \leq_t \mathbf t\), but \(\mathbf t\) is missing from that singleton. So too is the archived assertion that the "any information" set excluding \(\bot_k\) is truth-upward-closed: it contains truth bottom \(\mathbf f\) but excludes another point above it. Both remain legitimate *filters*, not by that fact right adjoints.

Even an upward-closed \(D\) does **not by itself establish** that its selected-support assignment is a right adjoint to the particular extension functor in the corpus. Supply both typed functors and prove the unit/counit or hom-set order equivalence for the claimed adjunction. The already proved finite top-value comprehension of a *specific order* should not be generalized to arbitrary \(D\) by analogy.

## SQL is a different, explicit translation problem

SQL's standard `WHERE` keeps rows for which its predicate evaluates TRUE under SQL's three-valued semantics. `NULL`, `UNKNOWN`, the `IS NULL` operators, joins and aggregate treatment all have defined SQL-specific rules. A FOUR-valued query is a **proposed additional, typed query facility**; it does not retroactively explain all SQL `NULL` behavior by "choosing the wrong designation."

For SQL compatibility, leave SQL `WHERE` semantics intact. A distinct substrate-level query-plan record may carry the valuation family, exact predication scope and designation to support operations such as "select affirmed evidence," "select contested evidence," and "select any witnessed evidence." Preserve all *separately sourced* positive and negative witnesses for each returned row; do not mistake "has no negative witness" for a proof of external truth.

The most interesting use is **conflict-sensitive computation**: a fact-finding or admissibility schema can select \(\top_k\)-cells for human/agent review without forcing the global decision to \(\mathbf f\), treating the conflict as a type error, or inferring every other proposition. A rejected or contested admission never itself authorizes an irreversible action.

## Proof and Engineering requirements

1. **Science:** define the admitted query/predication diagram, evidence scopes and designation predicates downstream of generated Marks and FOUR. For each proposed comprehension adjunction, state both functors and prove an actual equivalence. Distinguish truth-order from knowledge-order tops.
2. **Engineering (Data):** consume explicit declaration data in the **existing** FOUR, predication and hyperdoctrine implementation. Do not add a shadow bilattice, SQL reimplementation or truth-table parser. Treat selection and adjoint computation as separate operations unless the latter is proved and implemented.
3. **Operations:** bind the query to actual named sources, witnesses, completeness limits, policy and an authorized consumer. A filter result does not constitute a settlement of institutional authority.
4. **Conformance:** exercise all four FOUR points with \(\{\mathbf t\}\), \(\{\mathbf t,\top_k\}\), \(\{\top_k\}\), and \(\{\mathbf t,\mathbf f,\top_k\}\). Show that only the explicitly selected readings are returned, contradictory evidence is retained, and SQL `WHERE` remains unaffected. Reject unsupported claims of adjunction or database dialect support.

**Qualification status:** this finite designation/filtering proposal is meaningful; the generalized Lawvere-comprehension and SQL-equivalence claims remain open. Existing finite hyperdoctrine operations and the positive-threshold closure machinery implement different, narrower portions of the overall research program.

## Historical consolidation

This replaces the earlier long-form theorem-like note that incorrectly classified truth-upward-closed subsets of FOUR, asserted a general right adjoint without a proof, and conflated SQL's three-valued logic with a bilattice projection. Its additional SQL case studies and speculative derivations remain available through Git history. Reintroduce them only with proper semantics, source references and distinct tested obligations.
