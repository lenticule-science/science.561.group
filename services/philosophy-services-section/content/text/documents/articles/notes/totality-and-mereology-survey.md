---
title: "Totality and Mereology: The Problem of the Whole and All-That-Is"
date-created: 2026-04-03
text-type: survey
description: "A philosophical survey of the whole, the concept of 'everything,' and frameworks for understanding how parts relate to wholes. From Leśniewski's mereology through set theory, Russell's paradox, and relational accounts of totality in Whitehead, Buddhist philosophy, and Indigenous ontologies."
references:
  leśniewski-mereology:
    title: "Stanisław Leśniewski. Mereology (1916). Polish logic of parts and wholes."
  leonard-goodman:
    title: "Henry Leonard and Nelson Goodman. 'The Calculus of Individuals Illustrated.' Journal of Symbolic Logic, vol. 5, 1940."
  russell-paradox:
    title: "Bertrand Russell. The Principles of Mathematics (1903). Discussion of the paradox of the set of all sets."
  cantor-absolute-infinite:
    title: "Georg Cantor. Contributions to the Founding of the Theory of Transfinite Numbers (1915, translated 1952)."
  whitehead-process:
    title: "Alfred North Whitehead. Process and Reality: An Essay in Cosmology (1929). On creative advance and extensive continuum."
  nagarjuna-mula:
    title: "Nāgārjuna. Mūlamadhyamakakārikā (Fundamental Verses on the Middle Way, c. 150 CE). Translated by David Kalupahana."
  haraway-sympoiesis:
    title: "Donna Haraway. Staying with the Trouble: Making Kin in the Chthulucene (2016)."
  badiou-being-event:
    title: "Alain Badiou. Being and Event (L'Être et l'événement, 1988). Translated by Oliver Feltham."
  lewis-parts-classes:
    title: "David Lewis. Parts of Classes (1991). On mereology, set theory, and their relation."
  simons-ontology:
    title: "Peter Simons. Parts: A Study in Ontology (1987)."
  kimmerer-braiding:
    title: "Robin Wall Kimmerer. Braiding Sweetgrass: Indigenous Wisdom, Scientific Knowledge, and the Teachings of Plants (2013)."
---

## Introduction: The Impossible Whole

What is everything? The question seems to demand an answer: the totality of all things, the whole that contains all parts, the sum of all that exists. But this answer conceals a deep problem. As soon as you try to define everything precisely, you run into paradoxes. The set of all sets, if it exists, either contains itself (contradiction) or does not contain itself (also contradiction). There is no largest infinity; for any infinite cardinal, there is a larger one. The whole that would contain itself exceeds the very logic we use to define wholes.

This survey examines two major frameworks for thinking about wholes — mereology (the logic of parts and wholes) and set theory — and shows where they break down. It then turns to alternative accounts of totality: Whitehead's creative advance, Buddhist philosophy's dependent origination, Haraway's sympoiesis, and Indigenous relational ontologies. These alternatives refuse to treat totality as a thing or a set. They treat it instead as a process, a fabric of dependence, or a continuous web of relations.

The stakes are not merely abstract. How you think about the whole determines how you think about parts, about identity, about what it means to be bounded or complete. And in systems of knowledge, the question of totality becomes urgent: what is the relationship between the whole system and any particular element within it?

## Mereology: The Logic of Parts and Wholes

Mereology is the branch of formal logic that studies parts and their relations to wholes. Stanisław Leśniewski developed it in the 1920s, building on earlier work in logic. The basic idea is elegant: if you can formally define parthood, you can derive everything else — proper parts, overlaps, sums, complements.

The fundamental relation is parthood. We write "P(x, y)" to mean "x is a part of y." From this, other relations are defined:

- x is a **proper part** of y if x is part of y and x ≠ y
- x and y **overlap** if they have a common part
- x and y **are disjoint** if they have no common part
- x is the **sum** (or fusion) of A and B if x is the smallest thing that has both A and B as parts

