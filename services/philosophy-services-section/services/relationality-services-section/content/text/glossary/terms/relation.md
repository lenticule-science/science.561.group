---
name: "Relation"
description: "The unsaturated predicate between a subject and an object: Frege's concept with two empty places, directed by the order of those places, which a subject and an object fill to make a claim. In the relationality framework its values are evidence readings, not true and false. What it is true of, its extension, is a saturated object and not the relation itself."
aliases: [relations]
contrasts-with: [link, adjacency, "substance-based relation"]
date-created: 2026-04-29
references:
  frege1891:
    authors: ["Gottlob Frege"]
    title: "Function and Concept"
    year: 1891
  frege1892:
    authors: ["Gottlob Frege"]
    title: "On Concept and Object"
    publication: "Vierteljahrsschrift für wissenschaftliche Philosophie"
    year: 1892
  lambek1958:
    authors: ["Joachim Lambek"]
    title: "The Mathematics of Sentence Structure"
    publication: "American Mathematical Monthly"
    year: 1958
  aristotle-categories:
    authors: ["Aristotle"]
    title: "Categories"
    note: "Chapter 7 on relatives (pros ti)"
  bradley1893:
    authors: ["F. H. Bradley"]
    title: "Appearance and Reality"
    publication: "George Allen & Unwin"
    year: 1893
  russell1903:
    authors: ["Bertrand Russell"]
    title: "The Principles of Mathematics"
    publication: "Cambridge University Press"
    year: 1903
  james1912:
    authors: ["William James"]
    title: "Essays in Radical Empiricism"
    publication: "Longmans, Green, and Co."
    year: 1912
  whitehead1929:
    authors: ["Alfred North Whitehead"]
    title: "Process and Reality"
    publication: "Macmillan"
    year: 1929
  peirce1931:
    authors: ["Charles Sanders Peirce"]
    title: "Collected Papers"
    publication: "Harvard University Press"
    year: 1931
  nagarjuna:
    authors: ["Nāgārjuna"]
    title: "Mūlamadhyamakakārikā"
    note: "c. 150 CE, trans. Garfield 1995"
---

A **relation** is the unsaturated predicate that stands between a subject and an object. In Frege's terms it is a concept with two empty places, "— is parent of —", "— is taller than —": incomplete on its own, and completed into a claim when a subject fills the first place and an object the second (Frege 1891, 1892).

## Direction without prior relata

A relation's direction is the order of its empty places, not an arrow drawn between things that were already there. It has a first place and a second before anything fills either, so it is directed without presupposing its relata; the relata are whatever comes to fill it. The converse is the same predicate with its places exchanged. Symmetry, a converse that agrees with the original, is a property to establish, not a default supplied by the word.

The same fact answers Bradley's regress (1893). Bradley asked what binds a relation to its terms, and whether that binder needs a binder of its own. An unsaturated predicate needs none: its incompleteness is the binding. The terms do not attach to the relation; they fill it.

## Values are evidence, not truth

Frege's concept returns a truth value when filled. In the relationality framework a filled relation returns an evidence reading: evidence for and evidence against, independently, so a claim can be supported, denied, both, or neither. This is the framework's departure from the Boolean reading of the Fregean predicate, not from its unsaturatedness.

The math glossary keeps the two apart by name. The [predicate](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate.md) $p$ is the named element in the middle coordinate of a [predication cell](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) $(s, p, o)$; the valuation $v(p)$ is the function that takes a subject and an object to a reading. On this entry's reading the relation is the valuation with its places open, and $p$ is its name. Saturating it is the act of predicating ([unsaturated function](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/unsaturated-function.md)).

## Extension is not the relation

What a relation is true of, the pairs that fill it truly, is its extension: a subset $R \subseteq A \times B$ in Set, a subobject of $A \times B$ in a category, a morphism $A \times B \to \Omega$ into a subobject classifier. The extension is saturated. It is an object, with a domain, a codomain, and members.

Frege met this boundary as "the concept *horse* is not a concept" (1892): any name for a predicate names an object, so speech about a relation always lands on something saturated. The predicate $p$ in a cell is such a name. The relation itself shows up in use, as a predicate with its places open.

## Formal faces

- **Lambek calculus.** A two-place predicate has type $(np \backslash s)/np$: it takes an object on its right, then a subject on its left, and yields a sentence. The slashes are the relation's direction (Lambek 1958).
- **Typed λ-calculus.** A predicate of type $S \to O \to V$, $V$ the value logic. Unsaturatedness is the arrow type; saturation is application.
- **Predication cell.** The cell $(s, p, o)$ records one filling of $p$, valued in the evidence bilattice.

## Storing and transporting relations

A system that stores or transports relations keeps the subject role, the predicate's identity, and the object role together as one unit. Flattening the unit to an untyped or undirected link loses what is needed to represent asymmetric dependencies, processes, hierarchies, and irreversible changes. A relation is not adjacency: a graph edge presupposes the nodes it joins, and discards both the order of the places and what the predicate means.

## Grounding

The 561 Group's relationality is rooted in Lakota epistemology. In *mitákuye oyás'iŋ*, "all my relatives", relating is prior to things: what exists are acts of relating sustained in kinship with land, ancestors, other-than-human beings, and ceremony. The Western tradition below is contrast material, useful for triangulating how European metaphysics arrived at neighbouring but distinct positions; it is not the foundation. (Recorded 2026-04-05.)

## The tradition

- **Aristotle** called relations relatives, *pros ti*: "that which is said to be what it is of or than something else" (*Categories* 7). A parent cannot be conceived except in relation to a child.
- **Bradley** (1893) argued that if relations are real, what binds a relation to its terms needs a further relation, without end, so relations are appearance.
- **Russell** (1903) held relations irreducible and real: "Relations are not adjectives, and therefore cannot be subsumed under the category of qualities." He distinguished internal relations, grounded in the nature of their terms, from external ones, contingent on circumstance.
- **Peirce** distinguished dyadic from triadic relations; "A is between B and C" cannot be decomposed into pairs. His *rheme*, a predicate with blanks, is the same unsaturated form as Frege's concept, counted by its number of blanks.
- **James** (1912) held relations directly experienced, not inferred: the "and" between two things is as real as the things.
- **Whitehead** (1929) held every actual entity constituted by its prehensions, its grasps of other entities; relations are internal all the way down.
- **Nāgārjuna** (c. 150 CE) held that nothing has own-being (*svabhāva*); everything is by dependent origination (*pratītyasamutpāda*): "When this is, that is; when this is not, that is not."

## Related

- [Relating](relating.md)
- [Relationlessness](relationlessness.md)
- [Relationality](../../../../README.md)
