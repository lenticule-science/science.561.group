---
type: concept
status: draft
depends-on:
  - wolakhota-closure-system
  - residuated-restriction-as-authority-gate
  - four-bilattice
  - polity-cell-system
realizes: [authority-gate]
---

# Authority-gate (Lakota form)

The polity's authority-gate pattern is *virtue-witnessed*: payloads are gated by an authority-element that is itself a function of the agent's accumulated standing-cells under (W2) of $\mathcal{S}_\mathrm{wolak}$.
The structural form is the [residuated-restriction-as-authority-gate](../../../../../../../math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md) pattern from predication-categories, specialized to the Lakota substrate.

## The authority value

For an agent $a$ proposing a substrate-operation on cell $\phi$, the authority-value applied as residuation is determined by $a$'s standing-cells.
The map:

$$\mathrm{auth}(a, \phi) := \begin{cases} \top & \text{if } a \text{ has wičháša-wakȟáŋ standing on } \phi\text{'s wakȟáŋ-class} \\ \mathbf{t} & \text{if } a \text{ has four-virtue standing on the relevant virtue-class} \\ \bot & \text{if } a \text{ has no standing on the relevant cell-class (silent authority)} \\ \mathbf{f} & \text{never (denying authority is structurally absent — see below)} \end{cases}$$

The incoming-constrained payload at $\phi$ is then:

$$\mathrm{constrained}(a, \phi) = \mathrm{auth}(a, \phi) \Rightarrow \mathrm{proposed}(\phi)$$

per the residuation table of the cited theorem.

## Why $\mathbf{f}$-authority is structurally absent

By the residuation table, $\mathbf{f}$ (denying authority) produces uniform $\mathbf{t}$ output — *every payload is affirmed*.
This is paraconsistent ex-falso: an authority that internally denies as a substrate-fact about itself produces affirmation as its gate-output.
Substrate-design implication: an authority-element-value of $\mathbf{f}$ does not gate anything; it permits everything.

The Lakota polity's substrate does not employ $\mathbf{f}$-authority.
The structural reasoning:

- $\mathcal{S}_\mathrm{wolak}$'s authority-gate is *virtue-witnessed*.
  An agent without standing has no authority — that is $\bot$ (silent authority), not $\mathbf{f}$.
- $\mathbf{f}$-authority would correspond to an agent who *positively asserts producer-identity-neutrality* — a substrate-fact "I have no authority here" that, by residuation, would *uniformly permit* anything proposed.
- The substrate-content of "I have no authority here" in $\mathcal{S}_\mathrm{wolak}$ is *the absence of authority-cells*, which is $\bot$, not $\mathbf{f}$.

The polity's substrate therefore uses three of the four authority-rows: $\top$ (wičháša-wakȟáŋ-equivalent), $\mathbf{t}$ (virtue-standing), $\bot$ (no standing).
The $\mathbf{f}$ row is structurally unreachable.

## Reading the rows for the Lakota polity

**$\top$-authority** (paraconsistent / wičháša-wakȟáŋ-equivalent): identity on payloads.
The wičháša wakȟáŋ's authority on wakȟáŋ-class cells does not *filter* the payload — it passes through.
The structural consequence: the wičháša wakȟáŋ does not modify what payloads achieve; their authority is *the condition for the payloads to fire at all* (the (W5) office-installation requires wakȟáŋ-witness, etc.), not a content-modification gate.

**$\mathbf{t}$-authority** (affirming / virtue-standing): identity on $\{\bot, \mathbf{t}, \mathbf{f}\}$; demotes $\top$ to $\mathbf{f}$.
A virtue-standing agent's authority passes through ordinary $\mathbf{t}/\mathbf{f}/\bot$ payloads but *removes paraconsistent content* from $\top$-payloads.
The substrate-content: an authority-bearer's gating *resolves contestation* — when a contested ($\top$) payload comes through their gate, the negative-evidence-component is retained and the positive is filtered.
This is the substrate-mechanism of "the council settles by *removing* the contested-affirmation reading and treating it as denied-pending-further-evidence."

**$\bot$-authority** (silent / no-standing): produces $\mathbf{t}$ on $\{\bot, \mathbf{t}\}$ payloads; $\bot$ on $\{\mathbf{f}, \top\}$ payloads.
A no-standing agent's "authority" lets positive-payloads through (no negative content to filter) but collapses negative-evidence and contested payloads to silence.
The substrate-content: an agent without authority cannot *fire* negative-evidence cells; their attempted assertions are demoted to substrate-non-events on the polity's record.

This is what protects the polity from coup-attempts and arbitrary-claim-installation: an agent without standing cannot fire substrate-cells that the polity recognizes; their attempts are silenced.

## The score-governed variant

Per [score-governed-authority-gate](../../../../../../../math/theories/categories/theories/predication-categories/concepts/score-governed-authority-gate.md) (predicated-governance), authority can be *score-governed* — a numeric scoring on cell-history determines the authority-element.
The Lakota form has a specific score-governance: the score is the *standing-as-wolakȟota* cell's $\leq_k$-value, which itself is computed from the (W2) virtue-evaluation accumulation.

Substrate-algebraically: an agent's standing-as-wolakȟota is a $\leq_k$-monotone cell that aggregates the agent's virtue-conduct cells over time.
The score is the *cell's current $\leq_k$-value*.
The authority-element is *derived* from this score:

- Score $= \top$ (extremely high accumulated standing): wičháša-wakȟáŋ-equivalent authority.
- Score $= \mathbf{t}$ (high but not exceptional): virtue-standing authority.
- Score $= \bot$ (low or zero): no-standing authority.

The score-governance is *automatic* — no central authority computes it; the cell-accumulation under (W2) makes the score visible to the polity's substrate, and the substrate-recognition reads it.
This is the substrate-content of "everyone knows who is in good standing without anyone needing to keep a ledger."

## The kin-conditioned authority

The above authority-gate operates on *substrate-cells in general*.
For cells in the kin-class ($\Pi^\mathrm{kin}$, kin-care, etc.), there is an additional *kin-condition*: only kin (or huŋkápi-adopted-kin) can fire kin-class cells with full force.
A non-kin agent's authority-element is reduced by one tier on kin-class cells.

This is the substrate-mechanism for "outsiders cannot install kin-cells."
A non-kin proposing a kin-action has their authority reduced to $\bot$ for the kin-class cells, regardless of their general standing-as-wolakȟota.

## Sources

- [residuated-restriction-as-authority-gate](../../../../../../../math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md) — the algebraic underpinning.
- Ella Deloria, *Speaking of Indians* (1944) — virtue-witnessed authority in Dakota/Lakota political life.
- Marshall, *The Lakota Way* (2002) — the four virtues as authority-substrate.
- Walker 1982, *Lakota Society* — naca-and-wakichunza authority patterns.
