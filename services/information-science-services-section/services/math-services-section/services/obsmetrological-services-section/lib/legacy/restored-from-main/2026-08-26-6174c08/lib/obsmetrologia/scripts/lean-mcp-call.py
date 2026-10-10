#!/usr/bin/env python3
"""Call the package-owned Lean MCP server when a host cannot expose it directly."""

from __future__ import annotations

import argparse
import asyncio
import json
from pathlib import Path

from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client


ROOT = Path(__file__).resolve().parent.parent


def arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("tool", nargs="?")
    parser.add_argument("payload", nargs="?", default="{}")
    parser.add_argument("--list-tools", action="store_true")
    parser.add_argument(
        "--project-path",
        type=Path,
        default=ROOT,
        help="Lean project whose language server should answer the request",
    )
    return parser.parse_args()


async def run(options: argparse.Namespace) -> None:
    project_path = options.project_path.resolve()
    if not (project_path / "lean-toolchain").is_file():
        raise SystemExit(f"Lean project has no lean-toolchain: {project_path}")
    params = StdioServerParameters(
        command="uvx",
        args=["lean-lsp-mcp", "--lean-project-path", "."],
        cwd=str(project_path),
    )
    async with stdio_client(params) as (reader, writer):
        async with ClientSession(reader, writer) as session:
            await session.initialize()
            tools = (await session.list_tools()).tools
            if options.list_tools:
                print(json.dumps([
                    {"name": tool.name, "inputSchema": tool.inputSchema}
                    for tool in tools
                ], indent=2, sort_keys=True))
                return
            if not options.tool:
                raise SystemExit("one tool name or --list-tools is required")
            known = {tool.name for tool in tools}
            if options.tool not in known:
                raise SystemExit(f"unknown Lean MCP tool: {options.tool}")
            payload = json.loads(options.payload)
            if not isinstance(payload, dict):
                raise SystemExit("tool payload must be one JSON object")
            result = await session.call_tool(options.tool, payload)
            print(result.model_dump_json(indent=2, exclude_none=True))


asyncio.run(run(arguments()))
