---
name: project_capability-composition-insight
description: Discworld MUD's std/object.c composes ~10 capability-mixins via multiple inheritance; this may be the predication-native reframe for FARS kind → capability.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

Session 246e6d58 (2026-04-05) wrote 10 predication-first primitive term files (triple, entity, kind, coordinate, bilattice-element, atom, set, lifecycle-message, container, service) with kind-as-classification (instances MUST have predicates P1, P2...).

After reading Discworld's std/object.c: the production pattern is capability-composition, not kind-classification. A Discworld object inherits from ~10 capability mixins simultaneously (extra_look, enchant, id, misc, property, read_desc, auto_load, help_files, theft_callback, effects), each with its own state class, create() lifecycle, API. The object IS the composition.

**The reframe that may be correct:**
- `kind` → `capability`: entity declaring predicates + operations it provides
- Entity composes capabilities via `has-capability: [cap1, cap2, ...]`
- Entity's predicate-surface = ⊙-union of capability provisions composed with own assertions
- Orthogonal composition, no single-parent inheritance tree
- Identity itself becomes a composable capability (`identifiable`)

**Strategic synthesis:**
- Discworld capability-mixin + qtOps `<>` quality-application + adjoint predication algebra may converge on: a FARS entity is a composition of capability-monads, with ⊙ as monadic bind on predicates
- Matches captain's recurring phrase "Resource is Agent is Monad"

**Not yet acted on.** Before rewriting the 10 term files, need to: (a) verify round-trip through graph works after mash-engine session 9cde2419 finishes fars-core.js fixes, (b) check qtOps `<>` pattern more deeply, (c) research other billion-entity systems (Rimworld, DF, Minecraft, Git, IPFS, Kubernetes, Datomic) for additional patterns.

**If confirmed, term files to rewrite:** kind.md → capability.md; container.md and service.md restructured to declare `provides-predicate:`/`provides-operation:` instead of `requires:`.

**ECS convergence confirmed by research (2026-04-05):**

Read Rimworld, Dwarf Fortress, Entity-Component-System, IPFS CID texts. All these systems separate what OOP conflates:
1. Identity = pure reference (entity ID, coordinate, content-hash)
2. Capability/Component = composable data attached to identity
3. Behavior/System = queries over capability-patterns, not methods on classes

FARS's EAVT graph IS already an ECS store: entity-id + predicate + value = entity + component-type + data. What makes FARS distinctive: **components carry bilattice-valued provenance**, not just values.

Additional insights worth noting:
- DF's "labor-as-capability-declaration, not preference" = FARS predicate-presence is binary, bilattice-value is separate quality
- Git/IPFS content-addressed identity: worth considering whether FARS entity IDs derived from frontmatter-content hash would give immutability-by-construction
- Rimworld's passion-as-skill-to-task-match = dispatch quality metric
- Discworld's `nosave`/`private` decoration = persistence awareness in the type system itself

**Captain's 2026-04-05 correction (processed, Curry-Howard-Lambek collapse confirmed):**

Under CHL: propositions = types = objects-in-CCC. In the hyperdoctrine that FARS already IS (per `library/.../hyperdoctrine.md` and `library/.../predicate-fiber.md`), an entity's predication-set IS simultaneously its capability-set, term-language, type-profile, ECS components, Discworld mixins, monadic bind-context. Seven names, one structure.

**Direct consequence:** `capability` is NOT a new primitive. It's a LENS on predication. Writing capability.md would double-count. The central primitive is `predicate` (with signature + fiber-algebra + operations), viewable from logic/type/category/language/ECS/mixin/monadic angles.

**Vocabulary collapse:**
- Reframe `kind` → `predicate` with CHL trinity explicit
- Demote `container` to a named predicate `contains` with signature (entity → Set(entity))
- Demote `service` to a named predicate `responds-to` with signature (entity → Set(lifecycle-message))
- From "primitives + kinds + specific kinds" to just "primitives + predicate-with-signatures"

**The LISP-like language the captain asked for IS the hyperdoctrine itself:** predicates are types, fiber values are terms, ⊙/⇒ are adjoint-functor application, closure is evaluation, ∃/∀ are reindexing adjoints. Dependently typed, code = data = types = proofs.

**Pending:** captain's new observation that "we have content-addressed id, we just haven't realized it yet" — may reveal relational coordinate structure already present in FARS that I haven't seen.

**Content-addressing findings (2026-04-05, explored per captain request):**

**Currently implemented coordinate systems in FARS** (8 identified, all projections of one structure under CHL):
1. `file-path` — primary identity (`:db.unique/identity` in fars-core.js SCHEMA)
2. `id` — frontmatter field or filename stem
3. `in-domain` — derived from path components
4. `content-role` — derived from path (term/text/plan/task)
5. `eid` — sequential integer handle assigned during graph gen
6. predication-profile — latent, the entity's (predicate, value) vector
7. triple-set — latent, the canonical set of triples defining the entity
8. git-blob-hash — **EXCLUDED per captain 2026-04-05: "we don't want to use git as any part of fars"**

**Confirmed by grep:** none of SHA/createHash/digest/crypto used for entity identity anywhere in fars-core.js, record-event.js, or related tools. No content-addressing currently implemented.

**The latent content-address (captain's "we have it but haven't realized it"):**

Under EAVT semantics (Datomic-style) and under CHL collapse: **the entity IS its triple-set.** Identity comes from the facts. Two entities with identical canonical triple-sets ARE the same entity. A canonical hash of the predication-profile gives a content-addressed identifier — derivable directly from existing graph data, no new infrastructure, no git dependency.

**Strategic implication:** the `coordinate` primitive I wrote can be extended with a derived attribute `content-address: hash(canonical(triple-set))`. The file-path becomes a mutable convenience; the content-address is the stable identity. Deduplication and immutability-by-construction emerge automatically. Matches IPFS's CID pattern structurally without depending on git.

**Not yet acted on.** Will likely become: (a) a `content-address` derived field on entity, (b) a canonicalization function for triple-sets, (c) a hash function pure-Node (stdlib crypto acceptable since crypto is a stdlib module, not an external dep, though the existing code doesn't use it — pending confirmation that's OK).
