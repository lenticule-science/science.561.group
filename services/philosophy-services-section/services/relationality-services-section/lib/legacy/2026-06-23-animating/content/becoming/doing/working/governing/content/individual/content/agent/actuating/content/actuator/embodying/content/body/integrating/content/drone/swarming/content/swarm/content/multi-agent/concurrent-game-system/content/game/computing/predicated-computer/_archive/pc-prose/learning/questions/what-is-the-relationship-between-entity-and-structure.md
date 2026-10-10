---
name: what is the relationship between entity and structure
description: Pulls apart the two distinct mathematical notions the existing records confuse — "structure" in the standard Bourbaki / Mac-Lane sense versus "entity" as an element of a predication-fibration base equipped with its slice-category bundle — and derives the morphisms that connect them.
status: open
---

## The question

The 561 repo has two records, `code/structures/entity.md` and `code/structures/structure.md`, whose bodies pull in opposite directions:

- `entity.md` ends with the sentence "an entity is a structure: every entity inhabits at least one structure-form."
- `structure.md` opens with "a structure is an entity recorded at `code/structures/<slug>.md`."

Both cannot be true as a categorical claim about types. The records are conflating two distinct mathematical notions — "structure" in the standard sense familiar to anyone trained in modern algebra or category theory, and "entity" in a specific sense that has a precise mathematical identity in the predication-categorical setting this repo uses but that is not standard in introductory category theory. This file derives what those two notions actually are, and what morphisms (if any) connect them.

## What "structure" means in modern mathematics

A **structure** in the Bourbaki sense (Bourbaki, *Theory of Sets*, 1968, ch. IV) is a set equipped with one or more *characterizations*: relations on the set, functions on the set, or distinguished elements of the set, satisfying some collection of axioms. Examples: a group is a set with a binary operation and an inverse function satisfying the group axioms; a topological space is a set with a distinguished collection of subsets satisfying the open-set axioms; a category is two classes (objects and morphisms) with composition and identities satisfying associativity and identity laws.

The modern categorical refinement (Mac Lane, *Categories for the Working Mathematician*, 1971, ch. II §1; Lambek and Scott, *Introduction to Higher-Order Categorical Logic*, 1986, Part I) makes the structure-form explicit: a *category of structures of type $T$* has, as objects, sets-with-the-$T$-characterizations satisfying the $T$-axioms; as morphisms, $T$-preserving maps. The structure-form $T$ is itself a piece of data — the *signature* — declaring which characterizations a $T$-structure must carry.

Two consequences of this reading: a structure has a *signature* (the declared characterizations), and a structure-instance has an *underlying set* (or class, or category) on which the characterizations act. The two are routinely conflated colloquially ("a group" can mean either the structure-form or a specific group), but in careful work they are separated: the type is one piece of data, the instance is another.

## What "entity" means in this corpus

This corpus operates inside a **predication category** $\mathcal{P}$ whose objects are *entities* — elements of a fixed entity-set $E$ — and whose morphisms are *predication cells* $(s, p, o)$ where $s, o$ are entities and $p$ is a predicate drawn from a predicate category $\mathcal{C}$.

The predication apparatus is fibered: for each predicate $p \in \mathcal{C}$, there is a *fiber algebra* $A_p$ assigning a value in a bilattice $\mathbf{L}^\bowtie$ to every entity-pair $(s, o) \in E \times E$. The total category $\mathcal{E}$ of all $(p, v)$ with $v \in A_p$ is fibered over $\mathcal{C}$ by the projection $(p, v) \mapsto p$ — a Grothendieck fibration in the sense of Grothendieck (SGA 1, exposé VI, 1971) and Bénabou (*Fibered categories and the foundations of naive category theory*, 1985).

For each entity $e \in E$ there is a corresponding *slice category* $\mathcal{P}/e$: its objects are pairs $(X, f)$ with $X \in \mathrm{Ob}(\mathcal{P})$ and $f : X \to e$ a morphism (a predication cell into $e$); its morphisms are commuting triangles over $e$. The slice construction is functorial in $e$ and equips every object of $\mathcal{P}$ with the data of "the bundle of cells incident to it" — what an introductory text on sheaf theory or fibered categories would call the *bundle around the basepoint* $e$ (Mac Lane and Moerdijk, *Sheaves in Geometry and Logic*, 1992, ch. I §3 for the slice / overcategory; ch. II §6 for the bundle-of-stalks reading).

An entity in this corpus is therefore not a "structure" in the Bourbaki sense. It is an element of a base set equipped with its slice category — a categorical bundle pinned at a point. The phrase the user has used, colloquially, is "a fiber bundle"; the precise reading is "an element of $E$ together with the slice $\mathcal{P}/e$ that the predication fibration assigns to it."

A reader familiar with categorical logic will recognize this as the standard *element-of-a-fibration* setup. A reader who has only seen "structure" in the Bourbaki sense — and who has not seen the slice/bundle reading of an element-of-a-base — will likely conflate "entity" with "structure" because nothing in the standard structure vocabulary singles out the element-with-bundle reading.

## What the two records get tangled in

With those definitions in hand, the existing records' tensions resolve. Restated:

- `entity.md`'s sentence "an entity is a structure: every entity inhabits at least one structure-form" is a *typed-instance-of* claim: every element of $E$ that the cell-graph carries is, in some sense, an instance of at least one structure-form recorded at `code/structures/`. This is the relation between an element-of-a-base and the signatures the element's cells satisfy. The word "is" in the sentence is doing the work of *inhabits*, not *equals*.

