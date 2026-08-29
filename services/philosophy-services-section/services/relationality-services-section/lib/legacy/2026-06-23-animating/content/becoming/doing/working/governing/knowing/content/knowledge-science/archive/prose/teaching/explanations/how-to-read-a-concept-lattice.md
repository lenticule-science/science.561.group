---

title: "How to Read a Concept Lattice"
description: "A how-to guide: given a concept lattice diagram, how to interpret each node, each edge, and the overall shape. What questions does it answer about your data?"
date-created: 2026-03-31
requires:
  - formal-context
  - concept-lattice
teaches:
  - formal-concept-analysis
---

You have a [concept lattice](../../math/theories/order/terms/concept-lattice.md) — maybe drawn by software, maybe [built by hand](../../math/theories/order/texts/building-a-concept-lattice-by-hand.md). It is a diagram of nodes connected by lines. Here is how to read it.

## Each node is a concept

Every node in the lattice is a formal concept: a pair (extent, intent).

- The **extent** is the set of objects (files, entities, rows) that fall under the concept.
- The **intent** is the set of attributes (keys, column names, properties) that define it.

Extent and intent determine each other: the extent is exactly the objects that have all the attributes in the intent, and the intent is exactly the attributes shared by all the objects in the extent.

## Higher means more general

The lattice is drawn with more general concepts above more specific ones. Moving up: more objects, fewer defining attributes. Moving down: fewer objects, more defining attributes.

The top node is the most general concept. Its extent is all objects; its intent is only the attributes shared by everything. If every file in your repository has `type` and `date-created`, the top concept's intent is {type, date-created}.

The bottom node is the most specific concept. Its extent might be empty (no single object has every attribute), or it might be a single very richly attributed object.

## Lines mean specialization

A line from concept A down to concept B means B is a specialization of A: B has all the attributes of A plus at least one more, and B's objects are a subset of A's. Every object in B is also in A, but not vice versa.

There are no redundant lines. If A is above B and B is above C, there is no direct line from A to C — the relationship is implied by transitivity.

## What the lattice tells you

**Clusters.** Objects that always appear together in the same concepts share a pattern. They have the same attribute profile. If three files always co-occur across concepts, they are structurally interchangeable in your data.

**Attribute dependencies.** If attribute $m$ appears in every concept that attribute $n$ appears in, then $n$ implies $m$ in your data: every object with $n$ also has $m$. The lattice shows this as $n$'s concept being below $m$'s concept.

**Outliers.** An object that appears only in the top concept (and maybe one other) has very few attributes in common with the rest. It is structurally isolated. Whether this is a problem depends on your purpose.

**Gaps.** If you expected an attribute to be universal but the lattice shows it is not in the top concept's intent, some objects are missing that attribute. The lattice shows you which ones — they are the objects NOT in the extent of the concept whose intent includes that attribute.

**Implicit hierarchy.** The lattice itself IS the hierarchy of your data's conceptual organization. You did not have to design this hierarchy or impose it. It was extracted from the data by the [Galois connection](../../math/theories/order/terms/galois-connection.md). If the hierarchy makes sense, your data is well-organized. If it looks wrong — if concepts that should be separate are merged, or concepts that should be related are far apart — your data's frontmatter or attributes may need revision.

## A practical example

A repository of 20 Markdown files. The concept lattice has four levels:

```
Level 1: all 20 files share {type, date-created}
Level 2: 15 files share {type, date-created, authors}
Level 3: 8 files share {type, date-created, authors, status}
Level 4: 3 files share {type, date-created, authors, status, extends, requires}
```

Reading this: every file has a type and creation date. Most also have an author. About half also have a status. A small group has rich relational frontmatter (extends, requires). The hierarchy tells you: your richest-attributed files are the core of your knowledge structure; the rest are less connected.

The 5 files without authors might be auto-generated or imported without attribution. The 7 files with authors but no status might be drafts that were never given a status field. The lattice does not tell you which — it tells you WHERE to look.
