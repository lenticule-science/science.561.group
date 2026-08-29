---
name: select-infinity-category-model
description: Compare common models of infinity categories and select one for a given task, recording the model and the reason it fits.
---

# Select Infinity Category Model

Infinity categories have multiple equivalent models — quasi-categories, complete Segal spaces, Joyal's $\infty$-categories, model-categorical presentations. Each makes some constructions easy and others hard. Picking the right model for the task is part of the work.

## When to use

You are about to do an $\infty$-categorical construction or proof and need to commit to a model. Different models have different tooling, literature, and idiomatic moves; the wrong choice multiplies the work.

## How it works

1. **State the use case.** Homotopy theory? Higher algebra? Formal reasoning (e.g., univalence)? Lurie-style derived algebraic geometry? Each has a model the literature has built around.
2. **Compare at least two models** along these dimensions:
   - Tooling and literature support for the use case.
   - Difficulty of the constructions you'll need (limits, colimits, presheaves, fibrations, etc.).
   - Compatibility with neighboring formalisms (model categories, simplicial sets, etc.).
3. **Pick the model that aligns with the use case.** Quasi-categories for Lurie-style work; complete Segal spaces where simpliciality is awkward; type theory with HoTT/univalence for foundational constructions.
4. **Record the choice and the reason.** A short note in the working document — "using quasi-categories because [reason]" — saves later confusion.

## Prerequisites

- `learn-infinity-categories` — the basic framework you're choosing a model of.
