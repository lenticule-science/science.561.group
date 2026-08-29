---
name: what is a form
description: The corpus uses "form" — entity-form, agent-form, character-form, form-instantiation, instantiates-form — without a structure-record defining it. This file derives what a form is mathematically, settling whether the X-form compound names a definite categorical object.
status: open
---

## The question

The 561 corpus uses "form" heavily as a structural term: agent-form (12 occurrences), entity-form (18 occurrences), character-form, persona-form, officer-form, work-form, role-form, plus the relation names form-instantiation, instantiates-form. None of these is grounded in a `code/structures/form.md` record stating what a form is mathematically. A reader trying to learn the corpus's vocabulary finds "form" used as if it were a foundational concept while no foundational record states its content.

The question: what is a **form**, mathematically? Once stated, the older records using `X-form` compounds can be audited against the definition.

## How the corpus uses "form"

Three patterns occur. Sampling:

**Pattern 1 — "X-form" as the name of a kind of thing entities are.** From `agent.md`: *"An entity-form whose characteristic predication-shape makes it dispatchable."* Here `entity-form` is being used to name "the form an entity bears." `agent-form` is "the form an agent bears." The compound `X-form` reads as "the form named X."

**Pattern 2 — "form-instantiation" as the relation between an entity and a form.** From `agent.md`: *"The agent form is borne by an entity through form-instantiation."* The relation form-instantiation is doing the work of an interpretation morphism — the relation that pairs each element of a base set with the kinds-of-thing it satisfies.

**Pattern 3 — "form" as emphasis on the inhabitable side.** From `agent.md`: *"the agent form is one of several forms an entity may instantiate."* The reading here: a form is the kind-of-thing-an-entity-can-be, with the emphasis on inhabitability.

## What categorical algebra gives us

A **structure** in the Bourbaki sense (Bourbaki, *Theory of Sets*, 1968, ch. IV) is a set equipped with characterizations — distinguished relations, operations, and constants — satisfying some collection of axioms. The modern categorical refinement (Mac Lane, *Categories for the Working Mathematician*, 1971, ch. II §1; Lambek and Scott, *Introduction to Higher-Order Categorical Logic*, 1986, Part I) presents a structure-form via a *signature* declaring the characterizations and a set of axioms; a structure-instance is a categorical object satisfying that signature.

Categorical logic adds a further piece of data when a structure is interpreted in a category $\mathcal{P}$: the *interpretation relation* between elements (or carriers) of $\mathcal{P}$ and the structure. An element of $\mathcal{P}$ may *satisfy* the signature — its cell-graph supplies a witness for each characterization the signature requires — and the satisfaction relation is recorded as the interpretation (Lambek and Scott 1986, Part II §11).

## Derivation

A form is the joint type of these two pieces of data. Concretely:

A **form** is a pair $(S, \mathrm{inh})$ where:

- $S$ is a structure in the Bourbaki / Mac-Lane sense.
- $\mathrm{inh}$ is the inhabitance relation between a base set $E$ of entities and $S$, recording which elements of $E$ satisfy $S$'s signature.

The compound **structure-form** names this joint type: a structure-form is a structure paired with its inhabitance relation. The compound emphasizes that both pieces of data — the structure's signature and the inhabitance relation — are part of the form.

In the predication category $\mathcal{P}$, the inhabitance relation has a specific concrete form: an entity $e \in E$ inhabits $(S, \mathrm{inh})$ iff its cell-graph in $\mathcal{P}$ supplies a witnessing cell for each characteristic predication cell the structure's signature declares. The cells the signature declares are the structure's *predication-shape*, derived as a theorem in [`what-is-a-predication-shape`](what-is-a-predication-shape.md).

## The X-form compound, parsed

The corpus's `X-form` compound parses, under the definition above, as: *the form whose underlying structure is named X*. Examples:

| Compound        | Underlying structure                  | Inhabitance carriers                                  |
|-----------------|---------------------------------------|--------------------------------------------------------|
| structure-form  | a structure (object of $\mathcal{P}$) | records at `code/structures/<slug>.md`                |
| agent-form      | an agent                              | character records that bear agent-form predications    |
| character-form  | a character                           | character records                                      |

This parse is consistent with the X-form usage in the corpus's records that name a form by its underlying structure's name.

## Answer

A form is a pair $(S, \mathrm{inh})$: a structure $S$ together with an inhabitance relation $\mathrm{inh}$ that pairs $S$ with elements of a base set that satisfy $S$'s signature. The compound `structure-form` names this joint type. The compound `X-form` denotes the form whose underlying structure is named $X$.

The relation called *form-instantiation* or *instantiates-form* in older records is the inhabitance relation $\mathrm{inh}$ of a form. The transformer record at [`code/transformers/inhabiting.md`](../../../code/transformers/inhabiting.md) names this relation as the `inhabiting` morphism; cell `(entity, inhabiting, form)` reads "this entity inhabits this form."

## What this answer does not decide

- **Whether the older X-form records in the corpus are coherent with this definition.** The definition above is the math the audit will check against; it does not assume the older records are correct. Some `X-form` usages in `agent.md`, `entity.md`, `character.md`, and elsewhere may not exhibit a coherent inhabitance relation as currently written, or may conflate the form with its underlying structure. Updating those records is follow-up work and may involve substantive revisions, not just word-swaps.
- **Whether `code/structures/form.md` should be retired in favor of inline references to "structure-form" everywhere.** A separate record at `form.md` makes the definition addressable; eliminating it and instead defining structure-form inline at `code/structures/structure.md` is the alternative. The cost of either is small; the choice is editorial.
- **Whether every record at `code/structures/<slug>.md` is itself a structure-form.** It is plausible that all such records denote structure-forms (they describe a structure plus the inhabitance relation between entities and that structure), but stating this as a theorem requires showing that each record carries a coherent inhabitance relation. Some older records do not state the relation explicitly; these need updating.
