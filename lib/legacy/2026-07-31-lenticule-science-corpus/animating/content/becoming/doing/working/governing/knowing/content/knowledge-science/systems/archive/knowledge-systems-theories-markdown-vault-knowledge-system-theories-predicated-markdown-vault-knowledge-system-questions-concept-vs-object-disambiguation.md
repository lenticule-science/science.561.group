---
type: question
class: structural
status: open
explores:
  - concept
  - object
  - definition
  - realizes
see-also:
  - ../specifications/note-types/concept.md
  - ../specifications/note-types/object.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md
---

# When is a note a concept vs. an object (definition)?

Predication-categories establishes two distinct typed kinds:

- `concept` — semantic anchors that recur across the theory: *truth*, *knowledge*, *observation*, *agreement*, *consistency*. Not mathematical structures themselves; objects *realize* them. A concept note describes the role and discusses how it is realized differently across constructions.
- `object` (with `type: definition` in frontmatter) — mathematical structures: presheaves, hyperdoctrines, bilattices, fibrations, the predication settling. An object note gives a definition; the object *realizes* one or more concepts.

The directory pair is `concepts/` and `objects/` (note the duality between the directory name and the frontmatter type — `objects/` holds files with `type: definition`).

The discrimination works cleanly in predication-categories. The question is whether the discrimination *generalizes*: can every typed note in the corpus be unambiguously classified as concept or object, or are there cases where the boundary blurs?

## Why it matters

If contributors flip a coin between `concept` and `object` for the same kind of note, the typed vocabulary fragments and queries against `realizes:` become unreliable. The whole point of having two types is that `realizes:` is a directed edge from object to concept; if the source and target classes are not stable, the edge is not stable.

## Worked tensions to resolve

1. **The `predication-settling`** sits in `objects/` as a definition. *Truth*, *knowledge*, and *observation* sit in `concepts/`. This is clean. But what about `predication-cell` — is it a concept (a role: "the unit of predication") or an object (a definition: "an element of $\Phi(s, p, o)$")? Predication-categories chose object; the question is whether that choice generalizes.
2. **An engineering subtheory like `database-platform`** needs notes for things like `transaction`, `index`, `query-planner`. Are these concepts (semantic roles realized differently by Postgres vs. SQLite) or objects (structures with definitions)? The current convention is silent.
3. **In a knowledge-system theory** (this one), is `audience` a concept or an object? The communication-theoretic literature would treat audience as a *role* with multiple realizations (Aristotle's three audience types, Perelman's universal vs. particular audience), suggesting concept. But it can also be defined as a structure (the receiver of a message in Shannon's model), suggesting object.

## What an answer would look like

A working discrimination rule, defended by appeal to what each rule produces in `realizes:` queries:

- **Concept-as-role rule.** A note is a concept if and only if multiple distinct objects realize it, and the concept's body is meaningful independent of any single realization. Otherwise it is an object.
- **Concept-as-anchor rule.** A note is a concept if and only if the corpus needs to *cite* it from theorems and narratives without committing to a specific realization. Otherwise it is an object.
- **Concept-by-typology rule.** Concepts are the eight or twelve named semantic anchors a theory commits to once-and-for-all in its `_index.md`; everything else is object (or another type).

These rules give different answers in the borderline cases. Picking one (or showing they coincide on this corpus) is the answer.

## What is at stake in the wrong answer

A wrong rule produces directories where `concepts/` and `objects/` contain semantically interchangeable notes, defeating the point of the distinction. The right rule produces a `concepts/` directory that is small, stable, and high-citation; an `objects/` directory that is larger, more volatile, and high-realization.
