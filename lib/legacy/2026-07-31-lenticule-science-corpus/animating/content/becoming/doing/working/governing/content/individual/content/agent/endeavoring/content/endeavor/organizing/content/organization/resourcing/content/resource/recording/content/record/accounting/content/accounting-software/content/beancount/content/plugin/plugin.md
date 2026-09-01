---
title: "Plugin"
aliases:
  - "Plugin"
  - "plugin"
  - "Beancount plugin"
date-created: 2026-03-06T00:00:00
type: term
authors:
  - claude-opus-4-6
keywords:
  - Accounting
---


A plugin is a Python module that transforms the stream of directives after Beancount parses the input file.
Plugins can add, modify, or remove directives and generate errors.
They're loaded with the `plugin` directive in the Beancount file:

```
plugin "beancount.plugins.unrealized"
```

Built-in plugins include:

- `unrealized` — generates entries for unrealized capital gains/losses
- `auto_accounts` — automatically opens accounts on first use (relaxing Beancount's strict `open` requirement)
- `check_commodity` — validates that commodities are declared before use

Custom plugins are Python functions that receive the list of directives and options, and return a modified list plus any errors.
This makes Beancount extensible without modifying its core — users write plugins for tax lot selection, custom validation rules, depreciation schedules, or domain-specific bookkeeping logic.
