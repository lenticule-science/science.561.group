---
name: conjecture-unit

description: "Creates a new Conjecture math unit from a speculative claim found in another unit. Use when a claim should be extracted into its own file rather than staying as a remark."
skill-closure-kind: process
---

domain:
- `unit_file` — path to the math unit to reform
- `critique` — the math issues from `critique-unit.md` identifying what is speculative,
  what assumptions are hidden, and what proof steps are unjustified

codomain: `unit_file` rewritten as a conjecture unit, with no sub-heading anchors,
no epistemic mismatch, no hidden assumptions.

---

1. Read `unit_file` in full.

2. Update the frontmatter `description:` field to begin with "Conjecture: ".
   Keep the mathematical content of the description; only prefix the type.

3. Rewrite the body with the following sections in order. Use no sub-heading anchors
   (no `{#...}` on any heading below the top-level one).

   **a. Statement**
   The formal conjecture claim. All conditions that a proof would need to assume —
   genericity hypotheses, finiteness conditions, non-degeneracy requirements — must
   appear here as named hypotheses, not in a remark or motivation paragraph.
   Form: "Let X satisfy [hypothesis]. Then [claim]."

   **b. Motivation**
   Why this is expected to be true. Structural arguments, analogies, known special cases.
   Label each step of the argument that is not yet justified as an assumption or observation,
   not as a derivation.

   **c. What a proof requires**
   An explicit list. For each gap identified in the critique, name:
   - The specific step that is asserted but not derived.
   - What lemma or construction would be needed to derive it.
   - Which upstream open conjectures this depends on.

   **d. Depends on:**
   A §ref list of the units needed to *state* the conjecture (not just to prove it).

4. Change the top heading from "### Theorem —" or "### Definition —" to
   "### Conjecture —". Keep the display name and the top-level anchor `{#<unit_id>}`.

5. Remove all sub-heading anchors (`{#...}` tags on `####` headings).
   If a sub-heading contained content worth keeping, fold it into the appropriate
   section from step 3 as inline prose.

6. Remove all LaTeX paper syntax: `\ref{...}`, `\label{...}`, `Theorem~\ref{...}`,
   `(\ref{...})`. Replace cross-references of the form `Theorem~\ref{X}` with `§X`.

7. Save the file.
