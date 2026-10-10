from __future__ import annotations

from relationing.language import Type
from relationing.structure import (
    FiniteHeytingAlgebra,
    PowersetHeytingElement,
    build_powerset_heyting_algebra,
)
from relationing.structure import Relationlessness
from relationing.structures.semantics import is_sequent_valid


def main() -> None:
    void = Relationlessness()
    algebra: FiniteHeytingAlgebra[PowersetHeytingElement] = build_powerset_heyting_algebra(void, ["p"])
    carrier = algebra.as_list()
    p = Type.atom("p")
    formula = Type.imp(p, p)
    valid = is_sequent_valid([], formula, carrier, ["p"])
    print(f"p ⇒ p valid in 1-atom powerset model: {valid}")


if __name__ == "__main__":
    main()
