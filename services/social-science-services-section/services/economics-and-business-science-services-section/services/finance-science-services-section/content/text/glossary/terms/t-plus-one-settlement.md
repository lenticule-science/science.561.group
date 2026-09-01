---
name: "T+1 Settlement"
date-created: 2026-08-27
aliases:
  - "t+1 settlement"
  - "T+1"
description: "A settlement convention under which contractual cash and securities delivery is scheduled for one business day after trade date."
references: {}
---

**T+1 settlement** schedules contractual delivery of cash and securities for one business day after the trade date: trade date is **T**, and scheduled settlement is **T + 1**.

“Business day” follows the applicable market calendar, so weekends and holidays affect the calendar date. The convention can apply to some instruments and jurisdictions while other products use same-day, longer, or product-specific cycles. A failed settlement can remain unresolved after its scheduled date.

Settlement is distinct from trade execution and from a broker's display of buying power. A broker may extend credit against sale proceeds before settlement, while withdrawal or use for another product can remain restricted. Legal ownership, record dates, securities lending, corporate actions, and cash-account payment rules can also depend on settlement timing.

Systems should store trade date, scheduled settlement date, actual settlement status, market calendar, asset class, and currency separately. Current product coverage and regulatory effective dates belong in dated jurisdictional records rather than in the general convention. See [good faith violation](./good-faith-violation.md) and [free-riding](./free-riding.md).
