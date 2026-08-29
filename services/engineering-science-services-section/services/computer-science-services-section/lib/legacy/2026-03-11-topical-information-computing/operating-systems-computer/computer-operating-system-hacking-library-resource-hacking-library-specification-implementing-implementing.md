---
title: "Implementing"
description: "Implementation is a relation C implements A — concrete structure C implements abstract specification A — asserting that there exists a retrieve function R: States(C) → States(A) such that R maps every valid concrete state to a valid abstract state and every concrete operation of C is a refinement of the corresponding abstract operation of A under R. The defining structure: implementation crosses the abstraction boundary from specification to realization; it is not just refinement (which relates two specifications at the same level) and not just satisfaction (which is a logical truth relation). Implementation provides a structural witness — the retrieve function — that shows how the concrete representation realizes the abstract one. The retrieve function is the mathematical certificate of implementation."
defines: Implementing
related: Refines, Satisfies, Extends, DataAbstraction, AbstractDataType, RetrieveFunction
date-created: 2026-03-20
---

## Formal definition

**Implementation** is a relation $C \text{ implements } A$ between a **concrete structure** $C$ and an **abstract specification** $A$:

$$C \text{ implements } A \quad\text{iff}\quad \exists\; R : \mathrm{States}(C) \to \mathrm{States}(A) \text{ (retrieve function) s.t. Conds 1–3}$$

where: - $A$ is the **abstract specification** — a description of a data type or system in terms of abstract values, abstract state, and abstract operations; $A$ specifies **what** the system does, not **how** it does it; $A$'s state space may be mathematically idealized (e.g., abstract stacks as mathematical sequences) and its operations may be specified axiomatically or as abstract functions - $C$ is the **concrete realization** — a data structure, program, or system that provides actual computational representations of $A$'s abstract values and actual implementations of $A$'s operations; $C$'s state space uses concrete representations (arrays, linked lists, hash tables) and its operations are executable procedures - $R : \mathrm{States}(C) \to \mathrm{States}(A)$ is the **retrieve function** (or **abstraction function**) — a function mapping each concrete state $c \in \mathrm{States}(C)$ to the abstract state $R(c) \in \mathrm{States}(A)$ that $c$ represents; $R$ is the mathematical certificate of implementation: it shows exactly how the concrete representation relates to the abstract specification

**Three conditions** for $R$ to witness a valid implementation:

1. **Representation invariant coverage**: every state $c \in \mathrm{States}(C)$ that satisfies the concrete representation invariant $\mathrm{inv}_C$ has $R(c) \in \mathrm{States}(A)$ satisfying the abstract invariant $\mathrm{inv}_A$.
  The concrete representation must encode only valid abstract states — no concrete state outside the representation invariant's scope is required.

2. **Operation commutativity**: for each abstract operation $f_A : \mathrm{States}(A) \to \mathrm{States}(A)$ and its corresponding concrete operation $f_C : \mathrm{States}(C) \to \mathrm{States}(C)$:

$$R(f_C(c)) = f_A(R(c))$$

Executing the concrete operation and then abstracting (via $R$) gives the same result as abstracting first and then executing the abstract operation.
The concrete operation faithfully implements the abstract one through $R$.

3. **Initialization**: the concrete initial state $c_0$ corresponds to the abstract initial state: $R(c_0) = a_0$ where $a_0$ is the abstract specification's initial state.
  The implementation starts in the right abstract state.

**The retrieve function is not required to be injective**: multiple concrete states may represent the same abstract state (e.g., two different memory layouts representing the same list).
This is the essential flexibility that makes implementation more than isomorphism — the concrete representation may be more redundant, more detailed, or differently organized than the abstract one.

## Hoare: proof of correctness of data representations

C.A.R. Hoare (*Proof of Correctness of Data Representations*, 1972, *Acta Informatica*) gave the first formal treatment of data abstraction and implementation:

Hoare's paper establishes the following framework for proving that a concrete data representation correctly implements an abstract specification:

An **abstract type** is defined by: - An **abstract state space** $A$ (e.g., mathematical sequences for a stack) - Abstract **operations** with pre/postconditions in terms of $A$ (e.g., $\mathrm{push}(a, s) = a :: s$; $\mathrm{pop}(a :: s) = (a, s)$) - An **abstract invariant** $I_A \subseteq A$ (conditions that always hold)

