---
name: negate
type: concept
status: sketch
---

Internal complement. What a distinction leaves unmarked. The operation that formalizes exclusion as a unary act on a single recognition.

## What it is

`Negate(a)` is the pseudocomplement: the largest recognition $n$ with $a \land n = \bot$. It is defined via residuation as the special case $\text{Negate}(a) = \text{Induces}(a, \bot)$.

Set-theoretically, on a field with an involution $\neg$ satisfying $\neg(\neg x) = x$, Negate is that involution. Categorically, it is the pseudocomplement in a Heyting algebra: the largest element disjoint from the input.

## Key property: non-Boolean character

$\text{Negate}(\text{Negate}(a))$ includes $a$, but not necessarily equals it:

$$\neg \neg a \geq a, \quad \text{but } \neg \neg a \neq a \text{ in general}$$

This non-Boolean character is *essential* — it means the relational field admits genuine indeterminacy. Not every question has a determinate answer. The gap between $a$ and $\neg\neg a$ is what distinguishes the framework from classical logic. The gap is also the formal expression of [tension](tension.md): the failure of excluded middle.
