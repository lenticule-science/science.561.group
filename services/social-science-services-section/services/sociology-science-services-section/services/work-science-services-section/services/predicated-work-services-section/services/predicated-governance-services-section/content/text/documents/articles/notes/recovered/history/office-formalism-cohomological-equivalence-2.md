---
type: question
status: open
explores: [office-formalism-equivalence]
---

# Do the bilattice-substrate and Heyting-algebra-presheaf formalisms of office have equivalent cohomology?

The [office-formalism-equivalence theorem](../theorems/office-formalism-equivalence.md) sketches a translation between the bilattice-substrate realization of office (two predicates with closure rules) and the work-vocabulary's [formal-structure-of-office](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-office.md) (Heyting algebra fiber with two nuclear closures), preserving doubly-stable incumbency, persistence, shadow classes, and restriction maps as settling-morphisms.

The translation does *not* establish equivalence at the cohomology level. The Heyting-presheaf model and the bilattice-substrate model produce different cohomological structures by default: the office text's presheaf is in $\mathbf{HA}$; the predicated-work setting is in the bitopological settling site with d-frame-valued sheaves.

The question: is $H^n$ computed in the office text's setting equal to $H^n$ computed in the bilattice-substrate setting?

Resolving this requires applying the math program's [Priestley dualizability](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/priestley-dualizability.md) machinery to the specific case — the Heyting algebra fibers $H_t$ on the office side embedding via Priestley duality into paired Priestley spaces on the bilattice-substrate side, and verifying the cohomologies match.

If they match, the office text's nuclear-doctrine theorems (e.g., the four shadow classes' delegation propositions) carry over to the predicated-work program directly. If they don't match, the two formalisms agree at the structural-data level but differ in their cohomological invariants — meaning some structurally-equivalent offices are cohomologically distinguishable on one side but not the other, which would itself be a substantive finding.
