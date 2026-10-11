---
description: Tidepool's default allocation mechanism: a standing default executes unless a heard member objects, members who withdraw are not counted as assenting, and an objection among the heard escalates to a weighted vote.
identity: consensus-by-withdrawal-allocation
name: Consensus by withdrawal (allocation)
date-created: 2026-10-08
relations:
  uses:
    - tally-credit
  contrasts-with:
    - conviction-voting
---
**Consensus by withdrawal**, as an allocation mechanism, runs any question whose answer is a vector over admitted cells (an allocation) or a yes or no (edge admission, charter migration, mutual claim release). At opening the standing default is told: the last quiescent allocation, else a fixed-even split. Each admitted member may assent, object with an alternative, or withdraw; withdrawing drops the member's participation cell to unknown, changes nothing else, and may be undone freely within the window. Silence is unknown and is never counted as assent.

At window close the engaged remainder is read. No objection among the heard carries the default. An objection among the heard is a held contradiction and escalates to the matched-tally vote, whose weight is the [tally credit](../../../../../monetary-economics-science-services-section/content/text/glossary/terms/tally-credit.md) record of matched pairs, with the default and alternatives on the ballot. Nobody heard means adjournment and the fixed-even split executes. The count of those not heard is published. The charter sets a heard quorum required to carry any change from the default; the default itself needs none. The falsifier is that fewer than the quorum are heard in more than half of a rolling twelve-cycle window.

Specification: [Tidepool §3 A4, Consensus by withdrawal](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#a4-consensus-by-withdrawal). Lean: `ObsmetrologiaEconomics.Withdrawal.{quiesce, quiesce_cases, withdraw_touches_one, engaged_antitone}`.
