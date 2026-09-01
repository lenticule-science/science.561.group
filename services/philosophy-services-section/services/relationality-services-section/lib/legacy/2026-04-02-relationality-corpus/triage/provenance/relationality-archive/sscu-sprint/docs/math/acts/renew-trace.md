---

name: renew-trace
act: RenewTrace
top: TraceStep
bottom: CompleteTrace
summary: After stepping, the renewed orientation must contact the full record, so the act *Trace Step* witnesses the act *Complete Trace*.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

After stepping, the renewed orientation must contact the full record, so the act *Trace Step* witnesses the act *Complete Trace*.

In `(TraceStep CompleteTrace)` the act *Trace Step* observes *Complete Trace*, confirming that the renewed orientation spans the entire record.  This composition is therefore *Renew Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