These definitions lead to theorems. For instance: if x is part of y, and y is part of z, then x is part of z (transitivity). If x and y are parts of z, then their sum is also part of z (closure). A whole has a unique mereological structure; you cannot have two different ways of partitioning the same whole.

This logical framework has been refined over the decades. Peter Simons' *Parts: A Study in Ontology* (1987) clarifies classical mereology and explores variants. The key decisions are:

1. **Unrestricted composition**: Do any two objects, however unrelated, have a mereological sum? Classical mereology says yes. A stone and a cloud, if they are both in the room, have a sum — a scattered object composed of both. Not all philosophers accept this. Restricted mereology says only some collections form wholes.

2. **Atoms and the void**: Does every composite object decompose into atomic parts (indivisibles)? Does anything compose into nothingness? Classical mereology allows for continuous wholes without atoms, but requires that something exists (no empty whole).

3. **The transitivity of parthood**: Does the part-whole relation transitive? Yes, in classical mereology. If your finger is part of your hand, and your hand is part of your body, then your finger is part of your body.

Mereology's strength is that it offers a precise logical framework for talking about parts and wholes. Its weakness is that it leaves the notion of "parthood" itself undefined. What makes something a part? Is a finger a part of a body because it is spatially continuous with it? Because it is functionally integrated? Because it was grown as part of the same organism? Mereology is neutral on these questions; it only formalizes the relations once parthood is assumed.

## The Leonard-Goodman Calculus

Henry Leonard and Nelson Goodman's 1940 paper "The Calculus of Individuals Illustrated" brought mereology to wider attention by showing how it could be applied to concrete problems. They demonstrated that mereology could formalize certain ontological questions that had seemed intractable.

For instance: is a table one object or many objects (wood molecules, atoms)? Mereologically, it is both. The table is the mereological sum of its atoms. But equally, the atoms are parts of the table. There is no contradiction; they are descriptions at different levels of granularity, both valid within the mereological framework.

This seemed powerful: it promised a way to navigate the problem of composition without contradiction. If composition is unrestricted, then any plurality has a sum. The universe is the mereological sum of all objects. This is totality, defined rigorously.

But Leonard and Goodman also showed the limits. Consider the category "all and only the objects in this room." The sum of these objects is a scattered whole that includes the air between them, the space they displace, and possibly (depending on your definition of composition) the abstract space itself. The sum is well-defined mereologically, but it is not what we ordinarily mean by "the room." The room is a bounded place, not a mereological sum.

More troubling: the Leonard-Goodman framework requires that the universe itself be an object — the sum of all objects. But an object, by the definition used in mereology, is something with determinate properties and boundaries. Does the universe have boundaries? Does it have properties that distinguish it from non-being? Mereology can talk about the universe as a sum, but only by treating it as one more object among others, which seems to miss something about what makes it the *totality*.

## Set Theory and the Paradoxes

Set theory offers an alternative to mereology. Instead of parts and wholes, you have elements and sets. A set is a collection of elements. The power set of a set S is the set of all subsets of S. Sets can have other sets as elements. You can construct hierarchies of sets, building up from the empty set to increasingly complex collections.

Set theory seemed like a perfect foundation for mathematics and logic. David Hilbert, at the turn of the twentieth century, believed that set theory could ground all of mathematics in a complete, consistent, and decidable formal system. But the discovery of paradoxes shattered this hope.

**Russell's Paradox**: Consider the set R of all sets that do not contain themselves. Does R contain itself? If R contains itself, then by definition R should not contain itself (because R is the set of all sets that do NOT contain themselves). If R does not contain itself, then by definition R should contain itself. Either way, contradiction.

This is not a minor technical glitch. It is a fundamental problem with the naive notion of a set. You cannot freely collect elements into a set; not every property defines a set. The set of all sets that do not contain themselves does not exist.

