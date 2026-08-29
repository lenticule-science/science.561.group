---
name: vague-token
description: A token whose surface matches an entry in the vague-stretch watchlist — a regex literal or a hedge-phrase pattern flagged as a red-flag indicator that the emitter is reaching for a generic word because precise vocabulary is missing. A vague-token specializes token by carrying a trigger-reason and a list of exempt cues whose presence in the surrounding window suppresses the flag.
specializing: token
matching: vague-token-trigger
exempting: vague-token-exempt-cue
flagging: vague-token
---

Entity record for vague-token. A vague-token is a token that the watchlist scanner has classified as a stretch-indicator — a use that signals the emitter lacks precise context. The data shape extends [token](../) with two fields: a *trigger-reason* (free-text recorded on the watchlist entry that fired the match) and a list of *exempt-cues* (words whose presence in the surrounding window suppresses the flag because they indicate the token is being used precisely). The full data shape is at [the JSON schema](vague-token.schema.json); the EAVT log at [vague-token.jsonl](vague-token.jsonl).

The transformer that recognizes a token as vague is `noticing-a-vague-token`. The transformer that responds is `injecting-context-after-noticing-a-vague-token`. Both are recorded under [the injecting subtree](../../../doing/working/injecting/).
