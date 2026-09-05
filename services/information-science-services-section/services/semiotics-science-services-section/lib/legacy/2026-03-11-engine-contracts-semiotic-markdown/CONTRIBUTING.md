# Contributing

Thanks for your interest.
This is currently a personal/hobby project, but issues and small PRs are welcome.

## Ways to help

- Report ambiguities or missing cases in the spec (`spec/semiotic-markdown.md`).
- Add minimal test vectors (input Markdown + expected extraction output).
- Improve the Python reference implementation without overfitting to a single Markdown renderer.

## Development

```bash
python -m pip install -e ".[dev]"
pre-commit install
pytest
```

## Spec changes

- Keep normative language consistent (MUST/SHOULD/MAY).
- Prefer adding conformance vectors when adding or tightening requirements.

## Code of Conduct

This project follows `CODE_OF_CONDUCT.md`.
