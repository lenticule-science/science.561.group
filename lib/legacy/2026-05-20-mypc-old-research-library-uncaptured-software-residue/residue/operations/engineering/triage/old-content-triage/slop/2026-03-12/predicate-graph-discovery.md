---
date: 2026-03-12
type: slop
topic: predicate-graph.md discovery — what already exists, how it changes the design
---

# Predicate Graph Discovery

The document at:

```
domains/math/.../agential-semioverse/applications/computing/
agential-semioverse-repository/texts/predicate-graph.md
```

is the most important document we found today. It specifies the full
theoretical architecture — and it's substantially more complete than what
we were sketching. Key findings:

---

## The triplet model (already specified)

A **triplet** is (subject, predicate, object) where:
- **s** = file path (handle: relative path from content root)
- **p** = frontmatter key name
- **o** = path reference to another file (handle) OR string value

The **predicate graph** G = all triplets across all files. Computable by
walking every `.md` file and extracting non-metadata YAML fields.

This is exactly RDF. The spec says so explicitly ("This is the standard
model-theoretic satisfaction relation").

---

## The metadata/predicate distinction (critical)

Not all frontmatter keys are predicates. From section 1.2:

> "Metadata fields are excluded from triplet extraction. The boundary:
> **if the field establishes a relation between the page and something
> else (a concept, a page, a type), it is a predicate. If it describes
> the page as a document artifact, it is metadata.**"

Metadata fields (NOT part of the predicate graph):
`title`, `aliases`, `date-created`, `date-updated`, `status`,
`description`, `summary`, `license`

**`description` is metadata, not a predicate.**

This contradicts our earlier slop (`fregean-frontmatter.md`) where we
proposed `description` as the minimum differentiator that grants a node
its predicate-graph presence. The existing spec disagrees: description
describes the document as artifact; it doesn't establish a relation.

**Resolution**: A thing's minimum entry into the predicate graph is
having at least one predicate (non-metadata) field. The most universal
is `type`. So `type: thing` (or whatever kind) is the entry. `description`
is good practice but is metadata that linters check, not a graph node.

But: we may want to revisit this. The existing distinction separates
"document artifact" from "relational entity" — description is about the
former. If we want things to be first-class relational entities (not just
documents), description as a predicate is defensible. To be decided.

---

## The existing type system

The spec uses `type` as the kind predicate. It's the most-used predicate
in the graph (2722 occurrences). This IS the `kind` field.

The user's proposed `fun-essay: pie` pattern (predicate-as-type-key)
differs from this. The existing system uses:
```yaml
type: fun-essay
topic: pie
```

The `fun-essay: pie` pattern would collapse these into one field where
the key IS the type. This is property-based typing (OWL restriction style)
vs. explicit class membership (`rdf:type` style). Both are valid in RDF.
The existing library uses the explicit `type` field. Whether to change
this is a design question for the next phase.

---

## The existing axiom system (richer than SHACL)

The spec defines a theory per content type — a set of axioms:

| Axiom kind | Meaning |
|---|---|
| `must` | predicate MUST appear |
| `should` | predicate SHOULD appear (warning not error) |
| `target_exists` | handle targets must resolve to existing files |
| `no_self_ref` | predicate must not point to itself |
| `reciprocal` | if A has P to B, B should have Q back to A |
| `target_type` | handle target should have a specific type |

Five domain axiom registries already exist: math, philosophy, sociology,
games, education. Each defines `must`/`should` axioms for their types.

**91.3% satisfaction rate** (389/426 typed pages) as of 2026-03-06.

This is more expressive than basic SHACL for library use cases.
`reciprocal` and `target_type` are particularly powerful — they check
graph-level consistency, not just per-file field presence.

---

## What already exists vs. what we're building

| Component | Status |
|---|---|
| Triplet specification | Specified (predicate-graph.md) |
| Metadata/predicate distinction | Specified |
| Axiom kinds (must/should/target_exists/reciprocal/target_type) | Specified |
| Domain axiom registries (math, philosophy, sociology, games, education) | Specified |
| `predicate-graph.py` tool | References `scripts/predicate-graph.py` — exists in old repo structure, NOT in our engine |
| SHACL / TTL output | Not specified — the spec uses its own axiom language |
| MCP tools for validation | Not present — this is what we're building |
| `thing.md` as base kind | Not present |

The `predicate-graph.py` script exists in the old repository but is NOT
wired into our engine. It's a Python script that:
1. Walks `.md` files, parses YAML frontmatter
2. Extracts triplets (handles vs. values)
3. Loads domain axiom registries
4. Checks satisfaction per typed page
5. Reports gaps as errors/warnings

This script (or its equivalent) should be the `validate_object` MCP tool.

---

## On the merged philosophical/schema file

The existing architecture does NOT merge them. Type theories (axioms) live
in domain ASR specifications, not in the object files themselves. A
`mathematics/concepts/group/index.md` file doesn't define what a
mathematical definition must contain — that's defined in
`mathematics/specifications/mathematical-agential-semioverse-repository/`.

The user's intuition about merging philosophical content and schema is
worth preserving, but the schema lives at the domain/kind level, not the
instance level. `thing.md` would define what a `thing` type requires —
but it's a TYPE definition file, separate from instances of thing.

This is what we already proposed: `domains/general/thing.md` as a kind
declaration. The existing system puts this in `specifications/` directories.
We could follow that pattern OR use co-located kind files. To be decided.

---

## The Lindenbaum-Tarski connection (what the user was gesturing at)

Section 3.2 of predicate-graph.md makes it explicit:

> "The set of axioms for a type T, quotiented by logical equivalence,
> forms a Heyting algebra. This is the Lindenbaum-Tarski algebra of T's
> theory."

So the "Tarski" part emsenn was gesturing at is:
- The axioms for a type form a theory
- That theory, quotiented by logical equivalence, is a Lindenbaum-Tarski algebra
- The satisfaction relation P |= Phi_T is model-theoretic truth in Tarski's sense

The SPO triplet is Fregean (subject-predicate-object = first-order predicate).
The truth evaluation is Tarskian (model-theoretic). The algebra is
Lindenbaum-Tarski. All three are present.

---

## What this means for next steps

1. **Don't invent a new validation system.** The axiom system in
   predicate-graph.md is already well-designed. Port `predicate-graph.py`
   to an engine MCP tool.

2. **Resolve the `description` question.** Metadata vs. predicate for the
   `thing` base type. The existing spec says metadata; we may want to
   reconsider if things-as-relational-entities need it as a predicate.

3. **Design `thing.md` as a type declaration** following the pattern of
   domain ASR specifications. It defines axioms: what predicates must/should
   a thing have?

4. **The `fun-essay: pie` pattern** is a deliberate departure from the
   existing `type: X` + `topic: Y` approach. Worth writing up as a proposed
   change with justification before implementing.

5. **The satisfaction checker already exists** (as a script). The engine
   needs to expose it as an MCP tool. This is closer work than designing
   from scratch.
