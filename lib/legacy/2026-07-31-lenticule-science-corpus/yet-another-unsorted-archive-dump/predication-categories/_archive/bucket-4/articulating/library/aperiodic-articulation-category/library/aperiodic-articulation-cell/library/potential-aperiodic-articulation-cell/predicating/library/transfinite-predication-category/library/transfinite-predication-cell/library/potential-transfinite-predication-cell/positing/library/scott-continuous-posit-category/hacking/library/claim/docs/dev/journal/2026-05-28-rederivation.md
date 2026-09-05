---
title: "claim/ re-derivation against the four-regime grammar"
date: 2026-05-28
prior-location: "lab/hacking/articulating/library/stable-articulation-cell/predicating/hacking/library/predication-cell-set/library/predicate-set/library/predicate-category/hacking/library/claim/"
---

# claim/ re-derivation

## What this subtree was trying to say

The `claim/` namespace was written before the 2026-05-27 grammar stabilized, when "claim" was used loosely as "a proposition the system handles." In the now-stabilized grammar, **claim is positing-tier vocabulary**: a claim is exactly what the positing morphism issues. A predication produces a cell value; the act of *asserting* that value as a claim against the world is positing.

The subtree contains two kinds of children, which span tiers operationally even though the namespace lives at one tier:

**Records (in `library/`):**
- `claim-injection-attack-record/` — a record of an attempted positing-as-attack against a target scope. Positing-tier (records a posit event).
- `math-claim-candidate-record/` — pre-positing: an articulated proposition that has not yet been validated. Strictly speaking this is a *candidate* for positing; placement at positing tier is fine because it is in positing's input pipeline.
- `math-claim-validated-record/` — a positing that has passed validation. Positing tier.

**Morphisms (operations on math claims):**
- `extracting-math-claim/` — takes articulated content and produces a claim-candidate. Spans articulating → positing pipeline.
- `validating-math-claim/` — the positing-side validation morphism. Positing tier.
- `promoting-math-claim-to-closure-rule/` — promotes a validated claim into a closure rule. This crosses positing → settling tier (closure rules are settling-tier instruments).
- `injecting-claim-into-target-scope/` — installs a posit into another scope. Positing tier.

## Why positing tier

In the stabilized grammar:
- Predicating produces a result that lives in FOUR (the cell value).
- Positing takes that result and issues it as a stance the system commits to.
- Settling closes positings into a stable form via closure rules.

A "claim" is the result of positing. The whole `claim/` namespace, therefore, lives at positing tier — `scott-continuous-posit-category/hacking/library/claim/`.

The pipeline morphisms operationally cross tiers (one extracts from articulating-side content, another promotes into settling-tier closure rules), but their namespace placement reflects their *central* tier — positing — where they live as operations on the claim object itself.

## Why the move was needed

The prior path placed `claim/` under `predicate-category/hacking/library/`. That said "claim is a hacked term of predicate-category." But predicate-category in current grammar is the category whose objects are *predicates as labels* (each predicate type — `relative-of`, `wise`, etc.) — not claims. A claim is what gets posited about a predicate, not the predicate itself. The placement conflated the predicate-as-label with the asserted-claim about it.

## Untouched internal content

The record schemas inside `claim/library/` and the morphism scripts inside `claim/<op>/` were preserved verbatim. Their content has not been re-read against current grammar; the move only fixes the categorical placement. Some of these records and operations may need further sub-tier moves later (e.g., the `promoting-math-claim-to-closure-rule` morphism arguably has its target inside settling tier).
