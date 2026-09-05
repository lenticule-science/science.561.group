---

name: enrichment-unit
act: EnrichmentUnit
top: FixedInvariantLattice
bottom: FixedIdentity
summary: Assign enriched units from the lattice by composing the lattice structure with the fixed identity.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

To enrich a category over the invariant lattice, we assign each recognition an
enriched unit coming from the lattice’s identity.  We enforce this by letting
the lattice observe the identity:
`(FixedInvariantLattice FixedIdentity)` earns
***EnrichmentUnit***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
