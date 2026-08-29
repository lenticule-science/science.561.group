---
title: Function
id: relational-function
role: structure
status: plan
derived_from:
- acts/form-function-term
proof_refs: []
---


# Function

A **Function** is the math-level carrier consisting of function terms and their
applications, earned by the function/application acts.

## Components

- [`FormFunctionTerm`](docs/math/acts/form-function-term.md) — earns the
  function-term constructor by abstracting over a trace context.
- [`FormApplicationTerm`](docs/math/acts/form-application-term.md) — earns the
  application-term constructor by applying a function term to an argument term
  along the trace.
- [`ProfileExponential`](docs/math/acts/profile-exponential.md) — earns the
  exponential profile `A ⇒ B` and identifies function terms with that profile.
- Function and application terms inhabit
  [`JudgmentTerm`](docs/math/structure/judgment-term.md); they are specific
  constructors induced by the acts above.

## Proof

Sketch: the function and application acts introduce the corresponding
constructors in `JudgmentTerm`; the exponential profiling act equates those
constructors with `A ⇒ B` recognitions. Together these acts generate the
function structure over the term carrier.
