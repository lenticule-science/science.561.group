---
name: "Lambda calculus"
date-created: 2025-09-17
---


The **lambda calculus** is a formal system for expressing computation through function abstraction and application. Its core syntax consists of variables, abstractions such as $\lambda x.M$, and applications such as $M\,N$.

Computation proceeds primarily by beta reduction: applying $(\lambda x.M)$ to an argument $N$ replaces the free occurrences of $x$ in $M$ with $N$. The [untyped lambda calculus](./untyped-lambda-calculus.md) permits unrestricted application, while typed variants constrain terms with systems such as the [simply typed lambda calculus](./simply-typed-lambda-calculus.md) and dependent type theory.

Lambda calculus is foundational to programming-language semantics, computability theory, proof theory, and the Curry–Howard correspondence.

## Derived from traces

In the relationality derivation the λ-calculus is not stipulated but reached, at the predicating stage ([predication](predication.md)), from the [trace](trace.md):

- **Terms.** Binding a name at a trace's head seeds a term. A bound name presenting its head is a **variable**; the remainder after the head is a **body**; a body that returns to its context is a **function**; a function paired with a further head is an **application**.
- **Fixed points.** Application can apply a term to itself, and self-application yields the **least fixed-point term** and, dually, the **greatest fixed-point term** ($\mu$ and $\nu$; see [fixpoint](fixpoint.md)).
- **Types.** Types are seeded where a recognized context meets a bound term; variables, applications, weakening and the greatest fixed point each get a typing step, and binders are transported through contexts. Terms are typed by [judgements](typing-judgment.md).
- **Computation.** [Substitution](substitution.md) and application together give **reduction** ([β-reduction](beta-reduction.md)); stepping reduction along the whole trace gives **normalization**; the head of a normalized trace is a candidate **value**, and the values are what its tail collects. **Evaluation contexts** are built from the head and tail of a stepping trace, so evaluation proceeds inside a context rather than anywhere at once.
- **Equivalence.** Two recognitions are **eventually equivalent** when iterating the reflex step brings them to the same place in context. This is observational equivalence reached by iteration, and it is reflexive, symmetric and transitive along the trace; two contexts are equal when normalization identifies them.

Obsmetrologia proves the simply typed fragment confluent and cartesian closed ([Curry–Howard–Lambek](curry-howard-translation.md)).
