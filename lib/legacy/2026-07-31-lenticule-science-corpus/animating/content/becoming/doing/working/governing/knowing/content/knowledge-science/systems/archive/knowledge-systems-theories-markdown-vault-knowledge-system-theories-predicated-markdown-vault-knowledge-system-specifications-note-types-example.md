---
title: "Example notes"
---

# Example notes

An *example note* (frontmatter `type: example`, directory `examples/`) is a concrete instance or worked construction that exercises one or more theorems, objects, or morphisms end-to-end. Examples are how the corpus shows that its abstractions compute things people care about; they are also the first place new contributors look to learn what a theory does.

A good example follows the discipline of the theory it inhabits — it cites the theorems it instantiates, declares the constructions it depends on, and produces witnesses (computed values, generated tables, derived figures) that another reader could reconstruct.

## Required frontmatter

```yaml
---
type: example
---
```

## Recommended frontmatter

- `instantiates: [...]` — the theorems, objects, or morphisms the example exercises. This is the structural relation: the example is *placed after* every entity it instantiates, per [frontmatter-relations](../frontmatter-relations.md).
- `depends-on: [...]` — what the example presupposes (often the same as `instantiates:`, but `depends-on:` is broader: the example may depend on machinery it does not directly instantiate).
- `status:` — `verified | reproducible | sketched | abandoned`. A `verified` example is one whose computation has been re-run against the toolchain and produces the documented output; `reproducible` is verified-in-principle but the run may not be recent; `sketched` is partially worked.
- `see-also: [...]` — neighboring examples.

## Body conventions

An example note's body SHOULD have this shape:

```
# <Display name>

<First paragraph: what the example is and what it instantiates. One or two
sentences naming the construction and the theorems it exercises. If the
example is computed by a tool, the invocation goes here.>

## Step 1: <name>
## Step 2: <name>
...
## Step N: <name>

<For computed examples: the step-by-step computation, with intermediate
results in tables, code blocks, or display math. Each step cites the
theorem or morphism it applies.>

## Output / Verification

<The example's final output. For Lean-verified examples, a pointer to the
verifying module. For numerically-computed examples, the computed values,
preferably with a hash or other reproducibility token. For physical /
empirical examples, the measurement and its uncertainty.>

## What this exemplifies                  (recommended)

<One paragraph on what theoretical content the example makes visible. What
would be lost without this example?>
```

The step-by-step format follows the [computation-protocol](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/computation-protocol.md) narrative in predication-categories. Engineering examples (deployment scenarios, runbook walkthroughs) MAY use a different shape (a YAML / TOML configuration block, a sequence diagram, etc.) but SHOULD remain step-structured for auditability.

## When to use `example` vs. alternatives

- Use `example` for any concrete instance that exercises the theory's machinery on specific inputs.
- Use [theorem](theorem.md) when the content is a *general* claim about a class of cases.
- Use [narrative](narrative.md) when the content is a *story* about how concepts connect, not a worked construction.
- Use a tool / script in the theory's `tools/` directory when the content is an *executable* — the example may then cite the tool and its output, but the executable itself is not an example note.

## Validation rules (informal)

- An example note MUST declare `type: example`.
- An example note SHOULD declare at least one entity in `instantiates:`. An example that instantiates nothing is either misclassified or a curation diagnostic.
- An example with `status: verified` SHOULD declare the toolchain version or commit that produced the verification, so the example is reproducible.
- The example's `instantiates:` and `depends-on:` sets MUST resolve to existing notes.

## Examples of examples

- Computed math example: [benchmark-1-fibonacci](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmarks/benchmark-1-fibonacci.md). `status: verified`. Instantiates the step-$n$ cohomological rank theorem and three other constructions. Eight-step computation protocol with tables and verification at each layer.
- Engineering example slot: AOP and FARS's `examples/` directories — currently sparse, an explicit growth area per the corpus's curation diagnostics.
