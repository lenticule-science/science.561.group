---
kind: question
status: open
explores:
  - relconlang
  - morphology
  - lexicon
  - root-family
  - coinage
  - language-evolution
---
# What makes a RelConLang root family generative?

The current RelConLang research lexicon records biconsonantal root families and vocalic templates. The compiled communicating bundle can recognize declared root-pattern surfaces and attach features such as `root:k-d` and `template:CoCa`.

That is not yet an algorithm that generates or validates an entire morphological family.

The manifest's root-pattern rules currently cover noun-like surfaces such as `koda`, `kano`, `voma`, and `vara`. Related verbs such as `kod`, `kan`, `vom`, and `var` are admitted independently by ordinary verb regexes and do not receive the same compiled root identity.

Thus the intended family relations

[
kod \leftrightarrow koda,quad
kan \leftrightarrow kano,quad
vom \leftrightarrow voma,quad
var \leftrightarrow vara
]

are documented and intuitively regular but not currently derived by the grammar engine.

For experimental language evolution, the program needs to determine:

1. whether roots are abstract consonantal generators or merely metadata on listed lexemes;
2. which templates are productive and for which lexical categories;
3. whether a proposed new form can be generated/parsed from a root+template law rather than added as another regex;
4. how semantic neighborhood constraints prevent formally valid but semantically incoherent coinages;
5. how diachronic change can alter a family without retroactively changing old utterance readings.

Until then, "generative lexicon" should be read as a generative design specification with partial parser recognition, not a complete morphological generator.
