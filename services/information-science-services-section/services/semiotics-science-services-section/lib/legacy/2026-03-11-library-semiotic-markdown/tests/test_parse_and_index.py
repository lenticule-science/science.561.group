from __future__ import annotations

from pathlib import Path

import pytest

from semiotic_markdown.errors import DuplicateDocIdError
from semiotic_markdown.parse import parse_document
from semiotic_markdown.vault import index_vault


def test_parse_document_doc_id_and_title_from_frontmatter() -> None:
    text = "---\nid: My ID\ntitle: My Title\n---\nBody\n"
    record = parse_document(text=text, source_path="notes/anything.md")
    assert record.doc_id == "my-id"
    assert record.title == "My Title"
    assert record.folders == ["notes"]


def test_index_vault_detects_duplicate_doc_ids(tmp_path: Path) -> None:
    (tmp_path / "a.md").write_text("---\nid: Same\n---\n# A\n", encoding="utf-8")
    (tmp_path / "b.md").write_text("---\nid: Same\n---\n# B\n", encoding="utf-8")
    with pytest.raises(DuplicateDocIdError):
        index_vault(tmp_path)


def test_index_vault_matches_golden() -> None:
    vault = Path(__file__).parent / "fixtures" / "vault"
    records = index_vault(vault)
    payload = [record.to_dict(include_body=False) for record in records]
    golden_path = Path(__file__).parent / "golden" / "vault_index.json"
    expected = golden_path.read_text(encoding="utf-8")
    assert payload == __import__("json").loads(expected)
