---
type: definition
class: predication-cell-system
status: draft
symbol: "(E_{\\mathrm{lak}},\\, \\Pi_{\\mathrm{lak}},\\, \\mathcal{C}_{\\mathrm{lak}},\\, w_{\\mathrm{lak}})"
depends-on:
  - predication-cell-set
  - entity-set
  - predicate-set
  - predicate-category
  - four-bilattice
  - kin-relation-as-primitive
  - extended-entity-set
  - wakhan-as-cell-quality
realizes: [polity]
---

# Polity-cell-system (Lakota)

The substrate-algebraic specification of the Lakota polity's predication-cell-system: a quadruple $(E_\mathrm{lak}, \Pi_\mathrm{lak}, \mathcal{C}_\mathrm{lak}, w_\mathrm{lak})$ giving the entity set, predicate set, predicate category, and wakȟáŋ-marking function on which every subsequent Lakota-governance object, morphism, and theorem is defined.
The bilattice value domain is fixed as the [four-element bilattice](../../../../../../../../math/theories/categories/theories/predication-categories/objects/four-bilattice.md) $\mathbf{FOUR}$, realized in Lakota cosmogonic form as the [Tóbtób Kiŋ](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/tobtob-kin.md) — see §"Bilattice value domain" below.

## Data

A **Lakota polity-cell-system** is the quadruple

$$\big(E_\mathrm{lak},\; \Pi_\mathrm{lak},\; \mathcal{C}_\mathrm{lak},\; w_\mathrm{lak}\big)$$

with the following components.

### The entity set $E_\mathrm{lak}$

$E_\mathrm{lak}$ is the *extended* entity set in the sense of [extended-entity-set](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/extended-entity-set.md): humans are not privileged, and the entity set admits all beings the Lakota cosmos recognizes as standing in kin-relation.
The set decomposes into entity-classes:

| Class | Symbol | Examples |
|---|---|---|
| Humans | $E^\mathrm{hum}$ | Persons, ancestors-with-naǧí-still-kept, the named-deceased |
| Four-leggeds | $E^\mathrm{4leg}$ | Buffalo (*tatȟáŋka*), horses (*šuŋ́kawakȟáŋ*), deer, wolves |
| Wingeds | $E^\mathrm{wng}$ | Eagles (*waŋblí*), hawks, owls |
| Standing-ones | $E^\mathrm{stnd}$ | Trees — cottonwood (*čháŋ wakȟáŋ*), oak, cedar |
| Rooted-ones | $E^\mathrm{root}$ | Plants — sage, sweetgrass, prairie turnip |
| Swimming-ones | $E^\mathrm{swim}$ | Fish |
| Crawlers | $E^\mathrm{crwl}$ | Insects, snakes, small ground-dwellers |
| Stones | $E^\mathrm{ston}$ | Sweat-lodge stones, pipe stones; instances of [Íŋyaŋ-reduced](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/iyan.md) |
| Places | $E^\mathrm{plc}$ | Pȟahá Sápa (the Black Hills), Mní Wičhóni, council-grounds, lodge-sites |
| Wakȟáŋ-beings | $E^\mathrm{wkb}$ | The four superior Wakȟáŋ (Wí, Škáŋ, Makȟá, Íŋyaŋ); the lesser twelve; the Wakíŋyaŋ |
| Ceremonial objects | $E^\mathrm{cer}$ | The pipe (*čhaŋnúŋpa*), medicine bundles, the sacred drum |
| Polity-units | $E^\mathrm{pol}$ | Tiyospaye, oyate, the Oceti Sakowin as composite-entity |
| Offices | $E^\mathrm{off}$ | Naca-instances, akicita-positions, wičháša-wakȟáŋ-roles |

$E_\mathrm{lak} = \bigsqcup_{c} E^c$ over all the entity-classes.
The disjoint-union structure is meaningful: the classes do not blur, and a given entity belongs to *exactly one* class.
(A buffalo is a four-legged; the buffalo-nation as composite-entity is a polity-unit; the buffalo as wakȟáŋ-bearing-aspect is a wakȟáŋ-being.
These are three distinct entities with related-but-distinct substrate identities.)

### The predicate set $\Pi_\mathrm{lak}$

$\Pi_\mathrm{lak}$ is organized as the disjoint union of predicate-classes by function:

