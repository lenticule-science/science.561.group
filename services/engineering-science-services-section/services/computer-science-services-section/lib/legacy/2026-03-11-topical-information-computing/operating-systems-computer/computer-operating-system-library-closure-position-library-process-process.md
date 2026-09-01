---
name: process
description: The (meaning-settled = yes, execution-settled = yes) corner of the work-type enumeration — both the output and the method are known in advance. The bounded, fully-specified form of work; structurally the most settled corner.
specializing: closure-position
sigma-fixed: false
delta-fixed: false
meaning-settled: true
execution-settled: true
---

A **process** is the closure-position corner where both the *output* and the *method* are known in advance — the most bounded form of work.
The skill body is a precise script; running it on a valid input is guaranteed (modulo external errors) to produce the named output by the named method.
The σ and Δ nuclei have not yet fixed *for this instance* because the instance hasn't run; once it runs, both fire and the work settles immediately.

Examples: running a deterministic script against a parameters tuple; copying a file; canonical-formatting a record.
The fully-specified form of work that closes immediately under invocation.

(The σ-fixed/Δ-fixed cells above describe the *type-level* settlement of the corner — a process as a kind is not closed; only individual instances are.
This contrasts with derivation, whose corner is σ-fixed and Δ-fixed at the type level because the rule-system forces the output kind itself.)
