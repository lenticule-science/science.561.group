---
name: committing
gerund: committing
agent-noun: committer
imperative: commit
description: A transformer that records a working-tree state as a new history node in a versioned source-control system, attaching a message that names the change.
---

A committing transformer reads the current working-tree state of a versioned repository together with a message describing the change and produces a new commit object that records the state as the next node in the repository's history. The transformer mutates the repository's history graph by appending a node; it does not by itself publish the new state to any remote.

Committing is distinct from pushing in that committing is local to the repository — the new history node exists on disk but no remote sees it until a separate pushing transformer runs.

## Domain and codomain

- **Domain:** a working-tree state with staged changes and a commit message describing those changes.
- **Codomain:** a new commit object referenced by the repository's `HEAD` and by the potential branch's tip, recording the staged state and pointing at the prior commit as its parent.

## Morphological forms in naming grammar

- `gerund: committing` heads skills built on this transformer: `committing-the-working-tree`, `committing-a-repository-recursively`, `committing-a-change-with-git`.
- `agent-noun: committer` heads agents that invoke such skills: `committer-of-the-working-tree`, `committer-of-a-repository-recursively`.
- `imperative: commit` heads scripts that body such skills: `commit-the-working-tree.mjs`, `commit-a-repository-recursively.mjs`.
