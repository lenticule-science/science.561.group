---
name: four-layer-rule-architecture
description: "The discipline that closure rules in FARS decompose into four layers, each with a different rate of change and a different audience: entity fibers carry what a rule checks (premise patterns, conclusion patterns, severity, alternatives); precompiled cache holds the fast-lookup form of those patterns; stepping map $\gamma_t$ implements how a rule fires (the small, stable mechanism code, ~30 lines per rule kind); protocol adapter handles where and when the rule integrates with external surfaces (stdin/stdout for CLI, exit codes for scripts, MCP tool returns for harness integration)."
type: concept
class: framing
depends-on: [closure-rule, self-representation, fiber]
see-also: [closure-rule-record, closure-rule-system, settle, apply-edit, rule-addition-is-substrate-local]
---

# Four-layer rule architecture

The discipline that closure rules in FARS decompose into four layers, each with a different rate of change and a different audience: **entity fibers** carry *what* a rule checks (premise patterns, conclusion patterns, severity, alternatives); **precompiled cache** holds the fast-lookup form of those patterns; **stepping map** $\gamma_t$ implements *how* a rule fires (the small, stable mechanism code, ~30 lines per rule kind); **protocol adapter** handles *where and when* the rule integrates with external surfaces (stdin/stdout for CLI, exit codes for scripts, MCP tool returns for harness integration).

The layering is what lets FARS keep the substrate self-representing while still being fast: the top layer (entity fibers) is *substrate content* that humans and agents edit; the middle two layers (cache, stepping map) are *derived* and *stable*; the bottom layer (protocol adapter) is *realization-specific* and *harness-facing*.
Adding a rule means creating a new entity at the top layer; the cache is regenerated; the stepping map and the adapter do not change.

The pattern is the engineering analog of three converging precedents:

- **Dwarf Fortress raws.** Each creature, material, body part, or reaction is a text file in `raw/`.
  The C++ engine reads the raws on startup and executes the simulation.
  Adding a creature = adding a text file.
  The engine's code does not change.
  The text files are the program.
- **LPMud driver/mudlib split.** The driver is the C kernel (the stepping map plus the protocol adapter); the mudlib is the LPC layer (the entity fibers plus the rule patterns).
  Driver code changes once a year; mudlib content changes daily.
  The split is what makes a MUD live.
- **Discworld skill system.** Skills are described as data — names, level requirements, action signatures.
  The skill engine is small.
  Adding a skill is editing data, not code.

FARS adopts the same layering because it is what allows substrate self-representation to scale: rules CAN live in the substrate (as entity fibers) without performance penalty (because the cache is fast) and without sprawling code (because the stepping map is small) and without coupling to the harness (because the adapter is the only realization-specific layer).

## The four layers

### 1. Entity fibers — *what* to check

Each closure rule is a substrate entity with a fiber carrying:

- **`premise`** — the predication pattern the substrate is matched against.
  May reference cells (`status: t`), cell patterns (`status: t AND kind: theorem`), or cross-entity patterns (`(self, depends-on, X) AND (X, status: ⊥)`).
- **`conclusion`** — the predication pattern produced when the premise matches.
  Cells (with values) added to the substrate.
- **`match-radius`** — how far from a triggering cell the rule reads (single-fiber, neighbor-fiber, two-hop).
  Bounds the rule's locality cost.
- **`severity`** — the rule's failure-handling tier (`error`, `warning`, `info`).
  Informs how [`settle`](../../code/transformers/settle.md) reports the rule's $\top$-output, if any.
- **`repair-catalog-entry`** — optional pointer to a [repair](../../../../teaching/explanations/repair.md) recipe for the rule's $\top$-states.
- **`alternatives`** — optional list of alternate-rule references the substrate falls back on if the primary rule's match fails (Voyager re-dispatch pattern).

Rules-as-entities means: the substrate's "rule book" is queryable like any other content (`respond(rule, message)`); modifying a rule is a substrate edit (per [`apply-edit`](../../code/transformers/apply-edit.md)); the rule's history is in the event log.

