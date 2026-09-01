"""On-disk layout under ``$SUBSTRATE_ROOT``.

Per ``specs/filesystem/storage-layout.md``::

    $ROOT/events.jsonl
    $ROOT/cells/<pp>/<id>.json
    $ROOT/rules/<pp>/<id>.json
    $ROOT/fibers/<entity-slug>/fiber.json
    $ROOT/aliases/<name>
    $ROOT/evidence/<exec-id>.json
    $ROOT/signatures/<id>.json
    $ROOT/config.json

``<pp>`` is the first two hex chars of the content-id (sharding).

The materialized record file is canonical-bytes of the record (with ``id``
populated). The filename stem MUST equal the SHA-256 of the canonical
bytes of the record WITHOUT ``id``.
"""

from __future__ import annotations

import json
import os
from pathlib import Path
from typing import Any

from substrate.canonicalization import canonical, cid
from substrate.error_codes import PCS_RECORD_CORRUPT, PCS_RECORD_NOT_FOUND, SubstrateError

CONFIG_FILENAME = "config.json"


class StorageLayout:
    """Disk root manager — knows nothing about the kernel, only paths."""

    def __init__(self, root: str | Path):
        self.root = Path(root)

    # --- bootstrap --------------------------------------------------------

    def ensure_dirs(self) -> None:
        self.root.mkdir(parents=True, exist_ok=True)
        for sub in ("cells", "rules", "fibers", "aliases", "evidence", "signatures"):
            (self.root / sub).mkdir(parents=True, exist_ok=True)

    def write_config(self, config: dict[str, Any]) -> None:
        self.root.mkdir(parents=True, exist_ok=True)
        path = self.root / CONFIG_FILENAME
        path.write_bytes(canonical(config))

    def read_config(self) -> dict[str, Any] | None:
        path = self.root / CONFIG_FILENAME
        if not path.exists():
            return None
        return json.loads(path.read_text("utf-8"))

    # --- shard paths ------------------------------------------------------

    def _shard(self, kind: str, content_id: str) -> Path:
        return self.root / kind / content_id[:2] / f"{content_id}.json"

    def cell_path(self, cell_id: str) -> Path:
        return self._shard("cells", cell_id)

    def rule_path(self, rule_id: str) -> Path:
        return self._shard("rules", rule_id)

    def fiber_path(self, entity_slug: str) -> Path:
        return self.root / "fibers" / entity_slug / "fiber.json"

    def by_stratum_path(self, entity_slug: str, stratum: str) -> Path:
        """Materialised by-stratum projection file path.

        Per ``specs/filesystem/presheaf-storage.md`` §4.2: each by-stratum
        projection file is the disk form of one presheaf projection at the
        entity's current event-ordinal cursor. Three projections are always
        materialised (``asserted.json``, ``saturated.json``, ``settled.json``)
        for any entity touched by the σ/Δ engine in a respond invocation.
        """
        return self.root / "fibers" / entity_slug / "by-stratum" / f"{stratum}.json"

    def alias_path(self, name: str) -> Path:
        return self.root / "aliases" / name

    def evidence_path(self, exec_id: str) -> Path:
        return self.root / "evidence" / f"{exec_id}.json"

    # --- v0.2 theorem-grounded substrate-content paths --------------------
    #
    # Per library/.../predicated-computing/theorems/ . These paths are
    # the on-disk locations of the four newly-shipped theorem-grounded
    # substrate-aggregate kinds: regime records (PC #21), inconsistency-
    # sheaf witnesses, accessibility cells, and cost-ledger cells (#22).
    # Each follows the same shard-by-content-id convention as cells/
    # and rules/ .

    def regime_record_path(self, regime_id: str) -> Path:
        """``$ROOT/regime/<pp>/<id>.json`` — substrate's regime record(s)
        per ``regime-record.md``."""
        return self._shard("regime", regime_id)

    def inconsistency_dir(self, entity_slug: str) -> Path:
        """``$ROOT/inconsistency/<entity-slug>/`` — directory of
        $\\top$-cell witness records for an entity per
        ``inconsistency-sheaf-record.md``."""
        return self.root / "inconsistency" / entity_slug

    def inconsistency_witness_path(self, entity_slug: str, witness_id: str) -> Path:
        return self.inconsistency_dir(entity_slug) / f"{witness_id}.json"

    def accessibility_dir(self) -> Path:
        """``$ROOT/accessibility/`` — root of the substrate's single
        accessibility relation $R$ per
        ``substrate-accessibility-relation`` /
        ``modal-restriction-as-substrate-authorization-primitive``."""
        return self.root / "accessibility"

    def accessibility_path(self, cell_id: str) -> Path:
        return self._shard("accessibility", cell_id)

    def cost_dir(self, entity_slug: str) -> Path:
        """``$ROOT/cost/<entity-slug>/`` — per-entity cost-ledger
        directory per ``cost-composition-via-lawvere-quantale``."""
        return self.root / "cost" / entity_slug

    def cost_cell_path(self, entity_slug: str, cell_id: str) -> Path:
        return self.cost_dir(entity_slug) / f"{cell_id}.json"

    # --- atomic put -------------------------------------------------------

    @staticmethod
    def _atomic_write(path: Path, data: bytes) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        tmp = path.with_name(path.name + ".tmp")
        with tmp.open("wb") as fh:
            fh.write(data)
            fh.flush()
            os.fsync(fh.fileno())
        os.replace(tmp, path)

    def put_record(self, kind: str, body_without_id: dict[str, Any]) -> tuple[str, Path]:
        """Hash-and-write a record. Returns ``(content_id, path)``.

        ``body_without_id`` must NOT include an ``id`` field; we compute it.
        Idempotent: re-putting an identical body is a no-op.
        """
        content_id = cid(body_without_id)
        full = {"id": content_id, **body_without_id}
        path = self._shard(kind, content_id)
        if path.exists():
            existing = path.read_bytes()
            if existing != canonical(full):
                raise SubstrateError(
                    PCS_RECORD_CORRUPT,
                    f"existing {kind} record bytes differ from canonical",
                    id=content_id,
                )
            return content_id, path
        self._atomic_write(path, canonical(full))
        return content_id, path

    def put_fiber(self, entity_slug: str, body: dict[str, Any]) -> Path:
        """Fibers are not content-addressed; they are mutable per-entity caches."""
        path = self.fiber_path(entity_slug)
        self._atomic_write(path, canonical(body))
        return path

    def get_record_bytes(self, kind: str, content_id: str) -> bytes:
        path = self._shard(kind, content_id)
        if not path.exists():
            raise SubstrateError(PCS_RECORD_NOT_FOUND, f"{kind}/{content_id} missing")
        return path.read_bytes()

    def get_record(self, kind: str, content_id: str) -> dict[str, Any]:
        return json.loads(self.get_record_bytes(kind, content_id).decode("utf-8"))

    def has_record(self, kind: str, content_id: str) -> bool:
        return self._shard(kind, content_id).exists()

    def get_fiber(self, entity_slug: str) -> dict[str, Any] | None:
        path = self.fiber_path(entity_slug)
        if not path.exists():
            return None
        return json.loads(path.read_bytes().decode("utf-8"))

    # --- by-stratum presheaf projections ---------------------------------
    #
    # Per ``specs/filesystem/presheaf-storage.md`` §4.2 + §10: the σ/Δ
    # engine materialises three by-stratum projections per touched entity
    # after every respond. The files are content-addressed FiberSnapshot
    # records (carrying ``id``); two byte-identical projections produce the
    # same on-disk bytes and the same ``id``.

    def put_fiber_projection(
        self,
        entity_slug: str,
        stratum: str,
        body: dict[str, Any],
    ) -> Path:
        """Atomically write a by-stratum projection file."""
        path = self.by_stratum_path(entity_slug, stratum)
        self._atomic_write(path, canonical(body))
        return path

    def get_fiber_projection(
        self,
        entity_slug: str,
        stratum: str,
    ) -> dict[str, Any] | None:
        """Read a materialised by-stratum projection file. ``None`` if absent."""
        path = self.by_stratum_path(entity_slug, stratum)
        if not path.exists():
            return None
        return json.loads(path.read_bytes().decode("utf-8"))

    def get_fiber_projection_bytes(
        self,
        entity_slug: str,
        stratum: str,
    ) -> bytes | None:
        """Raw on-disk bytes of a by-stratum projection (for byte-identity checks)."""
        path = self.by_stratum_path(entity_slug, stratum)
        if not path.exists():
            return None
        return path.read_bytes()

    def discard_fiber_projections(self, entity_slug: str) -> int:
        """Remove all by-stratum projection files for an entity.

        Per ``specs/filesystem/presheaf-storage.md`` §10 gate 4: projection
        files are discardable; rebuild from the event log + fiber history
        reproduces byte-identical bytes. Returns the count removed.
        """
        d = self.root / "fibers" / entity_slug / "by-stratum"
        if not d.exists():
            return 0
        count = 0
        for p in d.iterdir():
            if p.is_file():
                p.unlink()
                count += 1
        return count

    # --- recovery ---------------------------------------------------------

    def cleanup_tmp(self) -> int:
        """Remove orphaned ``*.tmp`` files. Returns count removed."""
        count = 0
        for tmp in self.root.rglob("*.tmp"):
            tmp.unlink()
            count += 1
        return count
