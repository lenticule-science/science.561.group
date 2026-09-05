---
id: relational-unit
description: "Superseded. RelationalUnit has been renamed RelationalEntity. See relational-entity.md."
superseded-by: relational-entity
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Unit

**Superseded.** This concept has been renamed to [RelationalEntity](relational-entity.md).

Three-domain research found that "Entity" is more precisely correct than "Unit":
it is the canonical name in BWW/FRISCO ontology and knowledge-graph formalisms for a named, addressable individual that can carry properties.
"Unit" is a false cognate: in type theory it names the terminal type (the one-element type); in algebra it names the multiplicative identity.
Both meanings cause confusion for formally trained readers.

All uses of RelationalUnit in the system now read RelationalEntity.
All spec files that previously linked to `relational-unit.md` link to `relational-entity.md`.

See [entity](entity.md) for the abstract base concept.
See [relational-entity](relational-entity.md) for the full specification.

## Open questions

