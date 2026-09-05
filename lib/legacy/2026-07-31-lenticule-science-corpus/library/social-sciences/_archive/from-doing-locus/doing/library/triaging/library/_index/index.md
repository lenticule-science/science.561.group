---
name: transformers glossary
description: Typed relations (1-cells) between entity-forms in the 561 Group's category — each has a source-form, target-form, characteristic predication-shape, and step-induction role.
contains:
  - accountability-projector.md
  - accumulates-memory.md
  - addressing.md
  - articulating.md
  - citing.md
  - closure-operator.md
  - composes.md
  - composing.md
  - contains.md
  - cut-version.md
  - decomposes-into.md
  - depends-on.md
  - derives-from.md
  - has-character.md
  - has-status.md
  - heyokha.md
  - inhabiting.md
  - incarnates.md
  - incumbent-of.md
  - joining-by-knowledge.md
  - linting.md
  - member-of.md
  - originating.md
  - realizing.md
  - requires.md
  - slicing.md
  - specializing.md
  - structuring.md
  - supersedes.md
  - terminating.md
  - transforming.md
---

## Historic glossary — see lawful library for current positions

This directory is a historic flat glossary that predates the recursive thing-directory layout; it is named in the [mid-refactor condition](../../doing/working/hacking/teaching/explaining/the-mid-refactor-condition.md) as non-conformant. Each transformer's lawful position is its own gerund-named direct subdirectory of the appropriate source `$thing`. Records here are kept as facts about the historic shape; new work goes to the lawful position.

Transformers reconstructed at their lawful positions in the predication-originating cycle:

| Historic | Lawful position |
|---|---|
| `articulating.md` | [library/relationlessness/articulating/articulating.md](../../library/relationlessness/articulating/articulating.md) |
| `originating.md` | [library/object/library/thing/library/transformer/originating/originating.md](../../library/object/library/thing/library/transformer/originating/originating.md) |
| `terminating.md` | [library/object/library/thing/library/transformer/terminating/terminating.md](../../library/object/library/thing/library/transformer/terminating/terminating.md) |
| `specializing.md` | [library/object/specializing/specializing.md](../../library/object/specializing/specializing.md) |
| `realizing.md` | [library/object/realizing/realizing.md](../../library/object/realizing/realizing.md) |
| `addressing.md` | [library/identifier/library/name/addressing/addressing.md](../../library/identifier/library/name/addressing/addressing.md) |
| `inhabiting.md` | [library/object/inhabiting/inhabiting.md](../../library/object/inhabiting/inhabiting.md) |
| `slicing.md` | [library/object/library/thing/library/category/slicing/slicing.md](../../library/object/library/thing/library/category/slicing/slicing.md) |

Application-domain transformers (irrigating-when-dry-and-no-rain, dispatching-fabrication-job, etc.) are math-silent under the seven primitives and triage to `doing/working/hacking/doing/working/triaging/library/` in a subsequent cycle.

---

The typed relations (1-cells) between entity-forms in the 561 Group's category. Where [structures/](../structures/) catalogues entity-shapes, transformers catalogue the typed relations between them.

A transformer is a reified typed relation: it has a source-form and a target-form, a predication-shape characteristic of the relation, and step-induction roles (it lets some endeavor step happen that wouldn't happen without the relation).

## Originating morphism of the predication category

| Transformer | Source → target | Step-induction |
|---|---|---|
| [articulating](articulating.md) | [relationlessness](../structures/relationlessness.md) → [predication-cell](../structures/predication-cell.md) | Articulates the would-be absence into the originating cell $\phi^* = (X, p^*, R)$; one-way; the seed every other cell-derivation closes against. |

## Typed-signature morphisms

The morphisms a structure or transformer record uses to encode its own typed signature in frontmatter.

| Transformer | Source → target | Step-induction |
|---|---|---|
| [originating](originating.md) | morphism → object (functor $\mathrm{dom}: \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$) | Names the source object of a morphism; one of the two arrow-category projections. |
| [terminating](terminating.md) | morphism → object (functor $\mathrm{cod}: \mathrm{Arr}(\mathcal{C}) \to \mathcal{C}$) | Names the target object of a morphism; the dual arrow-category projection. |
| [specializing](specializing.md) | object → object (faithful subcategory inclusion) | Embeds a more-constrained type into a more-general type, characterized by additional invariants. |
| [realizing](realizing.md) | concrete-form → abstract-form (faithful, essentially-surjective interpretation functor) | Materializes an abstract form as a concrete form across a level of mathematical abstraction. |
| [addressing](addressing.md) | name → object (partial interpretation functor) | Sends a name-string to the object it identifies, where defined. |
| [inhabiting](inhabiting.md) | element → type (element-belongs-to-type relation) | Records that an element's cell-graph satisfies a structure-form's signature. |
| [slicing](slicing.md) | object → slice-category (post-composition functor $V \mapsto \mathcal{C}/V$) | Equips an object with its bundle of incident cells — the slice category around it. |

## Transformers over agent-forms

| Transformer | Source → target | Step-induction |
|---|---|---|
| [incarnates](incarnates.md) | [body-natural](../structures/body-natural.md) → [persona](../structures/persona.md) | Per-session embodiment of a durable identity |
| [incumbent-of](incumbent-of.md) | [persona](../structures/persona.md) → office (relation produces an [officer](../structures/officer.md)) | Time-bounded role-occupancy |
| [member-of](member-of.md) | [persona](../structures/persona.md) → [polity](../structures/polity.md) (relation produces [personnel](../structures/personnel.md)) | Polity-membership recognition |
| [has-character](has-character.md) | [persona](../structures/persona.md) → [character](../structures/character.md) | Stable disposition; closure-rule consultation |
| [accumulates-memory](accumulates-memory.md) | [persona](../structures/persona.md) × time → memory | Cross-session history accumulation |

Several listed transformers reify a relation as a target-structure: `incumbent-of` produces an officer; `member-of` produces personnel. This is the reified-relation pattern: the relation itself is addressable, signable, time-bounded.

## Transformers over scopes

(Pending; the agent-community scope-level transformers — `governing-soul-of`, `governance-process-of` — should be authored next.)

## Audit operators (audit-bootstrap, Pass 1)

| Transformer | Source → target | Step-induction |
|---|---|---|
| [accountability-projector](accountability-projector.md) | event-log entries (cosheaf side) → [witness-chain-record](../structures/witness-chain-record.md) (sheaf side) | Verdier identification of cosheaf homology with sheaf cohomology; emits a witness-chain-record per closed settling cobordism with TQFT partition function |
