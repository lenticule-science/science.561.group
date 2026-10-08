---
name: concept
description: Specification of a resource file under a theory's `concepts/` directory. A concept is a *shared vocabulary anchor in a multi-observer agentic system* — a named role across all observers' settlings, the recurring naturality class the closure operator works to satisfy. Mathematically grounded in multi-observer-system limits (consensus across observers requires shared predicate roles) and predicate-category-naturality (fully closed settlings are functors over the predicate category, with concepts as the naturality classes).
title: concept
---

A concept resource file presents one shared vocabulary anchor — a named recurring role across the agentic system's observers.

## What a concept is, mathematically

Two derivations converge on the same object.

### Multi-observer derivation

Per [multi-observer-system](../../../../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md), an agentic system is a functor $V : O \to \mathrm{Settlings}_B$ from a category of observers to settlings over a shared base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$. **Each observer's settling lives over the same predicate set $\Pi = \mathrm{Ob}(\mathcal{C})$.** Without that shared $\Pi$, the consensus settling $V_{\mathrm{cons}} = \lim_{o \in O} V(o)$ is undefined: observers cannot meet on cells whose coordinates they do not agree on.

The named entries of $\Pi$ — the shared predicate vocabulary — are concepts.
They are not themselves bilattice-valued; they are the *coordinate names* by which observers refer to the same predication cells.
The concepts directory is the substrate's record of this shared vocabulary.

### Predicate-category-naturality derivation

Per [predicate-category-naturality](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predicate-category/content/predicate-category-naturality/predicate-category-naturality.md), a fully closed predication settling is equivalently a functor $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_\ast(\mathbf{L})$.
The closure operator works at every step to bring the settling toward this functorial form.
The naturality classes — the equivalence classes of structures that fill the same role under the four predicate-category generators (specialization, converse, subject-projection, object-projection) — are concepts.
A concept is the recurring naturality role; concrete structures are its instantiations across the predicate category.

The two derivations agree: a concept is a *named role* that observers share and that the closure operator works to keep functorial.
Structures realize concepts; concepts persist across the multi-observer settling.

## Why this matters in an agentic substrate

Per AgOP's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md), every operative element of the substrate is itself a substrate entity.
The shared vocabulary by which agents communicate must therefore be substrate content, not external convention.
The concepts directory is where that shared vocabulary lives — recorded as substrate entities, edit-discipline applied, federation-bridgeable across distinct substrates that need to align their predicate names.

A concept entity asserts: "the role X recurs in this theory; structures in this theory's scope may realize it; multi-observer consensus on X-typed cells requires observers to agree on X's identity."
The body describes the role; the substrate's interpretation rules tie structures to it.

## File location

`<theory>/concepts/<concept-slug>.md`.
One file per concept.

## Frontmatter

### `name`

The slug naming this concept.
Required.

### `description`

One-sentence statement of the recurring role this concept names — what it identifies across realizations.
Required.

## Body

Human-readable description: what role the concept names, why the role recurs in this theory's scope, what the multi-observer consensus on cells of this concept's predicates looks like, how the role is realized differently across structures (where relevant).

## What this specification does not pin

The structured registration of "which structures realize this concept" lives in those structures' frontmatter, not in the concept file.
A concept file SHALL NOT enumerate its realizers — that data is computable by querying the substrate for structures that name this concept.

The interpretation rules that map presentation-layer predicate names to fiber-algebra values at the concept's predicates are realization-specific and deferred to the substrate's interpretation discipline.
