---
title: Codebase & Refactoring Graph
keywords:
  - idea
  - code
  - refactoring
part-of: relational-computer
description: "Represents code structure and evolution as recognitions so refactors are traceable graph rewrites."
---
# Idea: Codebase & Refactoring Graph

Represent code structure and evolution as recognitions so refactors are
traceable graph rewrites.

## 1. Recognitions

- `ModuleRecognition`, `FunctionRecognition`, `TypeRecognition`.
- `TestRecognition`: test cases covering code elements.
- `IssueRecognition`: bugs, feature requests, technical debt.
- `RefactorRecognition`: a proposed or executed refactor (rename, extract,
  rewire).

## 2. Topology and measurement

- Topology:
  - call graph, dependency graph, ownership graph.
- Measurement:
  - complexity metrics, coverage, churn (changes per module), build time.

Runbooks:

- `plan_refactor`, `apply_refactor`, `verify_refactor` tie actual code changes
  to the mathematical rewrite guarantees you already have.

