from __future__ import annotations

import argparse
import json
from pathlib import Path

from .vault import index_vault


def _cmd_index(args: argparse.Namespace) -> int:
    records = index_vault(args.vault)
    payload = [record.to_dict(include_body=args.include_body) for record in records]
    json.dump(payload, fp=args.output, indent=2 if args.pretty else None, ensure_ascii=False)
    if args.pretty:
        args.output.write("\n")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="smd", description="Semiotic Markdown utilities")
    subparsers = parser.add_subparsers(dest="command", required=True)

    index_parser = subparsers.add_parser(
        "index",
        help="Index a vault (directory) of .md files and emit extraction JSON",
    )
    index_parser.add_argument("vault", type=Path)
    index_parser.add_argument("--pretty", action="store_true")
    index_parser.add_argument("--include-body", action="store_true")
    index_parser.add_argument(
        "-o", "--output", type=argparse.FileType("w", encoding="utf-8"), default="-"
    )
    index_parser.set_defaults(func=_cmd_index)

    args = parser.parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main())
