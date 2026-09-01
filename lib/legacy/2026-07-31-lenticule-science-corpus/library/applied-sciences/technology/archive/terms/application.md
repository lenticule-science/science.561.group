---
id: application
description: "An Application is a pair (f, a) — a function f: A → B and an argument a ∈ A — together with the result f(a) ∈ B that the application produces. The defining structure: application is the fundamental computational act of instantiating a function at a specific argument. Application is not the function itself (which is the general rule), not the argument (which is the input), and not the result alone (which is the output). It is the act of pairing rule with instance, producing the result f(a). Application is what makes a function operational — a function is a potential; an application is the actualization of that potential at a specific point."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  function: relational-universe-morphism
  argument: relational-universe
output: relational-universe
ast:
  function-argument-pair:
    - function:
        - argument
    - result:
        - function
        - argument
---

# Application

## Formal definition

An **Application** is a triple $(f, a, b)$:

$$(f : A \to B,\; a \in A,\; b = f(a) \in B)$$

where:
- $f : A \to B$ is the **function** — the rule that the application enacts; $f$ specifies for each possible argument $a \in A$ what the result $f(a) \in B$ will be; the function is a general specification, not yet tied to any particular argument
- $a \in A$ is the **argument** — the specific input at which the function is instantiated; $a$ is drawn from the domain $A$ of $f$; the argument determines which of $f$'s many possible input-output pairs is actualized
- $b = f(a) \in B$ is the **result** — the output produced by applying $f$ to $a$; $b$ is uniquely determined by $f$ and $a$ (for a function: no choice, no branching, no non-determinism); the result is the application's contribution to the ambient computation

**One invariant.** $(f, a, b)$ is an application iff:

1. **Functional uniqueness**: $b = f(a)$ is the unique element of $B$ assigned to $a$ by $f$. A function assigns exactly one output to each input; application enacts this assignment for a specific input. The uniqueness is what distinguishes application from a relation (which may assign multiple outputs) and from a nondeterministic choice (which selects from a set of candidates). This invariant is not a separate condition imposed on applications but is constitutive of the concept: an application that produces two different results from the same function and argument would not be an application but a different computational concept.

## Church and lambda calculus

Alonzo Church (*An Unsolvable Problem of Elementary Number Theory*, 1936; *The Calculi of Lambda-Conversion*, 1941) defined the **lambda calculus** — the formal system in which application is the fundamental computation step alongside abstraction.

Lambda calculus has two constructors for terms:
- **Abstraction**: $\lambda x.e$ — defines a function with parameter $x$ and body $e$
- **Application**: $e_1\; e_2$ — applies term $e_1$ (as function) to term $e_2$ (as argument)

The **$\beta$-reduction rule** defines what application computes:

$$(\lambda x.e_1)\; e_2 \;\longrightarrow_\beta\; e_1[e_2/x]$$

Applying the function $\lambda x.e_1$ to argument $e_2$ substitutes $e_2$ for $x$ throughout $e_1$. This single rule is the complete computational content of lambda calculus — all computable functions arise from iterated $\beta$-reduction.

**Church's thesis** (combined with Turing's): lambda calculus captures all effective computation. The $\lambda$-definable functions and the Turing-computable functions are the same class. Application ($\beta$-reduction) is not just a notational device — it is the universal computational step.

**$\alpha$-equivalence**: terms differing only in bound variable names are identical ($\lambda x.x = \lambda y.y$). **$\eta$-equivalence**: $\lambda x.(f\; x) = f$ when $x$ does not occur free in $f$ — a function is equal to the abstraction of its own application. Together with $\beta$, these form the equational theory of lambda calculus.

## Curry: combinatory logic and application without variables

Haskell B. Curry (with Robert Feys, *Combinatory Logic*, 1958; building on Schönfinkel 1924) developed **combinatory logic** — a presentation of functional computation using application but no variables or abstraction. All computation is expressed through two basic combinators:

