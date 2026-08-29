---
name: derivation
description: The (σ-fixed = yes, Δ-fixed = yes) corner of the closure-position enumeration — execution settled by rules, meaning not pre-specified. The closure operator forces a unique output from the input.
specializing: closure-position
sigma-fixed: true
delta-fixed: true
meaning-settled: false
execution-settled: true
---

A **derivation** is the closure-position corner where the rule system forces a unique output given an input, but the output is not pre-specified — the work runs the rules and yields whatever the closure produces.
Mathematically: the σ-nucleus and Δ-nucleus are both at their fixed point on the work-cell, so the joint closure has converged; the output is the LFP rather than a pre-declared target.

Examples: type-checking, theorem-proving from premises, parsing a string against a grammar, computing a content-address.
In each, the input plus the rules determine the output uniquely, but a user could not name the output before running.
