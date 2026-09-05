---
date: 2026-03-12
type: slop
topic: M1 synthesis — base kinds derived from OWL/schema.org, TAB/qtmud, and library survey
---

# M1 Synthesis: What Kinds Do We Actually Need?

## What the three sources agree on

### OWL/schema.org minimum

The community consensus base for any named thing:
- IRI as identity (path handle = our IRI)
- `rdfs:label` / `schema:name` — human-readable name
- `rdfs:comment` / `schema:description` — human-readable description

schema:Thing adds: `identifier`, `sameAs`, `alternateName`, `version`.
OWL adds: `deprecated`, `versionInfo`.
SHACL is the constraint layer — the other standards are all open-world.

### TAB minimum

Every thing has:
- `name` — display label
- `behaviors` — list of capability modules (our `kind` + `skills`)
- `additive-attributes` — which fields accumulate across inheritance
- `grammar.pronouns` — linguistic metadata (not needed for library objects)

Critical TAB insight: `lookable` was a *separate type* from `thing`. Not everything had
a description. You had to explicitly declare "this thing can be looked at." In the
semioverse, everything should be differentiable — so `description` is not lookable's
property, it IS the base property. Everything is lookable. Description moves to thing.

TAB's `container` = `contents: []`. Library equivalent: any file is a container of
the files linked from it and the files in its directory. The directory IS the contents
field. No explicit `contents` needed — it's structural.

TAB hierarchy useful as structural reference:
- thing → lookable (has description) → notable (visible/important) → object (notable+massive)
- thing → container → area (container+exits)
- thing → mobile → person

Library equivalent:
- thing → term (specific referent) → concept (abstract pattern) → topic (broad region)
- thing → index (container of things in a region) → domain (top-level container)
- thing → person → institution (persons have relationships; institutions are composed of them)

### qtmud minimum

Every Thing has: name, nouns (set), adjectives (set).
Name parsing: last word → noun, preceding words → adjectives.
This is a search interface — how you FIND things by name.
Library equivalent: `aliases` field (already in 3671 files) + frontmatter `name` vs `title` distinction.

### Knowing Semioverse Specification

Already defines the DIRECTORY organization (the spatial structure):
- Governing: methods/, practices/, standards/
- Engaging: learning/, researching/, applying/
- Situating: disciplines/, schools/, lineages/
- Defining: topics/, concepts/, terms/

This spec tells us WHERE things go. We need the complementary layer: what KIND of thing
goes there. The Defining group (topics/, concepts/, terms/) maps directly to three of
our core content kinds.

---

## Convergence: the base thing

**Minimum predicate set for `thing`** (all sources agree):

| Predicate | Cardinality | Mapping |
|---|---|---|
| `description` | 1..1 REQUIRED | rdfs:comment = schema:description = TAB lookable |
| `name` | 0..1 | rdfs:label = schema:name = TAB :name |
| `kind` | 0..* | rdf:type = TAB :base (multi-valued via list) |
| `tags` | 0..* | already universal in library |
| `creators` | 0..* | schema:author = rdfs:isDefinedBy |
| `date-created` | 0..1 | already universal in library |
| `date-modified` | 0..1 | owl:versionInfo context |
| `version` | 0..1 | owl:versionInfo = schema:version |
| `aliases` | 0..* | schema:alternateName = qtmud nouns/adjectives |
| `status` | 0..1 | owl:deprecated generalized; draft/stable/deprecated |

Why description is REQUIRED and name is not: a thing must be differentiable to be in
the semioverse at all. A description makes it differentiable even without a formal name.
The file path provides identity (the IRI). The description provides differentiation.
A name without a description is a label with no content; a description without a name
is still a thing that can be found and understood.

This is the Tarski triplet framing: the frontmatter IS the secondary intension —
the schema properties of the object, not just its name. The file IS its own description.
The frontmatter makes that description machine-readable.

---

## Core content kinds for M1

Derived from library survey (frequency + consistency) and Knowing Semioverse hierarchy:

### Tier 0: Universal base
- **`thing`** — every library file is a thing. Has description (required).

### Tier 1: Defining kinds (directly from Knowing Semioverse Defining group)
- **`term`** — specific referent; linguistic handle for a particular object, process, or
  state. Adds `defines` (required). Maps to `terms/` directory. 1719 instances.
