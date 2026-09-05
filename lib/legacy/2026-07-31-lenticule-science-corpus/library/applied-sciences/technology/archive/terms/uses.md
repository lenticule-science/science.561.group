---
id: uses
description: "Use is a relation O uses R — operation O uses resource R — asserting that O requires R as a necessary ingredient for its correct functioning: O cannot supply its own function correctly unless R supplies its function correctly. The defining structure: use is necessary dependency — not mere reference or documentation, but active reliance. Use is the coarsest of the operation-resource relations: reads, writes, consumes, takes, and produces are all refinements of uses that specify the access mode. The core formal content is Parnas's USES relation (1979): A USES B iff the correct functioning of A depends on the correct functioning of B."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  operation: relational-universe-morphism
  dependency: relational-universe
output: relational-universe-morphism
ast:
  necessary-dependency:
    - operation
    - dependency:
        - correct-functioning:
            - operation
            - dependency
---

# Uses

## Formal definition

**Use** is a relation $O \text{ uses } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ResourceType})$$

holding when $O$ requires an instance $r : R$ for its correct functioning — $O$ cannot supply its function correctly unless $r$ supplies its function correctly.

**One invariant.** $O \text{ uses } R$ iff:

1. **Necessary ingredient**: $R$ is an active ingredient of $O$'s correct operation, not merely a passive reference. Correct functioning of $O$ depends on correct functioning of $R$: if $R$ is absent, faulty, or incorrectly specified, $O$ will fail to supply its function. Use is transitive in the dependency-correctness sense but not necessarily in the structural sense: if $O$ uses $R$ and $R$ uses $S$, then $O$'s correctness depends (transitively) on $S$'s correctness, even if $O$ does not directly reference $S$.

Use is the **coarsest** of the resource relations: $O \text{ reads } R$ implies $O \text{ uses } R$; $O \text{ writes } R$ implies $O \text{ uses } R$; $O \text{ consumes } R$ implies $O \text{ uses } R$; $O \text{ produces } R$ does not imply $O \text{ uses } R$ (creating $R$ does not require $R$ to already function). The converse does not hold: use does not specify access mode or lifecycle impact.

## Parnas: the USES relation and modular decomposition

David L. Parnas (*Designing Software for Ease of Extension and Contraction*, IEEE Transactions on Software Engineering, 1979): the **USES relation** on program modules defines the dependency partial order that structures decomposable systems. "$A$ USES $B$" means: the correct functioning of $A$ depends on the availability of a correct implementation of $B$.

The USES relation determines **level structure**: the levels of a system are defined by the longest USES-chain below each module. Level-0 modules use no other modules; level-$k$ modules use only modules at levels below $k$. A well-structured system has a shallow USES hierarchy — few levels — enabling incremental delivery (levels 0, 1, … each independently testable).

Parnas's key insight: the USES relation is an architectural decision, not a derivable property of code. Choosing which modules USE which others determines the system's extension/contraction properties. A module that USEs few others can be replaced without cascading changes; a module that is USED by few others can be removed without cascading failures.

The distinction from the **IS-COMPONENT-OF** relation: IS-COMPONENT-OF describes physical containment; USES describes functional dependency. A module may be a component of a subsystem without using it, and may use a module outside its subsystem.

## Harary and Liskov: dependency graphs and data abstraction

Frank Harary (*Graph Theory*, 1969): the USES relation defines a **directed graph** on modules. The **strongly connected components** of this graph identify circular dependencies — modules that mutually USE each other and cannot be separately tested or deployed. A good modular design has a **directed acyclic graph** (DAG) as its USES structure: the absence of cycles ensures that each module can be understood independently of those that use it.

Barbara Liskov and John Guttag (*Abstraction and Specification in Program Development*, 1986): in abstract data type (ADT) design, a type $A$ **uses** type $B$ when the operations of $A$'s interface are specified in terms of $B$'s values or operations. The abstraction function $AF : C \to A$ (mapping concrete to abstract) relies on the correct functioning of all types the abstract type uses. An ADT's **specification** is correct only relative to the specifications of the types it uses.

## W3C PROV: provenance and use

The **W3C PROV Data Model** (Moreau, Missier, et al., 2013): the relation `prov:used` links an **Activity** to an **Entity** it used. An activity $a$ `prov:used` an entity $e$ means $e$ was used in the execution of $a$ — $e$'s value was consumed or read as part of $a$'s operation. This is the provenance-graph counterpart of the USES relation: PROV tracks which entities (resources) were used by which activities (operations), enabling reconstruction of causal history.

The **PROV-DM** usage model: a usage record $(a, e, t)$ asserts that activity $a$ used entity $e$ at time $t$. Multiple usages of the same entity by different activities are separately recorded. The usage graph is the provenance trace of a computation; reconstructing it from the PROV-DM records recovers the USES relation of the executed system.

## UML dependency and component models

The **UML dependency arrow** ($A \dashrightarrow B$, «use» stereotype): component $A$ depends on component $B$ — a change to $B$'s interface or behavior may require changes to $A$. The UML «use» dependency is the notational counterpart of Parnas's USES relation at the model level. Required interfaces on UML components make the dependency explicit: a component exposes a required interface slot $\langle\!\langle \text{use} \rangle\!\rangle$ that names the types it needs to use.

**OSGi and service registries**: in component frameworks (OSGi, Spring), a component declares its **service dependencies** — the types it requires for injection. A component is only activated when all its declared dependencies are available. Use-as-dependency is the architectural primitive of injection frameworks: the dependency injection container resolves the USES relation at runtime by wiring providers to consumers.

## Open questions

- Whether the USES relation has a categorical representation — whether $O \text{ uses } R$ corresponds to $O$ being a morphism in a slice category over $R$, or to $O$ being in the image of a functor that factors through $R$'s type, and whether the coarseness of use (subsuming reads, writes, consumes) corresponds to a forgetful functor from the category of typed resource accesses to the underlying dependency category.
- Whether the transitivity of use (correct functioning depends transitively on all transitive dependencies) is compatible with abstraction barriers — whether hiding the USES relation behind an abstract interface (so that users of $A$ need not know that $A$ uses $B$) formally corresponds to a factoring of the correctness dependency through the abstract specification of $A$, shielding the transitivity from external observers.
