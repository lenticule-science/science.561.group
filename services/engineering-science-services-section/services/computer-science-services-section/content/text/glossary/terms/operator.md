---
name: "Operator"
aliases: [operators]
description: "A computing operator is a mathematical operator realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources and whose action is given by a procedure rather than by an existence claim."
instance-of: operator
specializes: operator
date-created: 2026-04-27
references:
  turing1936:
    authors: ["Alan M. Turing"]
    title: "On Computable Numbers, with an Application to the Entscheidungsproblem"
    publication: "Proceedings of the London Mathematical Society s2-42"
    year: 1936
    note: "computable functions as the operators of an idealised machine"
  church1936:
    authors: ["Alonzo Church"]
    title: "An Unsolvable Problem of Elementary Number Theory"
    publication: "American Journal of Mathematics 58(2)"
    year: 1936
    note: "lambda-calculus operators (abstraction, application)"
  plotkin1981:
    authors: ["Gordon D. Plotkin"]
    title: "A Structural Approach to Operational Semantics"
    publication: "DAIMI FN-19, Aarhus University"
    year: 1981
    note: "operators given by structural inference rules over typed terms"
  pierce2002:
    authors: ["Benjamin C. Pierce"]
    title: "Types and Programming Languages"
    publication: "MIT Press"
    year: 2002
---

A **computing operator** is a mathematical [operator](../../../../../../humanities/domains/math/terms/operator.md) realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources, and whose action is given by a procedure rather than by an existence claim. A computing operator is a specialisation of the broader mathematical notion — its sub-support is exactly the cases in which the transformation is effectively executable.

## What computing adds to the math

Three constraints distinguish a computing operator from an arbitrary mathematical operator.

**Effective computability.** The operator must be given by a procedure that can be carried out in finite steps without appeal to an oracle, completed search of an infinite space, or other non-constructive resource. Turing (1936) and Church (1936) independently fixed this requirement: a computing operator is a Turing-computable (equivalently, $\lambda$-definable) function on its representable inputs.

**Representability.** The source and target must admit a finite encoding. An operator on the real numbers, in the math sense, has continuum-sized source and target; the *computing* operator on the reals is the operator on a finite representation (floating-point numbers, computable reals à la Weihrauch, exact arithmetic over algebraic closures) — the underlying math operator restricted to the representable sub-support.

**Typing and operational semantics.** A computing operator is typed: its arity is fixed and its inputs are tagged with the types it accepts. Its action is given by inference rules in the style of Plotkin (1981) — small-step or big-step rules that say how the operator reduces on each shape of input — rather than by a defining equation that may have no procedure for evaluation. Pierce (2002) is the standard reference for the typing-and-rules combination as a modern foundation for operators in programming languages.

## Why this is a specialisation of math operator

The mathematical operator (in any of its three senses — functional-analytic, categorical, algebraic) need not be effectively computable. The Hilbert-space operator that projects onto the closure of the rationals in $\mathbb{R}$ is a perfectly good linear operator; the corresponding computing operator does not exist, because no finite procedure can decide for an arbitrary real whether it is rational. The computing operator inherits its source/target/structure-preservation from the math operator and adds the three constraints above. The induced restriction map (in the predicate-fiber sense) takes a math operator and yields the computing operator on the sub-support where the constraints are satisfied; the computing operator does not exist on the rest.

## Composition and the typed term

Computing operators compose along their types: if $f: A \to B$ and $g: B \to C$ are both computing operators, then so is $g \circ f: A \to C$, and its evaluation procedure is the sequencing of the two procedures. This makes the typed-operator family a category in the categorical sense — and the corresponding category of computing operators is *the* setting in which a programming language, a proof assistant, or an algebraic specification is studied.

## See Also

- [operator](../../../../../../humanities/domains/math/terms/operator.md) — the mathematical notion this specialises
- type — what fixes the operator's arity and acceptable inputs
- computation — the activity computing operators are the units of

---

## Additional formulation

```yaml
---
name: "Operator"
aliases: [operators]
description: "A computing operator is a mathematical operator realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources and whose action is given by a procedure rather than by an existence claim."
instance-of: operator
specializes: operator
date-created: 2026-04-27
references:
  - id: turing1936
    type: document
    title: On Computable Numbers, with an Application to the Entscheidungsproblem
    note: computable functions as the operators of an idealised machine
    author:
      - literal: Alan M. Turing
    container-title: Proceedings of the London Mathematical Society s2-42
    issued:
      - year: 1936
  - id: church1936
    type: document
    title: An Unsolvable Problem of Elementary Number Theory
    note: lambda-calculus operators (abstraction, application)
    author:
      - literal: Alonzo Church
    container-title: American Journal of Mathematics 58(2)
    issued:
      - year: 1936
  - id: plotkin1981
    type: document
    title: A Structural Approach to Operational Semantics
    note: operators given by structural inference rules over typed terms
    author:
      - literal: Gordon D. Plotkin
    container-title: DAIMI FN-19, Aarhus University
    issued:
      - year: 1981
  - id: pierce2002
    type: document
    title: Types and Programming Languages
    author:
      - literal: Benjamin C. Pierce
    container-title: MIT Press
    issued:
      - year: 2002
---
```

