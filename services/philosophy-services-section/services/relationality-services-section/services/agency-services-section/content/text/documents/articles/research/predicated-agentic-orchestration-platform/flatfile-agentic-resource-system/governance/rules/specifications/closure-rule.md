---
name: closure-rule
description: Specification of the `closure-rule` transformer-class. A closure-rule transformer is a substrate-recorded generator of one component of the theory's closure operator — a conditional cell-update (if antecedent holds, this cell achieves at least this value). One of many transformer-classes per [transformer.md](transformer.md); others include predicate-category morphisms, positing morphisms, twist-product fusion, modal restriction, and more.
title: closure-rule
---

A closure-rule transformer is one [transformer-class](transformer.md) — the syntactic-generator form.
A filed closure-rule transformer is a substrate-recorded generator of one component of the closure operator $\mathrm{cl}_p: A_p \to A_p$ that drives the theory's settling.

## What a closure-rule transformer is, mathematically

Per [closure-rule](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md), a closure rule has the schema:

$$\underbrace{\forall x_1 \cdots \forall x_n.\; \phi(\vec{x};\, \vec{y};\, v)}_{\text{positive } \Pi_1 \text{ antecedent}} \;\Longrightarrow\; \underbrace{v'(p)(t_1, t_2) \geq_k V}_{\text{cell-update consequent}}$$

with free entity variables $\vec{y}$ (the rule fires once per $\vec{y}$-instantiation) and universally bound variables $\vec{x}$.

The formal language is specified by [closure-rule-language](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md):

- **Cell atoms** — $v(q)(s_1, s_2) \geq_k V$ with predicate $q$, entity terms $s_1, s_2$, value $V \in \mathbf{L}^\bowtie$.
- **Signature atoms** — literals over the parameter base's primitives ($E$'s relations, $\mathcal{C}$'s generator-class membership, $\mathbf{L}$'s residuated-lattice relations).
- **Antecedent shape** — positive Boolean combination (conjunction, disjunction; no negation) of atoms, optionally preceded by a single $\forall$-block.
- **Consequent** — single cell-update $v'(p)(t_1, t_2) \geq_k V$.

The quantifier complexity of the antecedent determines the closure operator's Scott-continuity: quantifier-free antecedents yield Scott-continuous closure (strict or Scott-continuous regime); $\forall$-antecedents over infinite domains yield non-Scott-continuous closure (transfinite-bounded or aperiodic regime).

A closure-rule transformer files one such rule as a substrate entity.
The substrate's `settle` transformer reads the active closure-rule transformers and applies them per their schema.
Per the [four-layer rule architecture](../../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md), closure-rule transformers are layer-1 substrate-content entities.

## File location

`<theory>/transformers/<rule-slug>.md`.
One file per closure-rule transformer.

## Frontmatter

The base frontmatter (`name`, `description`, `transformer-class: closure-rule`, optional `realizes`) is specified by [transformer.md](transformer.md).
The closure-rule class ADDS the following required keys:

### `premise`

The structured antecedent of the rule.
A mapping with the following keys:

- `quantifiers` — list of entity-variable names bound by the $\forall$-block.
  Empty list (or absent) denotes a quantifier-free antecedent.
- `atoms` — list of premise atoms.
  Each atom is one of:
  - **Cell atom**: `{cell: [<subject>, <predicate-slug>, <object>], value: <bilattice-value>, op: ">=k"}` — the cell at $(s, p, o)$ has knowledge-order value at least $V$.
    Subject and object are entity terms (slugs, the free variables $\vec{y}$, or quantifier-bound variables $\vec{x}$).
  - **Signature atom**: `{kind: <signature-kind>, args: [...]}
    ` — a literal over the parameter-base signature (e.g., `{kind: "generator-class", args: ["specialization", <p>, <q>]}` asserts $q$ specializes $p$).
- `connective` — `and` | `or`.
  The connective combining the atoms.
  Required if `atoms` has more than one entry; default `and`.

Required.

### `conclusion`

The structured consequent of the rule.
A mapping:

- `cell` — list `[<subject>, <predicate-slug>, <object>]` naming the conclusion cell at $(s, p, o)$.
  Subject and object are entity terms in the rule's free variables.
- `value` — the bilattice value $V$ the cell is updated to be at least (in knowledge order).
- `op` — `">=k"`.
  Other comparisons are reserved for future closure-rule-language extensions.

Required.

### `match-radius`

A bounded positive integer giving the maximum traversal-hop count the premise reads.
`1` for single-fiber rules; `2` for one-relation-hop traversal; `3` for two-hop traversal.
Per FARS's bounded-radius discipline, unbounded-radius rules are non-conformant.
Required.

### `severity`

`error` | `warning` | `info`.
Determines how $\top$-cells produced by this rule are surfaced: `error` blocks the containing operation; `warning` admits the operation but records a diagnostic; `info` records without escalation.
Required.

### `predicate-uniformity`

`uniform` | `specific`.
`uniform` means the rule is stated using generator-class variables for predicates and obeys closure-operator naturality across the predicate category.
`specific` means the rule is stated at one specific predicate (admissible when no $\mathcal{C}$-morphism out of that predicate constrains the rule).
Default `uniform`.
Optional.

### `repair-catalog-entry`

Slug of a [repair](concept-reference.md) record specifying how to address $\top$-cells produced by this rule.
Optional.

### `alternatives`

Ordered list of closure-rule slugs to fall back to per the Voyager re-dispatch pattern: if this rule's premise matches but its conclusion produces $\top$, the substrate falls back to the first alternative whose conclusion is admissible.
Optional, multi-valued.

## Body

Human-readable description of the rule: its motivation, its scope, the corner cases it handles, and any non-obvious interactions with other rules.
The body is provenance, not match-content — the substrate evaluates against the structured frontmatter alone.

## Invariants the rule MUST satisfy

Per [ClosureRuleRecord](../../structures/closure-rule-record.md) and predication-categories' closure-rule language:

- **Substrate entity.** The closure-rule transformer is itself a substrate entity (per [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md)).
  Editing the transformer file edits the rule.
- **Positive in cell values.** The premise contains no negation of cell atoms.
  Cell values may only RISE in the knowledge order across the settling; a rule that fires on a falling value is mathematically ill-formed.
- **Bounded match-radius.** `match-radius` is finite and explicitly declared.
- **Side-effect-free matching.** Evaluating the premise does not mutate substrate state.
  Matching is a fiber-restriction operation.
- **Conclusion-explicit.** The conclusion is the structured `cell`/`value` pair, not a procedural callback.
- **Witness-cited.** Every rule application produces a witness citing this transformer's canonical hash.

## What this specification does not pin

- The exact encoding of bilattice values in YAML/JSON (`bot` / `t` / `f` / `top` vs `false` / `true` / `null` / a tagged form).
  Deferred to the broader [canonical-interpretation-rules](../../../canonical-interpretation-rules/canonical-interpretation-rules.md) work.
- The closure-rule-language extension for richer comparisons (e.g., $\geq_t$, $\leq_k$, equality at specific bilattice elements).
  Currently only $\geq_k V$ atoms are admitted.
- The interaction between `predicate-uniformity: specific` rules and federation.
  Rules stated at specific predicates may not translate cleanly across substrates with different predicate categories.
- The semantics of `alternatives` when multiple alternatives' premises also produce $\top$.
  Currently first-admissible wins; richer arbitration is deferred.