The response was to restrict set construction. Zermelo-Fraenkel set theory (ZF) introduces the axiom of foundation, which prohibits sets that contain themselves. The axiom of separation says you can only construct a set by taking elements from an existing set that satisfy a property. This rules out Russell's set by saying you cannot define a set of "all sets that..." — you can only define a set of "all sets in this collection that..."

But this solution comes at a cost. The unrestricted notion of "all sets" — the totality of sets — is no longer available. You cannot have a universal set, a set of all sets, because allowing that would reintroduce paradoxes.

## Cantor's Absolute Infinite and the Transfinite

Georg Cantor, in developing the theory of infinite sets, discovered something stranger: there is no largest infinity.

Cantor distinguished between different sizes of infinite sets using the notion of cardinality. The set of natural numbers (1, 2, 3, ...) has the same cardinality as the set of rational numbers (all fractions), even though it seems like there should be more rationals than naturals. This is because you can set up a one-to-one correspondence between them: you can list all rationals (they are countable).

But the set of real numbers (all decimal expansions, including non-repeating ones like π) has a larger cardinality. You cannot list all real numbers; no matter how you try, there are always real numbers not in your list. This is Cantor's diagonal argument. So there are at least two sizes of infinity: the cardinality of the natural numbers (called aleph-zero) and the cardinality of the reals (called aleph-one or the continuum).

But here is the remarkable fact: for any set S, the power set of S (the set of all subsets of S) has a cardinality strictly larger than S. This theorem, called Cantor's theorem, means there is no largest cardinal number. For any infinity, there is a larger infinity. The hierarchy of infinities is itself infinite.

This creates a problem for totality. If the totality of all sets is itself a set, then it has a power set, which is larger, which is not included in the totality. So the totality is not a set. The absolute infinite — the totality in its unlimitedness — exceeds the notion of a set.

Cantor himself recognized this. He distinguished between transfinite sets (which are infinite but can be ordered and have a cardinality) and the absolute infinite (which is beyond transfinite, beyond cardinality, beyond enumeration). The absolute infinite is not a set; it is the condition that makes any set possible. It is the totality that cannot be totalized.

Modern set theory accommodates this by simply refusing to speak of the set of all sets. In Zermelo-Fraenkel set theory, there is no universal set. The hierarchy of sets is unbounded. You can always construct a larger set. The totality exists but is not a complete object you can reason about in the same way you reason about particular sets.

## The Relationship Between Mereology and Set Theory

David Lewis' *Parts of Classes* (1991) examines the relationship between these two frameworks. Lewis argues that they are not competing theories of the same thing. Mereology is about concrete objects and their parts. Set theory is about abstract objects (sets) and their elements. The question is how they relate to each other.

Lewis proposes that the part-whole relation can be understood in terms of the element-member relation. If classes (sets) can themselves be composed mereologically, then you can have a unified framework: concrete parts form wholes; abstract elements form sets; and both can coexist in a single ontology.

But this solution raises new questions. What exactly is the relationship between a concrete object and the abstract set of its parts? If you have an apple, and the apple has atoms, and the atoms can be collected into a set, what is the relationship between the apple (concrete) and the set of its atoms (abstract)? They are not the same thing; the apple is concrete, the set is abstract. But they seem to describe the same composition of parts.

Lewis's answer is that they are distinct but parallel. You have both a mereological whole (the apple as a composite of atoms) and a set-theoretic whole (the set of atoms). They are two ways of organizing the same elements. But this seems to double-count the parts, treating composition twice over.

The deeper problem that both mereology and set theory face is this: they both assume that totality is a complete object (a mereological whole or a set) that can be enumerated or at least characterized. But the paradoxes and infinite hierarchies suggest that totality is not like that. It is not a complete inventory; it is more like a process, a continuous opening into new possibilities.

## Whitehead's Creative Advance: Becoming, Not Being

