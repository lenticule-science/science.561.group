"""Finite simplicial complex with Z-coefficient cellular cohomology.

A `SimplicialComplex` is a collection of `Simplex` objects, each carrying
its dimension and explicit face structure. Cohomology is computed via the
standard signed-incidence boundary maps.

Used downstream by `CellularSheaf` (which generalizes constant Z-coefficients
to sheaf-valued coefficients).
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Hashable

from sympy import Matrix, Rational, ZZ
from sympy.matrices.normalforms import smith_normal_form


@dataclass(frozen=True)
class Simplex:
    """A simplex in a simplicial complex: a tuple of vertices + dimension.

    Vertices are Hashable. The simplex is identified by its vertex tuple
    (so two simplices with the same vertex tuple compare equal).
    """

    vertices: tuple[Hashable, ...]

    @property
    def dim(self) -> int:
        return len(self.vertices) - 1

    def faces(self) -> list[Simplex]:
        """Return the codim-1 faces: simplices obtained by omitting one vertex."""
        if self.dim < 1:
            return []
        return [
            Simplex(tuple(self.vertices[:i] + self.vertices[i + 1:]))
            for i in range(len(self.vertices))
        ]

    def __repr__(self) -> str:
        return f"Simplex({self.vertices})"


@dataclass(frozen=True)
class SimplicialComplex:
    """A finite simplicial complex: a set of Simplex objects, closed under faces.

    Construction validates closure under faces.
    """

    simplices: frozenset[Simplex]

    def __post_init__(self) -> None:
        for s in self.simplices:
            for face in s.faces():
                if face not in self.simplices:
                    raise ValueError(f"complex not closed under faces: {s} has face {face} missing")

    def cells(self, dim: int) -> list[Simplex]:
        """Return all dim-dimensional cells, in a deterministic order."""
        return sorted([s for s in self.simplices if s.dim == dim], key=lambda s: s.vertices)

    def dimension(self) -> int:
        """Return the maximum dimension of any simplex."""
        return max((s.dim for s in self.simplices), default=-1)

    def coboundary_matrix(self, n: int) -> Matrix | None:
        """Return the n-th coboundary δ^n : C^n → C^(n+1) as a sympy Matrix
        with rows indexed by (n+1)-cells, columns indexed by n-cells.

        Returns None if n < 0 or there are no (n+1)-cells.
        """
        if n < 0:
            return None
        n_cells = self.cells(n)
        n1_cells = self.cells(n + 1)
        if not n1_cells:
            return None
        n_index = {c: i for i, c in enumerate(n_cells)}
        rows = []
        for tau in n1_cells:
            row = [0] * len(n_cells)
            for i, sigma in enumerate(tau.faces()):
                if sigma in n_index:
                    row[n_index[sigma]] += (-1) ** i
            rows.append(row)
        return Matrix(rows)

    def cohomology_rank(self, n: int) -> int:
        """Return rank of H^n with Q coefficients (i.e., free part of H^n with Z).

        H^n = ker(δ^n) / image(δ^{n-1}).
        rank H^n = dim ker(δ^n) - rank image(δ^{n-1}).
        """
        n_cells_count = len(self.cells(n))
        # Rank of image of δ^{n-1}
        prev = self.coboundary_matrix(n - 1) if n > 0 else None
        rank_prev = prev.rank() if prev is not None else 0
        # dim ker(δ^n) = n_cells_count - rank(δ^n)
        curr = self.coboundary_matrix(n)
        rank_curr = curr.rank() if curr is not None else 0
        dim_ker = n_cells_count - rank_curr
        return dim_ker - rank_prev
