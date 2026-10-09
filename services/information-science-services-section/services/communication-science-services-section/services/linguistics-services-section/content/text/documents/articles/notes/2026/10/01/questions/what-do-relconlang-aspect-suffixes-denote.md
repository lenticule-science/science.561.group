---
kind: question
status: open
explores:
  - relconlang
  - aspect
  - morphology
  - settling
  - closure
  - becoming
---
# What do RelConLang aspect suffixes denote?

RelConLang documents four productive verbal suffixes:

- `-ai`: inchoative / beginning;
- `-en`: process / underway;
- `-um`: settled result;
- `-o`: release / discharge.

Their names rhyme strongly with the relating/settling mathematics, but no recovered implementation currently proves that these linguistic aspects are images of articulating/predicating/positing/settling stages, closure ordinals, or fixed-point status.

The shared language compiler applies suffix regexes before lexical validation. A form that matches a suffix rule can therefore be tagged as a verb even if its stem is not a declared RelConLang root. This makes the suffixes genuinely productive morphology, but it also means parser acceptance is not semantic warrant.

The question asks for each suffix:

1. its linguistic aspect semantics;
2. whether it requires a known lexical root;
3. its interaction with FOUR/evidence and modality;
4. whether any relation to mathematical settling is a proved morphism, a design analogy, or merely shared vocabulary.

In particular, `-um` should not be interpreted as "mathematical fixed point reached" unless an explicit semantic bridge is derived.
