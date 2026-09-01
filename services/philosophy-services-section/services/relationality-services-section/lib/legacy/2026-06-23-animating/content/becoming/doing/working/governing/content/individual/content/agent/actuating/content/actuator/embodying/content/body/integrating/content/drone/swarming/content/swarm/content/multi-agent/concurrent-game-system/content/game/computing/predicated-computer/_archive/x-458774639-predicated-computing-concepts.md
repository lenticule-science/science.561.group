# concepts/

Engineering-semantic anchors that recur across the program. Not engineering objects in themselves; [objects](../objects/) realize them.

A concept here is a role — *operator*, *closure-rule*, *settling-as-computation*, *witness*, *repair*, *fuel-bound* — that takes different concrete shapes in different engineering structures. In one realization "the closure-rule system" is a Python module with declared rule classes; in another it is a Prolog database with rule terms; in a third it is a serialized JSON catalog read at runtime. The concept note describes the role and the discipline it imposes on any structure that would realize it.

Objects and morphisms that realize a concept declare it via `realizes:` in frontmatter. To find every realization of a concept, `grep -l "realizes:.*<concept>"` over `objects/` and `morphisms/`.

## Frontmatter

```yaml
---
type: concept
class: substrate | operator | discipline | pattern | ...
depends-on: [...]
see-also: [...]
---
```

Concept notes do not carry `status` (they are not claims). They may carry `depends-on:` when the role can only be precisely named after certain other notes exist.

## Body shape

A concept note's body describes the role: what it names, what discipline it imposes on any realization, what is settled by adopting the role. The body is engineering content, not implementation content — a concept describes what *kind* of engineering target it is, not how to write the code.

## When to add a concept

When the same engineering term does load-bearing work across two or more distinct realizations, and you want to be able to ask "is this still the same X?" — promote it to a concept. If a term only appears inside one realization, it does not need a concept note; it belongs in [examples](../examples/) instead.
