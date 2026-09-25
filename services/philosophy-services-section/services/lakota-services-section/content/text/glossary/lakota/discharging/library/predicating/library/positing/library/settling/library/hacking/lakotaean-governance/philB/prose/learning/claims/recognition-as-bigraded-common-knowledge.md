---
type: theorem
status: sketch
depends-on:
  - naca-office
  - wakichunza-office
  - wicasa-wakhan-office
  - office-as-double-settlement
  - bigraded-common-knowledge
  - recognition-as-bigraded-common-knowledge
realizes: [recognition-as-bigraded-common-knowledge]
title: Office-recognition is bigraded common knowledge in $\mathcal{S}\mathrm{wolak}$
description: Statement.
---

# Office-recognition is bigraded common knowledge in $\mathcal{S}_\mathrm{wolak}$

**Statement.** Per [recognition-as-bigraded-common-knowledge](../../../theorems/recognition-as-bigraded-common-knowledge.md), an office's recognition is *bigraded common knowledge* — common knowledge in both the truth-axis $C^t$ and the knowledge-axis $C^k$ of the [bigraded common knowledge theorem](../../../../../../../math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md).
The Lakota offices (naca, wakíčhuŋza, akicita, wičháša wakȟáŋ, blotáhuŋka, Heyókha) each instantiate this bigraded structure with specific Lakota-substrate firings.

## The bigraded structure

The [bigraded common knowledge theorem](../../../../../../../math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) defines two independent greatest-fixed-point common-knowledge operators on the predication-fibration:

- $C^t \phi$: common-knowledge in the truth-axis.
  "Every agent knows $\phi$ in the truth-class sense, and knows that every agent knows it, ad infinitum."
- $C^k \phi$: common-knowledge in the knowledge-axis.
  "Every agent has $\phi$ at knowledge-class $\top$ (or designated knowledge-level), and recursively."

The two operators are *bottoming-differently*: $C^t$ bottoms at $\mathbf{f}$ (truth-axis-bottom) on cells with no consensus-truth; $C^k$ bottoms at $\bot$ (knowledge-axis-bottom) on cells without knowledge-aggregation.
They are not collapsible into a single operator.

## Application to the naca-office

A naca's office-recognition has both bigraded readings:

**$C^t$-reading**: every populace-member's $\langle \text{populace-member}, \texttt{recognizes-as-naca}, a\rangle$ cell is at $\mathbf{t}$, and every populace-member knows that every populace-member's cell is at $\mathbf{t}$, ad infinitum.
This is the *populace's collective affirmation* of $a$'s naca-standing.

**$C^k$-reading**: every populace-member has the knowledge "$a$ is the naca" at $\top$ in the knowledge-axis (the cell is informationally-maximal — both the affirmation and any potential denial are settled simultaneously, and the merge is at $\top$ recording that the populace has settled this cell as definitively-known).

In the Lakota substrate, *both readings hold simultaneously*.
The structural-consequence:

- The naca's office-cell is at $\mathbf{t}$ in the merged-settling.
- The naca's office-cell is at $\top$ in the knowledge-axis (everyone knows everyone knows, etc.).
- The two cells are *aligned* (the $C^t$ and $C^k$ readings produce compatible substrate-states).

## When the bigraded structure diverges

The bigraded structure *can diverge* — and the divergence is itself informative about the polity's substrate-state.

**Case A: $C^t$ holds, $C^k$ does not.** The populace's individual cells all affirm $a$ as naca, but the *knowledge-of-each-other's-affirmation* is not in place.
Substrate-content: people have not been communicating enough; they each affirm but don't know that others affirm.
The office is *substantively* installed but *informationally* unstable — a small shock could collapse the affirmation if any individual's withdrawal cascades.

**Case B: $C^k$ holds, $C^t$ does not.** Everyone *knows* the polity-state on the office (the knowledge-axis is at $\top$ — the question has been substrate-settled), but the truth-class is not $\mathbf{t}$ — it is $\top$ (contested) or $\mathbf{f}$ (the populace knows the naca is *not* recognized but the substrate has not retracted the office-cell yet).
Substrate-content: the office is procedurally-in-place but substantively-failed.
Typically precedes recognition-withdrawal-succession (Case C of [naca-succession](../../../code/transformers/naca-succession.md)).

**Case C: both diverge.** The populace's substrate is in *unsettled-knowledge* about the office and *unsettled-recognition* of the office.
Substrate-content: substrate-emergency.
Typically corresponds to the early-stages of contested-succession.

The two readings together provide a *richer diagnostic* of office-state than either alone.

## Application to other offices

The bigraded structure applies to all the Lakota offices:

- **Wakíčhuŋza**: $C^t$ at the council-level (the omníčiye's collective appointment), $C^k$ at the populace-level (the polity knows the wakíčhuŋza).
  The bigraded structure protects against rogue-wakichunza claims (someone asserting wakichunza-standing without the bigraded-recognition).
- **Wičháša wakȟáŋ**: $C^t$ within the polity's wakȟáŋ-substrate-recognition-network; $C^k$ at the broader-polity level.
  The bigraded structure is what makes claimed-wičháša-wakȟáŋ-without-proper-installation substrate-detectable — the claim has neither $C^t$ nor $C^k$ supporting it.
- **Akicita**: $C^t$ within the war-party / hunt-party scope; $C^k$ at the oyate level.
  Scoped to the active-scope; the bigraded structure does not extend beyond scope-completion.
- **Blotáhuŋka**: Similar to akicita-scoped; the office's bigraded recognition exists during scope-active and is retracted at scope-completion.
- **Heyókha**: $C^t$ on the wakȟáŋ-vocation cell (the polity affirms the dreamer's vocation); $C^k$ on the protected-status cells (everyone knows the contrary-conduct is wakȟáŋ-protected).
  The Heyókha's substrate-position depends on this bigraded structure being intact.

## Significance

The theorem provides the substrate-algebraic content of "the polity recognizes its offices through aggregating common knowledge in two distinct senses simultaneously."
This is *not* the Western-procedural form of office-recognition (a single official-list maintained by an authority).
The Lakota offices are *substrate-emergent*: they exist when and only when the bigraded structure holds across the populace.

Operational consequence: a claim to office that does not have bigraded backing *cannot fire* the office's authority-cells, even if procedural steps were followed.
The substrate's office-recognition reads the bigraded structure directly; missing bigraded-content means the office-cell is not actually at $\mathbf{t}$ in the merged settling.
The polity's natural defense against unauthorized office-installation is the bigraded structure's substrate-presence.

## Sources

- [bigraded-common-knowledge](../../../../../../../math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) — the underlying bigraded structure.
- [recognition-as-bigraded-common-knowledge](../../../theorems/recognition-as-bigraded-common-knowledge.md) — the predicated-governance specialization.
- Walker 1982, *Lakota Society* — recorded office-recognition patterns.
- Ella Deloria, *Speaking of Indians* (1944) — recognition as polity-substrate.

## Earlier material

**Case B: $C^k$ holds, $C^t$ does not.** Everyone *knows* the polity-state on the office (the knowledge-axis is at $\top$ — the question has been substrate-settled), but the truth-class is not $\mathbf{t}$ — it is $\top$ (contested) or $\mathbf{f}$ (the populace knows the naca is *not* recognized but the substrate has not retracted the office-cell yet).
Substrate-content: the office is procedurally-in-place but substantively-failed.
Typically precedes recognition-withdrawal-succession (Case C of [naca-succession](../../../code/transformers/naca-succession.md)).
