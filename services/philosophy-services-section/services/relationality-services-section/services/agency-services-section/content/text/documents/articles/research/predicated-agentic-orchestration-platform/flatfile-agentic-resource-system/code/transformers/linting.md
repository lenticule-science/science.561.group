---
name: linting
description: A predicate whose cells record conformance-check relationships — which entity has been checked against which rule, and with what bilattice-valued result.
title: linting
---

## Subjects and objects

Subject: any entity in $E$ — the entity being checked.

Object: a rule or specification entity — the rule the entity is checked against.

## Cell values

- **true**: the entity passes the rule.
  The rule's antecedent pattern, evaluated against this entity's frontmatter and body, finds no violation.
- **false**: the entity fails the rule.
  The antecedent pattern finds at least one violation.
- **mystery**: the entity has not been checked against this rule.
  No linting cell has been recorded.
- **contradiction**: conflicting evaluations — the rule both fires and does not fire, typically due to rule inconsistency or incomplete specification.

## Mathematical structure

Linting is a read-only, single-entity application of a rule's antecedent pattern.
It is a targeted form of the substrate's closure-rule evaluation: rather than updating the entire settling, it evaluates one rule against one entity and records the bilattice result at the linting cell.

Formally: for rule $r$ with antecedent $\phi_r$ and entity $e$, the linting cell $(e, \mathtt{linting}, r)$ receives the bilattice evaluation $\phi_r(e)$ under the current valuation.
The linting predicate is non-mutating — it does not update fibers other than the linting cell itself.

This contrasts with settling, which applies all closure rules and updates all cells iteratively to fixpoint.
Linting is settling scoped to one (entity, rule) pair, run as a read-only query.

## Role in the substrate

Linting cells are the input to auditing: an auditing process reads linting cells across a target set of entities and rules, aggregates the results, and records its findings.
A making process runs linting immediately after scaffolding a new entity to verify the entity passes its kind-specific rules before the making cell is set to true.
