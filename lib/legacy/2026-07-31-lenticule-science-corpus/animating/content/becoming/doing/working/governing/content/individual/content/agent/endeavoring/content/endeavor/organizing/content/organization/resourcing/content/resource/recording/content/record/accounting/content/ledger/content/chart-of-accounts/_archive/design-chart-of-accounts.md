---

title: "Design Chart of Accounts"
description: Design and maintain a chart of accounts that reflects actual reporting needs. Use when setting up a new ledger or restructuring an existing one.
date-created: 2026-03-06
keywords:
  - accounting
runtime:
  invocation: inference
  tool: human
region:
  reads: ["content/domesticity/disciplines/accounting/"]
  writes: ["content/domesticity/disciplines/accounting/"]
dependencies:
- /domesticity/accounting/curricula/chart-of-accounts.md
part-of: domesticity/disciplines/accounting
---

- Identify all asset, liability, equity, income, and expense categories relevant to the household.
- Organize accounts hierarchically using colon-separated names (`Type:Category:Subcategory`).
- Align expense categories with tax form categories and budget categories.
- Open each account in Beancount with appropriate currency constraints.
- Review and refine the chart when reporting reveals missing distinctions.
