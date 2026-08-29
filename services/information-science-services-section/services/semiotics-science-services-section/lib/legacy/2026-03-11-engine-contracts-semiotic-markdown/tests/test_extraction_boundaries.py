from semiotic_markdown.extract import extract_features


def test_no_extraction_inside_code() -> None:
    body = "Inline `[[Nope]]`.\n\n```md\n[[Nope2]]\n```\n\nBut [[Yep]].\n"
    features = extract_features(body)
    link_targets = [
        f.target_id for f in features if getattr(f, "kind", None) in {"wikilink", "transclusion"}
    ]
    assert "nope" not in link_targets
    assert "nope2" not in link_targets
    assert "yep" in link_targets
