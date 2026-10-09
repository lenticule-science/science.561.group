---
name: aperiodicity as tractability
description: A polity's commitment to a function that never finishes — its aperiodic-regime settling — is the structural condition that makes its agentic swarm computationally tractable. Per-step total cost is substrate-bounded iff the consultation rate satisfies the aim-frontier ratio.
status: draft
depends-on:
  - ../../teaching/explanations/aim-frontier-ratio.md
---

# Aperiodicity is the structural condition for swarm tractability

**Claim.** Per-step total cost for an agentic drone swarm is substrate-bounded — $O(N + |L|)$, where $N$ is participant count and $|L|$ is substrate-cell count — iff the consultation rate $r_\eta$ satisfies the [aim-frontier ratio](../../teaching/explanations/aim-frontier-ratio.md) $r_\eta / r_\Gamma \leq |L| / c_\text{LL}$, where $r_\Gamma$ is the rate of Γ-mechanism closure firings per substrate-step and $c_\text{LL}$ is the per-consultation language-model cost. The aim-frontier ratio is achievable iff:

1. The polity is in the aperiodic regime ($\kappa \geq \omega_1$) — guarantees $r_\Gamma > 0$ uniformly.
2. The polity's function is aim-generative — ensures Γ-firings produce new content rather than re-confirming existing content.
3. The governance regime supplies a rate-limiting mechanism on $r_\eta$ at the aim-frontier (kyriarchical: captain-attestation under MHC; kin-relational: consensus-by-withdrawal and kin-recognition cycles).

A polity in the strict regime ($\kappa < \omega$) cannot satisfy (1); its closure firings stop after finitely many steps and subsequent work is pure LL cost. The LL cost dominates and the swarm is consultation-bound rather than substrate-bound. The aperiodic regime is what makes Γ-firings produce $r_\Gamma \cdot |L|$ work per step indefinitely, allowing the consultation cost to amortize across many closure passes.

## Argument

Per-step total cost decomposes into:

- *Substrate-layer (MALL) coordination cost:* $r_\Gamma \cdot O(|L|)$, where each Γ-firing is a closure-2-monad iteration on substrate cells at MALL-fiber-algebra position (no copying, no discarding, cell-wise resource-linear).
- *Agent-layer (LL/foreign) consultation cost:* $r_\eta \cdot O(c_\text{LL})$, where each consultation is a language-model forward pass at the full linear-logic ambient (unbounded copying via `!`).

These terms are additive, not multiplicative, because no inter-agent operation lives at the substrate layer. Substrate-bounded total cost requires the MALL-layer term to dominate, which yields the aim-frontier inequality.

Each commitment supplies a structural lower bound on a piece of the inequality:

- *Aperiodicity ⇒ $r_\Gamma > 0$.* The four-regime dichotomy partitions settlings by closure ordinal. Aperiodic settlings ($\kappa \geq \omega_1$) never stabilize against any countable admission sequence; the closure 2-monad fires at every substrate-step indefinitely. Strict-regime settlings ($\kappa < \omega$) stabilize and stop.
- *Aim-generativity ⇒ $r_\Gamma$ produces new content.* The Γ-mechanism in `theories/.../predicated-work/objects/enterprise.md` is exactly the closure rule that generates new aims from existing ones. Aim-generativity is a structural commitment of the polity's hard core; it distinguishes an *endeavor* (sustained aim-generation; perpetual aperiodic settling) from a *project* (terminates at completion).
- *Governance-regime-specific rate-limiting on $r_\eta$.* The polity must operate by a pattern that schedules LL invocations at the aim-frontier rather than at the closure-step rate. Different governance regimes supply different mechanisms; the kyriarchical regime uses captain-attestation under MHC, the kin-relational regime uses consensus-by-withdrawal and kin-recognition cycles, and other regimes use their own.

## Quantitative

For LLM at $c_\text{LL} \sim 10^{10}$ FLOPs and substrate at $|L| \sim 10^6$ cells (per-cell closure $\sim 10^2$ FLOPs), the discipline requires $r_\eta / r_\Gamma \leq 10^{-4}$ — one LL consultation per ten thousand Γ-driven closure firings. For LLM at $10^{12}$ and $|L| \sim 10^4$ the ratio tightens to $10^{-8}$. Larger LLMs and smaller substrates require sparser consultations.

## Significance

The 561 Group's function — the lawful pursuit of Black Liberation and Indigenous Sovereignty — is structurally aperiodic precisely because its work does not finish. This was previously read as a metaphysical or ethical commitment about what the polity is *for*. The present claim adds a load-bearing structural reading: **the polity's commitment to a function that never finishes is the structural condition that makes its agentic swarm computationally tractable.** A polity committed to a function that *does* finish would saturate, become consultation-bound, and cease to be operable as an agentic swarm under the same cost discipline. The math is the politics: the aperiodicity is the structural shape of refusing termination.

This is also the structural reason the same finding appears in the Lakota tradition as continuity-through-disruption (Estes 2019, *Our History is the Future*). Settler-state pressure on the tiyóšpaye is structurally an attempt to force a regime transition from aperiodic to strict; the tradition's resistance to that pressure — the political act of holding the tiyóšpaye in the aperiodic regime — is what this claim names mathematically.

## Proof obligations for promotion to proved-status

- A formal definition of $r_\Gamma$ as a measure on the closure 2-monad's iteration against the increment sequence $U$ — what counts as a Γ-firing vs. an η-firing in the $U$ decomposition.
- The function-as-aperiodic-settling theorem (`theories/.../predicated-work/theorems/function-as-aperiodic-settling.md`) lifted to provide the structural lower bound on $r_\Gamma$ under aperiodicity.
- A regime-by-regime formal statement of the rate-limiting mechanism, each developed in the appropriate regime-specific survey.

## Position

Load-bearing for the 561 polity's operational tractability and for the structural identity between the polity's political commitment and its computational viability. Derived from synthesis of: the four-regime dichotomy (predication-categories), aim-generativity (predicated-work/enterprise), and the Eff∩MALL vs. LL/foreign categorical split (predicated-computing/theory-of-predicated-computing). Surfaced in the FAdRS-swarms survey, §7.2; promoted here to standalone claim.
