from __future__ import annotations

from pathlib import PurePosixPath
from typing import Any

import yaml

from .errors import FrontmatterParseError, FrontmatterTypeError
from .extract import extract_features
from .model import DocumentRecord
from .slug import slugify


def _split_frontmatter(text: str) -> tuple[str | None, str]:
    stripped = text.lstrip("\ufeff")
    if not stripped.startswith("---\n") and stripped != "---":
        return None, text

    lines = stripped.splitlines(keepends=True)
    if not lines or lines[0].strip("\r\n") != "---":
        return None, text

    fm_lines: list[str] = []
    for i in range(1, len(lines)):
        if lines[i].strip("\r\n") == "---":
            frontmatter_raw = "".join(fm_lines)
            body = "".join(lines[i + 1 :])
            return frontmatter_raw, body
        fm_lines.append(lines[i])

    return None, text


def parse_document(*, text: str, source_path: str) -> DocumentRecord:
    frontmatter_raw, body = _split_frontmatter(text)

    frontmatter_norm: dict[str, Any] | None = None
    if frontmatter_raw is not None:
        try:
            loaded = yaml.safe_load(frontmatter_raw) or {}
        except Exception as exc:  # noqa: BLE001
            raise FrontmatterParseError(str(exc)) from exc
        if not isinstance(loaded, dict):
            raise FrontmatterTypeError("frontmatter must be a mapping")
        frontmatter_norm = dict(loaded)

    doc_id = _derive_doc_id(source_path=source_path, frontmatter=frontmatter_norm)
    title = _derive_title(source_path=source_path, frontmatter=frontmatter_norm)
    folders = _derive_folders(source_path=source_path)
    features = extract_features(body)

    return DocumentRecord(
        doc_id=doc_id,
        title=title,
        source_path=source_path,
        frontmatter_raw=frontmatter_raw,
        frontmatter_norm=frontmatter_norm,
        folders=folders,
        body_raw=body,
        features=features,
    )


def _derive_doc_id(*, source_path: str, frontmatter: dict[str, Any] | None) -> str:
    if frontmatter and isinstance(frontmatter.get("id"), str) and frontmatter["id"].strip():
        return slugify(frontmatter["id"])
    stem = str(PurePosixPath(source_path).with_suffix(""))
    return slugify(stem)


def _derive_title(*, source_path: str, frontmatter: dict[str, Any] | None) -> str:
    if frontmatter and isinstance(frontmatter.get("title"), str) and frontmatter["title"].strip():
        return frontmatter["title"]
    return PurePosixPath(source_path).stem


def _derive_folders(*, source_path: str) -> list[str]:
    posix = PurePosixPath(source_path)
    if not posix.parent or str(posix.parent) == ".":
        return []
    return [slugify(segment) for segment in posix.parent.parts]
