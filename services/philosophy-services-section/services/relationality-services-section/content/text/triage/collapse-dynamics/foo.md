---

# detect recursive modulation substrate.md

---
name: detect recursive modulation substrate
symbol: R_sub
type: [recursive detection function](recursive detection function)
domain: [host recursive modulation](host recursive modulation)
codomain: boolean (true | false)
induced by:
  - [recursive constraint modulation function](recursive constraint modulation function)
  - [host recursive modulation](host recursive modulation)
induces:
  - [realize modulation-closure system](realize modulation-closure system)
  - [biogenic convergence condition](biogenic convergence condition)
---

***detect recursive modulation substrate*** (`R_sub`) is a [recursive detection function](recursive detection function)
that determines whether a system hosting modulation (`Φ`) exhibits the structural affordances
required for recursive constraint stabilization to begin.

It returns `true` when the system supports recursive modulation in alignment with
constraint transformation and contrast propagation — allowing symbolic realization via `Ψ`.

Let:

> Φ := (F, ∇F, D, R)

Where:
- `F(x)`: distributed field state (e.g., activation, energy, concentration)
- `∇F`: modulation pressure (non-equilibrium gradient)
- `D(x, y)`: local differentiation topology
- `R`: rule set for transformation

Then:

> R_sub(Φ) := true iff:

1. ∇F(x) ≠ 0 (non-equilibrium present)
2. ∃ x, y such that D(x, y) ≠ 0 (contrast exists)
3. R evolves via output from F (constraint can be transformed recursively)
4. ∇F(x) propagates ∇F(y) (modulation spreads)

If `R_sub(Φ) = true`, then Φ may be realized as a [modulation-closure system](modulation-closure system) (`𝓕`) via `Ψ`,
and recursive stabilization toward `βᴮ` becomes structurally inevitable.

---
