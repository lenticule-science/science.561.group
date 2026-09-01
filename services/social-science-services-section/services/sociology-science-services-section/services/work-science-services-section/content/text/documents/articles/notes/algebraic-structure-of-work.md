---
title: "The Algebraic Structure of Work: Free Algebras, Ground Terms, and Operational Signatures"
date-created: 2026-04-03
description: "How universal algebra formalizes the work taxonomy — operations as signatures, work as term application, work units as ground terms, and the settlement path as substitution closure."
---

The [work taxonomy](../terms/work.md) distinguishes operations, work, and work units by their degree of specification. This text shows that the same distinction has a precise formalization in universal algebra: operations are signatures, work is term application, work units are ground terms, and the settlement of open work into determined work is the closure of free variables by substitution.

## The operational signature

Given a signature $\Sigma$ — a set of operation symbols, each with an arity — the work domain defines the operations available. An operation symbol $\omega \in \Sigma$ with arity $n$ is the abstract type: "review" is a binary operation (takes a reviewer and a document), "write" is a binary operation (takes a writer and a topic), "dispatch" is a ternary operation (takes a task, an agent, and a capability check).

The hierarchy:

- **Operation** is an operation symbol $\omega \in \Sigma$ with arity $n$ — the abstract type
- **[Work](../terms/work.md)** is an application $\omega(a_1, \ldots, a_n)$ where the $a_i$ may be variables — the operation being enacted
- **[Work unit](../terms/work-unit.md)** is a ground application $\omega(c_1, \ldots, c_n)$ where every $c_i$ is a closed, concrete value — the fully determined instance

## Free algebras and terms

Given a signature $\Sigma$ and a variable set $X$, the **free algebra** $T(\Sigma, X)$ is the set of all well-formed terms built from operation symbols in $\Sigma$ and variables in $X$. A **ground term** is an element of $T(\Sigma, \emptyset)$ — the free algebra with no variables. Every symbol in a ground term is bound to a concrete value; nothing is left open.

A work unit is a ground term in $T(\Sigma, \emptyset)$. It names exactly one invocation of exactly one operation on exactly specified inputs. Two work units with the same operation but different parameter values are different ground terms and therefore different work units.

A work description with free variables — "review [some document] by [some date]" — is an open term in $T(\Sigma, X)$. It is a template, not a work unit. Templates are what skill definitions and task descriptions typically look like before they are fully specified.

## Substitution as settlement

The act of binding free variables is a **substitution** $\sigma: X \to T(\Sigma, \emptyset)$ — a map from variables to ground terms. Applying $\sigma$ to an open term closes it: the result is a ground term (a work unit).

This is exactly the settlement path applied to work:

| Work type | Algebraic characterization |
|-----------|---------------------------|
| [Inquiry](../terms/inquiry.md) | Open term with unbound operation AND arguments — $\omega$ and $a_i$ both contain variables |
| [Derivation](../terms/derivation.md) | Operation is determined but arguments have free variables — $\omega$ is fixed, some $a_i \in X$ |
| [Procedure](../terms/procedure.md) | All arguments are bound but execution admits branching — ground term, but the operation's semantics include choice points |
| [Process](../terms/process.md) | Fully ground term with deterministic semantics — $\omega(c_1, \ldots, c_n) \in T(\Sigma, \emptyset)$ with no branching |

The settlement of inquiry → derivation → procedure → process corresponds to the progressive application of substitutions that close variables. Each substitution step commits to more, reducing the degrees of freedom in the term.

## Structure of a work unit

Every work unit is characterized by four components, corresponding to the ground term's structure:

- **takes**: the input type — what goes in (the domain of the operation)
- **affected**: which aspect of the input changes (the field being modified, not the whole carrier)
- **operation**: the operation symbol $\omega$ being invoked (references a skill or names the operation directly)
- **parameters**: the concrete values $c_1, \ldots, c_n$ instantiating this invocation — what closes the open term into a ground term

A work unit without fully specified parameters is not yet a work unit; it is an open term awaiting substitution.

## Compositionality

Because the work hierarchy is built on a free algebra, it inherits the free algebra's compositionality: complex work composes from simpler work units in exactly the ways the signature permits. A [workflow](../terms/workflow.md) is a composite term — a structured expression in $T(\Sigma, X)$ where some subterms may themselves be compound operations. The fact that this composition is free (no equations imposed beyond the signature) means that work units compose without side conditions: any well-typed composition is valid.

When the system imposes equations — "review must happen after drafting," "dispatch requires capability matching" — those equations define a quotient of the free algebra. The quotient algebra $T(\Sigma, X) / E$ is the algebra of work *modulo the system's constraints*. This is the formal content of what plan dependencies encode: each `depends-on` constraint is an equation in the quotient.

## Open questions

- Whether work unit parameters correspond to the substitution $\sigma: X \to T(\Sigma, \emptyset)$ in the free algebra — whether parameterization is formally a substitution homomorphism.
- Whether a work unit IS the Term kind for executable work, making the term/work-unit distinction a typing distinction within $T(\Sigma, \emptyset)$.
- Whether the settlement path (inquiry → process) has a lattice structure isomorphic to the lattice of congruences on the free algebra — whether "settling" a work type is the same as imposing equations that quotient the term algebra.
- Whether the `depends-on` graph of a plan generates the congruence that defines the quotient algebra of that plan's work — whether plan structure and algebraic structure are the same thing.

## See also

- [work](../terms/work.md) — the base concept
- [work unit](../terms/work-unit.md) — the ground term concept this text formalizes
- [Formal Planning Theory](./formal-planning-theory.md) — the AI planning formalism for the plan concept
- [Work Type Classification Survey](./work-type-classification-survey.md) — how work types are classified across disciplines
