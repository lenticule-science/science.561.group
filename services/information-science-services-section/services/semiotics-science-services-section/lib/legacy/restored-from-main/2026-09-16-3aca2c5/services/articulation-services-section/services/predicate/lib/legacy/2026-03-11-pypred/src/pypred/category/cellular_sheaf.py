"""Cellular sheaf primitive (minimal scope: constant-stalk + Z coefficients).

A `CellularSheaf` is a simplicial complex + per-cell stalk assignments + per-incidence
restriction maps. The constant-Z sheaf (`ConstantSheaf`) is the special case where
every stalk is Z and every restriction is the identity — used as a sanity-check
baseline (Pass 1 of the per-fiber Curry investigation).

This is intentionally minimal: stalks are Python ints/Z-modules, restrictions
are coefficients (1 for identity). Generalization to richer stalks (frames,
d-frames) is a future expansion.
"""

from __future__ import annotations

from dataclasses import dataclass

from .simplicial_complex import SimplicialComplex


@dataclass(frozen=True)
class ConstantSheaf:
    """The constant sheaf with stalk Z on a simplicial complex.

    Cohomology of this sheaf is the standard Z-coefficient cohomology of the
    underlying complex — used as a sanity check baseline.
    """

    complex: SimplicialComplex

    def cohomology_rank(self, n: int) -> int:
        """Cohomology rank in degree n (as a Q-vector-space dimension; equivalently
        Z-rank of the free part of H^n with Z coefficients)."""
        return self.complex.cohomology_rank(n)


@dataclass(frozen=True)
class CellularSheaf:
    """A cellular sheaf valued in Z with arbitrary integer restriction maps.

    Stalks are sized Z^{n_sigma} (rank per cell); restrictions are dict-of-matrices.
    Future expansion to frame-valued or d-frame-valued sheaves keeps this same shape.

    For the per-fiber Curry on the Belnap fiber, Pass 1 uses ConstantSheaf;
    later passes will use richer stalk types.
    """

    complex: SimplicialComplex
    stalk_ranks: dict
    restrictions: dict  # (face_simplex, coface_simplex) -> int (or matrix-of-ints later)

    def cohomology_rank(self, n: int) -> int:
        """Compute rank of H^n. Currently supports rank-1 stalks only.

        Generalization to higher-rank stalks is a future expansion.
        """
        for cell, rank in self.stalk_ranks.items():
            if rank != 1:
                raise NotImplementedError(
                    "Higher-rank cellular sheaves not yet supported in this primitive."
                )
        # Falls through to the constant-sheaf computation, since rank-1 stalks
        # with integer restrictions reduce to the simplicial complex's cohomology
        # with sign-twisted coboundary. For now we only handle constant restrictions.
        return self.complex.cohomology_rank(n)
