#!/usr/bin/env python3
"""Extract RES code blocks from the specification and serialize them."""
from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, List, Tuple

from res_parser import ResSyntaxError, parse_expression

SPEC_PATH = Path("on-relationality.md")
JSON_PATH = Path("relationality.json")
RES_PATH = Path("relationality.res")
RESERVED_HEADS = ["Relationlessness", "Reflex"]


def read_res_blocks(path: Path) -> List[Tuple[str, int]]:
    blocks: List[Tuple[str, int]] = []
    inside = False
    language: str | None = None
    buffer: List[str] = []
    start_line = 0
    with path.open("r", encoding="utf-8") as handle:
        for lineno, line in enumerate(handle, 1):
            stripped = line.rstrip('\n')
            if stripped.startswith("```"):
                fence = stripped[3:].strip()
                if not inside:
                    inside = True
                    language = fence or None
                    buffer = []
                    start_line = lineno + 1
                else:
                    if language is None:
                        block = "".join(buffer).strip()
                        if block:
                            blocks.append((block, start_line))
                    inside = False
                    language = None
                continue
            if inside:
                buffer.append(line)
    return blocks


def convert_node(node: Any) -> Any:
    if isinstance(node, str):
        return {"type": "symbol", "value": node}
    if isinstance(node, list):
        return {
            "type": "list",
            "elements": [convert_node(child) for child in node],
        }
    raise TypeError(f"Unsupported node type: {node!r}")


def is_named_fn(expr: Any) -> bool:
    return (
        isinstance(expr, list)
        and len(expr) >= 4
        and expr[0] == "fn"
        and isinstance(expr[1], str)
        and isinstance(expr[2], list)
    )


def ast_from_fn(expr: List[Any], line: int) -> Dict[str, Any]:
    if len(expr) != 4:
        raise ResSyntaxError(f"fn at line {line} must have four elements")
    _, name, params, body = expr
    if not all(isinstance(param, str) for param in params):
        raise ResSyntaxError(f"fn parameters at line {line} must be symbols")
    return {
        "name": name,
        "params": params,
        "body": convert_node(body),
        "source_line": line,
    }


def build_tree() -> Tuple[Dict[str, Any], List[str]]:
    blocks = read_res_blocks(SPEC_PATH)
    definitions: List[Dict[str, Any]] = []
    expressions: List[Dict[str, Any]] = []
    raw_blocks: List[str] = []

    for block, line in blocks:
        try:
            expr = parse_expression(block)
        except ResSyntaxError as err:
            raise SystemExit(f"Parse error at lines around {line}: {err}") from err

        raw_blocks.append(block.strip())

        if is_named_fn(expr):
            fn_entry = ast_from_fn(expr, line)
            definitions.append(fn_entry)
        else:
            expressions.append({"source_line": line, "expression": convert_node(expr)})

    return (
        {
            "reserved": RESERVED_HEADS,
            "definitions": definitions,
            "expressions": expressions,
        },
        raw_blocks,
    )


def main() -> None:
    tree, raw_blocks = build_tree()
    JSON_PATH.write_text(json.dumps(tree, indent=2), encoding="utf-8")
    with RES_PATH.open("w", encoding="utf-8") as handle:
        for block in raw_blocks:
            handle.write(block)
            handle.write("\n\n")
    print(f"Wrote {JSON_PATH} and {RES_PATH}")


if __name__ == "__main__":
    main()
