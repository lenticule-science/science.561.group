---
derives-methods-from-theory: [predicated-philosophy, lakotaean-philosophy]
---

# Predicated Lakotaean Philosophy

A substrate-algebraic articulation of [lakotaean-philosophy](../../../indigenous/theories/lakotaean-philosophy/) on the [predication-categories](../../../../../math/theories/categories/theories/predication-categories/) mathematics.
The Lakota relational ontology — [mitakuye oyasin](../../../indigenous/theories/lakotaean-philosophy/concepts/mitakuye-oyasin.md), [wakhan](../../../indigenous/theories/lakotaean-philosophy/concepts/wakhan.md), the [four virtues](../../../indigenous/theories/lakotaean-philosophy/concepts/four-virtues.md), [wolakota](../../../indigenous/theories/lakotaean-philosophy/concepts/wolakota.md), [wicozani](../../../indigenous/theories/lakotaean-philosophy/concepts/wicozani.md), the [seven rites](../../../indigenous/theories/lakotaean-philosophy/concepts/seven-rites.md) — given the formal shape that lets the substrate's machinery work for the tradition.

This subtheory is the substrate-algebraic *form*; the substantive content remains [lakotaean-philosophy's](../../../indigenous/theories/lakotaean-philosophy/), held under the captain's vested Lakota authority.

## What this subtheory commits to

**The Lakota predicate category is kin-relational.** The primary predicates on the substrate are kin-predicates: *relative-of*, *kin-class-of*, *relation-to-place*, *ancestor-of*, *spirit-relation-to*.
Other predicates that look unary in non-Lakota traditions (*is-sacred*, *is-wise*, *is-brave*) are themselves relations in this category — *sacred-to*, *wise-with-respect-to*, *brave-in-relation-to* — because under [mitakuye oyasin](../../../indigenous/theories/lakotaean-philosophy/concepts/mitakuye-oyasin.md) properties of entities standing alone are not the metaphysical primitives.
The kin-relation is the primitive; everything else is read off the relational structure.
See [kin-relation-as-primitive](objects/kin-relation-as-primitive.md).

**The entity set extends beyond the human.** Buffalo are oyate, stones are relatives, places carry standing.
The Lakota entity set $E_{\mathrm{lak}}$ includes humans, four-leggeds, wingeds, standing-ones, rooted-ones, swimming-ones, crawlers, stones, the elements (earth, water, fire, air), specific places (most explicitly [Pȟahá Sápa](../../../../../sociology/theories/politics/theories/lakotaean-politics/concepts/paha-sapa.md)), ancestors, and spirits.
Each is a substrate entity; predicates and closure rules quantify over the wider set, not over a humans-only subset.
See [extended-entity-set](objects/extended-entity-set.md).

**Wakhan is a quality on cells and on closure rules.** Some predication cells carry [wakȟáŋ](../../../indigenous/theories/lakotaean-philosophy/concepts/wakhan.md) — they bear the quality of the sacred.
Cells over Wakȟáŋ Tȟáŋka, cells over the pipe, cells over a place that is wakȟáŋ, cells over ceremony — all carry this quality.
The quality also attaches to closure rules: some closure rules are *wakȟáŋ-bearing*, meaning their firing is itself a sacred event (ceremony-binding is the central case).
The substrate distinguishes wakȟáŋ-bearing rules from ordinary rules at the rule-system level.
See [wakhan-as-cell-quality](objects/wakhan-as-cell-quality.md).

**The four virtues are evaluation predicates on conduct cells.** Every conduct cell $\langle a, \texttt{acts}, c\rangle$ admits evaluation under each of the four virtues — *wówačhantognaka*, *wóksape*, *wóohitika*, *wówačhiŋtȟaŋka*.
The evaluation produces a bilattice value: a conduct cell is at $\mathbf{t}$ under wówačhantognaka when the conduct exemplifies generosity, at $\mathbf{f}$ when it fails it, at $\bot$ when undetermined, at $\top$ when contradicted.
Cumulative virtue-evaluation across an actor's conduct history settles their standing as wolakȟota.
See [four-virtues-as-evaluation-predicates](objects/four-virtues-as-evaluation-predicates.md).
This composes cleanly with predicated-governance's existing [conduct-teachings-as-evaluation-predicates](../../../../../sociology/theories/work/theories/predicated-work/theories/predicated-governance/objects/conduct-teachings-as-evaluation-predicates.md).

**The seven rites are witness-bearing morphisms.** Each rite is a substrate operation that, when performed under proper conditions (proper wičháša wakȟáŋ standing, proper preparation, proper place), produces witnesses on specific cells.
The inipi witnesses purification; the haŋbléčheyapi witnesses vision; the huŋkápi installs kin-cells across the populace ([hunka](../../../../../sociology/theories/politics/theories/lakotaean-politics/concepts/hunka.md)); the wiwáŋyaŋg wačhípi witnesses the standing of the people as a people; the wanáǧi yuhápi maintains and then releases ancestor-relation cells.
See [seven-rites-as-witness-morphisms](morphisms/seven-rites-as-witness-morphisms.md).

**Wolakota is a closure-rule discipline.** Being wolakȟota — living the Lakota way — is the substrate's closure-rule discipline that produces conduct-cell settlings consistent with the four virtues, with mitakuye oyasin's relational obligations, and with proper participation in ceremony.
The discipline is the closure-rule subsystem $\mathcal{S}_{\mathrm{wolak}}$; an agent is acting wolakȟota when their conduct cells settle under this subsystem.
See [wolakota-as-closure-discipline](objects/wolakota-as-closure-discipline.md).

**Wicozani is a settling-quiescence condition.** The well-being of a person, tiyospaye, or people is the substrate condition in which the relevant relational cells have settled to consistent values under the wolakota closure discipline, with no persistent $\top$ (contradiction) on relation cells and no persistent $\bot$ (unsettlement) on cells where settlement is due.
Wicozani at the polity scale is the quiescence of the polity's settling — a structural rather than aggregate property.
See [wicozani-as-quiescence](objects/wicozani-as-quiescence.md).

## Layout

- [`concepts/`](concepts/) — predicated-Lakota semantic anchors (to be filled out from the leaves above).
- [`objects/`](objects/) — formal structures: [kin-relation-as-primitive](objects/kin-relation-as-primitive.md), [extended-entity-set](objects/extended-entity-set.md), [wakhan-as-cell-quality](objects/wakhan-as-cell-quality.md), [four-virtues-as-evaluation-predicates](objects/four-virtues-as-evaluation-predicates.md), [wolakota-as-closure-discipline](objects/wolakota-as-closure-discipline.md), [wicozani-as-quiescence](objects/wicozani-as-quiescence.md).
- [`morphisms/`](morphisms/) — operations: [seven-rites-as-witness-morphisms](morphisms/seven-rites-as-witness-morphisms.md), [hunka-as-kin-cell-installation](morphisms/hunka-as-kin-cell-installation.md), [wiping-of-tears-as-polity-quiescence-restoration](morphisms/wiping-of-tears-as-polity-quiescence-restoration.md).
- [`theorems/`](theorems/) — claims about Lakota-philosophical invariants on the substrate (to be developed).
- [`questions/`](questions/) — open questions.
- [`narratives/`](narratives/) — synthesis essays.
  See [predicated-lakotaean-philosophy-introduction](narratives/predicated-lakotaean-philosophy-introduction.md).
- [`references/`](references/) — cross-referenced to [lakotaean-politics/references](../../../../../sociology/theories/politics/theories/lakotaean-politics/references/) and [lakotaean-philosophy](../../../indigenous/theories/lakotaean-philosophy/).

## Relation to the political leaves

[Predicated-lakotaean-politics](../../../../../sociology/theories/predicated-politics/theories/) and [predicated-lakotaean-governance](../../../../../sociology/theories/work/theories/predicated-work/theories/predicated-governance/theories/) — both planned for future-session bootstrap — will derive methods from this subtheory in addition to their tree-parent predicated theories.
The political subtheories take the *formal* relational ontology that lives here and apply it to the polity-form and the governance-form.
The substantive Lakota content is shared across all three predicated subtheories; the formal articulations differ by what each subtheory's predicate category foregrounds.
