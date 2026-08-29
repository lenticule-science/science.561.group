---
kind: decision
slug: "decision:mcp-typed-tool-signature-fix"
title: "MCP typed-tool wrapper: build real signatures from VerbSpec"
date: 2026-05-02
status: enacted
of-polity: "polity:561-group"
decided-by: "office:engineering"
amends:
  - "operations/engineering/fars/src/fars/cli/mcp.py"
attests:
  - "office:witness"  # caught by live MCP roundtrip
---

# Decision: MCP typed-tool wrapper builds real signatures from VerbSpec

## Context

The FARS MCP server wraps each `VerbSpec`-driven corpus verb as a typed MCP tool with a JSON Schema for its parameters.
The original wrapper was:

```python
def _make_typed_tool(v, sp):
    def tool(**kwargs) -> str:
        return _run_typed(v, kwargs, root)
    ...
```

A live MCP roundtrip — initiated as part of treating FARS-as-the-app-being-deployed — surfaced that this wrapper is broken: FastMCP / pydantic introspect `tool` via `inspect.signature` and `typing.get_type_hints`, see `**kwargs`, and generate a JSON Schema requiring a single field literally named `kwargs` of type `dict`.
From an MCP client this means *all 35 typed corpus tools* are unusable — the client has no way to know what real fields to pass, and `{"kwargs": {...}}
` is the only thing pydantic accepts.

Skill tools (`skill_*`) and untyped corpus tools (`corpus_<verb>` for the 3 verbs without specs) were unaffected because they take a single explicit `args_str: str` parameter.

## Decision

The typed-tool wrapper now builds an `inspect.
Signature` and an `__annotations__` dict from each verb's `VerbSpec`, with one keyword-only parameter per `Parameter` and a Python type annotation derived from `Parameter.kind` and `Parameter.type`:

- `store_true` → `bool` (default `False`)
- `append` → `Optional[List[T]]` (default `None`)
- `positional` (required) → `T`
- `positional` (optional) / `flag` → `Optional[T]` (default from spec)

Two helpers — `_wire_type` and `_wire_default` — project all `Parameter.type` values onto a small set of JSON-Schema-safe primitives (`str`, `int`, `float`, `bool`); anything else (`Path`, callable parsers like `_parse_kv` for `--set key=value` in `corpus_fm`, or any custom class) collapses to `str`.
Defaults are normalized through the same projection so `Path('.')
` becomes `"."
` and the announced annotation matches the announced default.
The verb's own `kwargs_from_dict` reconstructs the rich Python type before invocation.

Both `tool.__signature__` and `tool.__annotations__` are set so FastMCP / pydantic see real per-parameter schemas.

## Consequences

- All 35 typed corpus tools become callable from MCP clients with their real parameter names.
- A fresh smoke test (`/tmp/mcp_smoke.py`, runs `corpus_stats` with `{}` and `corpus_list` with `{"kind": "concept", "limit": 3}`) verifies the round-trip.
- Skill tools and untyped tools are unaffected.
- The fix is also a useful witness-log entry: the live deployment exercise immediately surfaced a real bug that the offline tests had missed.
  This is exactly the failure mode `office:witness` exists to catch.

## See also

- `operations/engineering/fars/src/fars/cli/mcp.py` — the patched file.
- `operations/engineering/services/mcp-server/_index.md` — the service record.
- [decision:materialize-additional-offices](../../../group/decisions/materialize-additional-offices.md) — the parallel decision constituting `office:witness` whose remit this case exemplifies.
