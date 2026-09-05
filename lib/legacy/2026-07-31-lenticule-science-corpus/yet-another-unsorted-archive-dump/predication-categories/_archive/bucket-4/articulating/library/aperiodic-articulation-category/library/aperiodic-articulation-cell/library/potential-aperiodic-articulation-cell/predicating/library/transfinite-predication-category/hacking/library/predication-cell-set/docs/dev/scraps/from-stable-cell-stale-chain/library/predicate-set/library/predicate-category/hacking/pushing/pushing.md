---
name: pushing
gerund: pushing
agent-noun: pusher
imperative: push
description: A transformer that publishes local commits to a remote repository so the remote's branch ref advances to match the local branch's tip.
---

A pushing transformer reads a local repository's branch state and a remote name, transfers any commits the remote does not yet have, and advances the remote's named branch ref to the local branch's tip. The transformer does not modify local history; on success only the remote's view of the branch changes.

Pushing is distinct from committing in that pushing transfers existing commits; the commits themselves are produced by the committing transformer. A pushing transformer therefore presupposes that the local branch is at the state the caller intends to publish.

## Domain and codomain

- **Domain:** a local branch state (its tip commit and history) and the name of a remote together with the remote's branch ref to advance.
- **Codomain:** the remote's branch ref advanced to the local branch's tip; locally, the remote-tracking ref updated to match.

## Morphological forms in naming grammar

- `gerund: pushing` heads skills built on this transformer: `pushing-the-current-branch`.
- `agent-noun: pusher` heads agents that invoke such skills: `pusher-of-the-current-branch`.
- `imperative: push` heads scripts that body such skills: `push-the-current-branch.mjs`.