- $\mathbf{K}\; x\; y = x$ — the constant combinator (ignores second argument)
- $\mathbf{S}\; x\; y\; z = x\; z\; (y\; z)$ — the composition combinator (distributes argument)

Every lambda term has a translation into combinatory logic; combinatory logic is equi-expressive with lambda calculus. The key insight: in combinatory logic, **application is the only operation** — there is no abstraction, no variables, no scoping. The computational content of lambda calculus is exactly the content expressible through iterated application of combinators.

**Currying**: in combinatory logic (and standard functional programming), a multi-argument function $f : A \times B \to C$ is represented as a curried function $f : A \to (B \to C)$ — applying $f$ to $a$ produces a new function $f(a) : B \to C$ waiting for the second argument. Application is thus iterated: $(f\; a)\; b = f(a, b)$. This representation makes application the universal interface: every function takes exactly one argument and returns either a result or a new function.

## Reynolds and relational parametricity

John C. Reynolds (*Types, Abstraction and Parametric Polymorphism*, 1983) introduced **relational parametricity** — the study of what universally quantified types guarantee about application behavior.

For a polymorphic function $f : \forall A. F(A)$, relational parametricity says: for every relation $R \subseteq A \times A'$, if $a \mathrel{R} a'$ then $f(a) \mathrel{R'} f(a')$ where $R'$ is the relation on $F(A)$ induced by $R$. The function $f$ applies uniformly across all types — it cannot inspect the type of its argument, only apply the operations available to $F$.

Reynolds' **abstraction theorem**: the behavior of a polymorphic function under application is entirely determined by its type. If the type says "works for all $A$", the function must work relationally — it cannot distinguish between related arguments. This gives **free theorems** (Wadler 1989): just from the type of a function, one can derive theorems about how application of that function behaves, without ever inspecting its definition.

Relational parametricity transforms the question "what does applying this function do?" into a question about types and relations — making application behavior a consequence of type structure rather than a property that must be separately proved.

## Categorical application: morphism composition

In category theory, **application** corresponds to **morphism composition** $g \circ f : A \to C$ where $f : A \to B$ and $g : B \to C$. Applying $f$ to $a : A$ yields $f(a) : B$; applying $g$ to $f(a)$ yields $g(f(a)) : C$. The composite $g \circ f$ represents the sequential application.

In a **cartesian closed category** (CCC), application is a morphism $\mathrm{eval} : (A \Rightarrow B) \times A \to B$ — the evaluation map. The universal property of CCCs says: every morphism $f : C \times A \to B$ factors uniquely through $\mathrm{eval}$ via its **curried form** $\lambda f : C \to (A \Rightarrow B)$. This is the categorical statement of currying: application and abstraction are adjoint operations.

The **Curry-Howard-Lambek correspondence** makes application triply interpreted: it is function application (type theory), modus ponens (logic), and morphism composition (category theory). A single application step corresponds simultaneously to applying a program, applying a proof rule, and composing a morphism.

## Open questions

- Whether the operational content of application ($\beta$-reduction) and the denotational content (function application in a domain) always agree — whether the computational and mathematical notions of application are always coherent, or whether there are models in which $\beta$-reduction steps and semantic equality diverge (as in untyped lambda calculus with $\delta$-rules for arithmetic).
- Whether application in higher-dimensional type theory (cubical type theory, HoTT) has a richer structure than in simple type theory — whether applying a function to a path (proof of equality) should itself produce a path, and whether this path-application is the right higher-dimensional generalization.
- Whether relational parametricity (Reynolds) extends to effects — whether a program that applies a function with side effects can have its behavior characterized by the type alone, or whether effect annotations in the type are required to recover the abstraction theorem.
- Whether categorical evaluation $\mathrm{eval} : (A \Rightarrow B) \times A \to B$ in the topos $\mathbf{Sh}(T, J)$ has a natural interpretation in the relational universe — whether applying a morphism of the history presheaf to an element of the domain presheaf produces the right element of the codomain presheaf at each history, and whether this is the universal property of the exponential sheaf.
