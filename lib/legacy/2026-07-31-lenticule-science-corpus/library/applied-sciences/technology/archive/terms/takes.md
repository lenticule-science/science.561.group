---
id: takes
description: "Taking is a relation O takes R — operation O takes resource R as input — asserting that O receives R as a named structural parameter: R is passed to O, O may use R in any way (read, write, or consume), and R's lifecycle after O depends on O's type. The defining structure: taking specifies the input interface — what the operation receives as a named parameter — without specifying the access mode (read-only, modifiable, or destructive). Taking is the most general input relation; reads, writes, and consumes are all refinements of takes that specify the access mode. Taking corresponds to a function's domain: the type of values that must be supplied to invoke the operation."
defines: Takes
related: Reads, Writes, Consumes, Produces, Returns, Uses, FunctionDomain, LinearLogic
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  operation: relational-universe-morphism
  parameter-type: relational-universe
output: relational-universe-morphism
ast:
  function-parameter:
    - operation
    - parameter-type:
        - domain-of:
            - operation
---

# Takes

## Formal definition

**Taking** is a relation $O \text{ takes } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ParameterType})$$

holding when $R$ is a named input parameter of $O$ — $O$ cannot execute without an instance $r : R$ being supplied as input.

**One invariant.** $O \text{ takes } R$ iff:

1. **Parameter necessity**: $O$ requires an instance of $R$ as a named input to execute. Taking is a necessary-input relation: not merely that $O$ could use $R$ in principle, but that $O$'s interface specifies $R$ as a parameter that must be supplied. The mode of use (read, write, consume) is additional information beyond taking.

Taking is the **coarsest** of the input relations: $O \text{ reads } R$ implies $O \text{ takes } R$; $O \text{ writes } R$ implies $O \text{ takes } R$; $O \text{ consumes } R$ implies $O \text{ takes } R$. The converse does not hold: taking does not specify the access mode.

## Lambda calculus: function domains

Alonzo Church (*The Calculi of Lambda-Conversion*, 1941): in typed lambda calculus, a function $f : A \to B$ **takes** an argument of type $A$ — $A$ is the domain. The application $f\; a$ requires $a : A$. The function $f$ takes $A$ in the broadest sense: it requires an instance of $A$ without specifying whether $a$ is consumed (as in linear lambda calculus) or shared (as in classical lambda calculus).

In **linear lambda calculus** (the lambda calculus corresponding to linear logic): taking is disambiguated by the type:
- $f : A \multimap B$ takes and consumes $A$
- $f : !A \multimap B$ takes and reads $A$ (non-destructively)
- $f : A \otimes B \multimap C$ takes both $A$ and $B$

In **dependent type theory** (Martin-Löf 1984): a function $f : \Pi_{x:A} B(x)$ takes an argument $x : A$ and produces a result of type $B(x)$ (which may depend on $x$). Taking is the domain of the dependent function type.

## Separation logic: pre-heap assertions

In separation logic, an operation $O$ **takes** heap cells by requiring them in the precondition. The Hoare triple $\{x \mapsto v\}\; O\; \{Q\}$ asserts that $O$ requires exclusive ownership of $x$ pointing to $v$ as input. Taking $x$ means requiring the points-to assertion $x \mapsto v$ in the precondition.

The access mode is determined by the postcondition: if the postcondition retains $x \mapsto v'$ for some $v'$ (possibly unchanged), the operation writes/reads $x$; if the postcondition has $\mathrm{emp}$ for $x$'s position, the operation consumed $x$.

## Atkey: quantitative type theory and usage grades

Robert Atkey (*Syntax and Semantics of Quantitative Type Theory*, LICS 2018) makes the precise relationship between taking and its refinements rigorous. In quantitative type theory, every binding $x :_\rho A$ carries a **usage grade** $\rho$ from a semiring $\{0, 1, \omega\}$:

- $\rho = 0$: the parameter is declared but not accessed — it is taken but never used (weakening)
- $\rho = 1$: the parameter is consumed — taken and used exactly once (linear take)
- $\rho = \omega$: the parameter may be accessed freely — taken and readable any number of times (unrestricted take)

$O \text{ takes } R$ without further specification corresponds to the **generic grade** — the parameter appears in $O$'s signature with some grade $\rho \in \{0, 1, \omega\}$ not yet specified. The refinements are:
- $O \text{ consumes } R$: grade $\rho = 1$
- $O \text{ reads } R$: grade $\rho = \omega$
- Grade $\rho = 0$ is the limiting case where the parameter is declared but unused

Taking is the generic binder before grade annotation. The grade lattice \$0 \leq 1$ and \$0 \leq \omega$ (with \$1$ and $\omega$ incomparable) orders the access modes by specificity: taking is below both consuming and reading in the information order.

In Rust's ownership system — a practical implementation of linear types — taking manifests as receiving a value as a parameter:
- Take with grade 1 (consume): `fn f(x: T)` — value moved in, caller loses ownership
- Take with grade ω (read): `fn f(x: &T)` — shared borrow, caller retains ownership
- Take with grade ω exclusive (write): `fn f(x: &mut T)` — exclusive borrow, caller retains ownership but no others may access during the call

## Open questions

- Whether "takes" should be separated into "takes-for-reading" vs "takes-for-consuming" in a type system at the parameter declaration level, rather than inferred from the access pattern — and whether Atkey's grade annotation is the right mechanism or whether more expressive grading semirings (e.g., $\{0, 1, \omega, \omega^2, \ldots\}$ for bounded-use resources) are needed.
- Whether taking corresponds to a coend in category theory — whether $O \text{ takes } R$ means $O$ is a profunctor with $R$ in the contravariant position, and whether the various access modes (grades) correspond to different strengths of profunctor morphism or different enrichments of the profunctor category.
