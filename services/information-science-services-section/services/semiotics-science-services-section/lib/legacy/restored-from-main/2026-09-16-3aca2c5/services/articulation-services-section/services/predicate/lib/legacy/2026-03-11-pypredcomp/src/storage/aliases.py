"""Alias mapping — human-readable names → cell-ids.

Per ``specs/filesystem/alias-mapping.md``: an alias is a tiny file at
``$ROOT/aliases/<name>`` containing the canonical JSON ``{"target":
"<cell-or-entity-id>"}``. Names are lower-kebab-case, ASCII letters,
digits, and ``-/:`` allowed.
"""

from __future__ import annotations

import re
from pathlib import Path

from substrate.canonicalization import canonical
from substrate.error_codes import PCS_RECORD_NOT_FOUND, SubstrateError

ALIAS_NAME_RE = re.compile(r"^[a-z0-9][a-z0-9\-:/]*[a-z0-9]$|^[a-z0-9]$")


def validate_alias_name(name: str) -> None:
    if not ALIAS_NAME_RE.match(name):
        raise SubstrateError(
            "PCS_ALIAS_INVALID",
            f"alias name {name!r} fails lower-kebab pattern",
        )


class AliasStore:
    def __init__(self, root: Path):
        self.dir = root / "aliases"

    def set(self, name: str, target: str) -> Path:
        validate_alias_name(name)
        self.dir.mkdir(parents=True, exist_ok=True)
        path = self.dir / name
        # Alias names may contain ``/`` per ``alias-mapping.md`` §2;
        # ensure intermediate directories exist so nested names like
        # ``scope:engineering/tasks`` write cleanly.
        path.parent.mkdir(parents=True, exist_ok=True)
        # Per the filesystem spec, the alias file body is canonical
        # ``{"target": "<id>"}`` only — the alias name lives in the
        # filename, not the body.
        path.write_bytes(canonical({"target": target}))
        return path

    def get(self, name: str) -> str:
        validate_alias_name(name)
        path = self.dir / name
        if not path.exists():
            raise SubstrateError(PCS_RECORD_NOT_FOUND, f"alias {name} not found")
        import json

        body = json.loads(path.read_bytes().decode("utf-8"))
        return body["target"]

    def remove(self, name: str) -> None:
        validate_alias_name(name)
        path = self.dir / name
        if path.exists():
            path.unlink()

    def list_all(self) -> dict[str, str]:
        if not self.dir.exists():
            return {}
        import json

        out: dict[str, str] = {}
        # Alias names may contain ``/`` per ``alias-mapping.md`` §2,
        # so files live at arbitrary depths under ``self.dir``. Walk
        # recursively and reconstruct the alias name as the path
        # relative to ``self.dir`` using ``/`` separators.
        for path in sorted(self.dir.rglob("*")):
            if path.is_file():
                body = json.loads(path.read_bytes().decode("utf-8"))
                name = path.relative_to(self.dir).as_posix()
                out[name] = body["target"]
        return out