- **`concept`** — abstract pattern that emerges from and generalizes across terms.
  Adds `generalizes` (terms it generalizes over). Maps to `concepts/` directory. 196 instances.
- **`topic`** — broad region of concern that gathers many concepts and terms.
  Adds `gathers` (concepts and terms it aggregates). Maps to `topics/` directory. 157 instances.
- **`index`** — navigation and aggregation hub. Has `part-of` (parent thing).
  Maps to root of any directory. 447 instances.

### Tier 2: Entity kinds
- **`person`** — biographical entity. Adds: `born`, `died`, `known-for`.
  Maps to `general/people/`. 250 instances.
- **`institution`** — organizational entity. Adds: `founded`, `dissolved`, `members`.
  9 instances but important structurally.
- **`work`** — creative or intellectual production. Adds: `authored-by`, `published`.
  13 instances + ~214 texts.

### Tier 3: Knowledge kinds
- **`text`** — theoretical composition, essay, analytical writing.
  Adds: `authored-by`. 214 instances.
- **`lesson`** — knowledge output in accessible form for transmission.
  Adds: `teaches` (required), `requires`. 484 instances.
- **`specification`** — formal conformance requirement.
  Adds: `stability` (draft/stable/deprecated), `version` (required). 16 instances.
- **`definition`** — formal semantic or mathematical definition.
  Adds: `defines` (required), `symbol`. 16 instances.

### Tier 4: Operational kinds (relevant to engine)
- **`skill`** — decision-making procedure. Already in library/agents/skills/.
  Adds: `grants-to` (roles), `methods` (list of method paths).
- **`practice`** — situated doing; concrete operational procedure.
  Adds: `applies-to`. Maps to `practices/` directory.
- **`method`** — atomic callable procedure. Adds: `script` (path), `inputs`, `outputs`.

---

## The TAB play-test criterion

emsenn's test: we know we're on the right track when we can play Teraum via MCP calls.

Teraum uses areas, exits, lookables, objects, people. The MCP equivalent:
- `look` → read_object(current_path) + list_region(current_path)
- `go east` → navigate(exits["east"]) — reads exits from area's frontmatter
- `examine [thing]` → read_object(thing_path) — reads description from frontmatter
- `take [thing]` → not a library operation — this would be write_object + containment change
- `talk to [person]` → invoke Emsemiote on person_path's description

For this to work, areas need `exits` in frontmatter, objects need `location`, people
need `description`. All of these are covered by the kind definitions above.

The Teraum area `central-plains/fort-kelly.fnl` has: name, exits (implied by TAB area),
contents (NPCs, objects). Translated to library: a `thing` of kind `area` (or just
navigated via directory structure) with `exits: {east: ../path, north: ../path}` in
frontmatter and child files for its contents.

---

## What to build first

In order:
1. `library/domains/general/thing.md` — base kind declaration (philosophical + schema)
2. `library/standards/markdown/frontmatter/thing.shacl.ttl` — SHACL shape
3. `library/standards/markdown/frontmatter/thing.context.jsonld` — JSON-LD context
4. Repeat for: term, concept, topic, index (Tier 1 — highest instance count, most
   foundational for graph queries)
5. Then entity kinds (person, institution) and knowledge kinds (specification, definition)

The engine tools for M1:
- `frontmatter_to_ttl(path)` — uses JSON-LD context for the file's kind
- `validate_shacl(path)` — runs pyshacl against kind's shape
- `check_satisfaction(path)` → SHACL report
- `get_gaps(path)` → violated constraints

---

## Relationship to existing work

The Knowing Semioverse Specification (v0.1.0, 2026-03-09) defines directory types.
Our kind definitions are the complementary layer: what the FILES in those directories
are. The spec says "terms/ contains specific referents." Our `term` kind says "a
specific referent has: description (required), defines (required), kind: term."

These two documents together form the complete schema for library content:
- Knowing Semioverse Spec → WHERE things go (directory placement rules)
- Kind declarations → WHAT things are (frontmatter constraints)
- SHACL shapes → HOW conformance is checked (machine-readable constraints)
