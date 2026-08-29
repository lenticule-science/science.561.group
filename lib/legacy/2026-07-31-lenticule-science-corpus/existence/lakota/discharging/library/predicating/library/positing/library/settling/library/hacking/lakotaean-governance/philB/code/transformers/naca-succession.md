---
type: morphism
class: handoff-cobordism
status: draft
symbol: "\\mathrm{succeed\\text{-}naca}_{(a, b, N)}"
depends-on:
  - naca-office
  - naca-installation
  - succession-as-handoff-cobordism
  - wolakhota-closure-system
realizes: [succession, handoff-cobordism]
---

# Naca-succession

When a naca's office-cell falls (by death, virtue-failure, or recognition-withdrawal), a successor is identified through a *handoff-cobordism* on the office-substrate.
The morphism is a specialization of [succession-as-handoff-cobordism](../../../morphisms/succession-as-handoff-cobordism.md) to the Lakota naca-office.

## The setup

The handoff-cobordism takes a settling with $\langle N, \texttt{incumbent}, a\rangle = \mathbf{t}$ (incumbent $a$) and produces a settling with $\langle N, \texttt{incumbent}, a\rangle$ at $\bot$ (or $\mathbf{f}$ if recognition-withdrawn) and $\langle N, \texttt{incumbent}, b\rangle = \mathbf{t}$ for the successor $b$.

The cobordism is *not* a simple substitution.
The substrate-state in between has the office *unincumbencied* — the office-cell exists without a current incumbent.
This intermediate state has structural-consequences for the polity.

## The three cases

**Case A: Death-succession.** The incumbent $a$ dies.
The substrate-firings:

1. $\langle a, \texttt{alive}\rangle \to \bot$ (death-event).
2. $\langle N, \texttt{incumbent}, a\rangle$ drops to $\bot$ automatically (the antecedent-cell of the naca-closure-rule fails).
3. The office is *unincumbencied*; the polity continues with other elder-naca speaking until succession completes.
4. A successor-candidate $b$'s standing-cells are evaluated.
  If $b$'s virtue-standing is $\mathbf{t}$ and an induction-ceremony is conducted, the recognition-aggregation begins.
5. When recognition-aggregates to $\mathbf{t}$, the closure-rule's Stage 3 fires; $\langle N, \texttt{incumbent}, b\rangle = \mathbf{t}$.

The death-succession typically takes weeks-to-months.
During the gap, the polity operates with the remaining elder-naca and the wakíčhuŋza-tópa; major decisions can wait or be conducted at confederacy-scope.

**Case B: Virtue-failure-succession.** The incumbent's conduct drops a virtue-standing-cell below $\mathbf{t}$.
The substrate-firings:

1. The incumbent's conduct produces (W2)-negative cells.
2. Standing-as-$\nu$ for the relevant virtue drops below $\mathbf{t}$.
3. $\langle N, \texttt{incumbent}, a\rangle$ drops automatically (closure-rule's Stage 1 antecedent fails).
4. The agent $a$ remains an elder-naca-candidate possibly (their other virtue-cells may still be intact), but is no longer head-naca.
5. Succession proceeds as in Case A.

This case is rare in practice — most virtue-failures are at small scale and recoverable, not at scale-where-the-cell-drops.
When it does occur, it is *substrate-automatic*; no formal removal-procedure is required.

**Case C: Recognition-withdrawal-succession.** Enough populace-members iyúhá-šni from their recognition-cells that the aggregate fails.
The substrate-firings:

1. Multiple $\langle b, \texttt{recognizes-as-naca}, a\rangle$ cells drop to $\bot$.
2. The closure-rule's Stage 3 antecedent fails.
3. $\langle N, \texttt{incumbent}, a\rangle$ drops automatically.
4. Succession proceeds.

This case is also rare — typically, by the time recognition-withdrawal-aggregates, the agent has already begun substantively-failing the virtue-standings (Case B).
Pure recognition-withdrawal without virtue-failure is possible but uncommon.

## Family-line tendency without hereditary-rule

There is a *tendency* for naca-succession to flow within family-lines: the new naca is often a son, nephew, or grandson of the previous.
This is *not* a hereditary-rule.
The substrate-mechanism:

- A naca's children grow up with extensive *teaches-X-to* cells from the naca to themselves — learning council-protocols, learning the people's affairs, observing the conduct that produces high virtue-standings.
- This teaching-substrate increases the likelihood that the next-generation kin will themselves accumulate virtue-standing cells.
- When succession-time comes, the kin-candidates are typically those with the highest accumulated standings.

But the succession can flow *outside* the family-line.
If a non-kin candidate has higher virtue-standing-accumulation, they are the substrate-recognized successor regardless of kin-line.
Crazy Horse's succession-or-not-succession patterns and similar historical cases show this: family-line is a probabilistic-pattern, not a substrate-rule.

The structural contrast with hereditary-monarchy: a hereditary-monarchy has a closure-rule firing $\langle$child-of-monarch, $\texttt{is-monarch-elect}\rangle = \mathbf{t}$ regardless of conduct.
The Lakota substrate has no such rule; standing-cells must be earned, not inherited.

## Multiple-elder-naca and the senior-naca-cell

A typical oyate has several elder-naca (per [oyate](../objects/oyate.md) §"Constituent predications").
The head-naca-cell (senior-naca) is one specific naca recognized as senior speaker.
Succession can be either:

- *Head-naca succession*: when the senior-naca's cell drops, a new senior-naca is identified from among the remaining elder-naca.
  The other elder-naca remain in place.
- *Elder-naca addition*: when a new elder-naca is added (a younger agent achieving sufficient standing), the new naca-incumbent-cell installs without requiring any existing naca's cell to drop.
  The polity has an additional elder-naca.

The dual-mechanism (succession + addition) is structurally what allows the polity's naca-substrate to remain populated across generations without succession-crisis.
The senior-naca-cell is the *one* cell that gets transferred at succession; the broader elder-naca-set is maintained by ongoing-addition.

## The handoff-cobordism's substrate-content

Per [succession-as-handoff-cobordism](../../../morphisms/succession-as-handoff-cobordism.md), succession is a cobordism in the temporal 2-category $\mathbf{T}(\mathcal{C}_\mathrm{lak}, \lambda)$.
The cobordism takes the polity's substrate at $\tau$ (pre-succession) to the substrate at $\tau'$ (post-succession).
The cobordism-content:

- The accountability-cells from the previous incumbent's term remain on $a$ (the H⁰ₜ-invariant of the chain-of-command theorem applies: accountability does not transfer to the successor).
- The teaching-substrate from $a$'s mentoring of $b$ (typically present in family-line successions) is preserved.
- The succession itself is wakȟáŋ-marked: the induction-ceremony for $b$ is wakȟáŋ-bearing.

The cobordism's homotopy-class is determined by which case (A/B/C) the succession is.
Death-succession has the cleanest cobordism (no contested cells on either side); virtue-failure-succession has $\top$-residue from the failed-virtue period; recognition-withdrawal-succession has $\top$-residue on the recognition-cells that were withdrawn.

## Sources

- Walker 1982, *Lakota Society* — naca-succession patterns and family-line tendencies.
- Marshall, *The Journey of Crazy Horse* (2004) — historical naca-succession in the Oglala line.
- DeMallie 2001, *Handbook of North American Indians* vol.
  13 — succession across the seven Tȟitȟúŋwaŋ oyate.
- Hassrick, *The Sioux* (1964) — recorded succession-events.
