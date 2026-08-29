---
kind: example
status: verified
depends-on: [d-frame-cohomology-comparison, four-regime-dichotomy, settling-cohomology, strong-mld-via-composed-duality, multi-agent-epistemic-settling]
instantiates: [d-frame-cohomology-comparison, four-regime-dichotomy]
lineage: 5
---

# Benchmark 5: Epistemic Kripke frame

End-to-end computation conforming to the [computation protocol](../narratives/computation-protocol.md). The first **non-substitution-tilings** case in the suite — tests whether the framework computes anything useful outside its native substitution-dynamics setting.

Computed via `python3 tools/kripke-to-settling/encode.py --example three-agent-paraconsistent-witness`.

## Step 1: Specification

Multi-agent epistemic Kripke frame:
- **Worlds**: $W = \{w_1, w_2, w_3\}$.
- **Agents**: Alice, Bob, Carol.
- **Accessibility relations**: 
  - Alice: $w_1 \sim w_2$, $w_3$ isolated. Alice cannot distinguish $w_1$ from $w_2$.
  - Bob: $w_1 \sim w_3$, $w_2$ isolated. Bob cannot distinguish $w_1$ from $w_3$.
  - Carol: identity (each world only accesses itself). Carol can distinguish all worlds.
- **Atomic propositions**: $\{p\}$.
- **Initial valuation** (paraconsistent):
  - $v(w_1, p) = \mathbf{t}$ (true at $w_1$).
  - $v(w_2, p) = \mathbf{f}$ (false at $w_2$).
  - $v(w_3, p) = \top$ (paraconsistent witness — both true and false reported).

