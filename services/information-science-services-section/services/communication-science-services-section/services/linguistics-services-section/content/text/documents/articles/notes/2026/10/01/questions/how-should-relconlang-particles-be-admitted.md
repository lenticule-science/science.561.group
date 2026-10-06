---
kind: question
status: open
explores:
  - relconlang
  - particles
  - parsing
  - communicating
  - grammar-profile
  - lexical-admission
---
# How should RelConLang particles be admitted without borrowing the wrong lexical classes?

The current language bundle has no dedicated closed-class inventory for semantic-role particles, stance particles, complement markers, or dialogue particles.

RelConLang therefore places several forms into legacy lexical buckets:

- `ga`, `do`, `ve` are listed as determiners;
- `ta`, `na`, `sha`, `mu` are listed as both determiners and auxiliaries;
- `pa`, `lo`, `ke` are listed as prepositions.

The shared compiler's `closedClassTags` returns on the first matching class in the order determiner → preposition → pronoun → conjunction → auxiliary. Thus the FOUR particles that occur in both determiner and auxiliary sets are tagged only as determiners.

Role strategies separately inspect surface strings, so intended arcs such as `nsubj`, `dobj`, `ccomp`, and discourse arcs can still be produced. But generic determiner/preposition attachment rules may also produce structure licensed only by the borrowed lexical class.

The question is whether the shared language bundle should gain first-class particle classes, whether role strategies themselves should provide lexical admission, or whether another typed lexical mechanism should replace the overloaded legacy buckets.

A solution must preserve language-neutral communicating machinery and avoid making RelConLang-specific categories primitive in the shared parser.


## Existing generic hook

The grammar profile already carries every particle strategy as a typed `roleStrategies` entry with `marker` and `markerPosition`. This is enough information to derive a language-neutral set of grammatical markers at compile time.

That suggests an experiment: admit all profile markers under a generic marker/particle tag, rather than requiring them to masquerade as determiners or prepositions. Role-specific behavior can remain in `roleStrategies`; lexical admission need only say "this token is a grammatical marker."

This remains an experimental hypothesis, not a requested parser migration.
