# Linguistics Services Section

This package composes the language-neutral `communicating` provider with the
default English language fiber. It returns source-preserving candidate readings;
it does not decide what a speaker meant and never writes a customer's records.

Its first semiote provides a bounded Leader-message parsing service to the
Leader Movement Team. The service preserves the source, exposes ambiguity and
repair obligations, and returns candidate linguistic readings for admission by
the customer-side office.

Five recovered RMN blobs remain immutable local evidence under
`data/rmn/sha-256`. They are deliberately excluded from the published tarball.
`legacy-linguistics-relational-wire/v1` may validate and admit one of those
payloads through the relational-value-graph provider, then records a new
strict-JSON readdressing receipt. It has no encoder and no legacy egress.

## Children

`services/` carries one language fiber (an algebra die) per admitted language —
`english-language-algebra`, `lakota-language-algebra`, `latin-language-algebra`,
`mandarin-language-algebra`, and `tokipona-language-algebra` — alongside
`english-language-codecs`, `english-services-section`, `semantics-services-section`,
and `semiotics-services-section`. `lakota-language-corpus` (promoted this session
from `lib/legacy`) sits beside `lakota-language-algebra` as the finite,
manifest-backed Lakota communicating fiber over `@emsenn/communicating`, distinct
from the algebra die. The embodied-phonetics research docs area, under
`content/text/documents/articles/embodied-phonetics`, holds articulatory- and
motor-speech-phonetics notes rather than a runnable package.

Mandarin's fiber supplies its own dictionary-based, greedy longest-match
`segment` function rather than falling back to per-character tokenization;
that segmentation depends on the new optional `bundle.segment` hook added to
`lib/communicating`, which the pipeline calls in place of its default
script-boundary tokenizer whenever a bundle provides it.
