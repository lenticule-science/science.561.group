---
name: "currying"
aliases:
  - "currying"
  - "partial application"
date-created: 2026-03-05
tags: []
---

**Currying** is the transformation of a [function](../../../../../../content/text/glossary/terms/function.md) that takes multiple arguments into a sequence of functions, each taking a single argument. A function $f(a, b, c)$ becomes a function $f(a)$ that returns a function $g(b)$ that returns a function $h(c)$ that produces the result. In notation:

$$
f : A \times B \times C \to D \quad\longrightarrow\quad f' : A \to (B \to (C \to D))
$$

The concept is named after Haskell Curry, though it was first described by Moses Schönfinkel. In the lambda calculus, all functions naturally take a single argument — multi-argument functions are always expressed as curried chains of single-argument abstractions. The expression $\lambda x.\, \lambda y.\, x + y$ takes $x$ and returns a function that takes $y$ and returns $x + y$.

**Partial application** is the practical consequence of currying. Given a curried function, supplying fewer arguments than it ultimately needs produces a new function waiting for the remaining arguments. If `add` is a curried function of two arguments, then `add(3)` is a new function that adds 3 to whatever it receives. This is not a special mechanism — it is ordinary function application in a curried setting.

In Haskell, all functions are curried by default. Writing `add x y = x + y` defines a function that takes `x` and returns a function that takes `y`. Writing `add 3` produces the "add three" function without any special syntax. In languages where functions are not curried by default (Python, JavaScript), partial application requires explicit support — Python's `functools.partial`, for example.

Currying and partial application enable a style of programming where general functions are specialized by supplying some of their arguments, then [composed](./composition.md) into pipelines. Instead of writing a new function for each variation, the programmer reuses existing functions by fixing specific arguments: `map(double)`, `filter(isEven)`, `sortBy(name)`.

The connection to [closures](./closure.md) is direct. Each step of a curried function returns a [closure](./closure.md) that captures the supplied argument. `add(3)` returns a closure that remembers `3` and waits for the second argument.

## Related terms

- [composition](./composition.md) — partially applied functions are often composed into pipelines
- [closure](./closure.md) — each step of a curried function returns a closure
- [higher-order function](./higher-order-function.md) — curried functions are inherently higher-order
- [first-class function](./first-class-function.md) — currying requires functions to be values
- [pure function](./pure-function.md) — curried pure functions are safe to partially apply and reuse
