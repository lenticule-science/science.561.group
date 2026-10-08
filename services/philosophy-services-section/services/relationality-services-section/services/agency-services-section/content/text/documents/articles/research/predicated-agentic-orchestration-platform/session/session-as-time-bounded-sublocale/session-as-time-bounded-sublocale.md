---
type: theorem
class: engineering-claim
status: proved
depends-on: [session, session-record, scope, application-sublocale, predication-settling, settling-bound, predication-fibration, closure-conditions-composability]
see-also: [agent-record, view-record]
title: A session is the substrate's predication settling restricted to a time-bounded sublocale
description: Claim.
---

# A session is the substrate's predication settling restricted to a time-bounded sublocale

**Claim.** A platform [session](teaching/explanations/session.md) — formally a [session-record](../objects/session-record.md) entity — is structurally a [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) restricted to (i) an [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md) determined by the session's scope and the agent's authorization, and (ii) a bounded ordinal interval $[\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]$ in the substrate's overall settling, where $\tau_{\mathrm{start}}$ is the session's `started-at` and $\tau_{\mathrm{end}}$ is the session's `ended-at` (or the substrate's current ordinal for active sessions).

A session settling $(v_\tau^{\mathrm{sess}})_{\tau \in [\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]}$ is the restriction of the platform's substrate settling to the session's sublocale, with three substantive consequences:

1. **Session activity is closure-driven within its sublocale.** Each operation the agent performs in the session contributes an [increment](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $u_\tau$ to the substrate's increment sequence at ordinal $\tau \in [\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]$, restricted to the session's sublocale.

2. **Session resumability is settling-continuity.** Per [settling-continuity](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-continuity/settling-continuity.md), the session's value at any ordinal $\tau \in [\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]$ is determined by the session's prior valuations and increments.
  Resuming an interrupted session at ordinal $\tau$ is reconstruction of $v_\tau^{\mathrm{sess}}$ from the session record's `event-cursor` and `memory`.

3. **Session closure-conditions inherit by sublocale composability.** Per [closure-conditions-composability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-conditions-composability.md), the session's sublocale inherits closure conditions from the substrate's overall sublocale.
  A session in a constraint-equipped scope is itself constraint-equipped; a session in a self-generating scope is self-generating; etc.

## Why this holds

A session-record's structural fields correspond directly to the math object's data:

- **`scope`** identifies a sub-[predicate-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}_{\mathrm{sess}} \hookrightarrow \mathcal{C}$ and sub-entity-set $E_{\mathrm{sess}} \subseteq E$ on which the session operates.
  The pair $(\mathcal{C}_{\mathrm{sess}}, E_{\mathrm{sess}})$ determines the session's [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md) of the substrate's [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
- **`agent`'s authorization** further restricts the sublocale to the cells the agent has authorization to read or modify.
  By [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), this restriction is a modal-necessity operator $\Box_R$ on the agent's view; the session's effective sublocale is the modally-restricted $\mathcal{C}_{\mathrm{sess}}$-and-$E_{\mathrm{sess}}$.
- **`started-at` and `ended-at`** define the bounded ordinal interval.
  The session's [settling bound](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md) is $\lambda_{\mathrm{sess}} = \tau_{\mathrm{end}} - \tau_{\mathrm{start}}$; the session settling family is indexed by $[\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]$.
- **`event-cursor`** carries the session's current ordinal, supplying $\tau_{\mathrm{current}} \in [\tau_{\mathrm{start}}, \tau_{\mathrm{end}}]$ for active sessions.
- **`memory`** carries the session's accumulated context, which together with the event log restricted to the session's interval is sufficient to reconstruct any $v_\tau^{\mathrm{sess}}$ for $\tau \in [\tau_{\mathrm{start}}, \tau_{\mathrm{current}}]$.

**Part 1: Closure-driven within the sublocale.** Each session operation produces a witness contributing an increment $u_\tau$ scoped to the session's sublocale.
The substrate's [closure-driven](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) discipline applies: $v_{\tau+1}^{\mathrm{sess}} = \mathrm{cl}_{\mathrm{sess}}(v_\tau^{\mathrm{sess}} \vee_k u_\tau)$, where $\mathrm{cl}_{\mathrm{sess}}$ is the substrate's closure operator restricted to the session's sublocale.

**Part 2: Settling-continuity gives resumability.** The session's settling is settling-continuous in the math sense — limit-step values are determined as $\leq_k$-joins of preceding values.
Resuming at $\tau_{\mathrm{current}}$ is reading the session record's `event-cursor` and replaying the session's increment sequence from $\tau_{\mathrm{start}}$ to $\tau_{\mathrm{current}}$; the result is byte-identical to the pre-interruption state per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).

**Part 3: Closure conditions compose.** The session's sublocale is a sub-region of the platform's sublocale.
By [closure-conditions-composability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-conditions-composability.md), the session's sublocale inherits the closure conditions the platform's sublocale satisfies, on the predicates and entities the session admits.

## Engineering consequence

Several engineering consequences:

- **Sessions are first-class substrate objects.** A session is queryable like any other entity; its history is replayable; its state is auditable.
  The platform does not need a separate "session manager" outside the substrate — the session record IS the session.
- **Session bounds are substrate ordinals, not wall-clock times.** The substrate's settling-bound discipline is what matters for session completeness.
  Wall-clock time is informational metadata; the session's bounded interval is in substrate ordinals (event-log positions).
  For substrates in non-Scott-continuous regimes, a session may span transfinite ordinals — the session record must accommodate this per the regime.
- **Concurrent sessions are independent settlings.** Two sessions on different sublocales operate independently per [independence-implies-confluence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/independence-implies-confluence.md); the substrate can interleave their increments without affecting either's outcome.
  Sessions on overlapping sublocales must coordinate via the substrate's normal merge discipline.
- **Cross-session memory persists in the substrate.** The session's `memory` is substrate content; when the session closes, the memory persists as substrate predications.
  A subsequent session by the same agent can read prior-session memory through normal traversal — there is no "session memory loss" inherent in session boundary, only the boundary in agent attention.

## What the theorem rules out

- A "session" implemented as in-memory runtime state outside the substrate is not a substrate-side session.
  Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), runtime state without substrate representation breaks the [driver-substrate-split](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/driver-substrate-split.md): the session is not auditable, not replayable, not federation-portable.
- A session whose scope is not declared as an application-sublocale — a session that "sees everything" — has no closure-conditions-composability guarantee.
  The substrate's response is to require explicit scope declaration; sessions without scope are admissible only as transient interactive participants without substrate operations.
- A session whose start and end ordinals are not in the substrate's event log is incompletely recorded.
  Per [event-log](../../../objects/event-log.md), the session's bounds must be substrate ordinals to support resumability and replay.

## What the theorem requires

- The session-record cites a [scope](../../scope/scope.md) that determines an [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md) of the substrate's predication fibration.
- The session-record cites an agent whose authorization further restricts the sublocale (per [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md)).
- The session's `started-at` is a substrate ordinal in the event log; `ended-at`, when set, is also a substrate ordinal.
- The session's operations contribute increments to the substrate's increment sequence, with each operation producing a witness per [witness](../../../objects/witness.md).
- The substrate's closure operator restricted to the session's sublocale satisfies the four [closure-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms on the restriction.
