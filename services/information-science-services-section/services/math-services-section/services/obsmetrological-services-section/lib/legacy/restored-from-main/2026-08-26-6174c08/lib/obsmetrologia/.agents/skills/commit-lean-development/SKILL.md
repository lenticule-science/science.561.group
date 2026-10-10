---
name: commit-lean-development
description: Preserve Obsmetrologia proof development as coherent, reviewable Git history. Use for every Lean definition, theorem, proof, module, import, generated declaration index, proof recovery, rename, or refactor, and whenever preparing, committing, or publishing changes to this repository.
---

# Commit Lean Development

Treat Git commits as the durable record of mathematical development. A passing
worktree snapshot is not a substitute for a reviewable proof change.

## Establish the exact baseline

1. Run `git rev-parse --show-toplevel`, `git remote -v`, and
   `git status --short --branch` from the Obsmetrologia package root. The
   proof tree is tracked directly inside the `emsenn/info` monorepo (remote
   `bare-cedar-fog`); the toplevel resolves to the monorepo root, not this
   directory. Proof commits stage only paths under the Obsmetrologia package
   and never absorb unrelated monorepo state.
2. Fetch existing history before recovery work. Do not rewrite, force push, or
   discard a ref unless Morgan explicitly requests a history reconstruction.
   When authorized, follow the recovery procedure below and prove preservation
   before changing the remote.
3. Identify the theorem, definition, module, or generated source that owns the
   requested outcome. Use `git log --all -- <path>`, `git blame`, `git show`,
   and `git log --all -S'<declaration>'` when prior versions matter.
4. Record pre-existing modified and untracked paths. They belong to someone
   else unless the request identifies them. Never absorb them into the commit.
   If an intended target is already modified, stop and coordinate ownership or
   begin from a clean commit in a separate worktree; do not edit through it.

For historical material, distinguish:

- an ancestor commit from a snapshot with no Git ancestry;
- a reachable commit from a formerly dangling commit retained by a named ref;
- a source file from a generated index, blueprint, or prose claim;
- a theorem statement from a proof, `sorry`, axiom, or unchecked draft.

## Make one mathematical change

Define the commit before editing: one theorem-sized result, one tightly coupled
module change, or one mechanical move with all required import updates. Split
unrelated mathematics into separate commits even if it currently passes in one
worktree.

Preserve the requested statement and its trust status. Do not weaken a theorem,
replace a proof with `sorry` or an axiom, delete a difficult module, or relabel a
draft as proved merely to make a check pass. Do not hand-edit a generated file;
change its source and regenerate it.

Any deletion, purity refactor, or service split that touches Lean source requires
explicit authorization and a before/after inventory of affected files and
declarations. Every removed declaration must remain reachable at a named commit
or recovery ref and have a recorded destination or an explicit decision to
retire it. Organizational relabeling is not evidence that mathematics is safe
to delete.

Use `git mv` for tracked moves. Before a move, map the source, destination,
references, owning repository, and collisions; afterward prove destination
presence and source absence.

## Verify through Lean

Run the narrowest check that exercises the changed module, followed by the
repository gate appropriate to its dependency surface:

```sh
lake env lean path/to/ChangedModule.lean
lake build
```

Inspect warnings involving `sorry`, axioms, or unused hypotheses rather than
hiding them. If the repository provides a relevant audit script, run it as an
additional check. Report the command and actual exit status.

## Stage an intentional commit

Stage only enumerated paths:

```sh
git add -- path/to/ChangedModule.lean path/to/ImportSurface.lean
git diff --cached --check
git diff --cached --stat
git diff --cached
git status --short --branch
```

Never use `git add -A`, `git add --all`, or a repository-wide glob for normal
proof development. Do not commit a dirty worktree under subjects such as
`checkpoint`, `snapshot`, `pending work`, `worktree state`, or `WIP`. The
subject must name the mathematical or repository behavior that changed.

Commit only after the staged diff and verification describe the same coherent
unit. Push that commit immediately with `git push origin HEAD`; then report the
commit ID, push result, checks, and any unrelated remaining dirt.

## Recover without inventing history

The monorepo keeps one durable branch: `main`. Every retained historical state
of the proof tree must be reachable from it without a tag or recovery branch.

Before an authorized reconstruction, create a temporary complete bundle and
build the candidate graph in a disposable clone. Do not publish the candidate
until all source trees from the old main, recovered objects, and filesystem
snapshot are present in `git log main` of the candidate. Remove temporary refs
only after the new remote graph and consumer Gitlink are verified.

If an archived tree lacks `.git` metadata, preserve its exact tree as an
explicitly described reconstructed root. Record the provenance and uncertainty
in its commit message rather than pretending its timestamp or parentage is
original. Preserve sibling or concurrent states as side parents joined by a
no-tree-change recovery merge at their historical point; do not linearize them
into invented causality. Merge recovered mathematics into the current working
tree only after a declaration-level comparison and Lean verification.

## Completion gate

The task is complete only when:

- the intended statement and proof status are preserved;
- the targeted Lean check passes, plus `lake build` when the change can affect
  imports or shared definitions;
- the staged diff contains only the declared unit;
- the commit has a specific subject and is pushed;
- every retained version is reachable from the monorepo's `main`, which is the
  only durable branch and does not depend on tags for recovered history;
- the staged paths all live under the Obsmetrologia package directory, verified
  with `git status --short -- .` from the package root before committing.
