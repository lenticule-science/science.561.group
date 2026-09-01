---
title: "Paraconsistent Settling and Classification"
description: "Positive, negative, and inconsistency sheaves for bilattice-valued settling, including the proved bigraded classification and transfinite example."
date-created: 2026-06-20
type: theorem-and-example-note
source-snapshot: 2026-08-17-windows-561-group
source-variants:
  - paraconsistency/predication-negative-paraconsistent-settling-sheaf.md
  - paraconsistency/predication-negative-paraconsistent-settling-sheaf-1.md
  - paraconsistency/predication-paraconsistent-classification.md
  - paraconsistency/predication-paraconsistent-classification-1.md
  - paraconsistency/predication-paraconsistent-classification-2.md
  - paraconsistency/predication-paraconsistent-transfinite-settling.md
  - paraconsistency/predication-paraconsistent-transfinite-settling-1.md
  - paraconsistency/predication-paraconsistent-variants-opener.md
  - paraconsistency/predication-paraconsistent-variants-opener-1.md
  - paraconsistency/predication-paraconsistent-variants-opener-2.md
---

# Paraconsistent settling and classification

## The positive and negative tracks

The positive-paraconsistent sheaf $\mathcal{F}_U^{(k)}$ tracks cells gaining a truth component ($\mathbf{t}$ or $\top$). Its negation mirror $\mathcal{F}_U^{(k,-)}$ tracks cells gaining a falsity component ($\mathbf{f}$ or $\top$). For a stage $\tau$:

$$\Delta^{-,\mathrm{Belnap}}_\tau(q)=\{(s,o):v_\tau(q)(s,o)\in\{\mathbf{f},\top\}\text{ and no earlier stage is in }\{\mathbf{f},\top\}\},$$

and

$$\mathcal{F}_U^{(k,-)}(q,\tau,U)=\mathbb{Z}^{\Delta^{-,*,\mathrm{Belnap}}_\tau(q)\cap U}.$$

If a falsehood-only sheaf is introduced, the source proposes

$$0\to\mathcal{F}_U^{(\mathbf{f})}\to\mathcal{F}_U^{(k,-)}\to\mathcal{F}_U^{(\top)}\to0,$$

and identifies the shared contradiction component by

$$\mathcal{F}_U^{(k)}\cap\mathcal{F}_U^{(k,-)}\cong\mathcal{F}_U^{(\top)}.$$

Bilattice negation swaps $\mathbf{t}\leftrightarrow\mathbf{f}$ and fixes $\bot,\top$, inducing $\mathcal{F}_U^{(k)}\circ\neg\cong\mathcal{F}_U^{(k,-)}$. The d-frame-valued sheaf is noted as the broader symmetric container for both evidence tracks.

## Proved bigraded classification

For aperiodic settlings $v,v'$ over a common base, define

$$\mathrm{cl\text{-}inv}^{(k,t)}(v)=\left([\mathrm{cl\text{-}inv}^{(t)}(v)],[\mathrm{cl\text{-}inv}^{(\top)}(v)]\right)\in H^1_t(\mathbf{T}^*_{\leq\omega_1},\mathcal{F}_U^{(t)})\oplus H^1(\mathbf{T}^*_{\leq\omega_1},\mathcal{F}_U^{(\top)}).$$

The source theorem is `proved`:

$$v\sim_{\mathrm{MLD}}v'\quad\Longleftrightarrow\quad\mathrm{cl\text{-}inv}^{(k,t)}(v)=\mathrm{cl\text{-}inv}^{(k,t)}(v').$$

Bilattice homomorphisms preserve the $\{\mathbf{t},\top\}$ decomposition; the truth-only classification supplies the first component and the inconsistency sheaf supplies the second. For consistent settlings the second component vanishes. For inconsistent settlings it distinguishes patterns invisible to truth-order cohomology alone.

## Transfinite example

Start with the transfinite-induction settling on $E=\omega_1$ and seed $u_0(P)(0,0)=\top$. The closure rule propagates $\top$ to every diagonal cell. Consequently $\Delta^{+,\mathbf{t}}=\varnothing$, the classical $H^1_t$ is zero, while the inconsistency component is

$$H^1(\mathbf{T}^*,\mathcal{F}_U^{(\top)})\cong\bigoplus_{\mu\in L_{\mathrm{ns}}(\omega_1)}\mathbb{Z},$$

and the split knowledge-order cohomology is $H^1_k\cong\bigoplus_{\aleph_1}\mathbb{Z}$. Its bigraded invariant is $(0,\mathbf{1}_\top)$. This is an `example`, not a new classification proof: it demonstrates that a settling can be invisible to the classical sheaf while nontrivial in the inconsistency track.

The three “variants” openers are navigation duplicates for these same sheaf, classification, and transfinite-example claims. They do not warrant separate pages.
