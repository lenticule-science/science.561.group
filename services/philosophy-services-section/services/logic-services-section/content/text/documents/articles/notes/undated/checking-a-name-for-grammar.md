---
name: checking-a-name-for-grammar
description: "The checking-a-name transformer with the predicate bound to a grammar. checking-a-name-for-grammar takes a name plus a grammar (specifically the project's name-grammar at library/grammar/grammar.md) and decides whether the name parses against that grammar with every parsed component resolving to its declared library record."
specializing: checking-a-name
checking: name
against: grammar
agent-noun: checker-of-a-name-for-grammar
gerund: checking-a-name-for-grammar
imperative: check-a-name-for-grammar
originating: name
terminating: check-decision
title: checking-a-name-for-grammar
---

A **checking-a-name-for-grammar** is the specialization of [checking-a-name](checking-a-name.md) in which the predicate is bound to a [grammar](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/grammar.md). The input is `{subject: name, predicate: grammar}`; the output is a check-decision `{conforms, diagnostics}` per the parent.

The conformance test has two clauses, each a separately-diagnosable predicate:

1. **Lexical conformance.** The name string matches the kebab-case pattern from [the name JSON schema](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/library/name/name.schema.json) — lowercase ASCII letters, digits, hyphens; begins and ends with a letter or digit; no consecutive hyphens.
2. **Resolution conformance.** The name parses against the grammar's productions and every parsed component resolves to its declared record on the filesystem. A name that parses as `<gerund>(-<article>)?-<noun>(-<modifier>)*` requires the gerund head to resolve to a transformer record (a directory `[$gerund]/[$gerund].md` exists somewhere in the lawful tree) and the noun and modifier tokens to resolve to structure records (directories `library/[$noun]/[$noun].md` and `library/[$modifier]/[$modifier].md` exist).

The diagnostics returned name which clause failed and which component of the parse did not resolve. The transformer mutates nothing; the call appends a witness row to the local JSONL log recording the decision.

This transformer is invocable through Claude Code's PreToolUse hook protocol on `Write|Edit|MultiEdit`. The hook payload's `tool_input.file_path` is the source from which a name is extracted; the extracted name is the transformer's subject. The hook protocol is the invocation envelope, not the transformer's identity — the transformer's schema describes only the name-plus-grammar input and the check-decision output.
