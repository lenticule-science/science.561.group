---
name: "Commodity"
aliases:
  - "Commodity"
  - "commodity"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---

In GnuCash, a commodity identifies the unit carried by an
[account](../../../../../../content/text/glossary/terms/account.md), such as a
currency or security. Each account has one commodity, while a transaction also
has a currency in which its splits are valued. A security quantity and its
transaction-currency value are therefore distinct fields.

The price database can retain dated exchange rates or quotes between
commodities. A price answers a valuation question at a stated time and source;
it does not reconstruct acquisition cost, select disposed lots, prove market
liquidity, or reconcile the quantity held. Investment accounting must keep at
least four layers distinct:

- units held in the account commodity;
- transaction value in the transaction currency;
- acquisition lots and relieved historical cost; and
- dated price observations used for a selected report.

Commodity mnemonics also do not establish ownership, custody, restrictions, or
the reporting entity; account structure and source evidence carry those facts.
The GnuCash [transaction and split reference](https://wiki.gnucash.org/docs/STABLE/group__Transaction.html)
documents the amount/value distinction.
