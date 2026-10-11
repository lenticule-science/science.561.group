"""Cell atom — the spec's normative wire form for a single predication.

Per ``specs/filesystem/cell-record.md`` §1: a cell atom is the tuple
``(s, p, o, v)`` carrying its ``stratum``, ``ord``, and (for stratum >
``"asserted"``) ``derived_from`` / ``derived_via`` witness fields. This
matches the predication-categories ``predication-cell`` exactly: an
ordered triple :math:`\\phi = (s, p, o)` valued in the bilattice.

Cell atoms live inside event bodies (``events.jsonl``) and are also
embedded in :class:`storage.cell_record.FiberSnapshot` records under the
``cells: [...]`` array (one entry per atom emitted in the snapshot's
respond round). They MAY also be materialised as per-cell files at
``$ROOT/cells/<pp>/<id>.json``; that materialisation is optional —
see ``specs/filesystem/cell-record.md`` §7.

Distinction from :class:`storage.cell_record.FiberSnapshot`:

* ``Cell`` is a single predication atom; it carries one ``(s, p, o)`` and
  one bilattice value at one stratum. Per-predication semantics (witness
  chains, federation merge, retraction, σ/Δ pass derivations) operate on
  cell atoms.
* ``FiberSnapshot`` is the materialised projection of the presheaf at one
  ``(entity, stratum, peer, session, ord)`` context point. It bundles
  cell atoms for read-side efficiency. Per-entity-view semantics
  (``get_fiber(entity)`` reads, fiber-cache writes) operate on snapshots.
"""

from __future__ import annotations

import re
from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, Field, model_validator

from substrate.algebra import BilatticeValue
from substrate.canonicalization import canonical, cid
from substrate.error_codes import (
    PCC_HASH_MISMATCH,
    PCC_MISSING_WITNESS,
    PCC_UNKNOWN_STRATUM,
    SubstrateError,
)


# Per ``specs/kernel/stratified-facts.md`` §1: exactly three strings.
# Note: this is a documentation-only alias. The ``stratum`` field on
# :class:`Cell` is typed as ``str`` so the model validator below can
# raise ``PCC_UNKNOWN_STRATUM`` cleanly — using a pydantic ``Literal``
# on the field would short-circuit with a generic ``ValidationError``
# before the spec'd error code could surface.
Stratum = Literal["asserted", "saturated", "settled"]
_VALID_STRATA: frozenset[str] = frozenset({"asserted", "saturated", "settled"})

# Cell-id format: lowercase hex SHA-256, exactly 64 chars. Per
# ``specs/filesystem/cell-record.md`` §1.1 (``derived_from`` entries).
_CELL_ID_RE: re.Pattern[str] = re.compile(r"^[0-9a-f]{64}$")


