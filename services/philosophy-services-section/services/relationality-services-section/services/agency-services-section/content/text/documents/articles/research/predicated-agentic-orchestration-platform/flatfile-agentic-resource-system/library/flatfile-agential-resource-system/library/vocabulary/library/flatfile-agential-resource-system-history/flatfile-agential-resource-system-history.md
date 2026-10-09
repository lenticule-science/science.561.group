---
id: flatfile-agential-resource-system-history
description: "Conjecture: how the FARS implements the history category T using git — commits as histories, file changes as steps, ancestry as the prefix order, and git object store for restriction maps."
component-of: FlatfileAgentialResourceSystem
params:
  git-commit: relational-universe
  file-operations: relational-universe
output: relational-history
ast:
  git-history-correspondence:
    - git-commit:
        - history-monoid-element
    - file-operations:
        - step-alphabet-element
title: Flatfile Agential Resource System History
---

# Flatfile Agential Resource System History

**Status: conjecture.** This spec is written ahead of its derivation chain (`relational-history.md`, `relational-system-history.md`).
It records what git-as-T probably looks like so the design intent isn't lost while those specs are backfilled.
Each claim here must be verified against the abstract specs once they exist.

## The correspondence

| Math | FARS |
|---|---|
| Step set Σ | Named file operations: create, modify, delete an entity file |
| Commutation I | Two steps commute iff they affect different files |
| History t ∈ T | A git commit hash |
| Empty history e | The repository's initial commit (or a declared base commit) |
| Monoid operation t ★ u | Sequential git commits: apply u's changes after reaching t |
| Prefix order t ≤ t' | git ancestry: t is a reachable ancestor of t' |
| Foata normal form | A commit's changeset grouped by independent file layers |
| Fiber H_t | All entity file contents at commit t |
| Restriction map ρ: H_{t'} → H_t | `git show <t-hash>:<filepath>` for each entity file |
| Covering family (commutation cover) | The set of files changed in a single commit |
| Sheaf (accord) condition | No merge conflict for independent file changes |
| [RelationalMachineSteppingMap](../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/relational-machine-stepping-map.md): advancing t to s★t | `git commit` — writing a new commit |

## Fibers and restriction maps

The fiber H_t at commit t is the state of the FARS at that commit: every entity file with its content at t.
Any entity's content at any reachable history is accessible via:

```bash
git show <commit-hash>:<relative/path/to/unit.md>
```

The restriction map ρ: H_{t'} → H_t (t an ancestor of t') is: for each entity file, retrieve its content at t.
If the file didn't exist at t, the restriction is the empty section (the entity wasn't yet in R at that history).

## Scripts handling restriction maps

A script that needs to operate across histories receives a commit hash as an additional input parameter alongside the entity path:

```python
def read_unit_at_history(
    unit_path: Annotated[str, Field(description="Path to unit file")],
    history: Annotated[str, Field(description="Git commit hash; defaults to HEAD")],
) -> str:
    result = subprocess.run(
        ["git", "show", f"{history}:{unit_path}"],
        capture_output=True, text=True
    )
    return result.stdout
```

The default history is HEAD — the current commit.
Scripts that only need the current state need not specify a history.
Scripts checking restriction maps or sheaf conditions must accept and pass explicit history parameters.

## Sheaf condition in the FARS

A covering family at history t is the set of files changed in a single commit to produce t.
The accord condition — compatible sections assemble uniquely — corresponds to: two branches that independently modified different files merge without conflict.
Git enforces this structurally: independent file changes always merge cleanly.

A conflict (two branches modifying the same file) means the covering family is not a commutation cover — the steps are not independent.
Resolving a merge conflict is manually satisfying the sheaf condition.

## Open questions and risks

- **Git DAG vs. T**: T is a partial order (thin category).
  Git's DAG is also a partial order under ancestry, so merge commits don't violate the structure — they create joins.
  Whether git merges correspond to colimits in T or to something else needs verification against `relational-system-history.md`.
- **Commit granularity**: Is one git commit one step (one element of Σ) or a product of concurrent steps (one element of M(Σ, I))?
  The latter is more likely — a commit touching N independent files is N concurrent steps, which is why the Foata normal form groups them into layers.
- **Base commit**: The empty history e needs a concrete assignment.
  Candidates: the initial `git init` commit, or a declared sentinel commit in the repo.
- **History parameters in runbooks**: The runbook YAML interface for scripts that handle restriction maps needs a `history` input field typed as a git commit hash.
  This is not yet in the runbook schema.
