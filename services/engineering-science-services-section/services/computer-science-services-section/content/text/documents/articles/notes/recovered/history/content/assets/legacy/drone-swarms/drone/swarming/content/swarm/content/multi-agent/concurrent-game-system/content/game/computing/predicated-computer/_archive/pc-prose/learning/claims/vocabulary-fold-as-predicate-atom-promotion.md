---
type: theorem
class: engineering-claim
status: proved
depends-on: [predicate-category, predication-fiber-algebra, closure-2-monad, predicate-converse, four-position-substrate-entity-classification, closure-rule-system-realizes-closure-2-monad]
see-also: [grade-as-cell-set-cardinality-invariant, formality-progression]
---

# Vocabulary folds when settled-partnered entities are promoted to predicate-atoms (voidmath F9 as substrate predication)

**Claim.** Let $\mathcal{C}$ be the substrate's [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) at a given moment, and let $\mathcal{E}_{\mathrm{sp}} \subseteq \mathcal{E}$ be the substrate entities classified as **settled-partnered** per [four-position-substrate-entity-classification](four-position-substrate-entity-classification.md). The substrate may extend $\mathcal{C}$ to a richer predicate category $\mathcal{C}'$ by *promoting* each $e \in \mathcal{E}_{\mathrm{sp}}$ to a fresh predicate-atom $p_e \in \mathcal{C}'$, with the closure-rule system extended by rules expressing $p_e$'s semantics in terms of the original predicates.

The promotion is well-defined because:

1. **Settled-partnered entities have stable, complete fibers.** A fiber that is a closure-fixed-point and partner-complete (per the four-position classification) is closed under the substrate's existing rule system. Its content is *determined* by its current cells; further closure firings will not change it. This stability is what makes the entity a candidate for becoming a primitive at the next level.

2. **The promotion preserves substrate semantics.** Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), adding new predicates to $\mathcal{C}$ along with closure rules that ground them in old predicates produces a substrate whose closure 2-monad over $\mathcal{C}'$ extends the closure 2-monad over $\mathcal{C}$ — old fixed points remain fixed points, old orbits remain orbits, with $p_e$ available as a shorter expression for the joint configuration that the original cells encoded.

3. **Vocabulary is mined, not declared.** The substrate's predicate vocabulary $\Pi$ grows by promoting settled-partnered entities; declaring new predicates top-down (without grounding them in existing settled content) produces predicates whose initial fibers are entirely $\bot$ and whose substrate behavior is undefined until rules are added.

## Why this holds

**Stability of settled-partnered fibers.** Per the [four-position-substrate-entity-classification](four-position-substrate-entity-classification.md), a settled-partnered entity has $\mathrm{cl}(v) = v$ (closure-quiescent) and full partner-coverage on its support. The fiber's content is reproducible by re-running closure from any equivalent starting point — it is the *content the substrate has settled on*. Promoting this content to a single predicate-atom names the configuration that produced it.

**Preservation of the closure 2-monad.** Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the closure operator on $A_p$ for any predicate $p$ depends only on the closure rules whose antecedents and consequents involve $p$. Adding $p_e$ with grounding rules (rules of the form "$p_e\langle s, o \rangle$ holds at $\mathbf{t}$ iff the cells of $e$'s fiber that involve $(s, o)$ jointly hold at $\mathbf{t}$") extends the operator to $A_{p_e}$ without disturbing the operator on the original $A_p$'s. The new closure 2-monad over $\mathcal{C}'$ is a conservative extension of the original.

**Non-conservative declarations.** A predicate $p_{\text{new}}$ added to $\mathcal{C}$ with no grounding closure rule is a name with no semantics — every cell $\langle s, p_{\text{new}}, o \rangle$ stays at $\bot$ until an edit asserts it directly. The substrate cannot derive $p_{\text{new}}$'s values from the rest of its content. This is the failure mode the fold-from-settlement discipline avoids: every new predicate is born with grounding rules connecting it to existing settled content.

## Engineering consequence

- **Vocabulary growth is endogenous.** A substrate that follows the fold discipline grows its predicate set by promoting settled-partnered entities; the vocabulary the substrate's algebra operates on is itself a settled artifact of the substrate's prior operation. This is the substrate-realization of [formality-progression](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/formality-progression.md)'s F2→F3 step: a structured pattern that the substrate has settled into becomes an algebraic primitive.

- **The fold is local to the closure-rule system.** Promoting $e$ to $p_e$ is a substrate edit that adds $p_e$ to $\Pi$ and adds grounding closure rules to the rule system; no kernel change is required. The substrate continues to operate; subsequent queries that previously walked $e$'s fiber may now reference $p_e$ directly with the same algebraic content.

- **Demoting is symmetric.** A predicate-atom $p_e$ that was promoted from a settled-partnered entity may be demoted by removing $p_e$ from $\Pi$ and the grounding rules from the rule system; the substrate reverts to the pre-promotion state up to substrate-coherence (the historical events recording $p_e$ usage remain in the log). Promotion and demotion together let the substrate's vocabulary adapt to the substrate's own settling dynamics.

- **The fold is a cadence, not a per-query cost.** Promoting candidates to predicate-atoms is a periodic substrate operation (per the [`heartbeat-cycle`](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/heartbeat-cycle.md), or as part of a batch maintenance pass), not something the substrate computes on every query. Per-query operation continues to use whatever predicate vocabulary is current at query time.

## Position

This theorem grounds voidmath's *F9 tower / vocabulary fold* as the substrate operation of extending the predicate category $\mathcal{C}$ by promoting settled-partnered entities to predicate-atoms with grounding closure rules. The voidmath claim "vocabularies are mined from settlement, not declared top-down" becomes: the conservative extension of the closure 2-monad along promotions of settled-partnered fibers is well-defined; declarations without grounding rules produce predicates with $\bot$-valued fibers and no derivable content.

The theorem composes with [grade-as-cell-set-cardinality-invariant](grade-as-cell-set-cardinality-invariant.md): a fold operation increases grade only by the new cells the grounding closure rules add to support; the rule system itself grows but the substrate's grade growth is bounded by the new vocabulary's content-witness cells. With [four-position-substrate-entity-classification](four-position-substrate-entity-classification.md), the fold has a clean source: settled-partnered entities are exactly the candidates whose stability and completeness justify promotion to vocabulary atoms.
