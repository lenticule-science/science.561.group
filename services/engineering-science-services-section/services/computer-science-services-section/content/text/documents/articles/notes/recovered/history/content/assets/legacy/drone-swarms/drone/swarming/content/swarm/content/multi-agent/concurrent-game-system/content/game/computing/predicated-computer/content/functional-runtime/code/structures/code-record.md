---
type: definition
class: substrate-entity
realizes: [code-as-substrate]
depends-on: [code-as-substrate, function, predication-cell]
see-also: [function-record, runtime-record]
---

# Code record

A **code record** is the substrate-entity formal definition of *substrate-resident program code*: the predication-graph entity carrying the source representation of a [function](teaching/explanations/function.md) (or a sequence of expressions, a module, a script).

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`source-form`** — the program's source representation: AST predications, S-expressions, structured-source-text. Per [code-as-substrate](teaching/explanations/code-as-substrate.md), this is the substrate-content form.
- **`language-spec`** — reference to the language specification (which constructs the source uses): a programming-language definition that's itself substrate content.
- **`compiled-form`** — optional reference to a compiled lower-level representation of this code, produced by [compile](../morphisms/compile.md).
- **`source-of-compiled-form`** — for compiled code, reference back to the source code-record.
- **`provenance`** — who wrote this code, when, in response to what.
- **`tests`** — references to test code that exercises this code.
- **`closure-kind`** — `code`.

## Invariants

- **Substrate-resident.** Per [code-as-substrate](teaching/explanations/code-as-substrate.md), the source form is substrate content.
- **Language-coherent.** The source form must conform to the cited language-spec.
- **Provenance-attributed.** Per [witness](../../../objects/witness.md), code creation and edits are witnessed.

## Position in the platform

Code records are the substrate's *program-text registry*. Per [code-as-substrate](teaching/explanations/code-as-substrate.md), the substrate's code lives here, queryable and editable like any other substrate content.
