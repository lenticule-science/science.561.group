---
name: sexp-template-language
keywords:
  - idea
  - templates
  - language
part-of: relational-computer
description: "Defines an S-expression-based template language for capturing recognitions and generating documents."
---

Define a small S‑expression–based template language for capturing recognitions,
generating documents, and wiring runbooks, so that “templates” are themselves
structured, inspectable, and composable.

## 1. Core recognitions

- `TemplateLanguageSpecRecognition`
  - The grammar and semantics of the S‑expression language (constructors,
    conditionals, loops, interpolation, quoting).
- `TemplateSnippetRecognition`
  - A reusable snippet: a parameterized S‑expression that expands into one or
    more recognitions, runbook steps, or document fragments.
- `TemplateInstanceRecognition`
  - A particular use of a snippet with concrete parameters, tied to intake
    events or GUI actions.

## 2. Topology and measurement

- **Topology**
  - Snippets depend on the acts/specs/architecture they instantiate; the
    internal graph shows which parts of the math a template can touch.
  - Instances link to the recognitions they created or modified, preserving
    traceability from a template to its effects.
- **Measurement**
  - Track how often snippets are used, error rates, and downstream changes
    (e.g. how many follow‑up edits are needed after using a given template).
  - Use this to refine templates or deprecate ones that cause problems.

## 3. Runbooks and flows

- `run_expand_template`
  - Given a `TemplateSnippetRecognition` and parameters, expand into
    recognitions or runbook steps and submit them through intake.
- `run_lint_templates`
  - Check snippets against current specs/acts to ensure they only invoke
    allowed operations and remain well‑typed as the math evolves.
- `run_migrate_templates`
  - When specs/acts change, propose edits to affected snippets, preserving
    their intent while updating them to new semantics.

## 4. Cross‑domain connections

- Provides:
  - capture templates for everyday domains (journal entries, tasks, finance,
    medical logs),
  - scaffolding templates for math/spec/arch docs,
  - generation templates for newsletters, reports, and static documentation.
- Pairs naturally with the GUI workbench and dataview‑like query language to
  give users both “views over recognitions” and “recipes for creating them”.
