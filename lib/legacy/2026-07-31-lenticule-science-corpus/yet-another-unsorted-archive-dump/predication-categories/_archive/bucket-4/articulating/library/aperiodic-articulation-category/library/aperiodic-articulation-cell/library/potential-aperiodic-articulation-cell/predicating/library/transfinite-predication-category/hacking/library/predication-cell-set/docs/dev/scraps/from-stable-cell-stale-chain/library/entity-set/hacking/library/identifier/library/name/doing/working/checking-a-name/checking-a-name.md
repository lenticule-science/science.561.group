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
---

A **checking-a-name** is the specialization of the [checking transformer](../checking.md) whose source object is constrained to a [name](../../../../library/name/name.md). The input is `{subject: name, predicate: <predicate-record>}` where `name` is a kebab-case identifier conforming to the [name JSON schema](../../../../library/name/name.schema.json) and `predicate` is a record appropriate to names (a grammar, a uniqueness set, a forbidden-token list, or any other name-predicate). The output is a check-decision: `{conforms: boolean, diagnostics: [{clause, message}, ...]}`.

Further specializations bind the predicate to a specific class. The first such specialization is [the checking-a-name-for-grammar transformer](checking-a-name-for-grammar/checking-a-name-for-grammar.md), which fixes the predicate to a [grammar](../../../../library/grammar/grammar.md) and checks whether the name parses against that grammar with every parsed component resolving to its declared record.
