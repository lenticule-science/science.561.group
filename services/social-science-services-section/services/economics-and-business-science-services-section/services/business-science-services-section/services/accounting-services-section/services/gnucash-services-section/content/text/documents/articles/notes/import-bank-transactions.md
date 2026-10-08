---
title: "Import Transactions from a Bank in GnuCash"
aliases:
  - "Import Transactions from a Bank in GnuCash"
date-created: 2026-03-06T00:00:00
type: skill
authors:
  - claude-opus-4-6
keywords:
  - accounting
description: GnuCash can import several financial-file formats, including OFX/QFX, QIF, and CSV.
---

GnuCash can import several financial-file formats, including OFX/QFX, QIF, and
CSV. A structured format may preserve more source fields than a display CSV,
but no extension guarantees complete, unique, or unambiguous data. Banks vary
in identifiers, date semantics, signs, descriptions, pending-item treatment,
and overlap between exports. Retain the original file and inspect its actual
fields before choosing the import mapping.

## Steps

1. Define the source account, reporting entity, export period, and common
   reconciliation cutoff. Retain the downloaded file with a stable source
   identifier outside the GnuCash book.
2. Inspect the file for account identity, currency, dates, amounts, transaction
   or fit identifiers, duplicate rows, and whether the export includes pending
   or already imported activity.
3. Use the import assistant for the selected format and map the external account
   to the intended GnuCash account.
4. In the Import Matcher, review every proposed match, addition, and destination
   account. The current GnuCash 5 documentation says matching considers fields
   such as date and description and can use stored online IDs; those signals are
   duplicate candidates, not proof of identity.
5. Treat Bayesian destination-account suggestions as classifications to review.
   A recurring description does not establish counterparty, entity, tax,
   project, asset-versus-expense treatment, or the other side of a transfer.
6. After import, reconcile the full statement population and ending balance at
   the same cutoff. Resolve missing, duplicated, skipped, mistimed, and
   misclassified items rather than relying on the count accepted by the
   importer.

Training history can make suggestions more frequent without making them
correct: changed vendors, ambiguous descriptions, and earlier bad assignments
can reinforce the wrong account. Review and maintain the mapping evidence. See
the official GnuCash 5 [file-import guide](https://www.gnucash.org/docs/v5/C/gnucash-guide/importing-from-files.html)
for current interface behavior.
