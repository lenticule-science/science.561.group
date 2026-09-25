---
title: Writing Math Units
description: Reference for agents writing or editing files in math/.
---
# Writing Math Units

Reference for agents writing or editing files in `math/`.

---

## The One Rule Before All Others

Read `AGENTS.md` and `CLAUDE.md` first.
The hard rules there (no numbers, prefix order is natural, presheaves are contravariant, Heyting implication is $\Rightarrow_t$) override any habit or convention you bring from outside.

---

## Never Use Self-Referential Document Language

**Never write "this treatise", "this paper", "this construction", or "in this work".** These phrases make the text refer to itself as a document rather than to the mathematics.

Instead, name the actual mathematical object:

| Bad | Good |
|-----|------|
| "in this treatise" | "in $R$" or "in $\mathcal{H}$" |
| "in this paper" | "in $R$" |
| "of this construction" | "of $R$" or "of $\mathcal{H}$" |
| "the treatise's nuclear quartet" | "the nuclear quartet of $R$" |
| "every construction in this treatise" | "every construction of $R$" |
| "the founding thing of the treatise" | "the founding thing of $R$" |
| "The things of this treatise are" | "The things of $\mathcal{H}$ are" |

When choosing between $R$ and $\mathcal{H}$: use $R$ for ground-level constructions (fiber algebras, nuclei, the topos, FML0, self-generation); use $\mathcal{H}$ for hyperverse-level or cross-level statements.
If in doubt, use the most specific object actually being discussed.

---

## File Structure

Every file in `math/` is one unit: one axiom, one theorem, one definition, one lesson.
File name = concept name (no `def-` prefix, no acronyms).

```
math/fiber-algebras.md        (good)
math/def-fiber-algebras.md    (wrong)
math/fa.md                    (wrong)
```

**Flat directory.** No subdirectories in `math/`.

---

## Frontmatter Schema

Every unit has exactly two required fields:

```yaml
---
id: nucleus
description: "A nucleus on a Heyting algebra is an extensive, idempotent, meet-preserving endomorphism."
---
```

Annotation fields (underscore-prefixed) are optional:

```yaml
_math_symbol: "$j$"
_lean_file: "RelationalHyperverse/Nucleus.lean"
_aliases: ["closure operator"]
```

Additional hyphenated keys will be FML clause fields once the frontmatter migration proceeds (see `spec/frontmatter.md`).
No other fields.

---

## Adding a New Unit

1. Write `math/{concept-name}.md` with frontmatter and content
2. Add it to `math/_manifest.yaml` at the correct position
   - Lesson files go immediately *before* their formal unit
   - Respect dependency order: a unit's deps must appear earlier in the manifest
3. Run `python src/pipeline/build.py` (rebuilds the assembled paper)

---

## Cross-References

All cross-references use `{#anchor-id}` form:
```markdown
See [the Axiom of Fiber Algebras](#axiom-fiber-algebras).
```

The anchor id must match the `id:` frontmatter field of the target unit.
Never use section numbers.

---

## The Two Towers (Critical Distinction)

**Depth-filtration tower** builds $R$ within a fixed $T$ by depth.
Lives in closure-and-self-generation.
See `depth-filtration.md`.

**Hyperverse tower** builds $\mathcal{H}$ by iterating $U_\mathcal{H}$ across universes.
Lives in hyperverse-section.
See `hyperverse-tower.md`.

Do not conflate these.

---

## Current Priority

See `PLANS.md` for the active blockers and roadmap.
See `math/PLANS.md` for the current math task list.