Alfred North Whitehead's process philosophy refuses to treat totality as a being (a substance, a set, a mereological whole). Instead, totality is a *becoming*. It is the creative advance of occasions — the continuous coming-into-being of new actualities.

For Whitehead, reality is not a collection of things that exist at a time. Reality is the ongoing process of actuality emerging from potentiality. Each actual occasion comes into being by gathering the data of the past and adding something new — a determination of how the past is to be felt, integrated, transformed. This determination is novel; it is not fully contained in or determined by the past. So when a new occasion becomes, it does something new. The universe advances creatively.

What is the totality in this framework? It is not the sum of all actual occasions at a moment in time. That would be to treat time as if it were space, as if the universe had a frozen state that could be inventoried. Instead, the totality is the process itself — the ongoing creative advance. "Everything" is the continuous becoming that the universe is. Wholes and parts are always relative to a perspective within this advance; there is no absolute whole that exists apart from the process.

This dissolves the problem that mereology and set theory face. You cannot have a paradox of the set of all sets because there is no "all sets" existing at one time. Sets come into being and perish, becoming data for the next occasion. The totality is not a set; it is the process of setting, the continuous creation of determinate forms from the open potentiality of the future.

Whitehead's extensive continuum is crucial here. It is not a space in which things happen. It is the condition of togetherness — what makes it possible for actual occasions to relate to each other, to prehend each other, to overlap. The continuum is continuous, not discrete. It is the medium of relation itself, always generating new possibilities as the creative advance unfolds.

## Nāgārjuna and Dependent Origination

Buddhist philosophy, particularly Nāgārjuna's work in the second century CE, offers a radically different account of totality — not through the apparatus of logic and set theory, but through the analysis of emptiness and dependence.

Nāgārjuna's central teaching is that nothing has intrinsic self-nature (*svabhāva*). Nothing exists independently or in isolation. Everything exists only in dependence on other things. This is *dependent origination* (*pratītyasamutpāda*): "This being, that becomes; this not being, that does not become."

The key insight is that even the totality — the whole — does not have intrinsic nature. When we say "everything," we are not pointing at a final, complete inventory. We are pointing at the fact that every "thing" is constituted by its relations to every other "thing." A table exists only in dependence on wood, a maker, a concept of "table," someone to call it a table. Change any of these dependencies, and the table no longer exists. There is no table in itself.

Applied to the question of totality: there is no "all things" as a fixed whole. There is only the infinite mutual dependence of things on each other. To understand the totality is to understand this dependence, not to enumerate a set of discrete elements.

Nāgārjuna's analysis of emptiness (*śūnyatā*) is not nihilism — the claim that nothing exists. It is the denial that anything exists in itself. Everything is empty of self-nature, and this emptiness is what allows mutual dependence, relationship, and change. A table is empty of intrinsic table-ness, and because of this emptiness, it can be useful, can wear out, can be meaningful in relation to a user. If the table had intrinsic table-ness, independent of all relations, then it could never change or relate to anything else.

The totality, in this view, is the relational fabric itself. It is not a being but a becoming, not a collection but a web of mutual dependence. To grasp the totality is not to achieve complete knowledge of all things (which is impossible, given infinite dependence), but to understand the structure of dependence itself.

This is strikingly similar to Whitehead's process philosophy, though developed through entirely different traditions and methods. Both refuse to treat the whole as a being or a set. Both understand totality as a dynamic, relational process. Both see that wholes and parts are always dependent on perspective and context, never absolute.

## Haraway's Sympoiesis: Making-With

Donna Haraway's concept of sympoiesis — making-with — offers a contemporary account of totality grounded in actual material relationships rather than abstract logic.

Haraway argues that nothing makes itself. No organism is autopoietic (self-making) in isolation. Every being is sympoietic — made with, through, and because of other beings. A human is made of microbial partners (the microbiome), of the plants and animals it eats, of the atmosphere it breathes, of the climate system that generates weather. To draw a boundary around "the human" and treat everything outside as "environment" is to miss the fact that the human is constituted by what would conventionally be called the external environment.

