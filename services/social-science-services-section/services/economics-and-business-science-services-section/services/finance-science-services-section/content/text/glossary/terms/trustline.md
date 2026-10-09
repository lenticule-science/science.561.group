---
aliases:
  - credit line pair
  - bilateral credit line
description: A trustline is a bilateral record between two accounts holding each side's credit limit, per-direction interest rates and one signed balance, so that money is the netting of the two parties' debts and no token supply exists.
identity: trustline
name: Trustline
date-created: 2026-10-08
---
A trustline is a bilateral record between two accounts holding each side's credit limit toward the other, an interest rate for each direction, and a single signed balance whose sign says who owes whom. In the Trustlines contracts it is stored per unordered pair of addresses as creditlineGiven and creditlineReceived, interestRateGiven and interestRateReceived, a frozen flag and an int72 balance; a payment between strangers ripples along a chain of trustlines, each hop shifting its balance, with a fee that rises as a hop is pushed toward its limit ([Mutual Credit and Trustline Protocols](../../documents/articles/notes/2026/10/08/2026-10-08-mutual-credit-and-trustline-protocols.md)).

It differs from a [line of credit](./line-of-credit.md) in that the limit runs both ways and the balance can change sign, and from a [tally credit](../../../../../monetary-economics-science-services-section/content/text/glossary/terms/tally-credit.md) in that the limit is agreed by the two parties, not derived from a record of matched receipts. The Trustlines repositories have not changed since 2022 and the project's public sites were down on 2026-10-08.
