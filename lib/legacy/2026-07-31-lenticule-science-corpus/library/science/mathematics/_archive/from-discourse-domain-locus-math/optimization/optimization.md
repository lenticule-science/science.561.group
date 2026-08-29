---

title: "Optimization"
description: "Optimization is finding the best option within constraints. You have a measure of quality, a set of possibilities, and rules about which possibilities are allowed. Optimization picks the possibility that scores highest on the measure without breaking the rules."
date-created: 2026-03-29
defines:
  - "Optimization"
  - "optimizes"
  - "optimized-by"
  - "optimize"
requires: [measure, constraint]
produces: fixed-point
---

Optimization is finding the best option within constraints. You have a measure of quality, a set of possibilities, and rules about which possibilities are allowed. Optimization picks the possibility that scores highest on the measure without breaking the rules.

The constraints are what make optimization interesting. Without them, the answer is always "infinite" or "everything." With them, the answer is a tradeoff — you cannot improve one thing without worsening another. The best you can do is find a point where no small change helps, which is a fixed point of the optimization process.

Optimization applies an operation repeatedly within a system until it reaches a point that the operation cannot improve further. The system does not change into something else — it becomes a better version of itself. Header bidding optimizes programmatic advertising. It does not replace it. It makes the same auction work better.

When this library uses `optimizes` as a predicate, the subject is a technique and the object is the system it improves. `optimized-by` is the reverse.
