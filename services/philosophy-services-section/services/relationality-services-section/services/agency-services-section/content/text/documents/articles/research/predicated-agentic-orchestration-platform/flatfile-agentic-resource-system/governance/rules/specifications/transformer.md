---
name: transformer
description: Specification of a resource file under a theory's `transformers/` directory. A transformer is a morphism in the predication-fibration. Predication-categories distinguishes many morphism classes — closure operators, positing morphisms, predicate-category generators, twist-product fusion, modal restriction, bilattice homomorphisms, step-shift, settling-morphism, and more — each with its own structure. The `transformer-class:` discriminator names which class the filed transformer realizes; each class has its own sub-spec with class-specific required frontmatter.
title: transformer
---

A transformer resource file presents one morphism in the predication-fibration over base $(\mathbf{L}, \mathcal{C}, E)$.

## What a transformer is, mathematically

Per the predication-categories corpus, morphisms come in many distinct classes.
Each class has its own algebraic shape and operates on different parts of the predication structure.

**Morphisms in the predicate category $\mathcal{C}$** — arrows between predicates:

- **Predicate specialization** $f_{\mathrm{spec}}: q \to p$ where $q$ is a sub-predicate of $p$.
- **Predicate converse** — reverses the predicate's subject and object positions.
- **Predicate subject-projection** — collapses the subject coordinate.
- **Predicate object-projection** — collapses the object coordinate.

These four generators are themselves *predicates about predicates* — the specialization morphism between $q$ and $p$ IS the cell recording "$q$ specializes $p$" at the meta-predicate `specializes`.

**Morphisms in the predication-fibration** — operate on fiber algebras or valuations:

- **[Closure operator](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)** $\mathrm{cl}_p: A_p \to A_p$ — monotone, inflationary, idempotent, $\mathcal{C}$-natural.
  Generated syntactically by [closure rules](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md).
- **[Positing morphism](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/positing-morphism/positing-morphism.md)** $\mathrm{posit}_{(\phi,q)}: v \mapsto v \vee_k \delta_{\phi,q}$ — evidence-injection.
  Sub-classes by datum: assertive ($\mathbf{t}$), denial ($\mathbf{f}$), contestation ($\top$), abstaining ($\bot$).
  [Agentive positing](../../../../../../notes/undated/agentive-positing-morphism.md) attributes a posit to a specific observer.
- **[Bilattice homomorphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/bilattice-homomorphism.md)** — value-domain map preserving bilattice structure.
- **[Twist-product fusion](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md)** $\odot$ — non-integral fusion on $\mathbf{L}^\bowtie$.
- **Modal-necessity / modal-possibility operators** — modal restrictions on capability fibers.
- **Reindexing functors** $f^*: \mathcal{E}_p \to \mathcal{E}_q$ — induced by predicate-category morphisms.
- **Settling-morphisms** (cross-base, preorder, modeling) — see the [theory.md](theory.md) structural relation keys.
- **Step-shift, idealization, researching** — settling-level morphisms.

## File location

`<theory>/transformers/<transformer-slug>.md`.
One file per transformer.

## Base frontmatter (every transformer)

### `name`

The slug naming this transformer.
Required.

### `description`

One-sentence statement of what the transformer does.
Required.

### `transformer-class`

The morphism class this transformer realizes.
A slug naming one of the predication-category morphism classes — `closure-rule`, `assertive-positing`, `denial-positing`, `contestation-positing`, `abstaining-positing`, `agentive-positing`, `predicate-specialization`, `predicate-converse`, `predicate-subject-projection`, `predicate-object-projection`, `bilattice-homomorphism`, `twist-product-fusion`, `modal-necessity-restriction`, `modal-possibility-extension`, `reindexing-functor`, `step-shift`, `idealization`, `researching`, … This is an open enum; new classes from upstream may be added as FARS uses them.
Required.

### `realizes`

List of concepts the transformer realizes.
Optional, multi-valued.

## Per-class frontmatter

The `transformer-class` value selects which sub-spec applies.
Each class has its own specific required keys.
Currently filed sub-specs:

- **`transformer-class: closure-rule`** — see [closure-rule.md](closure-rule.md).
  Pins `premise`, `conclusion`, `match-radius`, `severity`, plus optional `predicate-uniformity`, `repair-catalog-entry`, `alternatives`.

Sub-specs not yet written (each is its own Phase-10-shaped piece of work):

- `predicate-specialization` / `-converse` / `-subject-projection` / `-object-projection` — predicate-category morphisms.
  Required keys at minimum: `source-predicate`, `target-predicate`, plus the sub-support inclusion data per [predicate-specialization](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md).
- `*-positing` — positing morphisms.
  Required keys at minimum: `cell` (the $(s, p, o)$ position), `datum` (the bilattice value), plus optional `agentive-attribution` for posits attributed to a specific observer.
- `twist-product-fusion` — fusion operation.
  Required keys: the two source fibers being fused.
- `modal-necessity-restriction` / `modal-possibility-extension` — modal operators.
  Required keys: the accessibility relation $R$, the world-set indexing.
- Others as needed.

## Body

Human-readable description of the transformer's operational semantics: how it acts, what invariants it preserves, where it composes with other transformers.
For closure-rule transformers, body content supplements the structured premise/conclusion; for predicate-category morphisms, the body explains the sub-support inclusion or projection structure; for positings, the body explains the speech-act context and the agentive attribution if any.

## What this specification does not pin

- Most per-class sub-specs (only `closure-rule.md` is currently written).
  Each remaining class needs its own sub-spec derived from upstream.
- The bilattice-value encoding in YAML (`bot`/`t`/`f`/`top` vs tagged form).
  Deferred to canonical-interpretation-rules.
- Whether the `transformer-class` enum should be closed (only allow known classes) or open (allow any slug, lint warns on unknown).
  Currently open.
