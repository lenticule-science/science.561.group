---
type: theorem
class: engineering-claim
status: sketch
depends-on: [doctrine-fidelity, interfacer, federation-bridge, predication-fibration, predication-fiber-functor, twist-product-fusion, twist-product-right-residual]
see-also: [interfacer-counit-law, federation-as-substrate-join]
---

# Doctrine fidelity composes through interfacer chains

**Claim.** Let $f : A \to B$ and $g : B \to C$ be two [interfacers](teaching/explanations/interfacer.md), each [doctrine-fidel](teaching/explanations/doctrine-fidelity.md) on its declared scope. Then their composition $g \circ f : A \to C$ is doctrine-fidel on the intersection of the scopes for which both $f$ and $g$ are doctrine-fidel.

The compositionality is what makes substrate engineering layered. A boundary that admits content from external system $A$ through interfacer $f$ into substrate region $B$, and then projects content from $B$ through interfacer $g$ to external system $C$, preserves doctrine fidelity end-to-end whenever both stages do. Federation chains, RDF/OWL pipelines, agential view-rendering — all are interfacer compositions; the theorem's content is that these compositions don't silently lose structure.

## Why this holds

An interfacer is a structure-preserving morphism between [predication fibrations](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md): on the source side, a fibration $\mathcal{E}_A \twoheadrightarrow \mathcal{C}_A$ representing the external system's predication structure; on the target side, the substrate's fibration. Doctrine fidelity is the requirement that the morphism preserve the [predication fiber functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md)'s structure — bilattice operations, [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$, [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) $\Rightarrow$, $\mathcal{C}$-naturality.

**Part 1: Doctrine fidelity is fibration-morphism preservation.** Per [doctrine-fidelity](teaching/explanations/doctrine-fidelity.md), an interfacer $f : A \to B$ is doctrine-fidel iff the induced functor between fibrations preserves bilattice-residuated structure cellwise. Per [interfacer-counit-law](interfacer-counit-law.md), the round-trip $f^{-1} \circ f$ recovers the original predications joined with any introduced annotations — which is the engineering content of the $\odot \dashv \multimap$ adjunction at the interfacer's external surface.

The structure-preservation is *compositional*: morphisms of fibrations form a category. If $f$ preserves $A$'s fibrational structure into $B$, and $g$ preserves $B$'s into $C$, then $g \circ f$ preserves $A$'s into $C$. Each preservation is a bilattice-residuated homomorphism on its scope; compositions of bilattice-residuated homomorphisms are bilattice-residuated homomorphisms.

**Part 2: Counit-law composition.** Per [interfacer-counit-law](interfacer-counit-law.md), each interfacer's round-trip recovers original-plus-annotations — the linear-logic counit of the $\odot \dashv \multimap$ adjunction. The composed interfacer's round-trip is:

$$(g \circ f)^{-1} \circ (g \circ f) = f^{-1} \circ g^{-1} \circ g \circ f = f^{-1} \circ \mathrm{id} \circ f = f^{-1} \circ f = \mathrm{id} \text{ (plus annotations)}$$

The composition's counit law follows from each component's counit law. Annotations introduced at each stage are preserved through the composition; the composed result includes annotations from both interfacers.

Combining the two: structure-preservation composes (Part 1), and the counit law composes (Part 2). The composed interfacer is doctrine-fidel on its scope.

## Engineering consequence

The compositionality is what makes substrate engineering scalable. Three engineering uses follow:

- **Layered I/O.** A predicated computer's external I/O is typically a chain of interfacers: a wire-format parser (e.g., JSON to JSON-LD), a vocabulary translator (e.g., JSON-LD to RDF), an arena translator (e.g., RDF to substrate predications). Each is a separate interfacer, each is independently testable for doctrine fidelity, and the composed chain inherits fidelity from the components. An engineering team can add a stage to the chain (a new wire format) without re-testing the existing stages.
- **Federation chains.** Per [federation-bridge](../objects/federation-bridge.md), two federated peers may need a translation chain: peer $A$ → bridge $B$ → bridge $C$ → peer $D$, where $B$ and $C$ are intermediate translations. The compositionality theorem says the chain is fidel iff each bridge is fidel; engineers can verify each bridge in isolation rather than testing every chain combination.
- **View pipelines.** A predicated-computer's [project](../morphisms/project.md) operation may chain through multiple shape-renderers (raw substrate → canonical view → wire-format-specific view). The compositionality says the resulting projected output is structurally faithful to substrate content, given each stage is.

## What the theorem rules out

A doctrine-fidelity violation in any single stage of an interfacer chain breaks the entire composition's fidelity. Per the substrate's doctrine-fidelity discipline:

- An interfacer with a *kernel* (content it explicitly does not preserve) creates a fidelity gap on its scope. Compositions involving such an interfacer have their composed scope reduced to the intersection of all stages' fidelity scopes. Engineers must propagate kernel declarations forward; a chain whose composed kernel is not explicitly declared has hidden fidelity gaps.
- A non-fidel interfacer in the chain — one that loses structure beyond what its kernel admits — means the composed chain is not doctrine-fidel. The substrate's response is to refuse the composed interfacer until the failing stage is repaired.
- Interfacers whose fidelity is *conditional* — e.g., fidel only when the source's content satisfies certain predicates — propagate the conditions through the chain. The composition's conditional fidelity is the conjunction of the components' conditions.

## What the theorem requires

- Each interfacer is a fibration morphism preserving bilattice-residuated structure (per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) axiom A3) on its declared scope.
- Each interfacer satisfies the [counit law](interfacer-counit-law.md) on its scope.
- The interfacers' kernel declarations are explicit and propagable through composition.
- The substrate's underlying algebra (per [extend-restrict-adjoint](teaching/explanations/extend-restrict-adjoint.md)) supports interfacer composition without introducing additional structure that would need separate fidelity verification.

## Status

Sketch. Full proof requires formalizing the category $\mathbf{Intfc}(B)$ of doctrine-fidel interfacers over substrate scope $B$ as a sub-category of the morphism category of $\mathbf{PrFib}$ (the 2-category of predication fibrations). The category-theoretic content is straightforward (composition closed, identities trivially fidel), but the substrate-level proof needs to formalize how kernel declarations and round-trip-annotations behave under composition. The four-bilattice case is straightforward; richer value-domains require additional verification.

## Connection to category theory

In categorical terms, the theorem says that doctrine-fidel interfacers form a *category* (with composition closed and identities trivially fidel) — specifically a sub-category of the 2-category $\mathbf{PrFib}$ of predication fibrations, restricted to morphisms preserving bilattice-residuated structure. The substrate's engineering is then this category with substrate-scopes as objects and doctrine-fidel-on-scope interfacers as morphisms. Per the [predication fiber functor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md), this category sits over the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) of the substrate's content algebra; doctrine fidelity is then a fibred property.
