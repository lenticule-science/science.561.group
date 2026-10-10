---
type: concept
class: region
depends-on: [predication-substrate, closure-conditions, parameter-base-category, predicate-category, predication-fibration, alexandrov-topology]
see-also: [application-sublocale, scope-cover-via-grothendieck-site]
---

# Scope

A bounded sub-region of a predicated computer — a delimited collection of entities and the predicates among them. In the substrate's hyperdoctrine setting, a scope is *an object of the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathcal{C}$* — a name in the substrate's site of admissible regions, with the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) determining which predications are admissible at it. Scope nesting is structurally a morphism in $\mathcal{C}$; cross-scope reads are pullbacks $f^*$ along these morphisms in the [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).

Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate's collection of scopes carries a *Grothendieck topology*: a family of sub-scopes $\{\sigma_i \to \sigma\}$ is a *cover* exactly when their joint predications produce the full predication state at $\sigma$. This is what makes "the scope is the sum of its sub-scopes" structurally well-defined, and what makes a substrate-level read at $\sigma$ reducible to coordinated reads at the cover.

## Hyperdoctrinal structure

A scope $\sigma$ is:

- **An object of $\mathcal{C}$.** The substrate's parameter-base category is the category of admissible scopes, with morphisms recording inclusion / projection / sub-scope relationships.
- **A fiber in the predication fibration.** Each scope $\sigma$ has its fiber $A_\sigma$ — the predication fiber-algebra of values that can be asserted at $\sigma$. Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), the assignment $\sigma \mapsto A_\sigma$ is functorial, and substitution $f^* : A_{\sigma'} \to A_\sigma$ along $f : \sigma \to \sigma'$ pulls back predications.
- **A site element.** Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate's scopes form a Grothendieck site $(\mathcal{C}, J)$; covering families are the substrate's structural mechanism for assembling sub-scope information into scope-level information.

Scope is not the same as the entity set. A region may contain entities that have predications reaching outside the region; the scope is the predication-bounded region at the site element, not just the entities. Two scopes may share entities (an entity may participate in predications visible to both scopes via $f^*$ pullback) without sharing predicates (the scopes admit different predicate vocabularies in their respective fibers).

## Three engineering uses

- **Containment.** A piece of work or a piece of content is *in* scope $\sigma$ when its predications belong to $A_\sigma$. Scope provides the substrate-level answer to "where does this belong?" without requiring an out-of-band placement decision; per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), the fiber's vocabulary structurally restricts admissible content.
- **Capability boundary.** Operations on the substrate are typically scope-typed: they act on entities visible in a particular fiber, with predicate vocabularies admitted by that fiber. An attempt to act outside scope is rejected at the substrate level — the operation lacks an admissible morphism in $\mathcal{C}$.
- **Audit boundary.** [Witness](witness.md) entries cite the scope at which a recorded action took place. An auditor reviewing a scope's history reads only the witnesses cited at that fiber; cross-scope activity is recorded but is visible from other scopes only through their own pullbacks.

## Scopes nest via $\mathcal{C}$-morphisms

A scope $\sigma_2$ contained in a scope $\sigma_1$ corresponds to a morphism $i : \sigma_2 \to \sigma_1$ in $\mathcal{C}$. The substitution functor $i^* : A_{\sigma_1} \to A_{\sigma_2}$ pulls back predications from outer to inner; the existential quantifier $\exists_i : A_{\sigma_2} \to A_{\sigma_1}$ pushes inner predications outward. Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), these adjoints are exactly what make "claims at the outer scope inform inner scopes; claims at the inner scope can be lifted to the outer scope" structurally well-defined.

Scope nesting is then the substrate-side instance of *site morphism*: an inclusion of one site element into another, with the corresponding pullback / pushforward functors on fibers.

## Scopes admit partial closure

Scope is the substrate-level structure that makes [the closure conditions](closure-conditions.md) admit *partial closure*: a region may satisfy the closure conditions within its fiber $A_\sigma$ without the full substrate satisfying them. A scope-closed region is a [complete sub-computer](closure-conditions.md) at its scope; an unscope-closed region is a region within a containing scope that has not yet satisfied the conditions on its own.

Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate's scope-cover discipline is exactly the sheaf condition on $(\mathcal{C}, J)$: a collection of partial sub-scope settlings glues to a global scope settling exactly when they agree on overlaps — the structural condition that makes coherent assembly of sub-scope information into scope information well-defined.

## Position in the substrate

The application-level instance of scope-as-bounded-region is the [application sublocale](../objects/application-sublocale.md): an application is a scope plus a particular nucleus that projects out the application's view of the substrate. Per the parameter-base-category framing, applications are site elements in $\mathcal{C}$; their nuclei are particular projection morphisms.
