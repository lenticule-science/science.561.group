---
title: "FCA against the predicated substrate"
date-created: 2026-05-02
description: "How formal concept analysis sits against the companion subtheory's predication-cell substrate. What FCA commits to that the predicated substrate generalises, what FCA preserves that the predicated framing inherits, and the precise sense in which 'FCA is a degenerate predicated knowledge system'."
references:
  - id: belohlavek2004
    type: document
    title: Belohlavek, Concept Lattices and Order in Fuzzy Logic (2004)
  - id: ganter-wille1999
    type: document
    title: "Ganter & Wille, Formal Concept Analysis: Mathematical Foundations (1999)"
see-also:
  - galois-connections-from-birkhoff-to-wille
---

## 1. The two substrates compared

FCA's substrate is the **formal context** $(G, M, I)$ — a binary (or residuated) incidence relation between an object set and an attribute set, equipped with the Galois connection induced by $I$ (per [formal-context](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/formal-context.md) and [derivation-operator](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/derivation-operator.md)).

The predicated framing's substrate (per the companion subtheory's [predicated-knowledge-system](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/objects/predicated-knowledge-system.md)) is the **predication-cell** — a subject-predicate-object triple evaluated in a bilattice value-domain $\mathbf{2} \otimes \mathbf{2}$, organised into fibers over a predicate category, with closure-rule-system-driven settling and scope structure.

Five structural restrictions reduce the predicated substrate to FCA's substrate:

1. **Value-domain restriction.** $\mathbf{2} \otimes \mathbf{2} \to \mathbf{2}$ (collapse positive and negative evidence into a single Boolean channel). FCA's classical case is binary; Belohlavek's residuated case relaxes this to a residuated lattice $\mathbf{L}$, but FCA does not natively use the bilattice structure of separate positive and negative evidence channels.
2. **Predicate-vocabulary restriction.** From an arbitrary predicate category $\mathcal{C}$ to a trivial single-binary-predicate category $\{\mathrm{has\text{-}attribute}\}$. FCA records all incidence as instances of one binary "has attribute" predicate; predicate-category structure (specialisation, inversion, composition) is not native to the substrate.
3. **Closure-rule-system restriction.** From an admissible-closure-rule-system to the fixed two-rule Galois system (the derivation operators applied iteratively). FCA's closure is exactly the Galois closure; domain-specific closure rules are off-substrate.
4. **Scope restriction.** From a multi-scope structure to a single trivial scope. FCA contexts are global; community-relative scope is off-substrate (per the open question [scope-for-fca-systems](../../../../learning-articles/questions/scope-for-fca-systems.md)).
5. **Witness restriction.** From explicit witness reification (every closure-rule application produces a substrate-entity-witness) to no witness structure. FCA's derivations are not reified; the concept lattice records the *fixed-points* of the closure but not the *paths* by which elements were closed.

After all five restrictions, the predicated substrate becomes exactly the FCA substrate. This is the precise content of the companion subtheory's [concept-lattice-as-degenerate-fiber](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/objects/concept-lattice-as-degenerate-fiber.md) object.

## 2. What FCA commits to that the predicated substrate generalises

Each restriction is a *commitment* the FCA lineage makes that the predicated framing relaxes:

- **Bilattice value-domain.** Multi-source disagreement about an incidence (one expert says $g \, I \, m$, another denies it) collapses to one of the two values in FCA. The bilattice value-domain in the predicated framing distinguishes asserted ($t$), denied ($f$), unknown ($\bot$), and contested ($\top$) cells. FCA's contestation collapses; the predicated substrate carries it explicitly.
- **Structured predicate vocabulary.** Attribute hierarchies, attribute compositions, attribute-as-entity reasoning all live outside FCA (typically in pre-processing or a separate ontology layer). The predicated framing's [predicate-category-stratification](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/concepts/predicate-category-stratification.md) and [specialize](../../../../../../glossary/terms/specialize.md) operations carry structured predicate vocabulary natively.
- **Domain-specific closure rules.** A rule "if $g$ has attributes $\{a, b\}$ then $g$ has attribute $c$" cannot be added to FCA's closure system without leaving the FCA framework (or moving to attribute exploration, which adds rules through human-in-the-loop confirmation). The predicated framing admits arbitrary [closure rules](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) classified by the [four-regime dichotomy](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md).
- **Community-relative scope.** Cross-community FCA requires the analyst to reconcile conflicting incidences off-substrate. The predicated framing handles cross-community scope as substrate operation (per [federate](../../../../../../glossary/terms/federate.md)).
- **Witness reification.** FCA does not record the derivation of derived attributes (e.g., the "amphibious" frog concept emerges as a meet without explicit derivation). The predicated framing reifies every closure-rule application as a substrate-entity (per [witness](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/witness.md)), supporting provenance, retraction, and explanation.

