---
name: "Directive"
aliases:
  - "Directive"
  - "directive"
  - "Beancount directive"
date-created: 2026-03-06
authors:
  - claude-opus-4-6
keywords:
  - Accounting
type: term
---


A directive is a typed Beancount entry interpreted by the parser and processing
pipeline. Many directives are dated, including transactions, account lifecycle
entries, assertions, prices, notes, documents, events, and commodity
declarations. Other file constructs—such as options, includes, and plugin
loading—and metadata attached to entries have different syntax. “Directive”
therefore does not mean every line in a Beancount file.

Core directives:

- `open` — declares an account. Accounts can't be used before they're opened.
- `close` — closes an account. No postings are allowed after this date.
- `txn` (or `*`) — a transaction with balanced postings.
- `balance` — asserts that an account's balance equals a specific amount on a date.
- `pad` — authorizes a generated adjustment when a following balance assertion
  requires one.
- `price` — records a commodity price for a given date.
- `note` — attaches a text note to an account on a date.
- `document` — links a file (receipt, statement) to an account on a date.
- `event` — records a life event (e.g., address change) for tracking purposes.
- `commodity` — declares and configures a commodity.

Parsing can reject unknown or malformed syntax, but successful parsing does not
establish that a directive is supported, complete, correctly classified, or
consistent with the reporting basis. Plugins can also transform the directive
stream after parsing, so a ledger's semantics include its options, includes,
plugins, and versions—not only its visible transaction lines.

See the official [Beancount language syntax](https://beancount.github.io/docs/beancount_language_syntax/)
for the complete grammar and date semantics.

## Earlier material

A directive is any dated entry in a Beancount file.
Unlike [Ledger](../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/endeavoring/content/endeavor/organizing/content/organization/resourcing/content/resource/recording/content/record/accounting/content/accounting-software/content/beancount/content/ledger-cli.md), where directives are optional configuration, Beancount treats everything as a directive — transactions, account openings, balance assertions, price entries, and metadata all follow the same pattern: a date followed by a directive type.

The strict directive model means Beancount rejects anything it doesn't recognize, which catches typos and formatting errors at parse time rather than silently ignoring them.
