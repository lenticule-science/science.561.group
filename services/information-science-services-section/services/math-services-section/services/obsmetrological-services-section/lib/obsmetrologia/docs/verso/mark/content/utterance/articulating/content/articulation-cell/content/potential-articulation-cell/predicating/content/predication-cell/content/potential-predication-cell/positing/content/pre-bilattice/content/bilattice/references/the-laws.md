# Reference: the laws

The algebraic properties the kernel guarantees. Each is checked in [the test suite](the-test-suite.md)
over random inputs through the real morphisms — these are *verified*, not aspirational.

Notation: a charge's value is `⟨a, b⟩`; `V(c)` is its value; σ is the order-swap `⟨a, b⟩ ↦ ⟨a, ¬b⟩`.

## Each order is a lattice (on the value)

For each of `joinK, meetK, joinT, meetT`:

| law | statement |
|---|---|
| commutative | `op(a, b) = op(b, a)` |
| associative | `op(op(a, b), c) = op(a, op(b, c))` |
| idempotent | `op(a, a) = a` |

And absorption ties join to meet per order:

- knowledge: `joinK(a, meetK(a, b)) = a`
- truth: `joinT(a, meetT(a, b)) = a`

*(All on the value. The evidence accumulates — see below — so these are value-laws, as a lattice
should be.)*

## The Klein-four gauge

| law | statement |
|---|---|
| `negate` involution | `negate(negate(a)) = a` |
| `conflate` involution | `conflate(conflate(a)) = a` (on the value) |
| commute | `negate(conflate(a)) = conflate(negate(a))` |
| `conflate` reverses `≤ₖ` | `conflate⟨a,b⟩ = ⟨¬b, ¬a⟩` — swaps absurd↔stable, fixes potential/active |

## The two orders are σ-dual

| law | statement |
|---|---|
| join | `joinT(a, b) = σ(joinK(σ a, σ b))` |
| meet | `meetT(a, b) = σ(meetK(σ a, σ b))` |

This is the two-orders duality made checkable: the truth ops *are* the knowledge ops read through σ.

## The carrier is lossless

| law | statement |
|---|---|
| accumulation | every op (`joinK/meetK/joinT/meetT`) returns evidence whose each side is `⊇` both inputs' — never shrinks |
| `aggregate` | `aggregate = joinK` on the value (the lossless evidence join is the knowledge join) |

## The descent (on real utterances)

| law | statement |
|---|---|
| measured potential | a fresh cell has value `⟨1,0⟩` (**potential**), witnessed by its given token |
| knowledge bracket | `settle ≤ₖ brim` on every cell |
| truth bracket | `adjudicate ≤_t presume` on every cell |
| the void is slack | `vanish` is non-empty exactly where the cones disagree; it carries the `[least, greatest]` interval |
| evidence preserved | `settle` keeps the token-evidence |
| absurd is reached | `meetK(potential, active) = absurd` — never seeded |
| the contract | `articulate([])` and `articulate([token])` throw (a missing side is malformed) |

## The structural morphisms

| law | statement |
|---|---|
| `cohere` | the closure is transitive and contains the original edges |
| `estrange` | `apex ∪ closure = all pairs`, disjoint (the complement of the closure) |
| `precipitate` | a composable pair `(a,p,b)·(b,q,c)` yields residue `[[p,q]]`; a lone self-loop yields none |
| `compare` | partitions a section: paraconsistent = exactly the ⊤ (stable) cells, consistent = the rest |

## See also

- [the test suite](the-test-suite.md) (where each law is checked) · [morphisms](morphisms.md) · [the charge](the-charge.md)
