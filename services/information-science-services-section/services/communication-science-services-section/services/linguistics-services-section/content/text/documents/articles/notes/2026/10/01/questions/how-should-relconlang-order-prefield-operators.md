---
kind: question
status: open
explores:
  - relconlang
  - word-order
  - stance
  - dialogue
  - provenance
  - scope
---
# How should RelConLang order prefield operators?

RelConLang currently has several elements that can occur before the core predicate:

- a fronted provenance phrase, `NOMINAL pa`;
- stance particles `ta/na/sha/mu`;
- dialogue particles `ku/du/se/ha`.

The documentation does not yet give a single compositional prefield grammar.

The core-clause sketch says `[charge/dialogue] subject verb object`, suggesting stance/dialogue are outermost. But the built stance example

`sava pa na mi ga dav do luma.`

places provenance before stance.

This matters because the two current parsers behave differently by construction. SignCraft strips at most two stance/dialogue particles before calling its clause parser. It can then parse a fronted provenance phrase. It does not currently re-enter the stance/dialogue prefield after consuming that provenance phrase.

The experiment should compare surface permutations and decide whether the language has:

1. fixed slots, e.g. `STANCE DIALOGUE PROVENANCE SUBJECT...`;
2. a discourse prefield whose operators have typed scope and partially free order;
3. multiple legal orders with explicit scope equivalence laws.

This should be settled linguistically before making either parser conform to the other.