The totality, in Haraway's account, is not a collection of individual beings with an environment. It is a continuously generating field of sympoietic relations. Every entity is an entanglement of other entities. A forest is not trees plus fungi plus insects plus soil plus microbes; it is the sympoietic process that generates all of these as co-arising beings. The forest becomes through the becomings of all its inhabitants; none exists in isolation.

This is radically different from mereology because the parts (organisms) do not pre-exist the composition. The parts and the whole co-create each other. A tree does not exist as a separate being that then becomes part of a forest. The tree is called into being by the forest; the forest is what it is through the existence of trees. This is not mereological sum; it is relational constitution.

The totality, therefore, is not enumerable. You cannot list "all beings" because beings are continuously coming into existence through sympoietic relation. The totality is an open, generative process. It has no final state, no complete inventory. It is the ongoing creation of kin, the continuous web of making-with that constitutes what exists.

## Indigenous Kinship Ontologies: Everything as Relation

Indigenous philosophies across the world express similar insights through the language of kinship. The concept of kinship is not metaphorical; it is ontological. Everything is kin because everything is in relation.

The Lakota concept *Mitákuye Oyás'iŋ* translates as "all my relatives." It expresses the totality not as a set of things but as a network of relations. The relatives include not only human family but all beings: animals, plants, rocks, water, stars. All are kin because all are related.

Robin Wall Kimmerer, in *Braiding Sweetgrass*, describes how Indigenous peoples understood themselves as part of a gift economy in which all beings are in exchange with each other. The earth gives; all beings receive and reciprocate. A tree grows; it offers oxygen, shade, fruit. An animal eats the fruit; it disperses seeds. A human harvests; they also tend and give back. This is not a hierarchy of beings using a neutral environment; it is a circle of kinship in which reciprocal obligation is the fundamental relationship.

The totality is this web of reciprocal relation. It is not a thing or a set of things; it is the continuously woven fabric of obligation and gift. To be part of the totality is to participate in this web, to give and receive, to care for relatives near and far, to extend the circle of kinship.

The importance of this account is that it makes clear that totality is not an abstract logical problem. It is a concrete material and ethical reality. The "everything" you are part of includes the land beneath your feet, the water you drink, the air you breathe, the food you eat, the people you live with, the ancestors who came before, the descendants who will come after. This is not metaphor; it is the actual constitution of your being.

## Badiou's Being and Event: Between Set Theory and Thought

Alain Badiou's *Being and Event* (1988) develops a sophisticated account that uses set theory as the language of being while acknowledging that truth and meaning emerge through events that exceed any set.

Badiou argues that being — the totality of what exists — is best described by the language of set theory. Everything that is, is a set. The void (the empty set) is the base; from it, all beings are constructed. This seems to commit him to mereology's problem: being as a complete inventory.

But Badiou's key move is to distinguish between the presentable (what can be described within a consistent set-theoretic framework) and the event (what ruptures presentation and exceeds the established order). An event is a sudden occurrence that cannot be reduced to the previous state of the system. When an event occurs, a truth-process begins: individuals in the situation must decide whether to be faithful to the event, and through this fidelity, they create a new meaning not contained in the previous situation.

For instance: the French Revolution was an event that ruptured the existing political order. The totality of social facts before the Revolution did not determine or contain the new order that emerged after. A new truth was created.

This means that the totality is not a complete set that determines everything. The set-theoretic structure describes what is presentable, what can be inventoried. But truth emerges through events that are not deducible from the presentable. The totality is always open to rupture, to the emergence of the new.

This is a way of holding together the logical precision of set theory (being is describable as a set) with the openness and creativity that process philosophy emphasizes. Being is a complete structure, but truth and meaning are created through events that exceed structure.

## Parts and Wholes: The Problem of Composition

