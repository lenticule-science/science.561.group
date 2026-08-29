---
kind: definition
type: action-functional
symbol: "S"
depends-on: [causal-dalembertian, lorentzian-causal-settling, sprinkled-causal-set-settling]
see-also: [settling-gauss-bonnet, myrheim-meyer-dimension, continuum-lorentzian-limit]
---

# Einstein–Hilbert action of a causal settling

The **Einstein–Hilbert action** of a causal settling is the total of the
[causal d'Alembertian](../causal-dalembertian/causal-dalembertian.md) applied to the unit field,
summed over events:
$$S \;:=\; \sum_{x} \Box\,\mathbf{1}\,(x).$$
Because `□` carries curvature (`□ 1(x) ∼ R(x)`, the local curvature reading), `S` is the discrete
form of the gravitational action `∫ R\sqrt{-g}` — the Benincasa–Dowker action of causal-set quantum
gravity, here as a settling invariant.

## The local curvature and the action

`□ 1(x) = ∑_{y ≼ x} μ(y,x)` is the **column Möbius sum** at `x` — an integer, the discrete local
curvature carried by the incidence algebra. The action `S = ∑_x □ 1(x) = ∑_{y ≼ x} μ(y,x)` (over all
ordered pairs) is its total. *(Built+green: `localCurvature`, `bdAction`; on the corpus diamond,
`bdAction = 1`.)*

## Two readings, honestly separated

* **Incidence reading (green).** With the exact incidence operator `□ = ∑ μ(y,x)·φ(y)`, the column
  sum `∑_{y ≼ x} μ(y,x)` is the **dual Möbius orthogonality** — it counts the *minimal* elements
  (the initial causal boundary), `□ 1(x) = [x \text{ minimal}]`. So the incidence action is the
  boundary count: a topological/combinatorial invariant of the order, exact and discrete. The
  diamond's `S = 1` is its single minimal event.
* **Curvature reading (roadmap).** The genuine Benincasa–Dowker *curvature* action uses the
  layer-grouped coefficients `c_k` (one constant per interval-abundance layer), not the per-element
  Möbius weights; the two agree exactly only under the research-grade
  [Möbius = BD coefficient identity](../causal-dalembertian/causal-dalembertian.md). In the
  `ρ → ∞` continuum limit `⟨S⟩ → −\tfrac14 ∫ R\sqrt{-g}` — the Einstein–Hilbert action proper. This
  limit is the Scott-continuous (`κ = ω`) sector and is the analytic frontier.

## Position in the program

`S` completes the spacetime portrait's *dynamical* face: dimension (Myrheim–Meyer), local curvature
(`□ 1`), global topology (Gauss–Bonnet `χ`), and now the **action** that the continuum sends to the
Einstein–Hilbert functional. The expected action `⟨S⟩` over a [sprinkling](../sprinkled-causal-set-settling/sprinkled-causal-set-settling.md)
is assembled from the operator's expectation commutation `⟨□ φ⟩ = □ ⟨φ⟩` (`dalembertian_expectation`)
and the Poisson settling expectation. What stays open is the curvature identification and the
continuum limit — gravity's discrete-to-continuum bridge.
