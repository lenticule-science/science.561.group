---
type: theorem
status: sketch
depends-on:
  - heyokha-vocation
  - wolakhota-closure-system
  - closure-2-monad
  - polity-cell-system
title: Heyókha-bearing preserves lax-idempotence
description: Statement.
---

# Heyókha-bearing preserves lax-idempotence

**Statement.** The polity's closure-2-monad $\mathrm{Cl}^\mathcal{S_\mathrm{wolak}}$ on its predication-fibration has *non-trivial lax-idempotence* (i.e., is genuinely 2-dimensional in the sense of [closure-2-monad](../../../../../../../../math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) §"2-categorical closure operator") if and only if the polity has incumbent Heyókha-vocations (entities $H \in E^\mathrm{off}_\mathrm{lak}$ with $\langle H, \texttt{incumbent}, a\rangle \geq_k \mathbf{t}$ for some agent).

## Proof sketch

**Lax-idempotence as substrate-feature.** The closure-2-monad's lax-idempotence is the structural fact that $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$ is a genuine non-identity 2-cell rather than identity.
The 2-cell records the substrate's holding of paradox: closure applied twice may differ from closure applied once by exactly the substrate-content that *cannot be eliminated* by further closure-iteration.

**The Heyókha's structural role.** The Heyókha-conduct (cf. [heyokha-vocation](../../../code/structures/heyokha-vocation.md)) is *wakȟáŋ-marked contrary conduct*: cells that the polity *holds at* $\top$ *deliberately* rather than letting closure resolve them.
The Heyókha riding-backwards is the substrate-instantiation of *cell-at-$\top$-not-to-be-resolved*: the cell records both directions of motion (rider going one way, polity-direction another); the rule-set does *not* fire to resolve the $\top$.

The exemption-rule structure noted in [heyokha-vocation](../../../code/structures/heyokha-vocation.md) §"The vocation's protective immunity": $\mathcal{S}_\mathrm{wolak}$ does *not* fire virtue-evaluation on Heyókha-marked conduct-cells.
This means closure applied to a Heyókha-marked cell does *not* drive it toward truth-class-resolution; the cell persists at $\top$.

**(⇒)** Suppose the polity has incumbent Heyókha-vocations.
Then $\mathcal{S}_\mathrm{wolak}$ contains Heyókha-marked conduct-cells at $\top$.
Applying closure once to the substrate produces these cells as derived-from-the-vocation.
Applying closure twice produces them again with the same $\top$-value: $\mathrm{cl}^2 = \mathrm{cl}$ on the *values* (both stop at $\top$), but the *2-cell from $\mathrm{cl}^2$ to $\mathrm{cl}$ records the route through the Heyókha-cells*.
The 2-cell is non-trivial: it tracks which paths through the substrate-graph the closure took.

In substrate-algebraic terms: the closure's idempotence-modulus is non-trivial because the substrate has *cells designed to be held at $\top$*.
The 2-cell measures the *structural-presence of held-paradox-cells*.

**(⇐)** Suppose no incumbent Heyókha-vocations.
Then $\mathcal{S}_\mathrm{wolak}$'s firing on the substrate has no Heyókha-marked conduct-cells; every conduct-cell is subject to the standard virtue-evaluation; closure drives cells toward truth-class-resolution; the residual $\top$-cells are *uncontroversially-contested* (no deliberate-paradox-bearing).
The 2-cell from $\mathrm{cl}^2$ to $\mathrm{cl}$ collapses to identity at every cell: $\mathrm{cl}^2 = \mathrm{cl}$ strictly.

The polity in this case has *strict-idempotent* closure, falls into the strict regime, and loses its paraconsistency-feature at the operational level. $\square$

## Substrate-content of the equivalence

What the theorem says about the polity:

- **Heyókha-presence ⟺ paraconsistency-feature.** The polity's capacity to *hold* contradictions productively rather than resolve them is structurally bound to the presence of Heyókha-vocations.
- **Heyókha-suppression ⟹ paraconsistency-loss.** The historical suppression of the seven rites and of Heyókha-related conduct (1881–1934, with continuing pressure) was operationally the *suppression of the polity's lax-idempotence*.
  The polity's substrate moved toward strict-idempotence; the paradox-bearing capacity diminished.
- **Reclamation as 2-cell restoration.** Contemporary reclamation work on the seven rites includes restoration of Heyókha-recognition; the 2-cell is being substrate-restored.

## Position relative to the cosmogonic substrate

The 2-cell at polity-scale is the *operational-trace* of the cosmogonic-paradox: Íŋyaŋ-in-Haŋhépi (cf. [iyan-hanhepi](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/iyan-hanhepi.md)) is the originating-paradox; the Heyókha-vocation is the polity-scale-bearer of the paradox-as-living-practice.
The substrate at every scale carries the same four-superior-Wakȟáŋ structure (cf. [tobtob-kin](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/tobtob-kin.md)); the lax-idempotence at polity-scale corresponds to the over-determined $\top$ position of Íŋyaŋ at the bilattice — the cosmogonic-paradox's algebraic location.

The polity's structural-commitment to the Heyókha-vocation is therefore the polity's *living substrate-content* of the cosmogonic paradox.
The polity that loses the Heyókha has lost not merely a ceremonial-vocation but its operational link to the cosmogony.

## Significance

The theorem is the structural answer to "why does the Lakota polity *need* Heyókha?"
The need is not symbolic-cultural but substrate-algebraic.
The polity's capacity to hold contested cells *as load-bearing rather than as system-failure* requires the lax-idempotence 2-cell; the 2-cell requires the Heyókha-vocation's substrate-presence.

The settler-state's persistent attempt to *eliminate* the Heyókha-vocation as religious-superstition (in the boarding-school era and after) was therefore not merely cultural suppression.
It was an attack on the polity's substrate-algebraic capacity to hold its own contradictions, and an attack on the cosmogonic-substrate's continuing operational presence in the polity.

## Sources

- Walker 1980, *Lakota Belief and Ritual*, "Ceremonies of the Heyoka" — the canonical Heyókha-recording.
- Brown, *The Sacred Pipe* (1953) — Heyókha role in ceremony.
- [closure-2-monad](../../../../../../../../math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) — the algebraic underpinning.
- [iyan-hanhepi](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/iyan-hanhepi.md) — the upstream cosmogonic-paradox.
- [tobtob-kin](../../../../../../../philosophy/theories/indigenous/theories/lakotaean-philosophy/concepts/tobtob-kin.md) — the four-superior-Wakȟáŋ structure.
- Vine Deloria Jr., *The World We Used to Live In* (2006) — Heyókha and the wider cosmogonic-substrate.
