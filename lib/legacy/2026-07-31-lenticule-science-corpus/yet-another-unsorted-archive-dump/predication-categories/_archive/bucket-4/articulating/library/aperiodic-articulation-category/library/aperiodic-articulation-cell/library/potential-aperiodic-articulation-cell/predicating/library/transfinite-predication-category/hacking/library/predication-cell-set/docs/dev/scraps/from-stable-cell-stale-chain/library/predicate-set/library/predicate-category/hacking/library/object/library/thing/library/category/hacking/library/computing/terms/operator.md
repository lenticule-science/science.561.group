---
title: "Operator"
defines: operator
aliases: [operators]
description: "A computing operator is a mathematical operator realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources and whose action is given by a procedure rather than by an existence claim."
instance-of: operator
specializes: operator
related: [function, procedure, primitive-operation, type, computation]
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

A **computing operator** is a mathematical [operator](../../../../../humanities/theories/math/terms/operator.md) realised in a computational system: a typed, effectively-computable transformation whose source and target are representable in finite resources, and whose action is given by a procedure rather than by an existence claim. A computing operator is a specialisation of the broader mathematical notion — its sub-support is exactly the cases in which the transformation is effectively executable.

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

- [operator](../../../../../humanities/theories/math/terms/operator.md) — the mathematical notion this specialises
- type — what fixes the operator's arity and acceptable inputs
- computation — the activity computing operators are the units of
