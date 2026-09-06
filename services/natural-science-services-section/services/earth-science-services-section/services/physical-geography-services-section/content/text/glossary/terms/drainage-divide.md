---
aliases:
  - divide
  - watershed boundary
description: "A drainage divide is the line of highest ground between two adjacent watersheds, from which surface water runs down one side into one outlet and down the other side into another. It is a border, not a channel: two watersheds that share a divide share no water until their confluence downstream."
identity: drainage-divide
name: drainage divide
provenance:
  date-created: 2026-09-05
---
A drainage divide is the line of highest ground between two adjacent watersheds, from which surface water runs down one side into one outlet and down the other side into another.
A continental divide separates basins that reach different oceans; the Laurentian Divide in northern Minnesota heads basins that reach Hudson Bay, the Atlantic, and the Gulf of Mexico.

A divide is a border, not a channel: it carries no water of its own, and two watersheds that share a divide share no water until their confluence downstream, whereas a property line or a survey grid can cross a divide without noticing it.

A record of a divide is therefore a pair of watershed ids and never a field on either, and any operation that computes which watersheds share a divide reads their common drains-to rather than their geometry.
That reading is stated in [the Earth as a topology of watersheds under the sun](../../../../../../content/text/documents/articles/notes/2026/09/05/2026-09-05-note-on-the-earth-as-a-topology-of-watersheds-under-the-sun.md), where two watersheds that share a divide are spacelike separated in the drainage order.
