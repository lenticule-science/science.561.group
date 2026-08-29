---

title: "Relief"
description: "A Relief is a triple (O, h, R) — an office O, a holder h currently in H*_{t*} (the settled binding), and a reason R (for cause, by request, end of tour, emergency) — together with a dissolution act that drives h's role-binding from H*_{t*} to ⊥. The defining structure: relief is the retraction of the section installed by investiture; after relief, the office O exists with its position vacant (the section s_r → h is collapsed to s_r → ⊥). Relief is the inverse morphism of the investiture's I⁺ act: it applies σ_{t*} to dissolve rather than settle the role-binding. Three cases have distinct formal structures: mutual relief (full investiture I⁻ with μ = 1), relief for cause (unilateral dissolution without incoming holder acknowledgement), and emergency succession (the relief is simultaneous with assumption by the successor)."
defines: Relief
related: Investiture, Succession, Office, Duty, Captain, DutyOfficer, Incumbent, HohfeldianPosition, Record, Accountability
date-created: 2026-03-20
---

## Formal definition

A **Relief** is a triple $\mathfrak{R} = (O, h, R)$:

$$\mathfrak{R} = (O : \mathrm{Office},\; h : H^*_{t^*},\; R : \mathrm{ReasonClass})$$

together with a **dissolution act** $\varepsilon : H^*_{t^*} \to \bot_{t^*}$:

$$\varepsilon(h) = \bot_{H_{t^*}}$$

where:
- $O$ is the **office** — the position being vacated; $O$ carries its full Hohfeldian deontic profile (authority, accountability, non-delegable duties) independently of who holds it
- $h \in H^*_{t^*}$ is the **current holder's binding** — the role-assignment proposition that is currently meaning-settled: $\sigma_{t^*}(h) = h$ and $\Delta_{t^*}(h) = h$; the holder is in the doubly-quiescent layer
- $R$ is the **reason class** — one of the structurally distinct cases (see below); the reason determines whether mutual acknowledgement $\mu$ is required
- $\varepsilon$ is the **dissolution act** — the formal event that drives $h$ from $H^*_{t^*}$ to $\bot_{H_{t^*}}$: the binding is dissolved, the section $s_O \mapsto h$ is replaced by $s_O \mapsto \bot$, and the office is vacant

**Three invariants.** $\mathfrak{R}$ is a valid relief iff:

1. **Settled binding**: $h \in H^*_{t^*}$ before $\varepsilon$ — the holder must be properly installed (in the doubly-settled layer) for relief to be meaningful. Relief of a person who was never invested is void: $h \notin H^*_{t^*}$ means there is no binding to dissolve.

2. **Vacancy after dissolution**: $\varepsilon(h) = \bot_{H_{t^*}}$ — after the relief act, the office's section position is genuinely vacant: $s_O \mapsto \bot$. No residual binding persists; the holder's accountability and authority within $O$'s scope return to zero. If relief is immediately followed by a new investiture, the vacancy is instantaneous (a limit point between the two bounded intervals).

3. **Documentary record**: $\mathfrak{R}$ is normatively effective only when recorded — in a log entry, orders, or official announcement. The record is the institutional expression that makes the vacancy legible to third parties. An unrecorded relief may be physically complete but institutionally invisible.

## The three cases

### Mutual relief (normal rotation)

The full investiture acts $I^+$ and $I^-$ with mutual acknowledgement $\mu = 1$ ([Investiture](../../../terms/investiture.md)). The outgoing holder says "I stand relieved" (or equivalent); the incoming holder says "I relieve you." Both acknowledgements are required for $\varepsilon$ to be effective. The relief and the next investiture are not separate events but two halves of a single handover morphism:

$$I^+ \circ \mathfrak{R} = \mathrm{handover}(O, h_{\mathrm{out}}, h_{\mathrm{in}})$$

The vacancy between $\varepsilon(h_{\mathrm{out}}) = \bot$ and $\sigma_{t^*}(h_{\mathrm{in}}) = h_{\mathrm{in}}$ is instantaneous: continuity invariant 3 of [Investiture](../../../terms/investiture.md) ensures no gap and no overlap.

### Relief for cause

