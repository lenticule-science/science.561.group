---
name: aim frontier ratio
description: The structural inequality r_η / r_Γ ≤ |L| / c_LL that governs whether an agentic swarm's per-step total cost is substrate-bounded; foundational for the aperiodicity-as-tractability claim.
---

# Aim-frontier ratio

The *aim-frontier ratio* is the inequality
$$\frac{r_\eta}{r_\Gamma} \;\leq\; \frac{|L|}{c_\text{LL}}$$
that governs whether an agentic swarm's per-step total cost is substrate-bounded ($O(N + |L|)$) or consultation-bound ($O(N \cdot c_\text{LL})$).

The variables:

- $r_\eta$ — *consultation rate*: the rate of language-model invocations per substrate-step. Each LL invocation is an η-firing in the substrate's increment sequence $U$ (introducing external evidence into the substrate's closure dynamics).
- $r_\Gamma$ — *autonomous-closure rate*: the rate of Γ-mechanism closure firings per substrate-step. Each Γ-firing is an internal closure-2-monad iteration driven by *existing* witnesses in the substrate, generating new content without LL invocation.
- $|L|$ — *substrate-cell count*: the size of the substrate's predication graph (cells with bilattice-valued $\mathbf{FOUR}$ predications).
- $c_\text{LL}$ — *per-consultation cost*: the FLOPs cost of one LL invocation. Typical values: $10^{10}$–$10^{12}$ FLOPs depending on model size and context.

## Why the inequality matters

Per-step total cost decomposes into MALL-layer (substrate) work and LL-layer (consultation) work, additive because no inter-agent operation lives at the substrate layer:

- MALL-layer cost: $r_\Gamma \cdot O(|L|)$ — each Γ-firing is cell-wise across the substrate.
- LL-layer cost: $r_\eta \cdot O(c_\text{LL})$ — each consultation is one model forward pass.

Substrate-bounded regime requires the MALL-layer term to dominate. Rearranging the dominance condition $r_\Gamma \cdot |L| \geq r_\eta \cdot c_\text{LL}$ yields the aim-frontier ratio.

The inequality is *named* the aim-frontier ratio because the substantive operational pattern that achieves it is consultation at the boundary of aim-generation: the polity thinks (one consultation), emits witnesses, lets the substrate work through many closure firings on those witnesses, then thinks again. Consultations happen at the *frontier* where new aims need to form — not at the rate of the substrate's autonomous closure work.

## Quantitative reference

| $c_\text{LL}$ (FLOPs) | $\|L\|$ (cells) | Required $r_\eta / r_\Gamma$ |
|---|---|---|
| $10^{10}$ | $10^6$ | $\leq 10^{-4}$ |
| $10^{12}$ | $10^6$ | $\leq 10^{-6}$ |
| $10^{10}$ | $10^4$ | $\leq 10^{-6}$ |
| $10^{12}$ | $10^4$ | $\leq 10^{-8}$ |

Larger LLMs and smaller substrates tighten the required ratio. The 561 polity at typical scale operates at the $10^{-4}$ boundary — one consultation per ten thousand closure firings.

## Achievement conditions

The ratio is achievable iff three commitments hold:

1. *Aperiodicity* ($\kappa \geq \omega_1$ in the four-regime dichotomy) — guarantees $r_\Gamma > 0$ uniformly across substrate-steps.
2. *Aim-generativity* (per `theories/.../predicated-work/concepts/aim-generativity.md`) — ensures Γ-firings produce new content rather than re-confirming.
3. *Governance-regime-specific rate-limiting on consultations* — the operational mechanism that keeps $r_\eta$ at the aim-frontier. Kyriarchical regime: captain-attestation under MHC. Kin-relational regime: consensus-by-withdrawal and kin-recognition cycles. Other regimes: their own mechanisms.

## Position

Foundational concept for the [aperiodicity-as-tractability claim](../../../learning/claims/aperiodicity-as-tractability.md). Surfaced in the FAdRS-swarms survey, §7.2; promoted here to a standalone concept atom. The ratio is the formal expression of the polity's "thinking ratio" — the structural rate of consultation against autonomous substrate work.
