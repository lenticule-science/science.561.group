---

title: "Building a Concept Lattice by Hand"
description: "A tutorial: take a small data table, compute the Galois connection, find the formal concepts, and draw the lattice. No prerequisites beyond arithmetic."
date-created: 2026-03-31
requires: []
teaches:
  - formal-context
  - concept-lattice
  - galois-connection
type: tutorial

---

This tutorial walks through building a [concept lattice](../../../../glossary/terms/concept-lattice.md) from a small data table. You need no mathematical background — just the ability to look at a table and find patterns.

## The data

Suppose you have five files with frontmatter:

| File | type | authors | status | extends |
|------|------|---------|--------|---------|
| A | paper | emsenn | draft | — |
| B | paper | emsenn | published | lattice |
| C | term | emsenn | published | — |
| D | paper | claude | draft | lattice |
| E | term | — | draft | — |

The files are the **objects**. The attribute-value pairs are the **attributes**. (For simplicity, treat each column as binary: does the file have a value for this attribute or not?)

Binary version:

| | type | authors | status | extends |
|---|---|---|---|---|
| A | ✓ | ✓ | ✓ | — |
| B | ✓ | ✓ | ✓ | ✓ |
| C | ✓ | ✓ | ✓ | — |
| D | ✓ | ✓ | ✓ | ✓ |
| E | ✓ | — | ✓ | — |

This is a [formal context](../../../../glossary/terms/formal-context.md): objects {A, B, C, D, E}, attributes {type, authors, status, extends}, and a binary incidence relation.

## The Galois connection

Two operations go back and forth between sets of objects and sets of attributes:

**From objects to attributes** ($A'$): given some files, what attributes do ALL of them have?

- {A, B}' = {type, authors, status} (both have all three; only B has extends)
- {B, D}' = {type, authors, status, extends} (both have all four)
- {A, B, C, D, E}' = {type, status} (the only attributes every file has)

**From attributes to objects** ($B'$): given some attributes, what files have ALL of them?

- {type, authors}' = {A, B, C, D} (all have both; E lacks authors)
- {extends}' = {B, D} (only these two have extends)
- {type, authors, status, extends}' = {B, D}

## The formal concepts

A formal concept is a pair (objects, attributes) where each determines the other: the objects are exactly those that have all the attributes, and the attributes are exactly those shared by all the objects.

Let's find them:

- ({B, D}, {type, authors, status, extends}): B and D share all four attributes. The files with all four are exactly B and D. ✓ This is a concept.
- ({A, B, C, D}, {type, authors, status}): A, B, C, D share these three. The files with all three (that also have authors) are A, B, C, D. ✓ Concept.
- ({A, B, C, D, E}, {type, status}): every file has type and status. The attributes shared by every file are type and status. ✓ Concept.
- ({B, D}, {type, authors, status, extends}): already found.
- (∅, {type, authors, status, extends}): no file has all attributes? Actually B and D do. So this is not a concept.

The full list of concepts (you find them by systematically checking all closure pairs):

1. ({A, B, C, D, E}, {type, status}) — the most general concept: "all files share type and status"
2. ({A, B, C, D}, {type, authors, status}) — "files with authors"
3. ({B, D}, {type, authors, status, extends}) — "files that extend something"
4. There may be others depending on the exact closure computation.

## The lattice

Order the concepts by inclusion of their object sets (or equivalently, reverse inclusion of attribute sets). More objects = more general = higher in the lattice. More attributes = more specific = lower.

```
    ({A,B,C,D,E}, {type, status})
              |
    ({A,B,C,D}, {type, authors, status})
              |
    ({B,D}, {type, authors, status, extends})
```

This is the concept lattice. It captures the implicit hierarchy: all files have type and status; most also have authors; a specific subset also extends something.

## What you learn

The lattice tells you the structure of your data without a [schema](../../../../../../../../content/text/glossary/terms/schema.md):

- **File E is an outlier**: it lacks authors, breaking the pattern of concept 2. The lattice shows this as E being in concept 1 but not concept 2.
- **extends is a specialization of the common pattern**: only files that already have all three basic attributes also have extends.
- **The implicit schema** is the hierarchy itself: type and status are universal; authors is nearly universal; extends is specialized.

Formal concept analysis extracts this structure from any data table. The table can have hundreds of rows and columns — the Galois connection and concept lattice scale. The structure was already in the data; FCA makes it visible.
