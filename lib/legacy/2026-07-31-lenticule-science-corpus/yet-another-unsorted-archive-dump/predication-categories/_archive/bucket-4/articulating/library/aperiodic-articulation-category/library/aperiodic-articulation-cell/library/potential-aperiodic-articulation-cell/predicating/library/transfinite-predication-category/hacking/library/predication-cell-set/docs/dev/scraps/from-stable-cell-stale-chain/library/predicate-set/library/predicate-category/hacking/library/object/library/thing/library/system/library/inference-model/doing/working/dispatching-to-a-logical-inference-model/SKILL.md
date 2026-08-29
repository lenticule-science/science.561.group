---
name: dispatching-to-a-logical-inference-model
description: Picks the first model whose skills list advertises the needed skill, then chains to dispatching-to-a-logical-inference-model-on-the-web (or to a local-model dispatcher in the future). Use when the dispatch chain has decided that the work needs logical inference and needs to pick which model handles it.
---

## Requirements

- Models are registered under `doing/working/inferring/models/<slug>.md` with a `skills:` list in frontmatter.

### Inputs

- `skill` — string. The slug of the skill the work needs (e.g. `closing-a-question`).
- `prompt` — string. The prompt to send to the selected model.
- `maxTokens` — number (optional).

## Steps

1. Walk `doing/working/inferring/models/` for `.md` files (excluding `_index.md`).
2. For each model record, read its frontmatter and check if `skills:` contains the requested skill.
3. First match wins. If no model advertises the skill, raise a no-match error naming the skill.
4. Resolve which sub-dispatcher to use. v1 hands everything to `dispatching-to-a-logical-inference-model-on-the-web`. Local-model dispatch is deferred.
5. Call the sub-dispatcher with `{ model, prompt, maxTokens }` and return its result.

## Outcomes

- On match: the response cell from the model is returned, augmented with the matched skill name.
- On no match: an error is raised. Higher layers decide what to do (wait, fail, broaden the search).
