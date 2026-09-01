---
name: "Plugin"
aliases:
  - "Plugin"
  - "plugin"
  - "Beancount plugin"
date-created: 2026-03-06T00:00:00
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


A plugin is executable code loaded into Beancount's processing pipeline after
the input has been parsed. A plugin can add, modify, or remove directives and
return errors. That power makes plugins part of the ledger's recognition,
measurement, and reporting implementation rather than harmless display
preferences. A file can load one with plugin syntax such as:

```
plugin "beancount.plugins.unrealized"
```

The available bundled plugins and their module names depend on the installed
Beancount version. Custom plugins commonly receive the parsed entries and
options and return a transformed entry population plus errors. Before admitting
a plugin into controlled books:

- identify its exact source and version;
- review which entries and options it reads, creates, changes, or removes;
- test it against representative lots, currencies, dates, and failures;
- preserve deterministic configuration and dependency installation; and
- make generated entries distinguishable from source events and reviewed
  accounting judgments.

A plugin can enforce a useful invariant, but it can also silently change report
populations or create balanced yet unsupported entries. Parser success and
debit-credit equality do not bound that risk. The official [Beancount scripting
and plugins documentation](https://beancount.github.io/docs/beancount_scripting_plugins/)
describes the interface for the installed generation of Beancount.
