---
name: search-mathlib

description: "Returns a Mathlib lemma name and type matching a structural proof obligation, or NONE with closest candidate noted. Use when close-sorry needs a structural lemma and the obligation does not involve FiberNuclearLanguage-specific constructors."
skill-closure-kind: process
---

domain: a proof obligation (type signature or informal description)

Search Mathlib for a lemma that matches a proof obligation.

**Critical constraint:** This project formalizes FiberNuclearLanguage — the level-zero nuclear
language ([fiber-nuclear-language](../math/fiber-nuclear-language.md)) — on top of a custom BiNucleus structure. Almost
none of this is in Mathlib. Before searching, classify the obligation. Searching
for the wrong thing wastes time and produces false confidence.

---

## Step 1 — Classify the obligation

**Project-specific — do NOT search Mathlib:**
```
Proposition V, Step, Steps              — our inductive syntax and reduction relation
Saturate M, Transfer M                  — our FiberNuclearLanguage constructors (Sat / Trans)
R1–R23, cp_*, nf, localConfluence      — our reduction system and confluence proof
BiNucleus, bn.commute                   — our algebraic structure (not in Mathlib)
σ_t / Δ_t as KZ nuclei                 — our specific nucleus pair (not in Mathlib)
FML_{R^(n)}, FML_ℋ                     — higher nuclear languages (not yet formalized)
```

**Structural — Mathlib has this, SEARCH:**
```
HeytingAlgebra, himp, inf, sup, ⊤, ⊥  — Mathlib has Order.Heyting
Nucleus (order-theoretic closure op)   — Mathlib has NucleusClass / ClosureOperator
Relation.ReflTransGen, diamond lemma   — Mathlib has Relation.ReflTransGen and friends
WellFounded, Acc, Measure              — Mathlib has WellFounded.fix
General lattice / order lemmas         — Mathlib has Order.Lattice, Order.BoundedOrder
Monoid, comm_monoid, free monoid       — Mathlib has these
```

If the obligation mixes project-specific and structural parts: search only for the
structural sub-obligation you are trying to discharge.

---

## Step 2 — Formulate the query

Translate to Mathlib names:

| Our term / concept | Mathlib search term |
|--------------------|---------------------|
| `Steps A B` | `Relation.ReflTransGen` |
| reflexive-transitive closure diamond | `Relation.ReflTransGen.diamond` or `Relation.ReflTransGen.join` |
| `HeytingAlgebra` | `HeytingAlgebra` (same) |
| nucleus idempotency | `NucleusClass` or `le_closure_apply` |
| well-founded on measure | `WellFoundedRelation`, `instWellFoundedRelationProd` |
| accessibility | `Acc`, `WellFounded.induction` |
| `⊓`, `⊔` | `inf`, `sup` |

Keep queries short and structural. Do not include FiberNuclearLanguage-specific names.

---

## Step 3 — Search

**MCP — Loogle (type-signature search):**
```
lean_loogle("Relation.ReflTransGen.trans")
lean_loogle("HeytingAlgebra.himp_inf_le")
```

**MCP — LeanSearch (natural language):**
```
lean_search("reflexive transitive closure is transitive")
lean_search("nucleus is idempotent closure operator")
```

---

## Step 4 — Evaluate results

```
Type signature matches exactly                →  use it directly
Matches after unfolding one definition        →  use with note
Requires typeclass instances we may not have  →  check: does our type carry this instance?
Results are from ring theory / topology / AG  →  query too broad; narrow it
```

**Do not use a result without reading its exact type.** Use `lean_hover_info` or
`lean_declaration_file` to confirm.

---

## Step 5 — If nothing matches

Note the closest result found. Return to `close-sorry` and build the proof from
Mathlib primitives, using the closest lemma as a stepping stone.

codomain: Mathlib lemma name and type — or NONE with closest candidate noted
