---
title: Beancount
description: Beancount is a plain-text double-entry accounting language and processing toolchain.
---
# Beancount

Beancount is a plain-text double-entry accounting language and processing
toolchain. Its source files encode directives, metadata, options, includes, and
plugin configuration; tools parse that population into entries and reports.

Beancount supplies useful mechanical constraints: transaction balancing,
account lifecycle checks, lot and commodity representations, executable balance
expectations, queries, and a reproducible text surface. Those constraints do
not choose the reporting entity, recognition basis, source population,
classification, valuation, cost-basis policy, or reconciliation evidence.

The control boundary therefore includes:

- retained source events and stable identifiers;
- reviewed accounting interpretations and traceable corrections;
- deterministic includes, options, plugins, dependencies, and versions;
- quantity, cost, price, control-account, and cutoff reconciliations; and
- reports whose populations and measurement rules are named.

The [balance assertion](../terms/balance-assertion.md), [pad](../terms/pad.md),
[plugin](../terms/plugin.md), and [Fava](../terms/fava.md) terms describe the
main boundaries where tool behavior is easily mistaken for accounting proof.
The official [Beancount documentation](https://beancount.github.io/docs/)
defines syntax and version-specific mechanics.
