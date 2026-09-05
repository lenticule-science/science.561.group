Instruction hierarchy
=====================

When instructions conflict, follow this order:

1. External/system policies for your environment (for example, any
   organisation-wide security or compliance rules, or the execution
   sandbox you are using).
2. The top-level :file:`AGENTS.md` and the Repository Guide.
3. In-tree specifications and docs:

   - mathematical spec under :mod:`docs.math <math/index>`;
   - repository methods and workflow in the Repository Guide plus the
     role-focused guides (:doc:`mathematics`, :doc:`computation`);
   - layer/API docs: :doc:`structure`, :doc:`language`,
     :doc:`geometry`, :doc:`physics`, :doc:`unary`;
   - code docstrings and comments.

4. The concrete code in :mod:`relationing` and the tests under
   :mod:`tests`.
5. Explicit instructions in a task/issue/PR or interactive session.

Prefer the more specific and more recent document when in doubt.