### 2. Precompiled cache — fast-lookup form

The cache is the realization's compiled view of the rules: a structure (typically a content-addressed projection) keyed by the substrate cells the rules match against, allowing $O(1)$ lookup of "what rules apply here?"
The cache is *derived* from the entity fibers; per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), the entity fibers are authoritative and the cache is invalidated/regenerated on rule edits.

The cache is realization-specific: a Python implementation might use dict-of-tries; a Rust implementation might use FST automata; a database-backed implementation might use indexed views.
FARS does not pin the cache's representation — only its discipline (regenerated on rule changes, byte-stable for fixed inputs).

### 3. Stepping map $\gamma_t$ — *how* to fire

The stepping map is the small, stable mechanism code that *applies* a matched rule.
It takes a (rule, match-site) pair and produces the conclusion fiber to compose into the substrate.
Per the layered architecture's claim, the stepping map for a given rule kind is on the order of *thirty lines* — the algorithmic content of rule application is small.

The stepping map is what realizations differ in: a Python implementation has its $\gamma_t$ in Python; a Rust implementation has it in Rust.
The stepping map is not substrate content — it is realization mechanism.
But it is *constrained* by the substrate-level rule entity: $\gamma_t$ reads the rule's `premise`, `conclusion`, `match-radius`, `severity` and behaves accordingly.
Two realizations whose $\gamma_t$ disagree on the same rule + same match-site produce different settled state — and one of them is wrong.

### 4. Protocol adapter — *where and when*

The protocol adapter is the realization-side layer that integrates rule firing with the realization's I/O surfaces: which CLI flag triggers which rule subset; which MCP tool exposes which rules; which stdin/stdout format carries the rule's input and output; which exit codes signal which severities.
The adapter is the most realization-specific layer; it does not appear in the FARS spec.

## Why the layering matters

Three engineering consequences fall out of the four-layer split:

- **Adding a rule is a substrate edit.** A new rule is a new entity with a new fiber.
  The cache regenerates; the stepping map is unchanged; the adapter is unchanged.
  No code change in the realization.
- **Tuning a rule is a substrate edit.** Changing a rule's severity, match-radius, or repair-catalog-entry is editing predications.
  The cache regenerates.
  No code change.
- **Replacing a realization is reusing the rules.** Two FARS realizations that share their rule entities (because the entity fibers are substrate content) and have correct stepping maps and adapters produce the same substrate behavior.
  Cross-realization equivalence is what makes [federation](../../teaching/explanations/federation.md) of FARS instances coherent.

## What this is not

- **Not a plugin system.** A plugin system extends the realization with new code.
  The four-layer architecture extends the substrate with new entity fibers; the realization's code is unchanged.
- **Not a rule engine.** A rule engine runs rules against data.
  The four-layer architecture *is* the substrate's algebra (per [`settle`](../../code/transformers/settle.md)) operating on rules-as-entities; "rule engine" implies a separate sub-system, but here the rule engine IS the substrate.
- **Not a DSL.** Some rule systems define a DSL for expressing rules.
  FARS rules are expressed in the substrate's predication vocabulary — the same vocabulary entities use to describe themselves.
  There is no separate rule language.

## Position

The four-layer rule architecture is what makes FARS's rule-as-substrate-entity discipline operationally tractable.
Without the layering, every rule edit would either trigger a full recompile (expensive) or run uncompiled (slow).
With the layering, rule edits are cheap, fast queries are possible, and the substrate's self-representation discipline holds at scale.

The framing depends on [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) at the top layer (rules are entities) and on [source-of-truth](../../../../teaching/explanations/source-of-truth.md) for the cache (substrate authoritative, cache derived).
It informs [`closure-rule-record`](../objects/closure-rule-record.md) (the substrate-record realizing layer 1) and [`closure-rule-system`](../objects/closure-rule-system.md) (the versioned collection of rule records that operators cite).
