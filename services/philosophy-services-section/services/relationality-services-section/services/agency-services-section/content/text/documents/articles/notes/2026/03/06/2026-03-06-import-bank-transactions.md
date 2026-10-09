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
introduces: skill
description: GnuCash can import transactions from bank downloads in OFX, QFX, QIF, and CSV formats.
---

GnuCash can import transactions from bank downloads in OFX, QFX, QIF, and CSV formats.
OFX/QFX is the most reliable format because it includes structured metadata (dates, payees, amounts, transaction IDs) that GnuCash can parse unambiguously.

## Steps

1. Download a transaction file from the bank's website.
  Prefer OFX or QFX format if available.
2. In GnuCash, go to File > Import > Import OFX/QFX (or the appropriate format).
3. GnuCash's import matcher shows each imported transaction alongside potential matches in existing records.
  It uses transaction IDs and dates to detect duplicates.
4. For each transaction, choose: match to an existing transaction (if it's a duplicate), add as new, or skip.
5. Assign destination accounts for new transactions.
  GnuCash learns from previous assignments and will suggest accounts based on payee names (Bayesian matching).

The Bayesian matching improves over time — the more transactions you categorize, the better the suggestions become.
