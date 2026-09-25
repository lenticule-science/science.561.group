---
kind: example
status: draft
depends-on: [anderson-putnam-direct-limit, penrose-classifying-invariant, penrose-substitution-settling, fibonacci-anderson-putnam-comparison, aperiodic-regime-classification, anderson-putnam1998, sadun2008]
instantiates: [aperiodic-regime-classification]
lineage: 5
title: "Penrose substitution: full corpus vs Anderson-Putnam comparison"
description: The L5c full-comparison instance — the corpus's framework demonstrated on the literature's most-developed aperiodic case.
---

# Penrose substitution: full corpus vs Anderson-Putnam comparison

The L5c full-comparison instance — the corpus's framework demonstrated on the literature's most-developed aperiodic case.

## Anderson-Putnam Penrose computation

[@anderson-putnam1998] (and [@sadun2008] §4) gives:

$$\check{H}^1(\Omega_{\text{Penrose}}) \;\cong\; \mathbb{Z}^5.$$

The five generators correspond to the five distinct Penrose tile types (under the natural encoding) and to specific cohomology classes detecting tile-arrangement features (the matching rules).

## Corpus computation

[penrose-classifying-invariant](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/examples/penrose-classifying-invariant.md) gives the pre-quotient corpus invariant:

$$\mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Penrose}}) \in \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}.$$

After quotient by settling-shift (the corpus's natural MLD-relation):

$$\mathrm{cl}\text{-}\mathrm{inv}(v_{\text{Penrose}}) / \sim_{\mathrm{settling-shift}} \;\stackrel{?}{=}\; \mathbb{Z}^5.$$

**Conjecture: yes.** The corpus's framework should reproduce Anderson-Putnam's $\mathbb{Z}^5$ for Penrose. **Verifying this is the L5c benchmark.**

## What's at stake

Three structural payoffs depending on the verification:

**1. If $\mathrm{cl}\text{-}\mathrm{inv}/\sim = \mathbb{Z}^5$**: the corpus's framework correctly reproduces Anderson-Putnam on the field's most-cited benchmark. Major validation that the framework generalizes Anderson-Putnam tiling cohomology faithfully.

**2. If $\mathrm{cl}\text{-}\mathrm{inv}/\sim$ is a different finite-rank group**: the corpus's framework gives a *different* invariant for Penrose. The discrepancy is structurally informative — points to where the corpus's bilattice / closure-rule encoding genuinely differs from Anderson-Putnam.

**3. If the verification can't be carried out**: gaps in the corpus's framework surface — most likely in the cellular extension plan's transfinite-cellular details, the substitution-as-closure-rule encoding, or the settling-shift quotient definition.

## Substantial new content the corpus adds

Beyond the Anderson-Putnam $\mathbb{Z}^5$, the corpus's framework on Penrose gives:

- **Bilattice-valued invariants.** Penrose tilings encoded with bilattice structure could exhibit truth-only / falsity-only / $\top$ orbit-types under composed duality. The strong-MLD orbit-type stratification.
- **Verdier-dual presentation.** The cosheaf-side dual of $\check{H}^1(\Omega_{\text{Penrose}})$ — an *independent* presentation of the classifying data via cosheaf homology.
- **Deformation theory.** $\mathrm{Ext}^1$ at a Penrose moduli point — a deformation tangent space describing nearby Penrose-like tilings.
- **Meta-classification.** The Penrose substitution rule placed in the meta-aperiodic stratum, paired with closure-equivalent rule variants.

## Position in Lineage 5c

The L5c headline instance — the framework's most substantive comparison with established literature. If the verification carries out cleanly, the corpus has *demonstrated* its framework on the field's reference benchmark. If not, the gaps surface specific next research targets.

**Status: draft.** The actual verification (computing $\mathrm{cl}\text{-}\mathrm{inv}/\sim$ for the corpus's Penrose encoding and comparing with Anderson-Putnam's $\mathbb{Z}^5$) is the corpus's most demanding open computational task.
