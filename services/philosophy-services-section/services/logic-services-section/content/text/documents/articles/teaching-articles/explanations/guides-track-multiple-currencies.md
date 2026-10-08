---

title: "Track Multiple Currencies"
description: Record and report on holdings in multiple currencies, including cost basis and exchange rates. Use when the ledger includes foreign currencies or crypto.
date-created: 2026-03-06
keywords:
  - accounting
  - finance
  - beancount
runtime:
  invocation: inference
  tool: llm
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/multi-currency.md
part-of: domesticity/disciplines/accounting
---

- Open accounts with the correct currency constraints.
- Record conversions using Beancount `@` or `@@` syntax with accurate cost basis.
- Add `price` directives from consistent sources to track market values.
- Reconcile foreign-currency accounts in their native currency.
- Review unrealized gains/losses in reports and understand their tax implications.
