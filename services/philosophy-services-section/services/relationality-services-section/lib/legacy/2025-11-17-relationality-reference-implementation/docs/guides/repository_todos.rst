TODOs and phases
================

Repository work is organised around TODO entries recorded in the docs
using the Sphinx ``todo`` extension. The aggregate view lives in
:doc:`todo` and should be treated as the primary backlog.

Each ``.. todo::`` has a single ``:phase:`` value that encodes both
its *priority tier* and its *execution stage*. The phase vocabulary
is:

- ``someday`` – ideas or extensions with no timeline.
- ``later`` – important work that should happen after current
  priorities, but not yet scheduled.
- ``soon`` – work we intend to tackle in the near term.
- ``plan`` – the next concrete feature(s) we are actively specifying
  and implementing.
- ``spec-math`` – specifying the mathematics in the formal notes under
  :mod:`docs.math <math/index>`.
- ``spec-test`` – specifying tests and APIs in the layer/API docs.
- ``code-tests`` – writing and running tests.
- ``code-module`` – implementing or refining the corresponding code.
- ``doc-module`` – writing or updating module/layer documentation.
- ``cross-doc`` – tightening spec↔code↔test cross-references.
- ``release`` – work for the TODO is complete and ready to be folded
  into the next MINOR release; the TODO is removed once it has been
  integrated in that release.

A TODO moves through the tiers as its priority changes and through the
execution phases as work is carried out. At any point it has exactly
one ``:phase:`` value.

In interactive work (for example, with an automated agent), user
requests should normally be reflected in the TODOs:

- log new requests as new TODOs or by refining existing ones;
- consider the overall backlog when deciding what to do next, and
  defer a new ask when an earlier-phase TODO clearly needs to come
  first; and
- keep ``:phase:`` values up to date as you move between spec, tests,
  code, and docs.

The :doc:`computation` guide’s “TODOs, backlog, and phases” section
gives additional details and examples.


