Environment, tooling, and hooks
===============================

The repository assumes a local development environment with:

- Python 3.10+;
- dependencies installed via ``make install`` into ``.venv``; and
- Git hooks enabled via ``git config core.hooksPath .githooks``.

Key commands (see :doc:`guides/computation` for details):

- ``make install`` – create the virtualenv and install the project in
  editable mode with developer/docs/lint extras.
- ``make test`` – run the test suite.
- ``make docs-html`` / ``make docs-pdf`` – build HTML and PDF docs.
- ``make lint`` / ``make format`` / ``make typecheck`` – run ``ruff``,
  ``black``, and ``mypy``.

Git hooks under ``.githooks/`` integrate these into the workflow:

- ``pre-commit`` compiles the code, runs lint/format checks, runs the
  tests, enforces version bumps for public API changes, and rebuilds
  docs when needed.
- ``commit-msg`` enforces Conventional Commits–style headers and
  checks version/changelog consistency for release commits.
- ``pre-push`` runs tests, ``mypy``, and a Sphinx HTML docs build.

The expectation is to fix underlying issues rather than bypassing the
hooks.

