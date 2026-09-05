---

name: "Verification"
description: "Verification is checking that something satisfies its constraints. A trial balance verifies a ledger by checking that debits equal credits. A type checker verifies a program by checking that every expression has a consistent type. A proof verifies a theorem by checking that each step follows from the previous one."
date-created: 2026-03-29
requires: [measure]
produces: determination

---

Verification is checking that something satisfies its constraints. A trial balance verifies a ledger by checking that debits equal credits. A type checker verifies a program by checking that every expression has a consistent type. A proof verifies a theorem by checking that each step follows from the previous one.

Verification does not create the thing it checks. It takes something that already exists and confirms whether it is correct according to some standard. The standard must exist independently of the thing being verified — otherwise there is nothing to check against.

Verification produces a determination: either the thing meets the standard or it does not. In practice, verification often produces more than a yes/no — it produces a description of where and how the thing deviates from the standard, which is more useful than a bare pass/fail.

When this library uses `verifies` as a predicate, the subject is a check and the object is what it checks. `verified-by` is the reverse.
