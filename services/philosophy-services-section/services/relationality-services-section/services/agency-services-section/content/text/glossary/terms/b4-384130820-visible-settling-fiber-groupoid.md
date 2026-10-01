---
type: definition
realizes: [invisible-automorphism-subgroup, visible-automorphism-quotient]
class: groupoid
symbol: "\\mathrm{KP}^{\\mathrm{vis}}(B)"
depends-on: [settling-fiber-groupoid, invisible-automorphism-subgroup, visible-automorphism-quotient, settling-automorphism-decomposition]
name: Visible settling fiber groupoid
description: "The quotient of the settling fiber groupoid by the normal subgroupoid of invisible automorphisms:"
---

# Visible settling fiber groupoid

The quotient of the [settling fiber groupoid](../../documents/articles/notes/undated/settling-fiber-groupoid.md) by the normal subgroupoid of [invisible automorphisms](../../../../../../../logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md):

$$\mathrm{KP}^{\mathrm{vis}}(B) \;:=\; \mathrm{KP}^\simeq(B) \,/\, N.$$

Concretely:
- *Objects:* [predication settlings](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/_archive/predication-settling.md) over $B$ (same as the unquotiented groupoid).
- *1-cells:* biequivalences modulo invisible automorphisms.
- *Automorphism groups* at each object: the [visible automorphism quotient](../concepts/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}(v) := \mathrm{Aut}^\simeq(v) / N(v)$, with the [semidirect-product decomposition](../../documents/articles/notes/undated/settling-automorphism-decomposition.md) $\mathrm{Aut}^\simeq(v) \cong N(v) \rtimes \mathrm{Aut}^{\mathrm{vis}}(v)$.

## Visible components = MLD-classes

The components of the visible settling fiber groupoid coincide with [mutually-locally-derivable](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/concepts/mutually-locally-derivable.md) equivalence classes:

$$\pi_0(\mathrm{KP}^{\mathrm{vis}}(B)) \;=\; \mathrm{KP}(B) \,/\, \sim_{\mathrm{MLD}}.$$

The quotient by $N$ identifies morphisms differing by invisible autos but introduces no new 1-cells between distinct settlings; components are unchanged from the unquotiented groupoid. The quotient affects automorphism groups, not components.

## The coarse moduli

The set of components $|\mathrm{KP}^{\mathrm{vis}}(B)| := \pi_0(\mathrm{KP}^{\mathrm{vis}}(B))$ is the [coarse settling moduli](../../documents/articles/notes/undated/coarse-settling-moduli.md) over $B$ — the set of MLD-classes, the underlying point-set of the moduli.

## Why this is the primary moduli

The visible quotient has simpler automorphism groups than the unquotiented [settling fiber groupoid](../../documents/articles/notes/undated/settling-fiber-groupoid.md) — the invisible bulk is collapsed. The cohomological [classifying invariants](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/objects/aperiodic-classifying-invariant.md) are $N$-invariant by construction, hence well-defined on the visible quotient, and the [moduli classifying function](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/_archive/moduli-classifying-function.md) is naturally a function on $|\mathrm{KP}^{\mathrm{vis}}(B)|$. The fine moduli — retaining the full $\mathrm{Aut}^\simeq(v)$ — is recorded as a secondary structure; see [fine vs visible moduli](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-fiber-groupoid/content/visible-settling-fiber-groupoid/narratives/fine-vs-visible-moduli.md).
