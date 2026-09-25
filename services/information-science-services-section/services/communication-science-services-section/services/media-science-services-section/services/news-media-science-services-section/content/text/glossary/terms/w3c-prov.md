---
name: W3C PROV
description: "The W3C provenance vocabulary - PROV-DM and PROV-O, Recommendations since 30 April 2013 - that models entities, activities, agents, and their derivation and attribution relations, descending from the 2007-08 Open Provenance Model and grounded in Green, Karvounarakis & Tannen's 2007 provenance-semirings database theory, and which records who did what to what and when without modeling whether a claim is true, fair, or legally safe."
date-created: 2026-08-22
aliases:
  - PROV-O
  - PROV-DM
  - PROV ontology
  - W3C PROV family
instance-of: w3c-standard
---

**W3C PROV** names a family of Recommendations -
principally **PROV-DM** (the data model) and **PROV-O** (its OWL2 ontology) -
published together by the W3C Provenance Working Group on **30 April 2013**, alongside sibling documents PROV-N, PROV-XML, PROV-CONSTRAINTS, PROV-AQ, and PROV-DICTIONARY ([PROV-O](https://www.w3.org/TR/prov-o/); [PROV-DM](https://www.w3.org/TR/prov-dm/)).
PROV-O supplies a vocabulary of entities, activities, and agents, and the relations among them -
generation, usage, derivation, attribution, delegation -
that lets a record show who produced or transformed a given object, using what inputs, under whose authority.
Moreau and Groth's companion volume, *Provenance: An Introduction to PROV* (Morgan & Claypool, 2013; companion site [provbook.org](https://www.provbook.org/)), is the standard practitioner's guide to generating and publishing PROV records.

PROV's direct predecessor is the **Open Provenance Model** (OPM), described by Moreau, Freire, Futrelle, McGrath, Myers, and Paulson in "The Open Provenance Model: An Overview" (2008) and formalized as OPM v1.1 in *Future Generation Computer Systems* (2010-2011).
PROV relaxed one of OPM's core rules:
OPM treated provenance artifacts as strictly immutable, while PROV allows entities to be mutable as long as the attributes that matter to a given description stay fixed.
Underneath both sits a database-theory result neither cites explicitly:
Green, Karvounarakis, and Tannen, "Provenance Semirings," *PODS* 2007, pp. 31-40 ([paper](https://web.cs.ucdavis.edu/~green/papers/pods07.pdf)), which gives provenance a compositional algebraic semantics by annotating facts with elements of a commutative semiring and propagating those annotations through query evaluation -
the mathematical anchor beneath what PROV expresses only as a graph vocabulary.

PROV-O records *who did what to what, when* -
it does not decide whether a claim is true, fair, or legally safe.
A claim-state layer (asserted, supported, disputed, superseded, stale, withdrawn) sits entirely outside the PROV vocabulary and must be defined as an extension on top of it, not discovered within it.

## See also

- [Study of Claim and Provenance Standards](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-claim-and-provenance-standards.md) - the fuller study this entry summarizes, including its greenfield gaps
