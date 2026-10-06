---
kind: question
status: open
explores:
  - relconlang
  - communicating
  - signcraft
  - parsing
  - semantic-interface
---
# What should be shared between the communicating and SignCraft RelConLang readers?

Two current experimental instruments read RelConLang for different purposes.

The shared `@red-cup-engineering/communicating` parser is language-neutral. It compiles grammar profiles, builds dependency proposals, settles grammatical hypotheses, produces parse forests, and feeds generic semantic/discourse readers.

The current `@red-cup-engineering/signcraft/inference/relconlang` parser is language-specific and intentionally strict. It normalizes verbs to declared roots, separates aspect, carries a clause reading, represents RelConLang obliques directly, and links complement clauses as events.

The experiment should not merge these merely because they overlap.

The question is whether they can project into a shared semantic carrier — provisionally the proposition nucleus plus separately indexed stance/force/dialogue/context — while retaining their own parsing strategies and evidence.

A useful law would be observational agreement where both instruments claim to know the same coordinate, while disagreement remains inspectable rather than silently reconciled.
