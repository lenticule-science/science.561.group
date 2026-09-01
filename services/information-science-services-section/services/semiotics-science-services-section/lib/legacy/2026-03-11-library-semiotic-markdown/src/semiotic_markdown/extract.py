from __future__ import annotations

import re
from collections.abc import Iterable
from pathlib import PurePosixPath

from .model import CalloutFeature, CitationGroupFeature, Feature, InlineFieldFeature, LinkFeature
from .slug import slugify

_FENCED_BLOCK = re.compile(r"(?ms)^[ \t]{0,3}(`{3,}|~{3,}).*?\n.*?^\1[ \t]*$\n?")
_INLINE_CODE = re.compile(r"(?s)(`+)([^`]*?)\1")

_WIKILINK = re.compile(r"!?\[\[([^\]\n]+?)\]\]")
_INLINE_FIELD = re.compile(r"(\[|\()([^\]\)\n]+?)::[ \t]*([^\]\)\n]+?)(\]|\))")
_CITATION_GROUP = re.compile(r"\[([^\]\n]*@[^]\n]*)\]")

_MARKDOWN_LINK = re.compile(r"\[([^\]\n]+)\]\(([^)\s]+)(?:[ \t]+\"[^\"]*\")?\)")


def extract_features(body: str) -> list[Feature]:
    eligible = _mask_ineligible_regions(body)

    features: list[Feature] = []
    features.extend(_extract_wikilinks(eligible))
    features.extend(_extract_inline_fields(eligible))
    features.extend(_extract_citations(eligible))
    features.extend(_extract_markdown_links(eligible))
    features.extend(_extract_callouts(body))
    return features


def _mask_ineligible_regions(body: str) -> str:
    masked = _FENCED_BLOCK.sub(lambda m: " " * (m.end() - m.start()), body)
    masked = _INLINE_CODE.sub(lambda m: " " * (m.end() - m.start()), masked)
    return masked


def _extract_wikilinks(eligible: str) -> Iterable[LinkFeature]:
    for match in _WIKILINK.finditer(eligible):
        raw_inner = match.group(1)
        is_transclusion = eligible[match.start()] == "!"
        target_raw, label = _split_target_label(raw_inner)
        yield LinkFeature(
            kind="transclusion" if is_transclusion else "wikilink",
            target_raw=target_raw,
            target_id=slugify(target_raw),
            label=label,
        )


def _split_target_label(value: str) -> tuple[str, str | None]:
    if "|" not in value:
        return value.strip(), None
    target, label = value.split("|", 1)
    target = target.strip()
    label = label.strip() or None
    return target, label


def _extract_inline_fields(eligible: str) -> Iterable[InlineFieldFeature]:
    for match in _INLINE_FIELD.finditer(eligible):
        opener = match.group(1)
        key = match.group(2).strip()
        value = match.group(3).strip()
        if not key:
            continue
        delimiter = "[]" if opener == "[" else "()"
        yield InlineFieldFeature(key=key, value=value, delimiter=delimiter)


def _extract_citations(eligible: str) -> Iterable[CitationGroupFeature]:
    for match in _CITATION_GROUP.finditer(eligible):
        content = match.group(1)
        keys: list[str] = []
        suppressed: list[str] = []
        for token in re.findall(r"(?<!\S)(-?)@([A-Za-z0-9_:-]+)", content):
            is_suppressed, key = token
            if is_suppressed:
                suppressed.append(slugify(key))
            else:
                keys.append(slugify(key))
        if keys or suppressed:
            yield CitationGroupFeature(keys=keys, suppressed_keys=suppressed)


def _extract_markdown_links(eligible: str) -> Iterable[LinkFeature]:
    for match in _MARKDOWN_LINK.finditer(eligible):
        label = match.group(1).strip()
        target = match.group(2).strip()
        if _is_external_link(target):
            continue
        target_id = _normalize_internal_link_target(target)
        if not target_id:
            continue
        yield LinkFeature(
            kind="markdown_link", target_raw=target, target_id=target_id, label=label or None
        )


def _is_external_link(target: str) -> bool:
    lowered = target.lower()
    return "://" in lowered or lowered.startswith("mailto:") or lowered.startswith("#")


def _normalize_internal_link_target(target: str) -> str:
    target = target.split("#", 1)[0].split("?", 1)[0]
    target = target.strip()
    if not target:
        return ""
    posix = PurePosixPath(target)
    stem = str(posix.with_suffix(""))
    stem = stem.removeprefix("./")
    return slugify(stem)


_CALLOUT_START = re.compile(r"^>[ \t]*\[!([A-Za-z0-9_-]+)\][ \t]*(.*)$")


def _extract_callouts(body: str) -> Iterable[CalloutFeature]:
    lines = body.splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        match = _CALLOUT_START.match(line)
        if not match:
            i += 1
            continue
        callout_type = slugify(match.group(1))
        title = match.group(2).strip() or None

        body_lines: list[str] = []
        i += 1
        while i < len(lines) and lines[i].startswith(">"):
            body_lines.append(lines[i].lstrip(">").lstrip())
            i += 1
        yield CalloutFeature(
            callout_type=callout_type, title=title, body="\n".join(body_lines).rstrip()
        )
