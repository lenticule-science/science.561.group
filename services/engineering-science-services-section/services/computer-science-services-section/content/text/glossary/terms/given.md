---
id: flatfile-agent-resource-system-given
description: "The relation from a math entity to a conjecture or condition on which its content is contingent. A file with 'given: X' asserts a result that holds if and only if X is assumed. It is not a proof of X; it is a proof that X implies this file's content."
component-of: RelationalSystemMarkdown
date-modified: 2026-03-19
params:
  math-entity: relational-universe
  conjecture: relational-universe
output: relational-universe-morphism
ast:
  conditional-derivation:
    - math-entity
    - conjecture:
        - defect-eigenvalue
---

# Given

## What this is

The `given:` relation names a conjecture or condition that the subject file's content presupposes.

A file with `given: X` is not a proof of `X`.
It is a derivation — a proof that assuming `X` yields the subject file's content.
The subject's theorems hold conditionally: they become unconditional when `X` is proved.

## Distinguished from `uses:`

`uses: X` means the subject refers to or builds on `X` — `X` is in scope and cited.
`given: X` means the subject's main claim is contingent on `X` being true.
A file may both `use:` and be `given:` the same conjecture.

## Distinguished from `grounds:`

`grounds: X` means the subject is the mathematical foundation that makes `X` valid — the dependency points from subject to object.
`given: X` means the subject's content depends on `X` — the dependency points from object to subject.
They are converses: if file A has `grounds: B`, file B may have `given: A`.

## Use

When a math entity derives consequences of an open conjecture, it carries `given:` pointing to that conjecture's entity.
When the conjecture is proved, all files carrying `given:` for it become unconditional corollaries.
A script scanning for `given:` entries and the proof status of their targets can automatically identify which conditional results have been promoted to theorems.

## Settlement metadata interpretation

The length of the `given:` list is the entity's **defect eigenvalue** — its distance from unconditional settlement in H*. An entity with no `given:` field (or an empty one) has defect 0.

When a listed condition is proved: delete its entry. If the list is now empty, check whether `base:` or `stratum:` were blocked by that condition and fill them in.
