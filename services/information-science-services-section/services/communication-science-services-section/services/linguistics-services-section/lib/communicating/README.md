# @lenticule-science/communicating

`communicating` is the language-neutral operation algebra over
`@red-cup-engineering/relating`. Its core operations transform admitted meme
carriers; raw text is admitted separately by a language bundle's codec, and
language-manifest evidence is read separately from both.

## Operation surfaces

The core surface contains exactly fourteen operations:

- `communicate`, `semiose`
- `speak`, `listen`, `illocute`, `ground`, `translate`, `negate`, `conflate`,
  `refer`, `modalize`, `presuppose`, `quote`, `compose`

`actions(bundle)` returns those fourteen operations plus the three bundle-bound
readings `cohere`, `spacetime`, and `channel`. Those readings do not enlarge the
core operation algebra.

`codecActions(bundle)` is the separate three-operation raw-text boundary:
`decode-communication`, `articulate-communication`, and
`settle-communication`.

`manifestActions(manifest)` is the separate seven-operation evidence surface:
the admitted language manifest, its Witness Journal rows, the combined finite
receipts, and its Lambek, sofic, Chu, and discourse-cover receipts.

## Boundary continuity

The messaging surface emits SCIS v2 CloudEvents. Its deterministic identifier
is derived from the normalized `{ source, type, time, data }` semantic value with
the established `lenticule.communicating.cloudevent` object kind and empty
witness root. Optional CloudEvents extension attributes do not rewrite it.

## Package surfaces

The root exports the operation factories and language-neutral admission
machinery. Fourteen explicit subpaths expose holography; language algebra;
understanding, codecs, geometry, grammaticality, parsing, and grounding;
speaking, signifying, illocuting, and listening; and messaging. Concrete
language packages supply their own bundles and manifests.