| Class | Function | Examples |
|---|---|---|
| Kin-relations | $\Pi^\mathrm{kin}$ | *kin-of*, *parent-of*, *child-of*, *brother-of*, *sister-of*, *uncle-of*, *aunt-of*, *grandparent-of*, *grandchild-of*, *cousin-of*; with degree specializations |
| Place-relations | $\Pi^\mathrm{plc}$ | *stands-in-relation-with*, *comes-from*, *buried-at*, *kin-to-place* |
| Conduct-relations | $\Pi^\mathrm{con}$ | *acts-wówačhantognaka-toward*, *acts-wóksape-toward*, *acts-wóohitika-toward*, *acts-wówačhiŋtȟaŋka-toward* |
| Witness-relations | $\Pi^\mathrm{wit}$ | *witnessed-by*, *bears-witness-for*, *kept-by*, *ceremony-conducted-by* |
| Wakȟáŋ-relations | $\Pi^\mathrm{wkn}$ | *wakȟáŋ-with-respect-to*, *ceremony-bound-to*, *dream-bound-to-Wakíŋyaŋ* |
| Standing-relations | $\Pi^\mathrm{std}$ | *speaks-for*, *stands-with*, *is-bound-to* |
| Office-relations | $\Pi^\mathrm{off}$ | *holds-naca-of*, *akicita-for*, *wičháša-wakȟáŋ-of*, *keeper-of* |
| Withdrawal-relations | $\Pi^\mathrm{wdr}$ | *iyúhá-šni-from* |
| Covenant-relations | $\Pi^\mathrm{cov}$ | *bound-by-treaty-with*, *signatory-of*, *adopted-into* (via huŋkápi) |

The kin-relations are *primitive* per [kin-relation-as-primitive](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/kin-relation-as-primitive.md): they are not derived from monadic properties of entities.
A monadic-looking statement ("this person is sacred") decomposes into a relational cell with a wakȟáŋ-being as the second argument ("this person is sacred-with-respect-to [the Wakȟáŋ Tȟáŋka totality]").
The predicate set's relational primacy is structurally constitutive.

### The predicate category $\mathcal{C}_\mathrm{lak}$

The objects of $\mathcal{C}_\mathrm{lak}$ are the predicates $\Pi_\mathrm{lak}$.
The morphisms are generated by the four canonical classes (per the [predicate category](../../../../../../../../math/theories/categories/theories/predication-categories/objects/predicate-category.md) structure of the predication framework):

1. **Specialization.** *kin-of* generalizes *parent-of*; *parent-of* generalizes *mother-of*; *kin-to-place* generalizes *buried-at*.
  The specialization arrows make the kin-predicate set a poset under generalization.
2. **Converse.** Most kin-relations are *converse-symmetric*: *kin-of* is its own converse (kinship is mutual).
  But office-relations and standing-relations have non-trivial converses: *speaks-for* has converse *is-spoken-for-by*; *holds-naca-of* has converse *is-headed-by-naca*.
3. **Subject-projection** and **object-projection**: collapse the entity-pair index along the subject or object axis. *kin-of*(s, o), subject-projected, gives *has-kin*(s) — a monadic "stands in some kin-relation."
  Object-projection gives *is-someone's-kin*(o).

By [predicate-generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), under $\mathrm{Sym}(E_\mathrm{lak})$-equivariance with $|E_\mathrm{lak}| \geq 3$, these four classes exhaust the natural bilattice homomorphisms between fiber algebras.
The Lakota polity's predicate-category is *fully generated* by these four classes; no additional reindexing structure is admitted.

### The wakȟáŋ-marking function $w_\mathrm{lak}$

$w_\mathrm{lak}$ is a Boolean-valued function on the predication cell set $\Phi_\mathrm{lak} = E_\mathrm{lak} \times \Pi_\mathrm{lak} \times E_\mathrm{lak}$ and on the closure-rule system, per [wakhan-as-cell-quality](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/wakhan-as-cell-quality.md):

$$w_\mathrm{lak} : \Phi_\mathrm{lak} \sqcup \mathcal{R}_\mathrm{lak} \to \{0, 1\}$$

where $\mathcal{R}_\mathrm{lak}$ is the set of closure rules under consideration.
A cell or rule with $w_\mathrm{lak}(\cdot) = 1$ is *sacred-bearing*; one with $w_\mathrm{lak}(\cdot) = 0$ is ordinary.
The marking is preserved by appropriate substrate operations (ceremonial witness-morphisms preserve wakȟáŋ-marking; non-ceremonial morphisms do not).

The wakȟáŋ-marking has two structural roles:

- **Sacred-substrate distinction.** Cells over ceremony-cells, over kin-relations installed by huŋkápi, over treaty-cells, are wakȟáŋ-marked.
  Cells over ordinary kin-relations by descent are typically not wakȟáŋ-marked (the kin-link is real but does not bear ceremonial-substrate weight per se).
  This is a substrate-algebraic distinction, not a metaphysical hierarchy: both kinds of cell are equally real; they differ in their downstream firing-conditions.