Unilateral dissolution by a superior authority, without incoming holder acknowledgement. The superior applies $\varepsilon$ without $\mu = 1$; the outgoing holder's consent is not required. The consequence: the outgoing holder's binding is dissolved and the office is vacant until the next investiture. Relief for cause may leave the office without a ready replacement — the vacancy is real and may persist.

The formal difference from mutual relief: $\mu = 0$ but $\varepsilon$ is still valid because the superior holds the authority to dissolve the binding unilaterally. UCMJ Art. 71 (removal of a commissioned officer), 33 CFR Part 164.82 (maritime: owner or charterer can relieve master), SOLAS Chapter XI-2/6 (port state can relieve master for safety violations): all provide this unilateral dissolution authority.

### Emergency succession

Relief is simultaneous with assumption by the successor: $\varepsilon(h_{\mathrm{out}})$ and $\sigma_{t^*}(h_{\mathrm{in}})$ occur at the same instant, triggered by an activation predicate (death, incapacity, capture). There is no mutual acknowledgement from the outgoing holder because they cannot give it. The documentation is performed by the incoming holder: the assumption is documented in writing, recording the time of assumption and the triggering condition.

Emergency succession is the relief case studied in [Succession](succession.md): the ordered list of candidates activates when the primary holder's binding cannot be maintained.

## Math grounding

The relief act is the **nuclear dissolution** of the settled binding $h \in H^*_{t^*}$:

- Before $\varepsilon$: $h \in H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$ — the binding is doubly quiescent
- $\varepsilon$ applies $\sigma_{t^*}$ in the dissolving direction: $\sigma_{t^*}$ is applied to retract $h$ from $H^*_{t^*}$ back into $H_{t^*} \setminus H^*_{t^*}$, and then the restriction map $H(f) : H_{t^*} \to H_{t^*-}$ propagates the vacancy backward
- After $\varepsilon$: $h \mapsto \bot_{H_{t^*}}$ — the binding is at the bottom element; the office position is unfilled

The dissolution act $\varepsilon$ is a restriction map $H(f)$ in the contravariant direction of the presheaf ([Passage](../../../humanities/domains/math/passage.md), backward pole): it restricts the settled binding at $t^*$ to its predecessor history, removing the forward-settled content. In section terms ([Section](../../../humanities/domains/math/section.md)): $\varepsilon$ is the **retraction** of the section $s_O : \{O\} \to H^*_{t^*}$ — it collapses the right inverse back to the zero element.

## Relief vs. resignation vs. expiry

| Mechanism | Initiator | Mutual ack. | Holder's role | Math |
|---|---|---|---|---|
| Normal relief | Superior + holder | Required ($\mu = 1$) | Outgoing holder acknowledges release | Section retraction with counit |
| Relief for cause | Superior only | Not required | Holder's consent irrelevant | Unilateral nucleus dissolution |
| Resignation | Holder only | Accepted by superior | Holder requests dissolution | Holder-initiated section retraction |
| Expiry of tour | Institutional schedule | Automatic at $T$'s end | Section lapses by period end | Temporal boundary of enrollment |

Resignation is the holder-initiated relief: $h$ requests $\varepsilon$ and the institutional authority accepts. The formal structure is the same as mutual relief but the direction of initiation is reversed.

Expiry is the automatic lapse of enrollment at $T$'s end ([Enrollment](../../../../../terms/enrollment.md), invariant 3): not a relief act but the natural termination of the bounded-period section. An officer whose tour ends is not "relieved" — their section lapses.

## Open questions

- Whether relief for cause (unilateral $\varepsilon$ without $\mu$) has a distinct categorical structure from mutual relief — whether the two are different morphisms or the same morphism with different generators ($\mu = 1$ vs. $\mu = 0$ as a parameter of the dissolution act, not a separate type).
- Whether the vacancy state (after $\varepsilon$, before the next $I^+$) has a formal object in the category — an empty section object $\bot_O$ — and whether vacancy is a valid state of the fibration or only a transitional non-state.
- Whether a chain of reliefs and investments can be represented as a path in the category of sections over the office fibration, and whether this path has a normal form (relief–vacancy–investment is the 3-step normal form, collapsing to a single handover morphism when vacancy is instantaneous).
