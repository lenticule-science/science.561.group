"""Top-level structural validator entry point.

Delegates to `relational_infinity_topoi.validate` for note-shape and
link-target checks, and to `dependency_audit.audit` for dependency-graph
resolution.

Usage (from this `tools/` directory):

    python validate.py

Exits with non-zero status if any check fails.
"""

from __future__ import annotations

import sys

from relational_infinity_topoi import validate as note_validator
from dependency_audit import audit as dep_audit


def main() -> int:
    rc = 0
    rc |= note_validator.main()
    rc |= dep_audit.main()
    return rc


if __name__ == "__main__":
    sys.exit(main())