A **concrete representation** is defined by: - A **concrete state space** $C$ (e.g., arrays with a top pointer for a stack) - Concrete **operations** (executable procedures) - A **representation invariant** $I_C \subseteq C$ (conditions the array representation always satisfies) - A **retrieve function** $R : I_C \to I_A$ mapping valid concrete states to abstract states

**Proof obligations** for the implementation: 1. $I_C$ is established by the concrete initialization: the initial concrete state satisfies $I_C$ 2. $I_C$ is maintained by each concrete operation: if $c \in I_C$ before, then $f_C(c) \in I_C$ after 3.
Each concrete operation $f_C$ correctly implements $f_A$ via $R$: the Hoare triple $\{I_C(c) \wedge R(c) = a\}\; f_C \;\{R(c') = f_A(a)\}$ holds

Hoare's framework established that correctness of data representations is provable by finding a retrieve function — a mathematical object that witnesses the correspondence between abstract and concrete.
This was the foundation of all subsequent work on data abstraction verification.

## Liskov and Guttag: abstract data types and abstraction functions

Barbara Liskov and John Guttag (*Abstraction and Specification in Program Development*, 1986) developed **abstract data types** (ADTs) as the programming language realization of Hoare's abstract/concrete distinction:

An **ADT specification** consists of: - A type name $T$ - An **overview** describing the abstract value the type represents - **Operations** with pre/postconditions specified in terms of the abstract value - An **abstraction function** $AF : \mathrm{rep} \to T$ mapping concrete representations to abstract values

The **representation invariant** $\mathrm{RI} : \mathrm{rep} \to \mathrm{Bool}$ specifies which concrete states are valid representations of abstract values.
Only states satisfying $\mathrm{RI}$ are subject to the abstraction function.

**The abstraction function is partial**: it is defined only on states satisfying $\mathrm{RI}$.
Outside $\mathrm{RI}$, the concrete state has no abstract meaning — it is an invalid intermediate state.
Operations must maintain $\mathrm{RI}$ (implementation invariant) and must commute with $AF$ (implementation correctness).

Liskov and Guttag introduce **benevolent side effects** — operations that appear to modify the concrete representation but leave $AF(\mathrm{rep})$ unchanged (e.g., a caching operation).
Benevolent side effects are permitted: they change the concrete state while preserving the abstract value.
This formalizes the implementation principle that multiple concrete states may represent the same abstract value.

## Reynolds and abstraction in type systems

John Reynolds (*Types, Abstraction and Parametric Polymorphism*, 1983) showed that the retrieve function / abstraction function has a deep connection to the semantics of polymorphic types:

A **representation independence** theorem: if a module $M$ with abstract type $T$ uses representation $C$ internally and exports $T$ via operations with the abstraction function $AF : C \to T$, then any two implementations $C_1$ and $C_2$ with abstraction functions $AF_1$ and $AF_2$ that satisfy the same abstract specification are **related by** a logical relation — the relation induced by the abstraction function.
No client code can distinguish $C_1$ from $C_2$, because the type system ensures all client accesses go through the abstract operations.

This is the **abstraction theorem** for modules: information hiding (encapsulation of the concrete representation) is enforced by the type system, and the retrieve function is the mathematical content of what is being hidden.
The module's abstract interface exposes only $T$; the concrete representation $C$ is inaccessible to clients.

Reynolds' paper connects data abstraction to relational parametricity: the abstraction function $AF$ defines a binary relation on values of type $T$, and well-typed programs respect this relation — they cannot distinguish elements of $T$ that are $AF$-related.

## Open questions

- Whether the retrieve function $R : \mathrm{States}(C) \to \mathrm{States}(A)$ is required to be a surjection (every abstract state has a concrete representation) or only a partial surjection (some abstract states may be unrepresentable), and whether this choice affects the theory of data refinement for non-terminating systems.
- Whether implementation in the sense of the retrieve function corresponds to a morphism of sheaves in $\mathbf{Sh}(T, J)$ — whether the retrieve function $R$ is a natural transformation between the presheaves representing $C$ and $A$, making implementation a morphism in the category of sheaves.
- Whether Liskov's behavioral subtyping (the Liskov Substitution Principle) and Hoare's data refinement are the same concept at different levels — whether behavioral subtyping is implementation relative to the behavioral specification, and whether the retrieve function in data refinement corresponds to the simulation relation in behavioral subtyping.