A **computing operator** is a mathematical [operator](operator.md) realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources, and whose action is given by a procedure rather than by an existence claim. A computing operator is a specialisation of the broader mathematical notion — its sub-support is exactly the cases in which the transformation is effectively executable.

## What computing adds to the math

Three constraints distinguish a computing operator from an arbitrary mathematical operator.

**Effective computability.** The operator must be given by a procedure that can be carried out in finite steps without appeal to an oracle, completed search of an infinite space, or other non-constructive resource. Turing (1936) and Church (1936) independently fixed this requirement: a computing operator is a Turing-computable (equivalently, $\lambda$-definable) function on its representable inputs.

**Representability.** The source and target must admit a finite encoding. An operator on the real numbers, in the math sense, has continuum-sized source and target; the *computing* operator on the reals is the operator on a finite representation (floating-point numbers, computable reals à la Weihrauch, exact arithmetic over algebraic closures) — the underlying math operator restricted to the representable sub-support.

**Typing and operational semantics.** A computing operator is typed: its arity is fixed and its inputs are tagged with the types it accepts. Its action is given by inference rules in the style of Plotkin (1981) — small-step or big-step rules that say how the operator reduces on each shape of input — rather than by a defining equation that may have no procedure for evaluation. Pierce (2002) is the standard reference for the typing-and-rules combination as a modern foundation for operators in programming languages.

## Why this is a specialisation of math operator

The mathematical operator (in any of its three senses — functional-analytic, categorical, algebraic) need not be effectively computable. The Hilbert-space operator that projects onto the closure of the rationals in $\mathbb{R}$ is a perfectly good linear operator; the corresponding computing operator does not exist, because no finite procedure can decide for an arbitrary real whether it is rational. The computing operator inherits its source/target/structure-preservation from the math operator and adds the three constraints above. The induced restriction map (in the predicate-fiber sense) takes a math operator and yields the computing operator on the sub-support where the constraints are satisfied; the computing operator does not exist on the rest.

## Composition and the typed term

Computing operators compose along their types: if $f: A \to B$ and $g: B \to C$ are both computing operators, then so is $g \circ f: A \to C$, and its evaluation procedure is the sequencing of the two procedures. This makes the typed-operator family a category in the categorical sense — and the corresponding category of computing operators is *the* setting in which a programming language, a proof assistant, or an algebraic specification is studied.

## See Also

- [operator](operator.md) — the mathematical notion this specialises
- type — what fixes the operator's arity and acceptable inputs
- computation — the activity computing operators are the units of

---

## Supplementary formulation

```yaml
---
name: "Operator"
aliases: [operators]
description: "A relational-computing operator is a computing operator whose source and target are graphs of relations rather than stored values — a transformation that takes a relation graph (or a region of one) to another relation graph by the addition, retraction, or traversal of relations."
instance-of: operator
specializes: operator
operates-on: relation
contrasts-with: value-mutation
date-created: 2026-04-27
---
```

A **relational-computing operator** is a [computing operator](operator.md) specialised to the [relational substrate](relational-computer.md): its source and target are graphs of [relations](../../../../../../../../humanities/domains/philosophy/terms/relation.md) — or regions thereof — rather than stored values. Where a generic computing operator transforms inputs of arbitrary type to outputs of arbitrary type, a relational-computing operator's inputs and outputs are necessarily relational structures, and its action is correspondingly restricted to the three relational primitives: insertion of a relation, retraction of a relation, and traversal along relations.

## How the specialisation works

In the predicate-fiber sense, a relational-computing operator is a predicate specialisation of the computing operator: the sub-support is exactly the cases where the operator's source and target are relation graphs (or regions of relation graphs), and the values are the computing operator's values restricted to that sub-support. A computing operator that returns a stored value at a memory address has no image in the relational-computing operator family — there are no stored values at addresses to return. A computing operator that transforms one relation graph into another inhabits both families, and its relational-computing specialisation is just its action on relation-graph inputs.

## Three primitive forms

Because the substrate has only three native operations, a relational-computing operator is, at root, a composition of three primitive forms:

- **Insertion** of a relation — add the edge $\langle s, p, o \rangle$ to the graph.
- **Retraction** of a relation — remove the edge $\langle s, p, o \rangle$ from the graph.
- **Traversal** of relations — enumerate the edges incident to a position $s$ under a given predicate $p$.

