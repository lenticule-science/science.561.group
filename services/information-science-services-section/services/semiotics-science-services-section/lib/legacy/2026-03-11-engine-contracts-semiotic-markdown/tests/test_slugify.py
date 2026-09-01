from semiotic_markdown.slug import slugify


def test_slugify_normative_examples() -> None:
    assert slugify(" Hello/World ") == "hello-world"
    assert slugify("a--b") == "a-b"
    assert slugify("A_B") == "a_b"
    assert slugify("") == "item"