The corpus encoding: $E = W$, $\Pi = \{p\} \cup \{K_i p, K_i K_j p : i, j \in \mathrm{Agents}\}$, with the closure rule computing $K_i p$ at world $w$ as the bilattice knowledge-meet of $v(w', p)$ over all $R_i$-accessible $w'$.

## Step 2: Regime classification

**Strict regime**, $\kappa = 2$. The closure converges in 2 stages: stage 1 computes direct $K_i p$ facts; stage 2 computes $K_i K_j p$ facts. No further iteration produces new content for this finite frame with paraconsistent S5 dynamics.

23 total firings across the 2 stages.

## Step 3: $\mathbf{Ab}$-valued cohomology

For a strict-regime settling, $H^0$ is non-trivial (the post-quiescence state) and $H^{\geq 1} = 0$ — no accumulating cohomology. The strict-regime cohomology vanishing theorem applies. The *interesting* content is in $H^0$, which is the final valuation at the closure ordinal.

## Step 4: d-frame cohomology

Per-firing d-frame structure (23 firings classified by their bilattice value at firing):

| firing type | count |
|---|---|
| truth-only ($\mathbf{t}$) | 11 |
| falsity-only ($\mathbf{f}$) | 6 |
| $\top$-firing (paraconsistent) | 6 |
| $\bot$-firing (no info) | 0 |

The 6 ⊤-firings come from the paraconsistent witness world $w_3$: when an agent's accessibility includes $w_3$, their $K$-fact at world $w_3$ becomes $\top$ rather than $\mathbf{t}$ or $\mathbf{f}$. This is **the d-frame structure capturing paraconsistent content in an epistemic setting** — exactly what the bilattice-valued framework was designed for.

Notable individual firings:
- $\tau = 1$: $v(w_3, K_{\mathrm{alice}} p) = \top$ — Alice at $w_3$ sees only $w_3$, which has $\top$ — so her K-fact inherits the paraconsistency.
- $\tau = 1$: $v(w_3, K_{\mathrm{carol}} p) = \top$ — Carol's identity-accessibility same situation.
- $\tau = 2$: $v(w_3, K_{\mathrm{alice}} K_{\mathrm{alice}} p) = \top$ — higher-order paraconsistency persists.

## Step 5: Verdier dual

For strict-regime settlings the Verdier duality $H^1 \cong H_1$ is trivial (both are zero). The settling's $H^0$ on the cosheaf side is the same final valuation; the dualization adds nothing new at the cohomological level beyond confirming the structure.

## Step 6: Strong-MLD orbit type

**Mixed orbit** (both ⊤-firings and asymmetric $\mathbf{t}/\mathbf{f}$-firings present). Per the firing-pattern characterization: not firing-pattern-self-dual (truth-only and falsity-only firings are not individually fixed by $\mathbb{D}_{\mathrm{val}}$).

Substitution-rule self-duality: not applicable here (no substitution rule per se; the closure rule is the epistemic K-axiom set). However, an analogous question can be asked: does the *frame structure* commute with bilattice negation? For this frame — Alice's accessibility $\{w_1, w_2\}$ swaps $\mathbf{t}/\mathbf{f}$ between $w_1$ and $w_2$, but Bob's $\{w_1, w_3\}$ swaps with $\top$ which is fixed under negation — the answer is **no** in general. The frame's structure is not negation-symmetric.

## Step 7: Literature comparison

Multi-agent epistemic logic on small Kripke frames is well-studied; the standard model checker MCMAS or DEMO-S5 would compute the same atomic K-facts ($K_{\mathrm{alice}} p = ?$ at each world).

For the standard 2-valued case (no paraconsistency), the corpus's framework reduces correctly: with $v: W \times \mathrm{Atoms} \to \{t, f\}$ classical, the closure produces the standard knowledge facts. **The corpus's distinctive content is the paraconsistent extension**: the bilattice-valued closure handles the $\top$-witness world $w_3$ correctly, propagating the paraconsistency to $K$-facts at $w_3$ for each agent who can access it.

This is what MCMAS (built for classical S5) would *not* compute — at $w_3$ in classical S5, the conflict $v(w_3, p) = \top$ has no semantics, while the corpus's framework gives a well-defined $K_i p$ value at $w_3$.

## Step 8: What's new

Three substantive findings:

1. **The framework computes** in the epistemic-Kripke setting, producing a finite-closure (strict regime) settling with concrete K-fact content. This is the first verified non-tiling case where the framework's full classification pipeline runs end-to-end.

2. **Paraconsistent witness content propagates correctly**: 6 ⊤-firings recorded across the 2 stages, all originating from agents whose accessibility includes the paraconsistent witness world $w_3$. The d-frame structure provides a principled way to track epistemic content under paraconsistency where standard 2-valued S5 would fail.

3. **The bilattice knowledge-meet** (the underlying operation) gives sensible semantics for "what does agent $i$ know" when the underlying world-valuation has $\top$ values: $K_i p$ inherits the strongest information common to accessible worlds, which is $\top$ if all accessible worlds agree on $\top$, or $\mathbf{t}$ if $\top$ is dominated by $\mathbf{t}$-only worlds, etc. This is structurally what paraconsistent epistemic logic should give.

The **non-trivial** content the framework adds beyond standard epistemic logic: a uniform treatment of paraconsistent witness worlds via the bilattice $\mathbf{FOUR}$ structure, with the closure operator's fixed-point producing $K_i p$ values that are not "true / false / undefined" but instead "$\mathbf{t}$ / $\mathbf{f}$ / $\top$ (conflict known) / $\bot$ (information absent)" — four-valued, and sensible.

## Acceptance criteria checklist

- [x] **Reproducibility**: regenerable via `python3 tools/kripke-to-settling/encode.py --example three-agent-paraconsistent-witness`.
- [x] **Triangulation**: regime-classifier (via the encode-tool's settling-stages output) + bilattice knowledge-meet + agent-specific K-fact computation all consistent.
- [x] **Literature alignment**: K-facts agree with classical S5 model checking on non-paraconsistent worlds; paraconsistent worlds extend coherently.
- [x] **Distinctness or admission**: 6 ⊤-firings give the d-frame structure substantive content beyond classical S5. The framework's classification is genuinely paraconsistent-extension content.
