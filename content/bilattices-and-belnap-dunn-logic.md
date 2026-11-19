---
title: "What Is a Bilattice? Belnap-Dunn Logic and the Two Orders"
summary: "A bilattice has two lattice orders, one for truth and one for information. It explains why a value meaning both true and false is data, not an error."
date-created: 2026-10-19
type: article
status: active
visibility: public
tags: [bilattice, belnap-dunn-logic, four-valued-logic, paraconsistent-logic, knowledge-representation]
abstract: "A bilattice is a set with two lattice orders: a truth order and a knowledge (information) order. The four-element example, FOUR, underlies Belnap-Dunn four-valued logic. This article asks why such a logic treats 'both true and false' as a legitimate state rather than an error."
keywords: [bilattice, Belnap-Dunn logic, knowledge order, truth order, Ginsberg, Fitting, four-valued logic, paraconsistent]
math: true
references:
  belnap1977useful: { type: chapter, title: "A useful four-valued logic", author: [{family: Belnap, given: Nuel D.}], editor: [{family: Dunn, given: J. Michael}, {family: Epstein, given: George}], issued: {date-parts: [[1977]]}, container-title: "Modern Uses of Multiple-Valued Logic", publisher: "D. Reidel", publisher-place: Dordrecht, page: "5-37", DOI: "10.1007/978-94-010-1161-7_2" }
  dunn1976: { type: article-journal, title: "Intuitive semantics for first-degree entailments and 'coupled trees'", author: [{family: Dunn, given: J. Michael}], issued: {date-parts: [[1976]]}, container-title: "Philosophical Studies", volume: "29", issue: "3", page: "149-168", DOI: "10.1007/BF00373152" }
  dunn2019: { type: chapter, title: "Two, three, four, infinity: the path to the four-valued logic and beyond", author: [{family: Dunn, given: J. Michael}], editor: [{family: Omori, given: Hitoshi}, {family: Wansing, given: Heinrich}], issued: {date-parts: [[2019]]}, container-title: "New Essays on Belnap-Dunn Logic", publisher: Springer, publisher-place: Cham, page: "77-97" }
  ginsberg1986: { type: paper-conference, title: "Multi-valued logics", author: [{family: Ginsberg, given: Matthew L.}], issued: {date-parts: [[1986]]}, container-title: "Proceedings of the Fifth National Conference on Artificial Intelligence", publisher: "AAAI Press", page: "243-247" }
  ginsberg1988: { type: article-journal, title: "Multivalued logics: a uniform approach to reasoning in artificial intelligence", author: [{family: Ginsberg, given: Matthew L.}], issued: {date-parts: [[1988]]}, container-title: "Computational Intelligence", volume: "4", issue: "3", page: "265-316", DOI: "10.1111/j.1467-8640.1988.tb00280.x" }
  fitting1991: { type: article-journal, title: "Bilattices and the semantics of logic programming", author: [{family: Fitting, given: Melvin}], issued: {date-parts: [[1991]]}, container-title: "Journal of Logic Programming", volume: "11", issue: "1-2", page: "91-116", DOI: "10.1016/0743-1066(91)90014-G" }
  kalman1958: { type: article-journal, title: "Lattices with involution", author: [{family: Kalman, given: J. A.}], issued: {date-parts: [[1958]]}, container-title: "Transactions of the American Mathematical Society", volume: "87", issue: "2", page: "485-491" }
---

# What Is a Bilattice? Belnap-Dunn Logic and the Two Orders

A bilattice is a set equipped with two lattice orders: one ranks elements by how true they are, the other by how much information they carry. Its smallest nontrivial example, FOUR, has the values neither, true only, false only and both, and it is the algebra behind Belnap-Dunn four-valued logic. The bilattice explains why "both true and false" can be a legitimate state of a database: it is the top of the information order, not the top of the truth order.

This article takes the algebraic angle. For the logic itself (connectives, consequence, caveats, open problems) see [Belnap four-valued logic](/belnap-four-valued-logic/).

## What is a bilattice?

