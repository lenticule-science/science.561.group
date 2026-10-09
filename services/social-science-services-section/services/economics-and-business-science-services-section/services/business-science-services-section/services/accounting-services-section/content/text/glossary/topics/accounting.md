---
title: "Accounting"
aliases:
  - "accounting"
date-created: 2026-03-06T00:00:00
date-modified: 2026-08-27T00:00:00
type: topic
keywords:
  - accounting
  - measurement
  - double-entry-bookkeeping
  - financial-reporting
contains:
  - account
  - journal
  - ledger
  - double-entry-bookkeeping
  - financial-statements
description: Accounting is the institutional practice by which a reporting entity turns economic events into classified, measured, and reviewable claims about that entity.
---


Accounting is the institutional practice by which a reporting entity turns
economic events into classified, measured, and reviewable claims about that
entity. Recording transactions is one part of the practice. Accounting also
sets the entity boundary, decides when an event is recognized, chooses a
measurement basis, maintains the resulting records, reconciles them to
independent evidence, and presents reports for particular users and purposes.

This definition separates accounting from both raw event capture and finance.
A bank statement, blockchain operation, invoice, or payroll file is evidence
that an event occurred; it is not yet an accounting conclusion. Finance studies
the allocation, pricing, funding, and risk of resources and claims. Accounting
constructs the entity-relative record through which many of those claims become
legible and contestable.

## The accounting transformation

An accounting system transforms an event through several judgments:

1. **Boundary:** Which reporting entity, if any, owns the resource, owes the
   obligation, earns the income, or bears the expense?
2. **Recognition:** Has the event met the conditions for entering the accounts,
   and in which period does it belong?
3. **Classification:** Which [accounts](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/03/06/2026-03-06-account.md) describe the event's
   economic roles?
4. **Measurement:** In what units and at what amount is each recognized element
   recorded?
5. **Posting:** How does the entry preserve the system's double-entry relation?
6. **Presentation:** Which aggregations and disclosures answer the report's
   purpose without erasing material distinctions?

These judgments should remain traceable to their source evidence. A durable
system therefore distinguishes the source event, the accounting interpretation,
and the resulting [journal entry](../terms/journal.md). Collapsing the three makes
correction difficult: a changed classification can then look like changed source
history, while an importer can appear to make policy decisions that were never
actually specified.

## What double entry establishes

[Double-entry bookkeeping](../terms/double-entry-bookkeeping.md) records each
transaction through at least two account effects and preserves the accounting
equation:

$$
\text{Assets} = \text{Liabilities} + \text{Equity}.
$$

This supplies a local conservation rule. A transaction that increases one
resource must identify the claim, sacrifice, income, or other resource change
that explains it. The [ledger](../terms/ledger.md) accumulates those postings by
account, and the [trial balance](../terms/trial-balance.md) tests their arithmetic
agreement.

Balance is necessary but not sufficient. A balanced entry can still be a
duplicate, omit an event, use the wrong entity, apply an unsupported value, or
misclassify a transfer as income. Double entry establishes internal arithmetic
coherence; source controls, accounting policy, reconciliation, and review test
different properties of the record.

## Quantity is not valuation

Accounting for multiple currencies, securities, digital assets, inventory, or
physical units requires at least two distinct coordinates:

- the native quantity of the thing held or transferred; and
- its measured value under a stated reporting basis and date.

The native quantity supports custody and inventory reconciliation. The measured
value supports cost, gain or loss, and financial-statement presentation. Replacing
the first with the second destroys operational evidence; treating the first as
if it already supplied the second invents a valuation policy. Exact quantities
should remain exact through posting and aggregation, including when a rational
amount has no finite decimal representation.

The distinction is developed concretely in [Accounting for Hive Assets with
Beancount](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-accounting-for-hive-assets-with-beancount.md).

## Accounting branches and purposes

Different accounting practices share the record but answer different questions:

- **Financial accounting** prepares general-purpose statements about position,
  performance, and cash flows for users outside day-to-day operations.
- **Managerial accounting** constructs decision-relevant measures for planning,
  control, and internal coordination.
- **Cost accounting** traces and allocates resource consumption to products,
  services, projects, or responsibility centers.
- **Tax accounting** applies the recognition, measurement, and classification
  rules of a particular jurisdiction and taxpayer.
- **Auditing and assurance** evaluate whether claims and controls warrant a
  specified degree of reliance.

These branches may legitimately produce different measurements from the same
event because their governing questions differ. They should not be merged into
one supposedly neutral number. The limits of allocation and commensuration are
examined in [The Limits of Cost
Accounting](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-the-limits-of-cost-accounting.md).

## Entity perspective and claims

Every classification is relative to an entity. An investor's equity security is
an asset; the issuer presents the corresponding residual interest within equity;
a consolidated group may eliminate an intragroup claim altogether. The word
*equity* therefore does not name one invariant account behavior across every
perspective. [Equity as Claim and
Asset](../../documents/articles/notes/2026/08/27/2026-08-27-note-on-equity-as-claim-and-asset.md)
develops this distinction.

## Operational integrity

A maintained accounting system needs controls beyond balanced postings:

- stable source identifiers and duplicate detection;
- explicit policies for recognition, valuation, and lot relief;
- reconciliation by account, custody location, commodity, and cutoff;
- held states for missing evidence or unresolved judgment;
- dated correcting and adjusting entries rather than silent historical edits;
- period close procedures that distinguish unresolved work from completed work;
  and
- reports that preserve material uncertainty instead of hiding it through
  premature aggregation.

Software can enforce exact arithmetic, schema boundaries, account constraints,
and reproducible report transformations. It cannot infer ownership, legal
substance, materiality, or a defensible valuation from transaction data alone.
Those are governed accounting judgments, and a sound implementation makes their
presence visible rather than disguising them as computation.
