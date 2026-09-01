Repository Guide
================

This guide is the shared entrypoint for working *in* the repository.
Both mathematicians and programmers should read it once and then use
their role-specific guides (:doc:`mathematics` and
:doc:`computation`) for day-to-day work.

It is split into small, focused pieces:

- :doc:`repository_instructions` – instruction hierarchy and how to
  resolve conflicts.
- :doc:`repository_todos` – TODOs, phases, and how work is tracked.
- :doc:`repository_history` – branches, commits, versioning, and
  releases.
- :doc:`repository_environment` – environment, tooling, and hooks.

The last section summarises how these pieces relate to the role‑focused
guides.

.. toctree::
   :maxdepth: 1

   repository_instructions
   repository_todos
   repository_history
   repository_environment


Role-focused guides
-------------------

The role-specific guides explain how to use the method in their domain:

- :doc:`mathematics` – how to work on the Relational Mathematics
  specification, keep spec atoms small and well-linked, and use TODOs
  and phases when defining new concepts.
- :doc:`computation` – how to extend the implementation and tests,
  keep code/layout aligned with the maths, and wire spec↔code↔tests.

When updating the method or process, prefer changing these guides and
the atomic repository pages listed above rather than older documents
such as ``docs/method.rst`` or ``docs/system.rst`` (which are now kept
only as compatibility shims).


