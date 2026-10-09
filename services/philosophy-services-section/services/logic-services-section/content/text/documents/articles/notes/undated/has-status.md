---
name: has status
description: "Maps any lifecycle-bearing entity to its current status value. Domain: any record with a lifecycle. Codomain: status vocabulary of that record's kind."
title: has status
---

Domain: any record with a lifecycle (task, spec, agent, work, office, …)
Codomain: the status vocabulary defined by that record's spec

`has-status` is a predication cell on the record itself — the transformer applies directly: `(record, has-status, value)`. The valid codomain values are pinned per record-kind by the governing spec, not by this transformer. This transformer names the edge; the spec constrains which values are valid at that codomain.
