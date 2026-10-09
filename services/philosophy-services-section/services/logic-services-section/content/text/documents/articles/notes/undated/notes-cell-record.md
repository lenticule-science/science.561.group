---
name: cell-record
description: A predication cell — a tuple of (subject slug, predicate slug, object reference, value drawn from the four-valued bilattice {⊥, t, f, ⊤}), optionally carrying a stratum tag (asserted, saturated, settled), a derived-from list of cell-ids it was derived from, and a derived-via identifier naming the closure rule or algebraic operator that produced it.
category: kernel
fields: []
title: cell-record
---

A cell-record is the persisted form of a single predication cell. Its mandatory components are the four cell coordinates — subject, predicate, object, value — recorded as slug references or as a literal bilattice value. Its optional components are the stratum tag, the derived-from set of cell-ids, and the derived-via closure-rule or operator identifier; these record the cell's provenance within a settling trajectory.