Each generalisation is *optional* in the predicated framing: a working predicated knowledge system can adopt any subset of the relaxations. The FCA-degenerate sub-substrate is the case where none of the five relaxations are adopted.

## 3. What FCA preserves that the predicated framing inherits

The opposite direction also matters: the predicated framing inherits FCA's structural commitments at the FCA-degenerate fragment.

- **The Galois closure.** The substrate's settlement under the FCA-degenerate closure-rule system is exactly the Galois closure on $\mathcal{P}(G) \times \mathcal{P}(M)$. The predicated framing inherits the FCA-internal *basic theorem* (per [basic-theorem-of-fca](../../../../../../glossary/concepts/basic-theorem-of-fca.md)): the substrate's fixed-point set at this restriction is a complete lattice, and every complete lattice arises this way.
- **The concept lattice as structural invariant.** The predicated framing's [knowledge-fiber-algebra](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/objects/knowledge-fiber-algebra.md) at the FCA-degenerate sub-substrate is exactly the concept lattice. The substrate's general fiber-algebra is what generalises to non-FCA cases.
- **Conceptual scaling as predicate refinement.** FCA's [scale](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/scale.md) is what the substrate's [predicate-category-stratification](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/concepts/predicate-category-stratification.md) does at the attribute level. The substrate inherits scaling as a special case of its predicate-category structure.
- **The implication base.** FCA's [implication-base](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/implication-base.md), particularly the Duquenne–Guigues canonical minimum base (per [duquenne-guigues-completeness](../../../../../../glossary/concepts/duquenne-guigues-completeness.md)), is the substrate's *minimum closure-rule presentation* at the FCA-degenerate fragment. The substrate's general theory does not yet provide such canonical minima at richer fragments (per [duquenne-guigues-beyond-binary](../../../../learning-articles/questions/duquenne-guigues-beyond-binary.md)).

The inheritance is conservative: the predicated framing does not modify the FCA-internal results. FCA's contributions stand independently of whether the predicated framing is adopted.

## 4. When to use which substrate

The two substrates serve different working contexts:

- **Use FCA when:** the data is a single (perhaps many-valued) incidence relation between two well-defined sets, with no community-relative variation, no need for explicit derivation provenance, and structural extraction (concept lattice, implication base) is the primary product. Empirical concept exploration, taxonomy construction, dependency-base extraction from relational data.
- **Use the predicated framing when:** any of the FCA restrictions are inadequate — multi-source disagreement matters, predicate vocabulary is structured and central, domain-specific closure rules must run, community-relative scope is required, derivations need provenance and explanation, or the system must federate with other knowledge systems built on the same substrate.

The two are not mutually exclusive. A predicated knowledge system can include FCA-shaped sub-systems for specific data domains (per the substrate's restriction discipline), inheriting FCA's algorithmic toolkit (NextClosure, AddIntent, attribute exploration) for structural extraction in those sub-systems while retaining the substrate's general machinery for the rest.

## 5. The relationship is structural, not historical

It is worth being explicit: the predicated framing did not *come from* FCA, and FCA did not *anticipate* the predicated framing. The two are independent constructions whose structural relationship the predicated subtheory's [knowledge-representation-survey](../../../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/predicated-knowledge-systems/texts/knowledge-representation-survey.md) §9 names retrospectively. The relationship is mathematically forced by the predication-cell substrate's parametric flexibility: any restriction that yields a single-binary-predicate, $\mathbf{L}$-valued, Galois-closure-only, single-scope, no-witness substrate *will be* FCA, regardless of whether FCA was the historical motivation.

This means the FCA lineage retains its independent standing. The companion subtheory cross-links into FCA at the points of structural correspondence (per the bridge theorem [belohlavek-bridge](../../../../../../glossary/concepts/belohlavek-bridge.md)) but does not subsume FCA — the FCA-internal questions (Duquenne–Guigues canonicity in the residuated case, the right scope discipline for multi-context data) remain FCA-internal and are pursued in this subtheory, not in the predicated companion.
