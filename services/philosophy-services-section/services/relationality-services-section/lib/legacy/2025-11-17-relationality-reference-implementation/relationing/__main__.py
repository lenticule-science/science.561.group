from __future__ import annotations

import sys


def main() -> None:
    """Console entrypoint for running the HTTP API via uvicorn.

    This is a thin wrapper that expects ``uvicorn`` to be available
    (for example, via the ``api`` extra). It runs the FastAPI app
    defined in :mod:`relationing.http_api`.
    """

    try:
        import uvicorn  # type: ignore[import]
    except ModuleNotFoundError:  # pragma: no cover - environment dependent
        print(
            "uvicorn is required to run the relational-core API. "
            "Install with: pip install 'relational-core[api]'",
            file=sys.stderr,
        )
        sys.exit(1)

    uvicorn.run("relationing.http_api:app", host="127.0.0.1", port=8000, reload=False)


if __name__ == "__main__":  # pragma: no cover
    main()