Higher-level operators are compositions of these: a graph-rewrite operator is a sequence of retractions and insertions; a query operator is a structured traversal; a closure operator is iterated insertion under fixed inference rules until quiescence.

## Why this is the right specialisation

A computing operator is constrained by effective computability, representability, and typing (the [computing-operator](operator.md) page makes the three explicit). A relational-computing operator inherits all three and adds a fourth: *substrate restriction*. The operator's source and target must be expressible as relation graphs, and its action must be given as a sequence of the three primitive forms. This is the formal content of *the substrate is relational*: every computing operator that acts on the relational substrate is, by definition, a relational-computing operator; computing operators that act on non-relational substrates are not.

## See Also

- [computing operator](operator.md) — the parent in the specialisation chain
- [operator](operator.md) — the mathematical root
- [relational computer](relational-computer.md) — the system whose operations these are

---

## Additional formulation

```yaml
---
name: "Operator"
aliases: [operators]
description: "A computing operator is a mathematical operator realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources and whose action is given by a procedure rather than by an existence claim."
instance-of: operator
specializes: operator
date-created: 2026-04-27
references:
  turing1936:
    authors: ["Alan M. Turing"]
    title: "On Computable Numbers, with an Application to the Entscheidungsproblem"
    publication: "Proceedings of the London Mathematical Society s2-42"
    year: 1936
    note: "computable functions as the operators of an idealised machine"
  church1936:
    authors: ["Alonzo Church"]
    title: "An Unsolvable Problem of Elementary Number Theory"
    publication: "American Journal of Mathematics 58(2)"
    year: 1936
    note: "lambda-calculus operators (abstraction, application)"
  plotkin1981:
    authors: ["Gordon D. Plotkin"]
    title: "A Structural Approach to Operational Semantics"
    publication: "DAIMI FN-19, Aarhus University"
    year: 1981
    note: "operators given by structural inference rules over typed terms"
  pierce2002:
    authors: ["Benjamin C. Pierce"]
    title: "Types and Programming Languages"
    publication: "MIT Press"
    year: 2002
---
```

A **computing operator** is a mathematical [operator](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/operator.md) realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources, and whose action is given by a procedure rather than by an existence claim. A computing operator is a specialisation of the broader mathematical notion — its sub-support is exactly the cases in which the transformation is effectively executable.

## What computing adds to the math

Three constraints distinguish a computing operator from an arbitrary mathematical operator.

**Effective computability.** The operator must be given by a procedure that can be carried out in finite steps without appeal to an oracle, completed search of an infinite space, or other non-constructive resource. Turing (1936) and Church (1936) independently fixed this requirement: a computing operator is a Turing-computable (equivalently, $\lambda$-definable) function on its representable inputs.

**Representability.** The source and target must admit a finite encoding. An operator on the real numbers, in the math sense, has continuum-sized source and target; the *computing* operator on the reals is the operator on a finite representation (floating-point numbers, computable reals à la Weihrauch, exact arithmetic over algebraic closures) — the underlying math operator restricted to the representable sub-support.

**Typing and operational semantics.** A computing operator is typed: its arity is fixed and its inputs are tagged with the types it accepts. Its action is given by inference rules in the style of Plotkin (1981) — small-step or big-step rules that say how the operator reduces on each shape of input — rather than by a defining equation that may have no procedure for evaluation. Pierce (2002) is the standard reference for the typing-and-rules combination as a modern foundation for operators in programming languages.

## Why this is a specialisation of math operator

The mathematical operator (in any of its three senses — functional-analytic, categorical, algebraic) need not be effectively computable. The Hilbert-space operator that projects onto the closure of the rationals in $\mathbb{R}$ is a perfectly good linear operator; the corresponding computing operator does not exist, because no finite procedure can decide for an arbitrary real whether it is rational. The computing operator inherits its source/target/structure-preservation from the math operator and adds the three constraints above. The induced restriction map (in the predicate-fiber sense) takes a math operator and yields the computing operator on the sub-support where the constraints are satisfied; the computing operator does not exist on the rest.

## Composition and the typed term

Computing operators compose along their types: if $f: A \to B$ and $g: B \to C$ are both computing operators, then so is $g \circ f: A \to C$, and its evaluation procedure is the sequencing of the two procedures. This makes the typed-operator family a category in the categorical sense — and the corresponding category of computing operators is *the* setting in which a programming language, a proof assistant, or an algebraic specification is studied.

## See Also

- [operator](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/operator.md) — the mathematical notion this specialises
- type — what fixes the operator's arity and acceptable inputs
- computation — the activity computing operators are the units of
