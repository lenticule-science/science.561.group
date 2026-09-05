Branches, commits, and releases
===============================

Branching and history are coupled to TODOs and phases:

- Treat ``main`` as the always-green trunk. All version bumps and
  release tags (``vX.Y.Z``) are created from ``main``.
- Use short-lived *work branches* for a coherent cluster of TODOs
  (for example, a small group of related theorems or helpers).
- Within a work branch, use *task branches* for individual TODO
  chains.
- Prefer additive history (normal merges) over rewriting published
  history.

The :file:`Makefile` provides helpers:

- ``make branch-work name=<branch>`` – from ``main``, run tests and
  docs, then create and check out a short-lived work branch
  ``<branch>``.
- ``make branch-task task=<name>`` – from a work branch, create and
  check out a task branch named after the current branch plus
  ``-<name>``, intended for a single TODO chain.
- ``make branch-merge-main`` – from a work branch, run tests and docs,
  then merge that work branch back into ``main`` with a
  non–fast-forward merge.

Commit messages follow a small Conventional Commits–style convention:

- ``type(scope): summary``, where ``type`` is one of
  ``feat``, ``fix``, ``docs``, ``style``, ``refactor``, ``test``,
  ``chore``, ``build``, or ``ci``;
- the ``scope`` typically names a layer (``structure``, ``language``,
  ``geometry``, ``physics``, ``library``) or a more specific module.

Versioning follows a SemVer-like policy tied to TODO phases:

- PATCH bumps (``make version-bump-patch``) correspond to *phase
  transitions* for in-flight TODOs at or after ``phase: spec-test``,
  plus associated bugfixes and doc/test updates, and must not change
  released public APIs.
- MINOR bumps (``make version-bump-minor``) are required when both:

  - at least one TODO has reached ``phase: release`` since the last
    MINOR bump; and
  - public API has changed (new or extended helpers/builders).

- MAJOR bumps are reserved for intentional breaking changes and should
  be explicit human decisions.

The details of versioning, release workflow, and changelog generation
are in :doc:`guides/computation`.


