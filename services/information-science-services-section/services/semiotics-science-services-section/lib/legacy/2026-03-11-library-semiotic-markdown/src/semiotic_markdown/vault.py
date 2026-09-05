from __future__ import annotations

from pathlib import Path

from .errors import DuplicateDocIdError, InvalidEncodingError
from .model import DocumentRecord
from .parse import parse_document


def index_vault(vault_root: Path) -> list[DocumentRecord]:
    vault_root = vault_root.expanduser().resolve()
    records: list[DocumentRecord] = []
    by_doc_id: dict[str, str] = {}

    for path in sorted(vault_root.rglob("*.md")):
        if not path.is_file():
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError as exc:
            raise InvalidEncodingError(str(path)) from exc

        source_path = path.relative_to(vault_root).as_posix()
        record = parse_document(text=text, source_path=source_path)

        existing = by_doc_id.get(record.doc_id)
        if existing is not None and existing != record.source_path:
            raise DuplicateDocIdError(
                f"doc_id '{record.doc_id}' from '{record.source_path}' duplicates '{existing}'"
            )

        by_doc_id[record.doc_id] = record.source_path
        records.append(record)

    return records