- `structure.md`'s sentence "a structure is an entity recorded at `code/structures/<slug>.md`" is a *meta-level* claim about records: every record at that path is itself a thing the cell-graph carries cells for (it has a name, a frontmatter, a body, and other records can address it) and therefore is an element of the repo's own entity-set. The word "is" here is doing the work of *the record at this path counts, in the repo's own predication graph, as*. It is not a claim about the math object the record describes; it is a claim about the record-qua-record.

Both sentences are true in their respective senses. They equivocate on "is."

## The morphisms

Two distinct morphisms connect entities and structures, in opposite directions, and they are not inverses.

**The inhabitance morphism.** For an entity $e \in E$ and a structure-form $S$, $e$ *inhabits* $S$ if $e$'s cell-graph satisfies $S$'s signature: every characterization $S$'s signature requires of an inhabitant is borne by $e$ in the predication graph. This is the categorical relation between an instance and its type — the slice $\mathcal{P}/e$ contains, for each cell $S$'s signature requires, a witnessing morphism into the corresponding scoping object. In standard categorical logic this is the *interpretation* of a type by an element (Lambek and Scott 1986, Part II §11).

The verb: *to inhabit*. The gerund: `inhabiting`. The cell: `(entity, inhabiting, structure)` reads "the entity inhabits the structure (as one of the type's instances)." The morphism is directional from element to type.

Every entity inhabits at least one structure-form (the "thing-with-predications" type, at minimum); most entities inhabit several jointly (a single record may be an instance of both `task` and `work` and `entity`). The inhabitance morphism is not in general injective and is not a subtype-inclusion functor — it is the *element-belongs-to-type* relation, fibered by the structure-form catalog.

**The slicing morphism.** For a structure-form $S$, the slice $\mathcal{P}/S$ is the category whose objects are pairs $(X, f)$ with $X \in \mathrm{Ob}(\mathcal{P})$ and $f : X \to S$ a cell. The slice is a category in its own right (Mac Lane 1971, ch. I §3) and is the bundle of all entities related to $S$ by cells. The slice construction $S \mapsto \mathcal{P}/S$ is itself functorial; in a clean reading it is the *post-composition functor* of Mac Lane 1971, ch. II §6.

The verb: *to slice*. The gerund: `slicing`. The cell: `(structure, slicing, slice-category)` reads "the structure slices to its slice-category." The morphism is directional from type to its bundle.

The two morphisms are not inverses of one another. They are different functors:

- `inhabiting` takes an entity (an element of $E$) and pairs it with a structure-form whose signature it satisfies.
- `slicing` takes a structure-form and gives back a category — not an element of $E$, but a category-of-elements-relative-to-the-type.

Reading `entity = slice-category` as the user has signaled colloquially (every entity is its slice) collapses the inverse direction of `slicing` back to an element, but only by the slice-construction identification — a non-trivial categorical equivalence, not a definitional identity.

## Answer

Entity and structure are different mathematical objects. They sit at different levels of the categorical apparatus:

- **Structure** is a categorical object with a signature: a Bourbaki / Mac-Lane structure-form. The set of all structure-forms is the structure-catalog (recorded in this repo at `code/structures/`).
- **Entity** is an element of an entity-set $E$, equipped (via the slice construction in the predication category $\mathcal{P}$) with the bundle $\mathcal{P}/e$ of all cells incident to it. The colloquial "fiber bundle" reading of entity is exactly the slice $\mathcal{P}/e$.

Two morphisms relate them, in opposite directions, not as inverses:

| Cell                                          | Reading                                                                  | Verb       |
|-----------------------------------------------|--------------------------------------------------------------------------|------------|
| `(entity, inhabiting, structure)`             | the entity satisfies the structure-form's signature in its cell-graph    | inhabit    |
| `(structure, slicing, slice-category)`        | the structure's slice in $\mathcal{P}$ is its bundle of incident cells   | slice      |

Neither morphism is `specializing`. Neither is `realizing`. They are categorical-logic-specific morphisms with their own definitions.

## What this answer does not decide

- **Whether `code/structures/entity.md` and `code/structures/structure.md` should be rewritten.** Both records currently equivocate on "is" in ways the math derivation above resolves. The cleanup is real work: at minimum, `entity.md`'s "an entity is a structure" sentence should be rewritten to "every entity inhabits at least one structure-form" (with `inhabiting` as the named cell); `structure.md`'s "a structure is an entity recorded at..." sentence should be rewritten as a meta-level claim about records, separated from the math definition of structure.
- **Whether `slice-category` deserves its own structure record.** The slice $\mathcal{P}/e$ is a category in its own right; if the repo wants to encode the `slicing` cell, the codomain needs a structure record. The corpus does not currently have one.
- **Whether `inhabiting` and `slicing` should be authored as transformer records now.** Both gerunds are clean and the derivation supports them, but the immediate cleanup of the conflated records does not strictly require the transformer records to exist first — those records can be authored alongside (or just after) the rewrites.
- **Whether the existing typed cell `inhabiting` exists elsewhere in the corpus under a different name.** A grep of `code/transformers/` may turn up a near-synonym already authored (`instantiating`, `realizing-instance-of`, or similar). Reconciling overlaps with existing records is part of the cleanup, not part of the math derivation.