A lattice is a partially ordered set in which every two elements have a greatest lower bound (meet) and a least upper bound (join). A **bilattice** is one set with *two* such orders, a truth order $\leq_t$ and a knowledge order $\leq_k$, each with its own meet and join. Matthew Ginsberg introduced the structure for artificial intelligence [@ginsberg1986; @ginsberg1988], where default reasoning, truth maintenance and theorem proving all need to separate "more true" from "more informed". Melvin Fitting developed it for logic programming [@fitting1991].

The operations are conventionally named:

| Operation | Order | Reading |
|---|---|---|
| $\wedge$, $\vee$ | meet and join in $\leq_t$ | conjunction, disjunction |
| $\otimes$, $\oplus$ | meet and join in $\leq_k$ | consensus, accumulation of information |
| $\neg$ | reverses $\leq_t$, preserves $\leq_k$ | negation |

In a bilattice a truth value is not a point on a line from false to true. It can encode evidence for and evidence against a sentence, and the two can vary independently.

## What is the four-element bilattice FOUR?

Take the two classical markers $\mathsf{T}$ and $\mathsf{F}$ and form the four subsets of $\{\mathsf{T},\mathsf{F}\}$:

| Value | Set | Reading | Knowledge order | Truth order |
|---|---|---|---|---|
| $\bot$ | $\varnothing$ | neither supplied | least information | intermediate |
| $\mathbf{t}$ | $\{\mathsf{T}\}$ | true only | positive information | greatest |
| $\mathbf{f}$ | $\{\mathsf{F}\}$ | false only | negative information | least |
| $\top$ | $\{\mathsf{T},\mathsf{F}\}$ | both supplied | greatest information | intermediate |

The knowledge order is subset inclusion, so $x \leq_k y$ iff $x \subseteq y$. The truth order says $x\leq_t y$ iff ($\mathsf{T}\in x$ implies $\mathsf{T}\in y$) and ($\mathsf{F}\in y$ implies $\mathsf{F}\in x$): more truth support and less falsity support. Hence $\mathbf{f}$ is least and $\mathbf{t}$ greatest in truth, while $\bot$ and $\top$ are incomparable middles. In knowledge, $\bot$ is least, $\top$ greatest, and $\mathbf{t}$, $\mathbf{f}$ are incomparable.

This is the central bilattice insight: one can be more informed without being truer.

Negation swaps $\mathbf{t}$ and $\mathbf{f}$ and fixes $\bot$ and $\top$. The knowledge operations give

$$\mathbf{t}\oplus\mathbf{f}=\top, \qquad \mathbf{t}\otimes\mathbf{f}=\bot.$$

If one source says true and another says false, pooling everything yields "both"; the consensus common to the two reports is no shared information. These are two different, deliberately separable policies.

### The pair (positive, negative) view

FOUR is also the set of pairs $(a,b)\in\{0,1\}^2$, with $a$ recording positive evidence and $b$ negative: $\bot=(0,0)$, $\mathbf{t}=(1,0)$, $\mathbf{f}=(0,1)$, $\top=(1,1)$. This is the **twist product** $\mathbf{2}\otimes\mathbf{2}$, a construction Kalman introduced for lattices with involution [@kalman1958] and Fitting extended to bilattices [@fitting1991]. The pair representation is what lets the same construction be run over lattices larger than $\{0,1\}$, giving bilattices that track degrees of evidence. In the working notes behind this article, a representation result attributed to Avron states that bounded interlaced bilattices (those whose operations are monotone in both orders) arise as twist products of this kind; this article does not reprove it.

## Why is "both true and false" not an error?

The value $\top$ is an informational state rather than an error, for five reasons.

