---
type: object
class: foundational
status: active
depends-on:
  - teaching/explanations/description-logic.md
  - ontology-schema.md
see-also: []
references:
  - references/baader-dlhandbook2003.md
---

# OWL axiom

An **OWL axiom** is a statement in the Web Ontology
Language (OWL) — a description-logic-based standard
for ontologies. Axioms encode the structural
content of an ontology: class hierarchies, property
restrictions, equivalences, and so on.

## Categories of axioms

OWL 2 distinguishes axiom types:

### Class axioms

- **SubClassOf.** $C \sqsubseteq D$: every
  instance of $C$ is an instance of $D$.
- **EquivalentClasses.** $C \equiv D$: same
  instances.
- **DisjointClasses.** $C \sqcap D \equiv \bot$:
  no shared instances.
- **DisjointUnion.** Class is union of disjoint
  parts.

### Property axioms

- **SubObjectPropertyOf.** $r \sqsubseteq s$.
- **EquivalentObjectProperties.** Same property.
- **InverseObjectProperties.** $r$ inverse of $s$.
- **FunctionalObjectProperty.** $r$ has at most one
  filler.
- **TransitiveObjectProperty.** $r$ is transitive.
- **SymmetricObjectProperty.** $r$ is symmetric.
- (similarly for data properties)
- **PropertyDomain.** $\exists r.\top \sqsubseteq C$.
- **PropertyRange.** $\top \sqsubseteq \forall r.C$.

### Individual axioms

- **ClassAssertion.** $a : C$.
- **PropertyAssertion.** $r(a, b)$.
- **SameIndividual.** $a = b$.
- **DifferentIndividuals.** $a \neq b$.

### Annotation axioms

- Labels, comments, provenance — ignored by reasoning
  but useful for humans/tooling.

## Class expressions

OWL axioms are built from class *expressions*:

- **Atomic.** Named class.
- **Intersection.** $C \sqcap D$.
- **Union.** $C \sqcup D$.
- **Complement.** $\neg C$.
- **Existential restriction.** $\exists r.C$.
- **Universal restriction.** $\forall r.C$.
- **Number restrictions.** $\geq n\ r.C$, $\leq n\ r.C$.
- **Nominal.** $\{a\}$ — class containing only
  individual $a$.
- **Property value.** $\exists r.\{a\}$.

These compose into arbitrarily-complex expressions
within the chosen DL fragment.

## Example

A small ontology fragment:

```
Mother ⊑ Female
Mother ≡ Female ⊓ ∃hasChild.Person
hasChild Domain Parent
Parent Range Person
mary : Mother
hasChild(mary, john)
```

Inference: mary is Female (from
Mother ⊑ Female and ClassAssertion).
john is Person (from hasChild Range Person).

## Reasoning over axioms

DL reasoners perform:

- **Classification.** Compute the full subsumption
  hierarchy from axioms.
- **Consistency checking.** Detect contradictions.
- **Entailment.** Determine which axioms follow.
- **Explanation.** Trace why an entailment holds.

Standard reasoners (HermiT, Pellet, ELK, Konclude)
handle real ontologies efficiently in practice.

## Open vs closed world

Crucial: OWL has **open-world semantics**:

- Absence of an assertion does *not* imply its
  negation.
- "We don't know" is distinct from "no."
- Database thinkers often expect closed-world; this
  is a common confusion.

Per [open-world-assumption](../theorems/open-world-assumption.md),
OWA has substantive consequences for reasoning.

## OWL profiles

Trade expressiveness for tractability:

- **OWL 2 EL.** Subsumption polynomial; biomedical.
- **OWL 2 QL.** Conjunctive query polynomial.
- **OWL 2 RL.** Rule-based reasoning.
- **OWL 2 DL.** Full $\mathcal{SROIQ}$.
- **OWL 2 Full.** RDF compatibility; undecidable.

Choose profile by use case.

## Limits

- **Decidability ceiling.** OWL 2 DL is decidable
  but high-complexity.
- **OWA confusion.** Users frequently expect
  closed-world.
- **Punning.** OWL 2 allows same name as class and
  individual; semantics subtle.
- **Expressiveness gaps.** Many natural patterns
  not directly expressible.

## Status

Standard formalism for ontology axioms. Production
deployment via reasoners. Active research on
extensions and reasoning improvements.
