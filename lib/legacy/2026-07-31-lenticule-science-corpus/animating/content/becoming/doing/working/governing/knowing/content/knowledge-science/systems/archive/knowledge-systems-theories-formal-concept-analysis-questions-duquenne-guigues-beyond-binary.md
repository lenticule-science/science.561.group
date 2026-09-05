---
type: question
status: open
depends-on: [duquenne-guigues-completeness, residuated-context, belohlavek-bridge]
see-also: []
---

# Does Duquenne–Guigues generalise to the residuated case?

The Duquenne–Guigues theorem (per [duquenne-guigues-completeness](../theorems/duquenne-guigues-completeness.md)) gives a *minimum-cardinality* canonical implication base for any finite binary formal context. The construction proceeds via *pseudo-intents*, which are well-defined by induction on the Boolean lattice $\mathcal{P}(M)$.

The open question:

> Does an analogous canonical minimum-cardinality implication base exist for finite residuated contexts (per [residuated-context](../objects/residuated-context.md)) at every choice of complete residuated lattice $\mathbf{L}$?

## Status of the question

Partial results exist:

- **Boolean $\mathbf{L} = \mathbf{2}$.** Recovered by Duquenne–Guigues. Settled.
- **Finite Heyting $\mathbf{L}$.** Pollandt (1997) and others have constructions; the question of *minimum cardinality* among generating bases is open in general.
- **$\mathbf{L} = [0, 1]$ with Łukasiewicz residuation.** Belohlavek and others have given graded-implication bases that generate the implication theory; canonical minimality is open and depends on what "minimum" means in the graded setting.
- **General complete residuated $\mathbf{L}$.** Belohlavek-Vychodil (2005) develop a graded-implication framework and prove a non-redundant base exists, but the analogue of Duquenne–Guigues *minimum cardinality* is not established at this generality.

## Why the question matters for the predicated framing

Per [belohlavek-bridge](../theorems/belohlavek-bridge.md), the residuated FCA construction embeds into the predicated substrate's knowledge-fiber-algebra. A residuated-FCA Duquenne–Guigues theorem would supply a *minimum closure-rule presentation* for the substrate's FCA-degenerate sub-substrate at any residuated value-domain — including the bilattice $\mathbf{2} \otimes \mathbf{2}$ that the substrate uses by default.

A negative result would be equally informative: it would tell the predicated framing that minimum-presentation results in restricted sub-substrates do not generally lift to the bilattice value-domain, and that the substrate's general theory cannot expect canonical-minimum closure-rule systems even in degenerate fragments.

## What an answer would look like

A positive answer would supply: a definition of *graded pseudo-intent* generalising the binary case; a proof that the family of $P \to P''$ for graded pseudo-intents $P$ is sound, complete, and minimum cardinality; a characterisation of the cases (which $\mathbf{L}$, which $\mathbb{K}$) where the minimum is unique up to renaming.

A negative answer would supply: a residuated context $\mathbb{K}$ exhibiting two non-equivalent generating implication bases of the same minimum cardinality, refuting uniqueness; or a context where no finite minimum exists, refuting existence.
