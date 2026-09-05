---
kind: conjecture
type: theorem-plus-open-problem
symbol: "D \\nmid C"
depends-on: [maslov-dequantization, residue-gap, lambek-curvature]
see-also: [einstein-hilbert-action, time-section, sprinkling-average]
---

# The magnitude witness — `D ∤ C`, the residue dequantization forgets

[Maslov dequantization](../../maslov-dequantization.md) collapses the counting magnitude `C` to its support `supp C = (C > 0)`.
What is **green** here is the exact statement of what that collapse loses; what is **conjectural** is that the lost datum is a single invariant wearing three faces.

## What is green: the witness is what `supp` forgets

The support map is **blind to divisibility**: for any `D ≥ 2` there are two magnitudes of the same support — both nonzero — that differ in whether `D` divides them (`supp_blind_to_dvd`, witnesses `C = D` and `C' = D+1`).
So the **non-divisibility witness** `D ∤ C` is exactly the `p = 1` magnitude information the `p = ∞` collapse discards (`Obsmetrologia.
Dequantization.witness`). *(Built+green.)*

This witness fires precisely with nonzero magnitude: `D ∤ 1` for every `D ≥ 2` (`witness_one`) and `D ∣ 0` always (`witness_zero`).
Read on the curvature, this gives **curvature `≠ 0 ↔` the witness fires**: the diamond's past-boundary magnitude `|□1(0)| = 1` carries the witness for every `D` (`diamond_boundary_witness`), while the flat interior `|□1(3)| = 0` carries none (`diamond_interior_no_witness`).
The discrete Ricci witness *is* a non-divisibility. *(Built+green.)*

## The conjecture: one invariant, three faces

The corpus carries `D ∤ C` in three places that this node conjectures are the *same* `p = 1` invariant:

1. **The Ricci witness.** The curvature magnitude (`localCurvature`, `bdAction`) whose non-vanishing is "not flat" — read above as `D ∤ C`.
2. **The descent depth.** The settling closure ordinal / [time section](../../../knowledge-least-valuation/settling/content/lorentzian-causal-settling/content/time-section/time-section.md) depth — how far the order descends.
3. **The residue gap.** The [Collatz parent-barrier gap](../../../../../../../../../../../../closure/collatz/...)
  (`Closure.
  Collatz.
  ResidueGap`): with `D = 2B − A` odd and `M = 2B`, non-descent reduces to `C ∉ ⟨D, M⟩`, a residue inequality `D·r − C ≥ M` gated on `D ∤ C`.

> **Conjecture (research-grade).** The Ricci curvature magnitude, the settling descent depth, and the residue-gap non-divisibility are one `p = 1` invariant — the magnitude `supp` discards — and the (real-power) power-mean deformation `boolStoch ⤳ natStoch` recovers it from the support.

This is **not** a theorem; it is the unifying claim the green pieces gesture at.
The three `D ∤ C`'s are each green in their own module; their *identity* is open.

## The real-power lens lands (algebraic powers)

The recovery does not need the full continuum of exponents — it needs **genuine real powers**, and the aperiodic regime already carries them as the **metallic/Salem** algebraic reals.
The metallic double `z = n + √(n²+4)` is a real with `z² = 2n·z + 4` (`metallic_root`), and its powers expand as

$$z^k \;=\; P_k\,z + Q_k,$$

an integer-graded combination at every grade `k` — the **metallic power lens** (`metallic_power_expansion`, `Obsmetrologia.
Aperiodic.
StepN.
MetallicPowerLens`).
So the real algebraic power `z^k` *is* the magnitude re-entering, **graded by `k`** (the lens / descent index), with the [Cassini](../../../../../../../../../../aperiodic/.../metallic-real) `±1` (`metallic_cassini`) as its non-degeneracy — the same unimodular `D ∤ C` witness, now on the real side.
The base `k = 2` *is* `metallic_root`. *(Built+green.)*

The transcendental residue the algebraic lens cannot grade — the chromatic-Lorentzian `κ = ω` part that *can't be metallized* — is discharged by the **exponential power series**, and that now lands too: `e = ∑ 1/n!
` is **summable at `κ = ω`** (`Obsmetrologia.
InternalReals.expSeq_summable`), via the factorial **halving** `2·term(i+1) ≤ term i` (`term_halving`) telescoped to a bounded tail.
The factorial decay falls faster than any fixed algebraic recurrence — the precise sense of "can't be metallized."
The [metallization dichotomy](../../../../../../../../../../aperiodic/...)
(`metallization_dichotomy`) crystallizes the split: finite metallic expansion (`κ < ω`) vs non-idempotent chromatic step + summable exponential series (`κ = ω`). *(Built+green.)*

And the transcendental real is now **assembled**: `e = ∑ 1/n!
` is a genuine corpus real (`RReal.mk expReal`, `Obsmetrologia.
InternalReals.e`) — the partial sums `expSeq` with explicit Cauchy modulus `2(k+1)`, the Cauchy field discharged by the summable tail in both directions.
Euler's number as a `κ = ω` settling fixed point, axiom-clean. *(Built+green.)*

What stays open is only the **continuum**: a *general* `a^p` for real `p` re-attaching the graded lens to `natStoch` as one continuous map — the full real-exponent power-mean deformation.
The algebraic lens (`κ<ω`), the transcendental point `e` (`κ=ω`), and the dichotomy between them are green; the continuum of exponents is the remaining frontier. *(Roadmap.)*

## Position

The witness is generated by the valuation's two faces: it is the arithmetic residue the idempotent (`p = ∞`) collapse cannot see.
The green content — that `D ∤ C` is exactly the forgotten magnitude, and that it reads as the curvature's non-vanishing — is honest and complete.
The identification of the three `D ∤ C`'s, and the real-power deformation that would restore the graded magnitude, are the open work.
