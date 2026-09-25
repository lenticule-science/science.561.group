---

title: "What Is a Formal Context?"
description: "An introduction to formal concept analysis for readers who have used spreadsheets but haven't encountered lattice theory."
date-created: 2026-03-30
requires: []
teaches:
  - formal-context
  - formal-concept-analysis
  - concept-lattice
type: explanation

---

You have a spreadsheet. Rows are things (files, people, products). Columns are attributes (author, status, type). Cells say whether a thing has an attribute, or what value it takes.

That spreadsheet is a **formal context**.

Formal concept analysis (Ganter & Wille 1999) is a way to extract structure from this kind of data. The idea is simple: look at which things share which attributes, and which attributes are shared by which things.

Given a set of things and a set of attributes shared by some of them, you can ask two questions:

1. **Given some things**: what attributes do ALL of them have? (Their shared attributes.)
2. **Given some attributes**: what things have ALL of them? (The things that fit.)

A **formal concept** is a pair where these two questions point at each other: a group of things and a group of attributes, where the things are exactly the ones that have all those attributes, and the attributes are exactly the ones shared by all those things.

For example, in a repository of Markdown files: the files tagged `type: paper` that also have `authors` and `status` form a concept — the concept of "a paper in this repository." The extent (the files) and the intent (the attributes `type: paper`, `authors`, `status`) define each other.

The set of all such concepts forms a hierarchy — a [lattice](./what-is-a-lattice.md). More general concepts (fewer attributes, more things) sit above more specific ones (more attributes, fewer things). This hierarchy is the **concept lattice**, and it captures the organizational structure of the data.

None of this requires imposing a schema. The concept lattice is extracted from whatever data you have. If your files use consistent frontmatter keys, the lattice is rich and navigable. If the frontmatter is sparse, the lattice is thin. Either way, the structure is already there — formal concept analysis makes it visible.

The concept lattice also reveals divergences: a file that has `type: paper` but lacks `authors` breaks the pattern of the "paper" concept. This isn't an error (there's no schema to violate) — it's a structural observation about where the data's implicit conventions break down.

When the values in the spreadsheet are richer than yes/no — when each cell carries a value like "affirmed," "denied," "contested," or "unknown" — the concept lattice inherits richer algebraic structure. The mathematics of what happens in this case is the subject of the fiber algebra of typed feature structures.

## Earlier material

The set of all such concepts forms a hierarchy — a [lattice](what-is-a-lattice.md). More general concepts (fewer attributes, more things) sit above more specific ones (more attributes, fewer things). This hierarchy is the **concept lattice**, and it captures the organizational structure of the data.