class Cell(BaseModel):
    """A single predication atom ``(s, p, o, v)`` at one stratum.

    The ``id`` is the SHA-256 of the canonical bytes of the record
    *without* ``id`` (per ``specs/filesystem/cell-record.md`` §2). The
    stratum tag and witness fields are part of the canonical bytes — the
    same ``(s, p, o, v)`` at different strata or with different witness
    chains produces different ids.

    Stratum/witness consistency rules (per spec §1):

    * ``stratum`` MUST be one of ``"asserted"``, ``"saturated"``,
      ``"settled"``; anything else raises ``PCC_UNKNOWN_STRATUM``.
    * For ``stratum == "asserted"``, ``derived_from`` and
      ``derived_via`` MUST be absent (asserted facts are first-class
      claims, not derivations).
    * For ``stratum != "asserted"``, ``derived_from`` MUST be a
      non-empty list of valid cell-id strings (lowercase 64-hex), and
      ``derived_via`` MUST be a non-empty string. Violations raise
      ``PCC_MISSING_WITNESS``.
    """

    model_config = ConfigDict(extra="forbid", frozen=False)

    # Discriminator — every wire-form cell atom carries ``kind: "cell"``.
    # See specs/filesystem/cell-record.md §6 wire example.
    kind: Literal["cell"] = "cell"

    id: str | None = Field(default=None, description="SHA-256 of canonical(record without id).")

    # The (s, p, o, v) tuple — the predication.
    s: str = Field(description="Subject — entity slug.")
    p: str = Field(description="Predicate — predicate slug.")
    o: str = Field(description="Object — entity slug.")
    v: BilatticeValue = Field(description="Bilattice value (None|True|False|Both).")

    # Event-ordinal at which this cell was emitted.
    ord: int = Field(description="Event-ordinal cursor at emission.")

    # Stratum and witness — see specs/kernel/stratified-facts.md.
    # Typed ``str`` so the model validator can raise PCC_UNKNOWN_STRATUM
    # for unknown values; see Stratum alias above.
    stratum: str = "asserted"
    derived_from: list[str] | None = None
    derived_via: str | None = None

    # Optional metadata.
    sender: str | None = None
    provenance: str | None = None
    wall_clock_at: str | None = None

    @model_validator(mode="after")
    def _check_stratum_and_witness(self) -> "Cell":
        if self.stratum not in _VALID_STRATA:
            raise SubstrateError(
                PCC_UNKNOWN_STRATUM,
                f"unknown stratum {self.stratum!r} "
                f"(must be one of asserted/saturated/settled)",
                stratum=self.stratum,
            )
        if self.stratum == "asserted":
            # Asserted facts are first-class claims; witness fields MUST
            # be absent. (See spec §1: derived_from/derived_via are
            # conditional on stratum > 0.)
            if self.derived_from is not None:
                raise SubstrateError(
                    PCC_MISSING_WITNESS,
                    "asserted stratum MUST omit derived_from "
                    "(witness fields are reserved for derivations)",
                    stratum=self.stratum,
                )
            if self.derived_via is not None:
                raise SubstrateError(
                    PCC_MISSING_WITNESS,
                    "asserted stratum MUST omit derived_via "
                    "(witness fields are reserved for derivations)",
                    stratum=self.stratum,
                )
        else:
            if not self.derived_from:
                raise SubstrateError(
                    PCC_MISSING_WITNESS,
                    f"stratum {self.stratum!r} requires non-empty derived_from",
                    stratum=self.stratum,
                )
            if not self.derived_via:
                raise SubstrateError(
                    PCC_MISSING_WITNESS,
                    f"stratum {self.stratum!r} requires derived_via",
                    stratum=self.stratum,
                )
            # Validate cell-id format on each derived_from entry.
            for entry in self.derived_from:
                if not isinstance(entry, str) or not _CELL_ID_RE.fullmatch(entry):
                    raise SubstrateError(
                        PCC_HASH_MISMATCH,
                        f"derived_from entry {entry!r} is not a valid cell-id "
                        f"(must be lowercase 64-hex SHA-256)",
                        stratum=self.stratum,
                    )
        return self

    def canonical_body(self) -> dict[str, Any]:
        """Dict form of the cell *without* ``id``, dropping unset optionals.

        Per ``specs/filesystem/cell-record.md`` §2: id is computed from
        ``canonical(record_without_id)``. Unset optionals (``None``) are
        dropped so they don't pollute the canonical bytes.
        """
        body = self.model_dump(mode="json")
        body.pop("id", None)
        # ``v`` is the BilatticeValue enum string; dump emits the right form.
        return {k: val for k, val in body.items() if val is not None}

    def compute_id(self) -> str:
        return cid(self.canonical_body())

    def with_id(self) -> "Cell":
        body = self.canonical_body()
        return Cell(id=cid(body), **body)

    def canonical(self) -> bytes:
        """Canonical bytes of the FULL record including ``id``."""
        body = self.canonical_body()
        body_id = self.id or cid(body)
        return canonical({"id": body_id, **body})

    def verify_id(self) -> None:
        if self.id is None:
            return
        expected = self.compute_id()
        if expected != self.id:
            raise SubstrateError(
                PCC_HASH_MISMATCH,
                "cell id does not match canonical hash",
                expected=expected,
                actual=self.id,
            )
