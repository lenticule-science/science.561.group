---
part-of:
  - functional

title: "Composition and Currying"
aliases:
  - "Composition and Currying"
date-created: 2026-03-05
keywords:
  - functional-programming
  - programming
requires:
  - /technology/disciplines/computing/software/programming/functional/curricula/functional-overview.md
teaches:
  - "Function Composition"
  - "Currying"
  - "Partial Application"
  - "Closures"
---

## Entry conditions

Use this lesson when you can already describe [pure functions](../terms/pure-function.md) and [immutability](../terms/immutability.md) and are ready to learn how functional programs combine small functions into larger ones.

## First-class functions

Before functions can be composed, they must be values. A [first-class function](../terms/first-class-function.md) is a function that a language treats like any other value — it can be stored in a variable, passed as an argument, and returned as a result.

```
double = λx. x * 2
```

Here `double` is a variable whose value is a function. It is not a declaration — it is an assignment of a function value to a name, no different in kind from assigning a number to a name. This is the starting point for everything that follows.

## Composition

[Composition](../terms/composition.md) wires two functions together: the output of the first becomes the input of the second.

Given $f : A \to B$ and $g : B \to C$, the composition $g \circ f$ is a function from $A$ to $C$:

$$
(g \circ f)(x) = g(f(x))
$$

**Worked example.** Let `double(x) = x * 2` and `addOne(x) = x + 1`.

- $(addOne \circ double)(3) = addOne(double(3)) = addOne(6) = 7$
- $(double \circ addOne)(3) = double(addOne(3)) = double(4) = 8$

Order matters. Composition is not commutative, but it is **associative**: $(h \circ g) \circ f = h \circ (g \circ f)$. This means you can chain any number of functions without worrying about grouping.

The identity function $\text{id}(x) = x$ composes with any function and changes nothing: $f \circ \text{id} = \text{id} \circ f = f$.

**Why this matters.** Composition is how functional programs scale. Instead of writing one large function, you write small pure functions — each doing one thing — and compose them. Because pure functions have no side effects, the composition is safe: the pieces cannot interfere with each other.

## Closures

A [closure](../terms/closure.md) is a function that carries its defining environment with it. When a function is created inside another function, it can reference variables from the outer scope. Those references persist even after the outer function returns.

```
makeAdder(n) = λx. x + n
addThree = makeAdder(3)
addThree(10)  →  13
```

`addThree` is a closure. It "closes over" the variable `n`, capturing the value `3`. When called later, it still knows that `n = 3`, even though `makeAdder` has finished executing.

Closures are the mechanism that makes the next concept — currying — work.

## Currying

[Currying](../terms/currying.md) transforms a function of multiple arguments into a chain of functions, each taking one argument.

A function $f(a, b) = a + b$ becomes:

$$
f' = \lambda a.\, \lambda b.\, a + b
$$

Applying $f'$ to one argument returns a closure waiting for the second:

$$
f'(3) = \lambda b.\, 3 + b
$$

This is not a special operation — it is ordinary function application. The lambda calculus has no multi-argument functions at all; every function takes exactly one argument. Multi-argument functions are syntactic sugar for curried chains.

**Partial application** is the practical use of currying. Given a curried function, supplying some but not all of its arguments produces a specialized function:

```
multiply = λa. λb. a * b
triple = multiply(3)           -- a function that triples its input
triple(5)  →  15
```

No new function was written. `triple` was created by partially applying `multiply`. This pattern — specializing a general function by fixing some arguments — replaces much of the boilerplate that imperative programs use factory functions or configuration objects for.

## Composing partially applied functions

Currying and composition combine into a powerful idiom. Partially applied functions are composed into pipelines that transform data step by step:

```
process = filter(isEven) ∘ map(double) ∘ take(10)
```

Each piece is a general [higher-order function](../terms/higher-order-function.md) partially applied with a specific operation. The composition chains them into a single function that takes a list and produces a result. Each piece is pure, so the pipeline is pure.

This style — small pure functions, partially applied and composed — is the central idiom of functional programming. It scales because the pieces are independent: you can test each one in isolation, rearrange them freely (respecting types), and add new stages without modifying existing ones.

## Common mistakes

- **Confusing composition order.** $g \circ f$ means "apply $f$ first, then $g$." The visual order is right-to-left. Pipeline operators (`|>`) reverse this to left-to-right, which some programmers find more natural.
- **Confusing currying with partial application.** Currying is the structural transformation of a multi-argument function into a chain of single-argument functions. Partial application is the act of supplying some arguments. Currying enables partial application, but they are not the same operation.
- **Forgetting that closures capture references, not values** (in languages with mutable variables). If a closure captures a mutable variable and that variable later changes, the closure sees the new value. In functional programming, this is rarely a problem because variables are immutable.

## Check for understanding

1. Given `f(x) = x + 1` and `g(x) = x * 3`, what is $(f \circ g)(4)$? What is $(g \circ f)(4)$?
2. Write a curried function `power(exponent)(base)` and use partial application to create `square = power(2)`. What value is captured in the closure?
3. Why does composition of pure functions guarantee that the composed function is also pure?