All of these accounts face a common problem: how do parts relate to wholes? Is the whole reducible to its parts? Or does the whole have an emergence that exceeds the sum of parts?

Mereology and set theory assume that wholes are reducible: the whole is the sum of its parts, nothing more. If you have all the parts and you know how they are arranged, you know the whole. This is reductive composition.

But consider a living organism. You can list all the atoms in a body, describe their chemical bonds, specify their spatial arrangement. But this does not tell you why the organism is alive — why it maintains itself, reproduces, responds to its environment. The organization of the parts seems to matter in a way that pure summation misses.

Whitehead and Haraway argue for emergence: the whole has properties and relations that are not present in any individual part. These are not magical properties; they arise from the web of relations among parts. But the web itself is not a "part" that you can add to the list. It is the structure that gives meaning to the parts.

This is sometimes called the "holistic" view against the "reductive" view. But these are not contradictory positions; they are perspectives on different levels of analysis. At the level of parts (atoms), you have a complete description. At the level of the whole (the living organism), you have a different description that includes relational and emergent properties. Both are true.

The implications for totality are profound. If the totality is treated as a sum of parts (mereological or set-theoretic), you miss the relational properties that constitute it. You treat the totality as if it were just more of the same — more objects, more elements, more facts. But the totality has a peculiar status: it cannot relate to anything outside itself (there is nothing outside), so it cannot be understood using the same logic that works for parts. The totality is its own context, and this changes everything.

## The Self-Reference Problem

All of these frameworks face a final problem: self-reference. The totality must include descriptions of itself. A complete account of everything must include an account of the very account you are giving.

In mereology, this is manageable as long as you treat the description as a separate object. The description is a part of the totality, but it is not the same as the totality itself. A book about everything is part of everything, but the book is not the same as what it describes.

In set theory, self-reference becomes a paradox. If the totality is a set, and the totality must include the description of the totality, then the totality describes itself, which leads to self-referential loops. Russell's paradox is a version of this.

In process philosophy, self-reference is natural. The universe is continuously describing itself as it becomes. New occasions arise that incorporate the data of past occasions, including past descriptions of the universe. The totality is not trying to be complete at each moment; it is becoming more aware of itself through its own activity. There is no paradox because the totality is not trying to be a complete, static set; it is an open, dynamic process.

Indigenous relational ontologies treat self-reference as kinship responsibility. If everything is kin, then your description of the totality is a gift to your relatives, past and future. It is not trying to be complete; it is trying to be true to the relations that bind you.

## Totality Without Totalization

The convergence of these diverse accounts suggests a principle: the totality cannot be totalized. It cannot be captured in a complete, static, enumerable set. But it can be grasped relationally, through the structure of dependence that constitutes it.

To understand the totality is not to achieve complete knowledge of all things (which is impossible). It is to understand the patterns of relation that make any particular thing meaningful. It is to see how everything is implicated in everything else, how boundaries between things are enacted and perspectival, how new possibilities continuously emerge.

This is not a limitation of knowledge; it is a truth about the nature of reality. The totality is fundamentally open. It is not a completed inventory waiting to be discovered; it is a continuously generating process. To think about it accurately requires letting go of the desire for complete enumeration and embracing instead a practice of following relations, attending to emergence, remaining faithful to the differences and dependencies that make life possible.

## See also

- [Philosophy of Environment](./philosophy-of-environment-survey.md) — on what surrounds a thing, boundaries between thing and world
- [Relation](../terms/relation.md) — the fundamental structure that constitutes totality
- [Part and Whole](../../terms/part-and-whole.md) — the categories that compose and decompose
- [Boundary](../domains/western/domains/metaphysics/domains/ontology/terms/boundary.md) — where totality meets itself, where systems are delimited
- [Dependent Origination](../../terms/dependent-origination.md) — the Buddhist account of how all things arise interdependently
- [Emergence](../../terms/emergence.md) — how wholes have properties not present in parts alone
