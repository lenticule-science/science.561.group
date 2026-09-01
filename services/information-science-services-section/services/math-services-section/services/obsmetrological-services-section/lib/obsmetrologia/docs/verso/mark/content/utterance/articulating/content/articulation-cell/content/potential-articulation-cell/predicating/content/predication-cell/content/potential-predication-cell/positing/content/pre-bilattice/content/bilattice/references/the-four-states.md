# Reference: the four states

The `value` of a [charge](the-charge.md) is one of four states, by its two bits `[a₊, a₋]`:

| value | name | reading | knowledge ≤_k | truth ≤_t |
|---|---|---|---|---|
| `[F,F]` | **absurd** | no side — irreconcilable / the void | bottom | middle |
| `[T,F]` | **potential** | has-potential, not yet active | middle | top |
| `[F,T]` | **potential** | engaged, potential spent | middle | bottom |
| `[T,T]` | **stable** | both — fully made good ("told both", ⊤) | top | middle |

(The classical Belnap names are ⊥ / t / f / ⊤; the state names are the dynamical reading this kernel
uses.)

## The two orders

The same four states carry two lattice orders at once — that is what makes it a *bilattice*:

```
                stable [T,T]                    knowledge ≤_k  (vertical):  absurd → {potential,active} → stable
               ╱           ╲                    truth     ≤_t  (horizontal): active → {absurd,stable} → potential
       active [F,T]     potential [T,F]
               ╲           ╱
                absurd [F,F]
```

- **knowledge** raises *both* bits — "how determined." `joinK` / `meetK` move both the same way.
- **truth** raises the positive bit, lowers the negative — "which way." `joinT` / `meetT`.

They are **σ-dual**: the order-swap `σ: absurd↔active, potential↔stable` (in bits `[a,¬b]`) carries
one order to the other, so `joinT = σ∘joinK∘σ` (a [law](the-laws.md) the suite checks).

## The gauge on the states

The Klein-four gauge acts on the value (not the cones):

| op | bits | action on states |
|---|---|---|
| `negate` | `[b, a]` | swaps **potential↔active**, fixes absurd/active (reverses truth) |
| `conflate` | `[¬b, ¬a]` | swaps **absurd↔stable**, fixes potential/active (reverses knowledge) |
| `negate∘conflate` | `[¬a, ¬b]` | swaps both pairs (the total complement) |

## How states arise

- A freshly **measured** cell is **potential** — token given (positive bit witnessed), claim only
  claimed (negative bit free). *(`posit`)*
- **absurd** is only ever *reached*: `meetK(potential, active) = absurd`. It is never seeded.
- **stable** (⊤) is reachable because the carrier is lossless — both sides can hold witnesses at once.

## See also

- [the charge](the-charge.md) · [morphisms](morphisms.md)
- explanations: [the bilattice and the four states](../explanations/the-bilattice-and-four-states.md) ·
  [knowledge and truth are σ-dual](../explanations/knowledge-and-truth-are-sigma-dual.md)
