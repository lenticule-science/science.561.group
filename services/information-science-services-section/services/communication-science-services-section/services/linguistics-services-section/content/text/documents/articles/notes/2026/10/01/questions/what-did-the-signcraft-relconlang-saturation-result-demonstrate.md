---
kind: question
status: open-with-audit
explores:
  - relconlang
  - signcraft
  - formal-concept-analysis
  - evaluation
  - leakage
  - language-learning
---
# What did the SignCraft RelConLang saturation result demonstrate?

A September 2026 SignCraft experiment parsed RelConLang into normalized event rows and `(s,P,o)` cells, learned subject/object fibers, and used formal-concept-analysis closure as a backoff for sparse fibers.

The evaluator made several good corrections: exact fact deduplication, unbiased seeded shuffling, equal candidate pools across predictors, and multi-seed reporting.

However, its CLI collects `expect.features` from the **entire corpus before the fact split** and passes those hand-authored semantic tags into the FCA concept builder. The model is trained only on training facts, but lexical feature side information can include annotations originating in held-out records.

The reported mean — baseline 3.40/6, fiber 1.80/6, closure-with-features 3.60/6 — should therefore be interpreted as a small transductive experiment showing that FCA can exploit supplied lexical-semantic annotations, not as evidence that those semantic regularities were learned inductively from held-out-free training data.

A clean continuation should report multiple conditions: no features, manifest-derived features, training-only gold features, and the historical full-corpus-feature condition.