- **Authority-gate condition.** Many of the Lakota polity's [authority-gates](../../teaching/explanations/authority-gate.md) condition on wakȟáŋ-marking of the proposed action.
  The naca's installation requires wakȟáŋ-marked witness cells; treaty's binding requires wakȟáŋ-marked declaration cells; akicita's bounded authority is *not* wakȟáŋ-marked but is conducted under wakȟáŋ-bearing supervision.

## Bilattice value domain

The polity's value domain is $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$, identified with the four superior Wakȟáŋ:

| $\mathbf{FOUR}$ | Lakota | Role |
|---|---|---|
| $\mathbf{t}$ | Wí | Truth-designated; the polity's *yes* |
| $\mathbf{f}$ | Makȟá | Truth-antidesignated; the polity's *no* |
| $\bot$ | Škáŋ | Under-determined; the polity's *not-yet-pronounced* |
| $\top$ | Íŋyaŋ | Over-determined; the polity's *contested-and-load-bearing* |

The truth-order $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$ and knowledge-order $\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$ hold on the Lakota labels exactly as on the abstract labels.
Negation $\sim$ swaps Wí ↔ Makȟá and fixes Škáŋ, Íŋyaŋ.
See [tobtob-kin](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/tobtob-kin.md).

## The predication-cell-set $\Phi_\mathrm{lak}$

$$\Phi_\mathrm{lak} := E_\mathrm{lak} \times \Pi_\mathrm{lak} \times E_\mathrm{lak}.$$

Each element $\phi = (s, p, o)$ is a Lakota predication-cell.
Note that the entity set's wide scope makes $|\Phi_\mathrm{lak}|$ enormous: cells exist between buffalo and stones, between ancestors and places, between offices and ceremonial objects.
Most of these cells are unsettled (at $\bot = \mathrm{Škáŋ}$) most of the time — the substrate-algebra recognizes their *possibility*, not their *actuality*.
A valuation $v$ assigns concrete values only to cells the polity has actually settled.

## Subject–object orientation under the Lakota reading

The predication-cell's orientation — $\phi = (s, p, o)$ is asymmetric, distinguishing $(s, p, o)$ from $(o, p, s)$ as distinct cells — is preserved here. *kin-of(A, B)* and *kin-of(B, A)* are distinct cells with potentially independent values; their relationship is the converse generator.
In Lakota practice, the asymmetry is meaningful: *A is the parent-of B* and *B is the parent-of A* are distinct cells (typically with values $\mathbf{t}$ and $\mathbf{f}$ respectively).
The converse generator relates them but does not collapse them.

## Position in the leaf

This object is the foundational substrate-specification for the leaf.
Subsequent objects, morphisms, and theorems refer to $(E_\mathrm{lak}, \Pi_\mathrm{lak}, \mathcal{C}_\mathrm{lak}, w_\mathrm{lak})$ as fixed.
The closure-rule subsystem $\mathcal{S}_\mathrm{wolak}$ that fires on this substrate is a separate object — see [wolakhota-closure-system](wolakhota-closure-system.md).

For the comparison with the Western abstract polity in [predicated-governance/objects/polity](../../../objects/polity.md), see [lakota-vs-western-polity-cell-system](teaching/explanations/lakota-vs-western-polity-cell-system.md).

## Sources

The substrate-algebraic shape is from the [predication-categories framework](../../../../../../../../math/theories/categories/theories/predication-categories/) (the predication-cell-set, predicate-category, four-bilattice constructions).
The substantive Lakota content is drawn from:

- [extended-entity-set](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/extended-entity-set.md) — the wider entity classification.
- [kin-relation-as-primitive](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/kin-relation-as-primitive.md) — the relational primacy of the predicate set.
- [wakhan-as-cell-quality](../../../../../../../philosophy/theories/predicated-philosophy/theories/predicated-lakotaean-philosophy/objects/wakhan-as-cell-quality.md) — the wakȟáŋ-marking function.
- [tobtob-kin](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/tobtob-kin.md) — the four-superior-Wakȟáŋ ↔ four-valued bilattice mapping.
- [Walker 1980](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/references/walker1980.md), [Walker 1983](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/references/walker1983.md), [Sword's recorded Tóbtób Kiŋ doctrine](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/references/sword-tobtob-kin.md), the [Finger interview](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/references/finger-conception-of-energy.md) — primary recorded sources for the entity-classification and the cosmogonic four.
- Ella Deloria's [*Speaking of Indians*](../../../../../politics/theories/lakotaean-politics/references/deloria-ella1944.md) — the breadth of kin-relation in Dakota/Lakota tradition.
- Albert White Hat Sr.'s [*Reading and Writing the Lakota Language*](../../../../../politics/theories/lakotaean-politics/references/white-hat1999.md) — the predicate-relational structure of contemporary Lakota.
