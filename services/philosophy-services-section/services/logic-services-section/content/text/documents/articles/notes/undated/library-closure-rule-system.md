---
name: closure-rule-system
description: The substrate's queryable, versionable representation of the closure-rule system S. Generates the closure operator cl^S via the standard fixed-point construction (least operator satisfying every rule's consequent whenever its antecedent holds). Per the closure-rule-system-realizes-closure-2-monad theorem the system realizes the closure 2-monad Cl^S; the monad laws and lax-idempotence are substrate-content properties. Required fields per the source at theories/.../predicated-computing/code/structures/closure-rule-system.md — id, description, version-hash, rules, scope-applicability, closure-kind-distribution, rule-language-fragment, fuel-policy, predecessor.
specializing: closure-operator
realizes:
  - closure-rule
  - closure-2-monad
title: closure-rule-system
---
