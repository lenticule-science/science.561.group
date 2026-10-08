---
name: checking-a-name
description: "The checking transformer specialized to inspect a name. checking-a-name takes a name (per the name structure at library/name/) plus a predicate appropriate to names — a grammar, a uniqueness constraint, a forbidden-token list — and returns a check-decision."
specializing: checking
checking: name
agent-noun: checker-of-a-name
gerund: checking-a-name
imperative: check-a-name
originating: name
terminating: check-decision
title: checking-a-name
---

A **checking-a-name** is the specialization of the [checking transformer](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-07-05-doing/working/hacking/doing/working/checking/checking.md) whose source object is constrained to a [name](name.md). The input is `{subject: name, predicate: <predicate-record>}` where `name` is a kebab-case identifier conforming to the [name JSON schema](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/library/name/name.schema.json) and `predicate` is a record appropriate to names (a grammar, a uniqueness set, a forbidden-token list, or any other name-predicate). The output is a check-decision: `{conforms: boolean, diagnostics: [{clause, message}, ...]}`.

Further specializations bind the predicate to a specific class. The first such specialization is [the checking-a-name-for-grammar transformer](checking-a-name-for-grammar.md), which fixes the predicate to a [grammar](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/grammar.md) and checks whether the name parses against that grammar with every parsed component resolving to its declared record.
