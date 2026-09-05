---
name: validate-thing
description: Validate a thing against its applicable SHACL shapes and report pass/fail
---

Validate: $ARGUMENTS

## Instructions

Check whether a thing satisfies formal constraints.

1. Locate the thing (resolve path to a file or directory with index.md).
2. Check if the thing has a colocated .ttl file. If not, run
   `/generate-rdf` first.
3. Look for applicable SHACL shapes:
   - Colocated shapes (same directory, `*.shapes.ttl`)
   - Type-based shapes (shapes that apply to all things of this type)
   - Global shapes (shapes that apply to all things)
4. If shapes exist, validate the .ttl against them. Report:
   - Which shapes passed
   - Which shapes failed and why
   - What needs to change to pass
5. If no shapes exist, check manually:
   - Does the frontmatter have all required fields?
   - Do all links resolve?
   - Is the type field consistent with the content?
   - Is the page in the right directory for its type?

Report pass/fail with specifics.
