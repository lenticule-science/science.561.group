"""pypredcomp substrate kernel package (v0.2).

This is the kernel layer of pypredcomp — the predicated-computing OS
distributed as the ``pypredcomp`` package on PyPI. The package's
import name is kept as ``substrate`` because that is the kernel's role
inside the OS; the ``pypredcomp`` distribution also installs the
``storage``, ``network``, ``drivers``, ``shell``, ``init_boot``, and
``process`` packages alongside it.

v0.2 adds the OS layer on top of the v0.1 kernel: users, sessions,
runlevels, an HTTP shell, and a parser/dispatcher REPL.
"""

__version__ = "0.2.0"
