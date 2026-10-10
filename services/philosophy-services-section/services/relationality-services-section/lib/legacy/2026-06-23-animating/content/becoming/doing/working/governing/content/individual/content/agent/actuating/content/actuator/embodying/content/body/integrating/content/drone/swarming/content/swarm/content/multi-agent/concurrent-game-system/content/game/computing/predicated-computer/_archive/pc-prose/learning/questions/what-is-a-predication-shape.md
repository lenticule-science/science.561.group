---
name: what is a predication-shape
description: The corpus uses "characteristic predication-shape" in nearly every structure-record body, naming the cells that characterize a form. This file asks whether "predication-shape" is a distinct mathematical object or the corpus's term for the signature of a structure-form.
status: open
---

## The question

The 561 corpus uses "predication-shape" — and especially "characteristic predication-shape" — in nearly every structure-record's body to introduce the cells the structure-form requires. Examples from the corpus's bodies:

- *"An entity-form whose characteristic predication-shape makes it dispatchable — bearing identity, capability, operative, and authorization predications that let dispatch match incoming work to it."*
- *"## Distinguishing predication-shape — Cells uniquely characteristic of a skill: has-name, has-description, has-closure-position, ..."*
- *"## Characteristic predication-shape" (recurring section heading)*

No structure record at `code/structures/predication-shape.md` defines the term. A reader trying to learn what a predication-shape *is* finds it used everywhere as a foundational concept while no foundational record states its mathematical content.

The question: is **predication-shape** a distinct mathematical object, or is it the corpus's name for the **signature** of a structure-form (the Bourbaki / Mac-Lane data declaring which characterizations a structure-instance must carry)?

## How "predication-shape" is used

Two stable patterns:

**Pattern 1 — "characteristic predication-shape" as the cells the form requires.** From `agent.md`: *"This structure record gives the agent-form's characteristic predication-shape: the cells that make an entity dispatchable, queryable, and accountable."* The "predication-shape" here is the list of cells the form's instances must bear. The cells named in the body — `has-name`, `has-identity-key`, `has-skill`, etc. — are the components of the predication-shape.

**Pattern 2 — "predication-shape" as the discriminator between forms.** From `agent.md`: *"Two entity-forms are distinct when the kinds of cells they characteristically bear differ."* Two forms differ exactly when their predication-shapes differ. This is the standard "types are distinguished by their signatures" claim from categorical algebra.

In both patterns the predication-shape is *the list of cells the form requires* — what a categorical logician would call the form's *signature*.

## What "signature" means in categorical algebra

A **signature** of a structure-form $T$ is a finite list of typing judgments. The standard categorical-algebra references are Mac Lane, *Categories for the Working Mathematician*, 1971, ch. II §1; and Lambek and Scott, *Introduction to Higher-Order Categorical Logic*, 1986, Part I §1. A signature declares four kinds of data.

- The *sorts* of the type are the carriers an instance must supply.
- The *operations* of the type are the functions an instance must support, with declared arities and result sorts.
- The *relations* of the type are the predicates an instance must support.
- The *constants* of the type are the distinguished elements an instance must designate.

A $T$-structure is then a categorical object equipped with carriers, operations, relations, and constants matching the signature, satisfying some additional set of *axioms* (equational or first-order conditions on the data).

For predication-categorical types, the signature is presented as a list of *characteristic cells*: predication cells with declared subject-sort, predicate, and object-sort. Each characteristic cell is a typing judgment in the categorical sense. An instance inhabits the type when its cell-graph supplies a witnessing cell for each characteristic cell the signature declares.

## The derivation

Comparing:

| Corpus phrase                                              | Categorical reading                                                           |
|------------------------------------------------------------|-------------------------------------------------------------------------------|
| "characteristic predication-shape of the agent-form"       | The signature of the structure-form agent.                                    |
| "cells uniquely characteristic of a skill"                 | The signature cells of the structure-form skill.                              |
| "two entity-forms are distinct when their predication-shapes differ" | Two structure-forms are distinct when their signatures differ. |
| "the cells that make an entity dispatchable"               | The signature cells that, when satisfied, place the entity in the agent type's extent. |

The mapping is one-to-one and lossless: every property the corpus's prose attributes to a "predication-shape" is a property categorical algebra attributes to a "signature." The two terms refer to the same mathematical object: the predication-shape of a form is the signature of the corresponding structure-form.

## Answer

Predication-shape is the corpus's term for the **signature** of a structure-form (equivalently, of a form). The two names refer to one object — the list of characteristic cells / typing judgments that a structure-form's instances must satisfy. The two names carry different rhetorical emphasis: "signature" emphasizes the formal-language / categorical-algebra side, while "predication-shape" emphasizes the predication-cell-graph side native to this corpus.

A short structure record at `code/structures/predication-shape.md` recording this synonymy, with the formal definition of a signature lifted directly from categorical algebra, closes the vocabulary gap.

## What this answer does not decide

- **Whether to keep "predication-shape" or deprecate it in favor of "signature."** The corpus's existing prose uses "predication-shape" widely, especially as a section heading ("## Characteristic predication-shape"). A short structure record establishing the synonymy is the minimal-disruption option; a wholesale rewrite to "signature" is the consistency-maximizing option.
- **Whether the section heading "## Characteristic predication-shape" in structure-records should become "## Signature."** This is a corpus-style decision that follows the synonymy decision.
- **The form versus structure-form distinction.** The previous question file `what-is-a-form.md` settled that form and structure-form are the same object. The predication-shape concept inherits that settlement: the predication-shape of a form is the signature of a structure-form is the predication-shape of a structure.
