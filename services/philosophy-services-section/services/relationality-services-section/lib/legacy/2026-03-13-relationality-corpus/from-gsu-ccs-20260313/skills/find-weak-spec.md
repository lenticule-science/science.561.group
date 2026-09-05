---
name: find-weak-spec

description: "Scans spec/ and returns spec files ranked by weakness: missing definition, no normative claims, uncited MUST assertions, pending longer than body."
skill-closure-kind: inquiry
---

domain: none — reads `spec/*.md` autonomously, excluding context files

codomain: a ranked list of spec files from weakest to strongest, each with a score
and a list of defects tagged `auto` or `needs-input`

---

Read all `spec/*.md` files excluding: `AGENTS.md`, `INBOX.md`, `PLANS.md`, `IDEAS.md`,
`MEMORY.md`, `SOUL.md`. Also read `spec/specs.md` to use as the reference for what a
spec must contain.

For each file, check:

- **Missing `id`** (−2, auto)
- **Missing `description`** (−2, auto)
- **Missing `defines`** (−2, auto): file clearly defines one thing but `defines` is absent
- **No opening definition** (−3, needs-input): no "What it is" or equivalent first section
  that states what the thing is
- **No normative claims** (−4, needs-input): no MUST, MUST NOT, SHOULD, CAN, or CANNOT
  anywhere in the body
- **Uncited MUST on a mathematical object** (−3, needs-input): a MUST/MUST NOT claim
  about a mathematical object has no markdown link to a math unit or proof
- **Instance content in concept spec** (−3, needs-input): a section describes a specific
  instance (a path, a technology, a named system) rather than the abstract concept —
  see `spec/specs.md` Encodings/Implementations rule
- **Pending longer than body** (−2, needs-input): the Pending or Open questions section
  is longer than the sum of all other sections
- **Empty or heading-only body** (−5, needs-input)

Score = sum of penalties. Return files sorted ascending by score. Exclude score = 0.
Report total defect count.
