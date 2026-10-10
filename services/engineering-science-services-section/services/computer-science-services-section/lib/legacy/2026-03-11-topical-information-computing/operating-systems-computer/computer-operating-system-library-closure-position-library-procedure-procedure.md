---
name: procedure
description: The (σ-fixed = yes, Δ-fixed = no) corner of the closure-position enumeration — meaning settled (the output kind is named in advance), but the Δ-stabilization not yet fixed (each execution may vary in detail). The structurally repeatable form of work.
specializing: closure-position
sigma-fixed: true
delta-fixed: false
meaning-settled: true
execution-settled: false
---

A **procedure** is the closure-position corner where the *kind* of output is settled in advance (you know what you're going to produce) but the *details* of each execution vary (the Δ-stabilization nucleus has not converged to a unique fixed point — different runs can produce different specific values within the named kind).
Repeatable: you can run the same procedure many times, each producing one instance of the named output kind.

Examples: writing a diary entry (kind is known; each entry is different), generating a build report (the report shape is fixed; the numbers vary), filing a routine record.
The σ-saturation has fired (the kind is closed under the rules) but Δ has not (each instance is its own.).
