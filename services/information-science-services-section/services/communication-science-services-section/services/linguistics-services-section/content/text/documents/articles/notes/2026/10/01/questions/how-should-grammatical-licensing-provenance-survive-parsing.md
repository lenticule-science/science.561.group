---
kind: question
status: open
explores:
  - relconlang
  - parsing
  - provenance
  - role-particles
  - communicating
  - evidence
---
# How should grammatical licensing provenance survive parsing?

RelConLang describes `ga` and `do` as explicit role receipts. The shared parser does distinguish licensing rules during proposal generation: a subject arc can arise from `nsubj-particle` or `nsubj-position`, and similarly for objects.

However, `construe()` projects `Proposal { arc, rule }` to a bare `Arc` before charging and settling. The final `ParseResult` therefore preserves the dependency relation but not the rule that licensed it.

If a particle strategy and positional fallback both produce the same arc, downstream readers cannot distinguish:

- role inferred from word order;
- role explicitly witnessed by a particle;
- role multiply supported by both.

That prevents the current parse carrier from realizing the design claim that explicit role particles are auditable receipts.

The experiment should test a provenance-preserving parse carrier in which grammatical hypotheses retain their licensing witnesses. The natural substrate is already present: the parser charges hypotheses with witness-bearing FOUR carriers. The question is how rule provenance should enter those evidence lists without making language-specific parser code.
