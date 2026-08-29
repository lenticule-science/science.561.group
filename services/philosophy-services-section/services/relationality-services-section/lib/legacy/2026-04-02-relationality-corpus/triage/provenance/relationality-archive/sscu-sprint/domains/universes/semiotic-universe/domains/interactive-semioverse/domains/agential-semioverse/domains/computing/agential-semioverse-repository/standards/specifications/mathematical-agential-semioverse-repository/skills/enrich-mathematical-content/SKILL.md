---
name: enrich-mathematical-content

description: "Enrich a mathematical page's frontmatter with domain-specific typed relations"
---

Add domain-specific typed relations to a mathematical page's frontmatter based on the [Mathematical ASR specification](../../index.md).

## Procedure

1. **Read the target page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Determine the mathematical content type.** Based on the page body:
   - Does it establish the meaning of a term or structure? → `definition`
   - Does it state a proposition taken as given? → `axiom`
   - Does it state and prove a result? → `theorem` (or `lemma`, `proposition`, `corollary`)
   - Does it demonstrate a result is true? → `proof`
   - Does it state an unproven conjecture? → `conjecture`
   - Does it give a concrete instance? → `example` or `counterexample`
   - If none of these apply, keep the general ASR type (`term`, `concept`, `text`).

3. **Identify required relations.** Consult the [content types specification](../../index.md) for MUST and SHOULD requirements:

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `definition` | `defines:` | `has-example:`, `requires:`, `extends:` |
   | `axiom` | `part-of:` | `enables:` |
   | `theorem` | `proven-by:`, `requires:` | `corollaries:` |
   | `proof` | `proves:`, `uses:` | `technique:` |
   | `lemma` | `proven-by:`, `requires:` | `supports:` |
   | `corollary` | `follows-from:`, `proven-by:` | — |
   | `conjecture` | — (MUST NOT `proven-by:`) | `evidence:` |
   | `example` | `illustrates:` | — |
   | `counterexample` | `refutes:` | — |

4. **Read the page body for implicit relations.** Look for:
   - Inline links or references to other pages → candidates for `requires:` or `uses:`
   - Phrases like "extends," "generalizes," "builds on" → `extends:`
   - Phrases like "for example" → `has-example:`
   - The page's position in a dependency chain (e.g., group requires monoid)

5. **Add relations to frontmatter.** Only add relations that are accurate based on the page content. Do not invent relations the content does not support.

6. **Update `type:` if appropriate.** If the current type is `term` but the content is actually a mathematical definition with formal context, consider updating to `definition`. Only change if the new type is clearly more accurate.

7. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Constraints

- Do not modify body content. This skill only touches frontmatter.
- Do not add relations to pages you have not read.
- Prefer existing page paths for relation targets. If a target page does not exist, use a descriptive string value instead of a broken path.
- If unsure whether a relation applies, leave it out. Missing SHOULD relations produce warnings, not errors.
