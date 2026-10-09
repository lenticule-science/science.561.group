---
title: GnuCash
description: GnuCash is a double-entry accounting application with an account hierarchy, transaction-and-split model, multiple-commodity support, import matchers, scheduled transactions, reconciliation workflows, reports, and several storage backends.
---
# GnuCash

GnuCash is a double-entry accounting application with an account hierarchy,
transaction-and-split model, multiple-commodity support, import matchers,
scheduled transactions, reconciliation workflows, reports, and several storage
backends.

Its interface can organize an accounting record, but the application does not
choose the reporting entity, accounting basis, source population, recognition
policy, valuation method, chart mappings, or close criteria. Those judgments
must remain explicit and supported outside any learned matcher or generated
entry.

The main control boundaries are:

- bank and other imports are source proposals, not automatically new entries;
- learned account mappings require review and can reinforce earlier errors;
- a zero reconciliation difference can contain offsetting errors;
- scheduled transactions require source, expiry, duplicate, and reconciliation
  controls;
- commodity quantity, transaction value, historical cost, and current price
  answer different questions; and
- register and report views are selected projections of the book, not
  independent evidence.

The [commodity](../terms/commodity.md), [register](../terms/register.md),
[scheduled transaction](../terms/scheduled-transaction.md), and [split
transaction](../terms/split-transaction.md) terms define those mechanics. The
official [GnuCash 5 Tutorial and Concepts Guide](https://www.gnucash.org/docs/v5/C/gnucash-guide/)
is the version-specific interface reference.
