---
part-of:
  - functional

title: "composition"
aliases:
  - "composition"
  - "function composition"
date-created: 2026-03-05
tags: []
defines:
  - "composition"
  - "function composition"
---

**Composition** is the operation of combining two [functions](./function.md) so that the output of the first becomes the input of the second. Given a function $f : A \to B$ and a function $g : B \to C$, their composition $g \circ f$ is a new function from $A$ to $C$ that applies $f$ first, then $g$ to the result:

$$
(g \circ f)(x) = g(f(x))
$$

Composition is the primary mechanism by which [functional programming](/technology/disciplines/computing/software/programming/functional/index.md) builds complex behavior from simple parts. Rather than writing a single large function, a functional programmer writes small [pure functions](./pure-function.md) and wires them together through composition.

Composition works cleanly when functions are pure. If `f` and `g` are both pure, then `g ∘ f` is also pure: same inputs always produce the same output, no side effects. This composability is a direct consequence of purity — there are no hidden interactions between `f` and `g` that could break when they are combined.

The operation is **associative**: $(h \circ g) \circ f = h \circ (g \circ f)$. The identity function $\text{id}(x) = x$ serves as the identity element: $f \circ \text{id} = \text{id} \circ f = f$. These properties mean that functions under composition form a mathematical structure (a category), which is one of the deep connections between functional programming and mathematics.

Some languages provide a composition operator directly. Haskell uses `.` (dot): `(g . f) x` means `g(f(x))`. In languages without a built-in operator, composition is achieved by nesting calls — `g(f(x))` — or by writing a `compose` [higher-order function](./higher-order-function.md) that returns the composed function.

**Pipelines** are composition read in the other direction. Where `g ∘ f` reads right-to-left ("apply f then g"), a pipeline reads left-to-right: "start with x, then apply f, then apply g." Languages like Elixir (`|>`), F# (`|>`), and Unix shells (`|`) use pipeline operators. The underlying operation is the same.

