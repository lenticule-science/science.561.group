---
name: closure-rule-system
description: The closure-2-monad of closure-rule firings — a monad on the category of predication-cell sets whose Kleisli structure is the firing dispatch.
specializing: monad

---

A **closure-rule system** is a monad T on a category of cell-collections whose unit η encodes "a cell asserts itself" and whose multiplication μ composes derivation chains (cells derived from cells derived from cells collapse to single derivations). Closure rules are the Kleisli morphisms of T: each rule has a premise pattern (matching incoming cells) and an action that produces additional cells in the monadic context. Firing a closure rule is Kleisli composition. In the 561 OS, the closure-rule system is the kernel of the FOUR-based computer — the firing process IS what the computer computes. A closure-rule system specializes [monad](../../monad.md). Sub-structures under [library/](library/) include hooks (closure rules with external lifecycle-event premises).
