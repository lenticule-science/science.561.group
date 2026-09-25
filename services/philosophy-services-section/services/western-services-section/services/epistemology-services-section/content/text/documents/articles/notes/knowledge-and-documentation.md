---
title: "Knowledge and Documentation"
description: "Documentation does not merely record knowledge — it constitutes it. A record creates institutional facts, not descriptions of them."
date-created: 2026-04-04
sources:
  - "Plato, *Theaetetus* (c. 369 BCE)"
  - "Edmund Gettier, 'Is Justified True Belief Knowledge?' (1963)"
  - "Alvin Goldman, *Epistemology and Cognition* (1986)"
  - "Suzanne Briet, *Qu'est-ce que la documentation?* (1951)"
  - "Michael Buckland, 'Information as Thing' (1991)"
  - "Marvin Minsky, 'A Framework for Representing Knowledge' (1974)"
  - "John Searle, *The Construction of Social Reality* (1995)"
  - "Luciana Duranti, 'Diplomatics: New Uses for an Old Science' (1989)"
---

## The problem

Knowledge systems face a persistent confusion: they treat documentation as downstream of knowing. First you know something, then you write it down. The record is a copy of the knowledge, a shadow of the real thing.

This gets the relationship backwards. In any institutional context — a legal system, a library, a software repository — the record does not describe a fact. It makes the fact real. A court's written judgment does not report that someone is guilty; it constitutes the guilt. A committed spec file does not describe that a term exists in the system; the commit is what brings the term into existence.

Documentation is not recording. It is constitution.

## What counts as knowledge

The classical account: knowledge is justified true belief. You know that *p* if you believe *p*, *p* is true, and you have good reason to believe *p*. Plato articulates this in the *Theaetetus*, and it held for two millennia until Edmund Gettier broke it in 1963 with cases where all three conditions are met but no one would say the person knows. A stopped clock reads the correct time twice a day — you look at it, form a true belief with apparent justification, and yet you do not know what time it is.

The post-Gettier landscape fractured. Reliabilism (Goldman, 1986) replaced justification with reliable process: you know *p* if *p* was produced by a process that reliably yields truths. Social epistemology extended this further — knowledge is not solely an individual achievement but something produced, validated, and maintained by communities with shared standards of evidence. A scientific fact is not known by one mind; it is known through peer review, replication, institutional memory.

What matters for documentation is where this trajectory leads: away from knowledge as a private mental state and toward knowledge as something constituted by public processes. If knowledge requires reliable processes and community validation, then the artifacts of those processes — the records, the documents, the committed transactions — are not secondary to knowledge. They are part of what makes knowledge knowledge.

## What counts as a document

Suzanne Briet's answer (1951): a [document](../../../../../terms/document.md) is any sign preserved or recorded for the purpose of representing, reconstructing, or proving a phenomenon. An antelope in the wild is not a document. The same antelope in a zoo — catalogued, preserved, made available for study — is a document. The physical thing does not change. What changes is the intentional act of setting it apart as evidence.

Michael Buckland (1991) clarified the mechanism: information-as-thing. A document is a physical or symbolic object that functions as evidence. It is not information in the sense of a mental state (information-as-knowledge) or a communicative act (information-as-process). It is a thing that can be pointed to, stored, retrieved, and used as a basis for claims.

Duranti's archival theory (1989) adds the critical dimension: records are not just preserved objects but transactions. A record is created in the course of activity and preserved as evidence of that activity. The principles of provenance and original order are not filing conventions — they are epistemic commitments. A record stripped of its context of creation is not merely disorganized; it is epistemically degraded. You cannot know what it means without knowing how it came to be.

## Knowledge representation as ontological commitment

When Minsky proposed frames (1974), he was not just building a data structure. He was making a claim about what knowledge is: knowledge is a collection of stereotyped situations with default values that can be overridden by experience. Semantic networks made a different claim: knowledge is a web of labeled relationships between concepts. Description logics made yet another: knowledge is a set of class definitions, role restrictions, and subsumption relations that support decidable inference.

Each representation scheme is an ontological commitment — a declaration of what kinds of things exist and what kinds of relations hold between them. The Entity-Attribute-Value-Transaction (EAVT) model commits to a specific ontology: the world consists of entities that have attributes with values, and every change is a transaction. This is not a neutral storage format. It is a claim that institutional reality is constituted by discrete, attributable, time-stamped acts.

This commitment is not accidental. It mirrors the structure of [status function declarations](../../../../../../../../../../social-science-services-section/content/text/glossary/terms/status-function-declaration.md): an entity (target) acquires an attribute (status) with a value (the institutional role) through a transaction (the authorizing act). The datastore does not merely store facts about the world. It constitutes the institutional world it describes.

## Records as institutional facts

Searle's analysis (1995) makes this explicit. Institutional facts — money, property, marriage, corporate personhood — exist only because of collective declarations of the form "X counts as Y in context C." A piece of paper counts as a dollar. A ceremony counts as a marriage. A git commit counts as a published term.

These facts are not discovered. They are created by the act of declaration. And the declaration must be recorded to persist. An unrecorded marriage may have occurred, but institutionally it did not happen — no legal consequences follow, no status changes propagate. The record is not a copy of the institutional fact. The record is what makes the institutional fact operative across time and across the community that recognizes it.

Duranti's diplomatics reinforces this: a record's authenticity (it is what it claims to be), reliability (it accurately represents the transaction that produced it), and integrity (it has not been altered) are not archival niceties. They are the conditions under which a record functions as an institutional fact. A tampered record does not merely contain wrong information — it fails to constitute anything at all.

## The constitutive function

This is why this system treats records as transactions rather than descriptions. When the datastore commits an EAVT quad, it is not writing down something that was already true. It is performing the institutional act that makes it true. The entity acquires the attribute at the moment of transaction — not before.

This is also why provenance, immutability, and temporal ordering matter as architectural commitments rather than implementation details. If records constitute facts, then altering a record does not correct a description — it retroactively changes what was institutionally real. Append-only logs are not a performance optimization. They are an epistemic guarantee: what was constituted stays constituted, and new facts are constituted by new transactions.

Documentation is the practice of constituting knowledge through committed, preservable, evidential acts. A library that understands this does not treat its records as a mirror of what it knows. It treats the act of recording as the act of knowing.

## See also

- [Document](../../../../../terms/document.md) — Briet's definition and the archival principles
- [Status Function Declaration](../../../../../../../../../../social-science-services-section/content/text/glossary/terms/status-function-declaration.md) — the formal mechanism by which institutional facts are constituted
- [Epistemology](../terms/epistemology.md) — the broader field of study