1. **It has a precise meaning.** $\top=\{\mathsf{T},\mathsf{F}\}$ records that both truth and falsity have been supplied.
2. **It is structurally regular.** Negation, conjunction, disjunction, consensus and accumulation are all defined on it, with the same laws as for the other values.
3. **It is epistemic.** In Belnap's reading the values describe what a system has been told [@belnap1977useful]. Dunn's relational semantics [@dunn1976; @dunn2019] likewise models contradictory suppositions or assertions, not necessarily contradictions in the world. Dunn explicitly warns against reading the semantics as claiming that some sentence is really both true and false.
4. **It is paraconsistent.** $\top$ is designated (it counts as truth-supporting), yet it does not make every formula designated. Take $v(p)=\top$ and $v(q)=\mathbf{f}$: then $v(p\wedge\neg p)=\top$ is designated and $v(q)$ is not, so $p\wedge\neg p\not\models q$. Explosion fails and the conflict is stored locally.
5. **It preserves diagnostic information.** Treating $\top$ as an error would erase the fact that two evidential streams disagree. As a value, it lets the system answer, inspect, revise or defer while keeping the conflict as data.

The name matters here. Because $\top$ is the top of the *knowledge* order, calling it "maximally true" is a category mistake; it is maximally informed in the specific sense of containing both a positive and a negative report.

## What does Dunn's relational semantics add?

Dunn replaced the classical valuation function with a relation between sentences and the markers $\mathsf{T}$ and $\mathsf{F}$; equivalently each sentence $A$ receives a set $V^*(A)\subseteq\{\mathsf{T},\mathsf{F}\}$. The clauses are two-sided:

$$\mathsf{T}\in V^*(\neg A)\iff\mathsf{F}\in V^*(A),\qquad \mathsf{F}\in V^*(\neg A)\iff\mathsf{T}\in V^*(A),$$

$$\mathsf{T}\in V^*(A\wedge B)\iff \mathsf{T}\in V^*(A)\text{ and }\mathsf{T}\in V^*(B),$$

$$\mathsf{F}\in V^*(A\wedge B)\iff \mathsf{F}\in V^*(A)\text{ or }\mathsf{F}\in V^*(B),$$

with dual clauses for disjunction. Truth conditions and falsity conditions are tracked independently. The four-valued algebra above is exactly what results.

## How do bilattices help with logic programming?

Fitting's observation is a division of labour between the two orders. The connectives $\wedge$, $\vee$, $\neg$ evaluate formulas according to the truth order. Fixed-point semantics for programs, by contrast, can be taken in the knowledge order, where the least fixed point is the interpretation containing no extraneous information.

A computation can therefore start at $\bot$, add positive information, add negative information, and, if both arrive for the same atom, reach $\top$. Arriving at $\top$ means the program has acquired conflicting reports; it does not mean the semantic machinery has broken. Truth operations evaluate; knowledge operations govern informational growth.

## Where else does this structure matter?

Ginsberg's motivation was inference systems that need to compare how true a sentence is against how well informed the system is. The same split recurs in the 561 Group's research on [predication over bilattice-valued fibers](/adjoint-structure-of-predication-on-bilattice-fibers/), where fibers of subject-predicate-object assertions carry FOUR-valued charges, and in [paraconsistent settling](/paraconsistent-settling-and-comprehension/), where closure runs in the knowledge order. Those pages build on, and do not replace, the standard bilattice theory sketched here.

## Limits and open problems

- **Scope of the claim.** This is a memorandum-level synthesis of Belnap, Dunn, Ginsberg and Fitting. It states the orders, operations and the five-part argument; it contains no new theorem.
- **Epistemic, not metaphysical.** The argument that $\top$ is a state of information does not settle whether any true contradictions exist; the sources deliberately do not take that position.
- **Conditionals.** The bilattice operations above do not include a canonical implication. Residuated implications on twist products exist, and choosing among them is discussed in [the adjoint-structure paper](/adjoint-structure-of-predication-on-bilattice-fibers/); the base logic has no unique conditional ([Belnap four-valued logic](/belnap-four-valued-logic/)).
- **Provenance and degrees.** FOUR forgets who said what and how strongly. Richer bilattices can track degrees; tracking sources is an open design question.

## Related

- [Belnap four-valued logic: reasoning with gaps and gluts](/belnap-four-valued-logic/)
- [Paraconsistent settling and comprehension](/paraconsistent-settling-and-comprehension/)
- [The adjoint structure of predication on bilattice fibers](/adjoint-structure-of-predication-on-bilattice-fibers/)
- [The Nelson identity on four-valued truth](/nelson-identity-on-four-valued-truth/)
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/)
