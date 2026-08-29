---

name: feedback_one-fix-at-a-time
description: Identify one problem, fix it, verify, move on — don't plan or batch
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

When improving infrastructure, work one concrete fix at a time. Identify a specific broken thing, fix it, verify the fix, then move to the next thing.

**Why:** The user gets frustrated when Claude spends context on plans, audits, and gap analyses instead of shipping fixes. Three sessions were spent "planning ECC integration" with almost no concrete changes. When Claude finally identified "session-start is in the wrong lifecycle stage" and just fixed it, that took 5 minutes and immediately improved things.

**How to apply:** When asked to improve the harness or infrastructure: (1) identify the most impactful broken thing you already know about, (2) fix it, (3) verify it works, (4) move to the next one. No gap analyses, no priority matrices, no "let me plan the approach." Just fix things.
