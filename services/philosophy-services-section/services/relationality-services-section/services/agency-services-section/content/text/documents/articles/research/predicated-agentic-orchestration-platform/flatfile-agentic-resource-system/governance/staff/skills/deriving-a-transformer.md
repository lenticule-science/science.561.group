---
name: deriving-a-transformer
description: Skill for deriving a new transformer from first principles — starting from the predication-fibration structure and ending with a properly named, filed, and named entity in transformers/.
title: deriving-a-transformer
---

## What derivation means

A transformer in FARS is not invented — it is derived.
The objects of $\mathcal{C}$ are predicates that the theory has mathematical justification for: they arise from the bilattice structure, the fibration axioms, or the operational semantics of the FARS substrate.

Deriving a transformer means: 1.
Identifying a relationship between entities that needs to be expressible as a predication cell 2.
Checking whether the relationship is already captured by an existing transformer 3.
If not, showing where in the theory the relationship comes from 4.
Naming it as a gerund 5.
Filing it in `transformers/` with only `name:` and `description:`

Do not file a transformer that cannot be mathematically justified from the theory.
Unjustified transformers create keys that the predication fibration cannot interpret — they are metadata in transformer clothing.

## Step 1: Identify the relationship

State the relationship you want to express as a predication cell.
Write it as: "entity $e_1$ [verb phrase] entity $e_2$."

Examples: - "concept `mystery` negates itself" → `mystery negating mystery` - "transformer `specializing` specializes transformer `conversing`" → `specializing specializing conversing` - "structure `predication-cell` is the subject-type of transformer `negating`" → needs derivation

## Step 2: Check if an existing transformer covers it

Collect all files in `transformers/` directories of this substrate.
Their slugs are the current Ob(C).
Ask: does any of these predicates express the relationship in Step 1?

If yes: use that transformer's slug as the frontmatter key.
Do not create a new one.

## Step 3: Locate the theoretical source

Where does this relationship appear in the theory?
Trace it to one of:

- The **bilattice FOUR** (four-bilattice.md) — relationships between truth, false, mystery, contradiction under the two lattice orders or negation
- The **predication-fibration** axioms (predication-fibration.md) — relationships that hold between transformers in $\mathcal{C}$
- The **FARS operational semantics** — relationships that arise from how the substrate actually operates (sessions, dispatch, federation, closure)

If you cannot trace the relationship to any of these, the relationship may not belong in frontmatter at all.
Leave it in the body.

## Step 4: Name it as a gerund

The name is the present participle of the verb that describes what the predicate does.
Test: can you say "entity A is [slug]-ed-by entity B" or "entity A is [slug]-ing entity B"?

- `negating`: "mystery is negated-by mystery" ✓
- `truth-preceding`: "false is truth-preceded-by mystery" ✓ (or: "false truth-precedes mystery")
- `dispatching`: "the substrate is dispatching messages to agents" ✓
- `has-type`: cannot be gerundified without choosing a new name — need to think about what the predicate actually records

If you cannot form the gerund naturally, reconsider whether this is the right predicate or the right name.

## Step 5: File the transformer

Create `transformers/<gerund-slug>.md` with only:

```
---
name: <gerund-slug>
description: <one sentence: "A predicate whose cells record [what relationship].">
---

<body: what entities appear as subjects, what as objects, what the cell value means, what mathematical structure underlies the predicate>
```

No `source:`, `target:`, `type:`, `class:`, or any other metadata keys.

## Step 6: Audit

Run the audit to confirm the new file passes:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root>
```

## What to do with "action transformers"

The FARS substrate has many transformers with names like `dispatch`, `settle`, `compose`, `admit-federation-envelope`.
These were filed as "morphisms" in an earlier framing.
Under theory-encoding.md:

- They are in `transformers/` → they are in Ob(C) → they are predicates
- As predicates, their cells record: "entity $e_1$ [transformer] entity $e_2$" at some bilattice value
- The QUESTION is: what relationship does, say, `dispatching` record between two entities?

This requires rederivation.
For each action transformer, ask: in the FARS operational semantics, what predication relationship does this morphism define between substrate entities?
The answer becomes the body of the correctly-derived transformer, and the gerund name follows from that predication.

This is not a fast cleanup — it is the primary remaining derivation work in the FARS theory.
