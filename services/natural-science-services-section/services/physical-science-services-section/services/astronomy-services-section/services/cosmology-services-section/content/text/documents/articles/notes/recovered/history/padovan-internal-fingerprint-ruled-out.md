---
status: negative-result / recorded
flagged: exploratory-computation
---

# The both-Padovan (ρ-internal) fingerprint does not clean up — negative result

Recorded so a future session does not re-run the same search. Tests the conservative
[two-stage both-finite reading](two-stage-both-finite-reading.md): if **both** pipelines ride
the *same* plastic-ρ (strict-finite) spiral and the tension is a stage-offset, then the
late/early ratio should be a **ρ-internal** quantity, not the cross-band φ/ρ.

It is not. Exploratory computation only; **flagged, not claimed**.

## What was computed

Candidate quantities against the canonical late/early ratio `R = 73.04/67.36 = 1.0843`
(plastic `ρ ≈ 1.32472`, golden `φ ≈ 1.61803`):

| candidate | value | err vs R | clean exponent? |
|---|---|---|---|
| φ/ρ (cross-band; the primary reading's naive fingerprint) | 1.2214 | 12.6% | — (already known to fail) |
| **φ^(1/6)** (golden; the recorded coincidence) | 1.0835 | **0.08%** | **yes — 1/x = 5.94 ≈ 6** |
| ρ^(1/3) (n = 3) | 1.0983 | 1.3% | no |
| ρ^(1/4) (\|image (1,1,2)\| = 4) | 1.0728 | 1.1% | no |
| ρ^(1/6) (mod-6 analogue) | 1.0480 | 3.4% | no |
| *exact* ρ^x = R | — | — | **x = 0.288, 1/x = 3.47 (not clean)** |

The pure plastic-ρ powers *bracket* R (ρ^(1/4) below, ρ^(1/3) above) but the exponent that hits
R exactly is `ρ^0.288` (`1/x = 3.47`) — no clean integer, no obvious structural meaning. By
contrast the *golden* `φ^(1/6)` hits to 0.08% with an exponent of essentially exactly **6**
(`1/x = 5.94`). A free search over finite Padovan stage-offsets `r_k/r_j = P(k+1)P(j)/P(k)P(j+1)`
finds `r7/r8 = 1.089` (0.4%) but that is overfit: `r_k/r_j → 1` as stages grow, so it is a
finite-size artifact, not a fingerprint.

## Verdict

On the numbers, reading Hubble as **entirely** Padovan does not produce a clean fingerprint.
The only clean hit is a **golden** quantity — which, taken at face value, mildly favors keeping
the second (Scott-continuous / golden) band, i.e. the primary cross-band reading, over the
benched both-finite reading. This confirms the premise of
[`phi-sixth-root-numerology`](phi-sixth-root-numerology.md)'s "two sixes": φ's exponent really is
≈ 6, while ρ has no clean exponent.

## The decisive caveat

The observed-ratio spread is wider than the candidate gap:

- 73.04/67.36 → 1.0843
- 73.0/67.0 → 1.0896
- 74.0/67.4 → 1.0979

a **~1.3% range**, *larger* than the gap between φ^(1/6) (1.0835) and ρ^(1/3) (1.0983). So the
data cannot currently distinguish the golden fingerprint from the plastic one, and the
0.02%-class "match" is partly an artifact of one chosen H₀ pair. **Numerology cannot adjudicate
this.** The value is entirely in *deriving* the exponent (the 6) from the
[[cosmic-settlement]] propagation depth — `cosmic-band-mismatch-law`'s owed-item #2 — not fitting
it. Until that derivation exists, neither φ^(1/6) nor any ρ-power is more than a recorded
coincidence.

See the follow-on geometric angle (spiral angular-sector reading) where the "6" is approached as
`2π/6` rather than a bare exponent.
