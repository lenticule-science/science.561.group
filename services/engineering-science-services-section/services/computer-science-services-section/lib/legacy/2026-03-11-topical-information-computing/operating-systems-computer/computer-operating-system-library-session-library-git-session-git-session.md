---
name: git-session
description: A session bracketed by a git operation's lifecycle hooks — typically pre-commit on one end and post-commit on the other. The unit of work the OS treats as one git-level act.
specializing: session
bracketed-by:
  - git-pre-commit
  - git-post-commit
---

A **git-session** is a [session](../../session.md) specialized by being bracketed by a git operation's lifecycle hooks rather than by a Claude Code SessionStart/Stop pair.
Typical bracket: `pre-commit` (when staged changes have arrived and a commit is about to be written) and `post-commit` (after the commit object is in place).
Other git brackets (pre-push/post-push, pre-receive/post-receive) form their own git-sessions.

## Why git-session is a session

The session form is generic — a temporally-ordered set of operations bracketed by lifecycle events.
Claude Code wraps that form one way (SessionStart → Stop, with a character bound); git wraps it another way (pre-X → post-X, with a commit or push as the bracketed act).
The 561 OS treats both as instances of the same session structure, with the bracket-pair as the specializing cell.

This matters for the witness log: every act inside a git-session's brackets is attributable to the session, signed by the character that owns the git config locally, and accumulates as the session's chain — the same accounting discipline used inside claude-sessions.

## Characteristic predication-shape

- `bracketed-by(git-session, {git-pre-X, git-post-X})` — the pair of git hook events that begin and end the session.
- `triggers-on(git-session, git-operation)` — which git operation (commit, push, merge) the session is bracketed around.
- `staged-changes(git-session, [path])` — the set of paths changed during the bracket.
- `commit-object(git-session, oid?)
  ` — the commit OID once written (post-commit only).
- `runs-as-identity(git-session, git-identity)` — the local git user.name/user.email at the time of the operation.
