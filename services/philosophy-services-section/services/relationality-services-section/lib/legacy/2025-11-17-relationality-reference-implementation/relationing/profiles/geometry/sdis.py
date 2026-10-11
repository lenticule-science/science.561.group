"""
Stratified directed site profiles over finite Heyting carriers.

This module provides a small value-level representation of profiles
over a finite Heyting algebra together with a designated family of
covers. It is intended as a concrete playground for the
stratified‑directed‑∞‑sites discussion: a profile assigns a
recognition to each region in a finite carrier, is monotone with
respect to the Heyting order, and satisfies a simple gluing condition
along the chosen covers.

The underlying carrier is always a :class:`FiniteHeytingAlgebra`
instance; individual recognitions are elements of that carrier.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Callable, Generic, Mapping, Sequence, TypeVar

from relationing.structure.finite_heyting import FiniteHeytingAlgebra
from relationing.structure.heyting_algebra import HeytingAlgebra


A = TypeVar("A", bound=HeytingAlgebra)


@dataclass(frozen=True)
class StratifiedDirectedCover(Generic[A]):
    """Finite cover in a stratified directed site.

    A cover is recorded extensionally as a finite family of "source"
    regions and a single "target" region. In the intended reading the
    sources jointly cover the target; in particular, in a finite
    powerset model the join of the sources is at least as recognising
    as the target.
    """

    sources: tuple[A, ...]
    target: A


@dataclass(frozen=True)
class SDISProfile(Generic[A]):
    """Profile over a finite Heyting carrier with designated covers.

    The carrier records the finite Heyting algebra of regions in the
    site. The assignment maps each region to a recognition living in
    the same Heyting algebra. The profile is intended to satisfy:

    - totality: every carrier element has an assigned recognition;
    - monotonicity: x ≤ y ⇒ P(x) ≤ P(y); and
    - cover gluing: for each cover (U_i → U) the value on U is
      determined by the glued values on the sources via a chosen
      gluing operation.
    """

    carrier: FiniteHeytingAlgebra[A]
    assignment: Mapping[A, A]
    covers: Sequence[StratifiedDirectedCover[A]]

    def is_total(self) -> bool:
        """Return True when all carrier elements are assigned."""

        elems = set(self.carrier.elements)
        keys = set(self.assignment.keys())
        return elems == keys

    def is_monotone(self) -> bool:
        """Check x ≤ y ⇒ P(x) ≤ P(y) over the carrier."""

        elems = self.carrier.elements
        for x in elems:
            px = self.assignment.get(x)
            if px is None:
                return False
            for y in elems:
                if not x.leq(y):  # type: ignore[arg-type]
                    continue
                py = self.assignment.get(y)
                if py is None or not px.leq(py):  # type: ignore[arg-type]
                    return False
        return True

    def satisfies_covers(self, glue: Callable[[Sequence[A]], A]) -> bool:
        """Check that the profile satisfies all covers via ``glue``.

        The gluing operation receives the sequence of recognitions on
        the cover sources and is expected to return the recognition on
        the target. For example, in a powerset-style Heyting algebra a
        natural choice is to glue by finite join.
        """

        if not self.is_total():
            return False
        for cover in self.covers:
            if not cover.sources:
                # Degenerate covers are not meaningful here.
                return False
            local_values = [self.assignment[s] for s in cover.sources]
            glued = glue(local_values)
            target_value = self.assignment[cover.target]
            if glued != target_value:
                return False
        return True

    def satisfies_covers_by_join(self) -> bool:
        """Specialisation of :meth:`satisfies_covers` using joins.

        This reads the profile covariantly: the recognition assigned to
        a covered region is the Heyting join of the recognitions on its
        covering family.
        """

        def glue(values: Sequence[A]) -> A:
            if not values:
                raise ValueError("cannot glue an empty family by join")
            acc = values[0]
            for v in values[1:]:
                acc = acc.join(v)  # type: ignore[assignment]
            return acc

        return self.satisfies_covers(glue)


__all__ = ["StratifiedDirectedCover", "SDISProfile"]

