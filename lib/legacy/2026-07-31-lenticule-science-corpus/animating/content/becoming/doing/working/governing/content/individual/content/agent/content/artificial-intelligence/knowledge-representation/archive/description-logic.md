---
type: concept
class: foundational
status: active
depends-on:
  - knowledge-representation.md
  - ontology.md
see-also:
  - ../objects/owl-axiom.md
  - ../theorems/owl-decidability.md
references:
  - references/baader-dlhandbook2003.md
---

# Description logic

**Description logics (DLs)** are a family of decidable
fragments of first-order logic designed for
representing structured knowledge about classes,
properties, and individuals. The formal foundation of
OWL and modern ontologies.

## Origins

- **KL-ONE (1979)** and successors gave informal
  semantic networks formal semantics.
- **Description logics (1980s-90s)** formalized this
  into a logic family.
- **OWL (2004+)** standardized DLs for the Semantic
  Web.

## Core constructs

A typical DL has:

- **Concepts** (classes): Person, Animal.
- **Roles** (binary relations): hasParent, locatedIn.
- **Individuals** (instances): john, paris.
- **Concept constructors:** intersection ($C \sqcap
  D$), union ($C \sqcup D$), negation ($\neg C$),
  existential restriction ($\exists r.C$), universal
  restriction ($\forall r.C$).
- **Axioms:** subsumption ($C \sqsubseteq D$),
  equivalence ($C \equiv D$), individual assertions
  ($a : C$).

## TBox vs ABox

- **TBox** (terminological box): the schema —
  classes, properties, axioms about them.
  - $\text{Mother} \equiv \text{Female} \sqcap
    \exists \text{hasChild}.\text{Person}$
- **ABox** (assertional box): the instances and
  their properties.
  - $\text{mary} : \text{Mother}$
  - $(\text{mary}, \text{john}) : \text{hasChild}$

The TBox/ABox distinction enables modular reasoning.

## Inference services

DL reasoners answer:

- **Subsumption.** Is $C \sqsubseteq D$?
- **Classification.** Compute the full subsumption
  hierarchy.
- **Consistency.** Is the knowledge base satisfiable?
- **Instance checking.** Is individual $a$ in class
  $C$?
- **Conjunctive query answering.** Find individuals
  matching a pattern.

These are the standard DL reasoning tasks.

## The DL family

DLs are named by features (each adds an
expressiveness component):

- **AL.** Attributive language; baseline.
- **C.** Negation of any concept.
- **N.** Number restrictions.
- **Q.** Qualified number restrictions.
- **I.** Inverse roles.
- **R.** Role hierarchy.
- **O.** Nominals (named individuals in concepts).
- **F.** Functional roles.

Combinations: $\mathcal{ALC}$, $\mathcal{SHIQ}$,
$\mathcal{SROIQ}$ (= OWL 2 DL).

Greater expressiveness → harder reasoning. The
balance determines the practical sweet spot.

## Complexity landscape

- **EL** family: polynomial-time reasoning.
- **DL-Lite** family: low-complexity query answering.
- **$\mathcal{ALC}$:** ExpTime-complete.
- **$\mathcal{SHIQ}$:** ExpTime-complete.
- **$\mathcal{SROIQ}$ (OWL 2 DL):** N2ExpTime-complete.

For real ontologies, reasoners are typically much
faster than worst case.

## OWL profiles

OWL 2 standardized profiles trading expressiveness
for tractability:

- **OWL 2 EL.** Polynomial reasoning; biomedical
  ontologies.
- **OWL 2 QL.** Tractable conjunctive query
  answering.
- **OWL 2 RL.** Polynomial rule-based reasoning.
- **OWL 2 DL.** Full $\mathcal{SROIQ}$;
  decidable.
- **OWL 2 Full.** RDF compatibility; undecidable.

Choose profile based on application needs.

## Reasoners

Production DL reasoners:

- **HermiT.** $\mathcal{SROIQ}$ reasoning.
- **Pellet.** OWL 2 DL.
- **ELK.** OWL 2 EL specifically.
- **FaCT++.** Earlier reasoner.
- **Konclude.** Modern, performant.

These handle real-world ontologies (millions of
axioms) efficiently in practice.

## In contemporary AI

- **Biomedical ontologies.** Gene Ontology, SNOMED
  CT use OWL EL; reasoners actively employed.
- **Enterprise.** Semantic data integration uses
  DLs.
- **Linked Data / Semantic Web.** OWL is the
  standard ontology language.
- **LLMs and DLs.** Emerging research on using
  LLMs to construct/extend DL ontologies and on
  evaluating LLM consistency with DL semantics.

## Limits

- **Closed under decidability.** Many natural
  knowledge patterns require expressiveness DLs
  don't have.
- **Open-world assumption.** Default DL semantics
  is open-world; sometimes counterintuitive.
- **Update.** Updating DLs (belief revision) is
  hard.
- **Engineering.** Building good DL ontologies is
  craft-intensive.

## Status

Mature theoretical framework with industrial-scale
deployment. Standard formalism for ontology work.
Active research on extensions, query answering, and
ML integration.
