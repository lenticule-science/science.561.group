---
type: theorem
class: engineering-claim
depends-on: [closure-conditions, scope, sublocale-as-application, predication-fibration, predication-hyperdoctrine, predicate-category, closure-rule-system-realizes-closure-2-monad]
see-also: [closure-rule-system-realizes-closure-2-monad, regime-record]
---

# Closure conditions compose under scope nesting and intersection

**Claim.** Let $\sigma_1$ and $\sigma_2$ be two scopes of a predication substrate, each satisfying the [closure conditions](teaching/explanations/closure-conditions.md) up to some stage. Then:

1. **Nesting.** A scope $\sigma_2$ contained in $\sigma_1$ satisfies up to the same stage as $\sigma_1$ does on the predicates and entities of $\sigma_2$. The inner scope's closure stage is bounded above by the outer scope's stage.
2. **Intersection.** The intersection scope $\sigma_1 \cap \sigma_2$ — the scope whose vocabulary is the intersection of $\sigma_1$'s and $\sigma_2$'s vocabularies, whose closure rules are the rules common to both, whose nuclei project the intersection of their visible regions — satisfies up to the minimum of $\sigma_1$'s and $\sigma_2$'s stages.

The result is what makes [application sublocales](teaching/explanations/sublocale-as-application.md) compose: an application's scope inherits closure-stage from its containing scopes, and two applications' shared sublocale carries the conditions both applications satisfy.

## Why this holds

A scope of a predication substrate is a sub-[predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}_\sigma \hookrightarrow \mathcal{C}$ together with a sub-entity-set $E_\sigma \subseteq E$, plus the corresponding sub-fibration $\mathcal{E}_\sigma \hookrightarrow \mathcal{E}$ of the [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md). Each of the seven closure conditions is a structural property that either restricts or projects coherently along these inclusions.

**Stage 1 (Bare presence — condition 1 only).** Bare presence requires that every entity participating in the scope's predications is itself a substrate entity. Nesting: $E_{\sigma_2} \subseteq E_{\sigma_1} \subseteq E$, so substrate-residence transfers down. Intersection: an entity in $E_{\sigma_1} \cap E_{\sigma_2}$ is in both, hence substrate-resident.

**Stages 2–4 (Composable structure — conditions 1–4).** Composable structure requires closure under the predicate-category's morphisms restricted to the scope. The four [predicate-category generators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) (specialization, converse, subject-projection, object-projection) act on a sub-predicate-category by inclusion-and-restriction; closure under these operations on $\mathcal{C}_{\sigma_2}$ is the restriction of closure on $\mathcal{C}_{\sigma_1}$. For intersection, the predicates common to both scopes participate in operations admitted by both; closure under these holds in $\mathcal{C}_{\sigma_1 \cap \sigma_2}$.

**Stage 5 (Constraint-equipped — conditions 1–5).** Constraint-equipped requires the scope's [shapes](theories/agential-orchestration-platform/concepts/shape.md) and [closure-rule-records](../objects/closure-rule-record.md) to be declared. By [closure-2-monad lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), being a $\mathrm{Cl}^{\mathcal{S}}$-algebra on a sub-fibration is a property — restriction to a sub-fibration preserves the algebra structure when the rules used are admissible on the restricted vocabulary. Nesting and intersection inherit constraint-equipping by restriction of declared shapes and rules to the smaller scope.

**Stage 6 (Self-generating — conditions 1–6).** Self-generating requires that the scope's closure-rule applications produce predications in scope. Per [closure-rule](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md), every rule names which predicates appear in its consequent. A rule whose consequent uses only $\mathcal{C}_{\sigma}$-predicates produces in-scope predications when applied; rules using out-of-scope predicates would violate self-generation. Nesting: rules that close $\sigma_2$-vocabulary inside $\sigma_1$ also close it inside $\sigma_2$. Intersection: rules whose consequents use only shared predicates produce in-intersection predications.

**Stage 7 (Closed — conditions 1–7).** Closed requires the scope's [topology](teaching/explanations/topology.md) declarations and active sheaf-style gluing — equivalently, the [predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md) structure on the sub-fibration. The hyperdoctrine's quantifier adjoints, Frobenius reciprocity, and Beck-Chevalley coherence restrict to sub-predicate-categories with finite limits; both nesting and intersection preserve those structural commitments when the sub-categories admit the required limits.

## Engineering consequence

Two applications running on the same substrate with overlapping scopes inherit closure stage cleanly: their shared sublocale satisfies the conditions both component sublocales satisfy. There is no "you can't combine these applications because their closure conditions disagree" engineering objection — combining them produces a sublocale whose conditions are the intersection of the components'.

The result is what makes sublocale composition (per [application-sublocale](../objects/application-sublocale.md)) operationally clean: the combined application's closure stage is computed from the components', not separately argued. Per [scope-as-predication](teaching/explanations/scope-as-predication.md), this is the structural realization of "applications combine through the substrate's algebra rather than through ad-hoc integration."

## What the theorem rules out

The theorem does not claim that the *union* scope $\sigma_1 \cup \sigma_2$ inherits closure-stage cleanly. The union admits both component vocabularies; closure under operations on the combined vocabulary may produce predications that neither component scope admits, and the closure conditions on the union may require additional shapes or rules not present in either component. The substrate's response to a union scope is to declare it as a new scope with its own closure-condition profile.

The theorem also does not claim that the conditions compose under arbitrary morphisms between scopes. The two compositions covered (nesting, intersection) are structural compositions with clear sub-fibration inclusions in the predication fibration; other compositions (substrate-level reflective sublocales, federation across mismatched vocabularies via bridges) require explicit per-composition arguments.

## What the theorem requires

- The component scopes correspond to sub-predicate-categories $\mathcal{C}_{\sigma_i} \hookrightarrow \mathcal{C}$ with finite-limit-preserving inclusions (per the hyperdoctrine's structural needs at stage 7).
- The component scopes' closure conditions are declared per [closure-conditions](teaching/explanations/closure-conditions.md) (the seven-condition formulation).
- The closure rules and shapes are declared as substrate entities (per [self-representation](teaching/explanations/self-representation.md)) so that "shared between scopes" is a substrate-content question.
- The substrate's predicate-vocabulary admits set-theoretic intersection.

The Caramello three-level correspondence (per [caramello-three-level-correspondence](questions/caramello-three-level-correspondence.md)) provides formal topos-theoretic background that this theorem uses implicitly through the predication-fibration framing: scopes are sub-fibrations, and closure-conditions are property-like structures on sub-fibrations.
