from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Literal


@dataclass(frozen=True)
class LinkFeature:
    kind: Literal["wikilink", "transclusion", "markdown_link"]
    target_raw: str
    target_id: str
    label: str | None = None

    def to_dict(self) -> dict[str, Any]:
        data: dict[str, Any] = {
            "type": "link",
            "kind": self.kind,
            "target_raw": self.target_raw,
            "target_id": self.target_id,
        }
        if self.label is not None:
            data["label"] = self.label
        return data


@dataclass(frozen=True)
class CalloutFeature:
    callout_type: str
    title: str | None
    body: str

    def to_dict(self) -> dict[str, Any]:
        data: dict[str, Any] = {
            "type": "callout",
            "callout_type": self.callout_type,
            "body": self.body,
        }
        if self.title is not None:
            data["title"] = self.title
        return data


@dataclass(frozen=True)
class InlineFieldFeature:
    key: str
    value: str
    delimiter: Literal["[]", "()"]

    def to_dict(self) -> dict[str, Any]:
        return {
            "type": "inline_field",
            "key": self.key,
            "value": self.value,
            "delimiter": self.delimiter,
        }


@dataclass(frozen=True)
class CitationGroupFeature:
    keys: list[str]
    suppressed_keys: list[str]

    def to_dict(self) -> dict[str, Any]:
        return {
            "type": "citation_group",
            "keys": self.keys,
            "suppressed_keys": self.suppressed_keys,
        }


Feature = LinkFeature | CalloutFeature | InlineFieldFeature | CitationGroupFeature


@dataclass(frozen=True)
class DocumentRecord:
    doc_id: str
    title: str
    source_path: str
    frontmatter_raw: str | None
    frontmatter_norm: dict[str, Any] | None
    folders: list[str]
    body_raw: str
    features: list[Feature]

    def to_dict(self, *, include_body: bool = False) -> dict[str, Any]:
        data: dict[str, Any] = {
            "doc_id": self.doc_id,
            "title": self.title,
            "source_path": self.source_path,
            "frontmatter_raw": self.frontmatter_raw,
            "frontmatter_norm": self.frontmatter_norm,
            "folders": self.folders,
            "features": [feature.to_dict() for feature in self.features],
        }
        if include_body:
            data["body_raw"] = self.body_raw
        return data
