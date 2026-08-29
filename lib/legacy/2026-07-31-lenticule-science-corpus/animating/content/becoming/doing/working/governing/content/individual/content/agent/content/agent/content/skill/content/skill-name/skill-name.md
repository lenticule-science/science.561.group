---
name: skill name
description: The kebab-case slug naming a skill, decomposable as a verb-noun phrase whose head is a gerund resolving to a transformer and whose tail is a noun resolving to a structure.
derives-from:
  - skill.md
---

A skill name is the directory name at `doing/working/hacking/doing/working/skills/<slug>/`.
The slug parses as `<gerund>(-a|-an|-the)?-<noun>(-<modifier>)*` where the gerund resolves to a transformer record at `code/transformers/<verb>.md` whose `gerund` field matches the head, and the noun resolves to a structure record at `code/structures/<noun>.md`.
Modifiers further constrain the noun and resolve to concept or structure records.

A skill name is the linguistic projection of the underlying transformer-structure pair into the substrate's naming grammar.
Two skills with the same transformer and structure differ in their modifier tail; two skills with the same name are identical.
