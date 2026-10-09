"""Generic runbook executor.

Loads a Runbook (YAML) from cold storage or the Unit table and executes it
step by step. No per-runbook Python code required — the executor handles all
step types generically.

Step types:
  llm-call    invoke a PydanticAI agent; system_prompt may be a skill file path
  write       write a Unit to the hot store
  query       search the Unit table; returns list of content dicts
  for-each    iterate over a list; execute sub-steps per item
  call        invoke another runbook by id, passing named inputs
  script      run a shell script and capture stdout as result
  collect     gather outputs from a for-each into a named result

Template syntax: {{key}} or {{step_id.result}} resolved against the run context.
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path
from typing import Any

import yaml
from pydantic import BaseModel

REPO_DIR = Path(__file__).parent.parent.parent
RUNBOOKS_DIR = REPO_DIR / "runbooks"


# ------------------------------------------------------------------
# Public entry point
# ------------------------------------------------------------------

async def run(runbook_id: str, inputs: dict[str, Any]) -> dict[str, Any]:
    """Load and execute a runbook by id. Returns its outputs."""
    rb = _load(runbook_id)
    return await _execute(rb, inputs)


# ------------------------------------------------------------------
# Loader: hot store first, cold store fallback
# ------------------------------------------------------------------

def _load(runbook_id: str) -> dict:
    """Load a runbook by id.

    Checks the Unit table first (hot store). Falls back to runbooks/ on disk
    (cold store) if not yet loaded. This means runbooks are first-class Units:
    loader.py should ingest runbooks/ into the Unit table on startup.
    """
    from sqlmodel import Session, select
    from src.engine.db import get_engine
    from src.engine.models.unit import Unit, RunbookContent

    with Session(get_engine()) as session:
        units = list(session.exec(
            select(Unit)
            .where(Unit.kind == "Runbook")
        ).all())
        for u in units:
            rb = RunbookContent.model_validate_json(u.content)
            parsed = yaml.safe_load(rb.source_yaml)
            if parsed.get("id") == runbook_id:
                return parsed

    # Fallback: load directly from disk
    path = RUNBOOKS_DIR / f"{runbook_id}.yaml"
    if not path.exists():
        raise FileNotFoundError(f"Runbook not found in Unit table or disk: {runbook_id}")
    with open(path, encoding="utf-8") as f:
        return yaml.safe_load(f)


# ------------------------------------------------------------------
# Executor
# ------------------------------------------------------------------

async def _execute(rb: dict, inputs: dict[str, Any]) -> dict[str, Any]:
    from datetime import date
    ctx: dict[str, Any] = {"inputs": inputs, "today": date.today().isoformat()}

    for step in rb.get("steps", []):
        step_id = step["id"]
        step_type = step["type"]

        result = await _dispatch(step, ctx)
        ctx[step_id] = {"result": result}

    # Collect declared outputs
    outputs: dict[str, Any] = {}
    for out in rb.get("outputs", []):
        name = out["name"]
        outputs[name] = _resolve(out.get("from", f"{{{{steps.{name}.result}}}}"), ctx)

    return outputs


async def _dispatch(step: dict, ctx: dict) -> Any:
    t = step["type"]
    if t == "llm-call":
        return await _llm_call(step, ctx)
    if t == "write":
        return _write(step, ctx)
    if t == "for-each":
        return await _for_each(step, ctx)
    if t == "call":
        return await _call(step, ctx)
    if t == "script":
        return _script(step, ctx)
    if t == "collect":
        return _collect(step, ctx)
    if t == "query":
        return _query(step, ctx)
    if t == "update":
        return _update(step, ctx)
    raise ValueError(f"Unknown step type: {t!r}")


# ------------------------------------------------------------------
# Step implementations
# ------------------------------------------------------------------

async def _llm_call(step: dict, ctx: dict) -> Any:
    from pydantic_ai import Agent
    from src.engine.prompts.loader import load_skill

    system_prompt_raw = step.get("system_prompt", "")
    # If it looks like a file path, load it
    if system_prompt_raw.endswith(".md") and not system_prompt_raw.startswith("{"):
        system_prompt = load_skill(system_prompt_raw)
    else:
        system_prompt = _resolve(system_prompt_raw, ctx)

    user_input = _resolve(step.get("user_input", ""), ctx)
    result_type_name = step.get("result_type")
    result_type = _resolve_type(result_type_name) if result_type_name else str

    agent = Agent(
        step.get("model", "claude-sonnet-4-6"),
        result_type=result_type,
        system_prompt=system_prompt,
    )
    result = await agent.run(user_input if isinstance(user_input, str) else json.dumps(user_input))
    return result.data


def _write(step: dict, ctx: dict) -> dict:
    from sqlmodel import Session
    from src.engine.db import get_engine
    from src.engine.models.unit import Unit, content_model

    kind = _resolve(step["kind"], ctx)
    dept = _resolve(step["department"], ctx)
    content_raw = {k: _resolve(v, ctx) for k, v in step.get("content", {}).items()}

    model_cls = content_model(kind)
    content_obj = model_cls(**content_raw)

    with Session(get_engine()) as session:
        unit = Unit.make(kind, dept, content_obj)
        session.add(unit)
        session.commit()
        session.refresh(unit)
        unit_id = unit.id

    if step.get("flush"):
        from src.engine.serializer import flush_departments
        flush_departments({dept})

    return {"unit_id": unit_id}


def _update(step: dict, ctx: dict) -> dict:
    import json
    from sqlmodel import Session
    from src.engine.db import get_engine
    from src.engine.models.unit import Unit

    unit_id = int(_resolve(step["unit_id"], ctx))
    fields = {k: _resolve(v, ctx) for k, v in step.get("fields", {}).items()}

    with Session(get_engine()) as session:
        unit = session.get(Unit, unit_id)
        if unit is None:
            raise ValueError(f"Unit {unit_id} not found")
        data = json.loads(unit.content)
        data.update({k: v for k, v in fields.items() if v != ""})
        unit.content = json.dumps(data)
        session.add(unit)
        session.commit()
        dept = unit.department

    if step.get("flush"):
        from src.engine.serializer import flush_departments
        flush_departments({dept})

    return {"unit_id": unit_id}


async def _for_each(step: dict, ctx: dict) -> list:
    items = _resolve(step["over"], ctx)
    results = []
    for item in (items or []):
        item_ctx = {**ctx, "item": item}
        for sub in step.get("do", []):
            r = await _dispatch(sub, item_ctx)
            item_ctx[sub["id"]] = {"result": r}
        results.append(item_ctx.get("item_result", {}).get("result"))
    return results


async def _call(step: dict, ctx: dict) -> Any:
    runbook_id = _resolve(step["runbook"], ctx)
    inputs = {k: _resolve(v, ctx) for k, v in step.get("inputs", {}).items()}
    return await run(runbook_id, inputs)


def _script(step: dict, ctx: dict) -> str:
    cmd = _resolve(step["cmd"], ctx)
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True, cwd=REPO_DIR)
    if result.returncode != 0 and step.get("fail_on_error", True):
        raise RuntimeError(f"Script failed: {result.stderr}")
    return result.stdout.strip()


def _query(step: dict, ctx: dict) -> list[dict]:
    """Query the Unit table. Returns list of content dicts with id/kind/department injected."""
    from sqlmodel import Session, select
    from src.engine.db import get_engine
    from src.engine.models.unit import Unit

    with Session(get_engine()) as session:
        stmt = select(Unit)
        if kind := _resolve(step.get("kind"), ctx):
            stmt = stmt.where(Unit.kind == kind)
        if dept := _resolve(step.get("department"), ctx):
            stmt = stmt.where(Unit.department == dept)
        units = session.exec(stmt).all()

    search = _resolve(step.get("search"), ctx)
    results = []
    for u in units:
        row = {**json.loads(u.content), "_id": u.id, "_kind": u.kind, "_department": u.department}
        if search and search.lower() not in u.content.lower():
            continue
        results.append(row)

    if limit := step.get("limit"):
        results = results[:int(limit)]
    return results


def _collect(step: dict, ctx: dict) -> Any:
    source = _resolve(step["from"], ctx)
    return source


# ------------------------------------------------------------------
# Template resolution
# ------------------------------------------------------------------

_TEMPLATE_RE = re.compile(r"\{\{(.+?)\}\}")


def _resolve(value: Any, ctx: dict) -> Any:
    """Resolve {{...}} templates against ctx. Non-string values pass through."""
    if not isinstance(value, str):
        return value
    # Full match — return the resolved value directly (preserves non-string types)
    m = re.fullmatch(r"\{\{(.+?)\}\}", value.strip())
    if m:
        return _lookup(m.group(1).strip(), ctx)
    # Partial match — substitute and return string
    def replace(m: re.Match) -> str:
        result = _lookup(m.group(1).strip(), ctx)
        return json.dumps(result) if not isinstance(result, str) else result
    return _TEMPLATE_RE.sub(replace, value)


def _lookup(path: str, ctx: dict) -> Any:
    """Dot-path lookup into ctx. E.g. 'inputs.department' or 'step_id.result'."""
    parts = path.split(".")
    obj: Any = ctx
    for part in parts:
        if isinstance(obj, dict):
            obj = obj.get(part)
        elif hasattr(obj, part):
            obj = getattr(obj, part)
        else:
            return None
    return obj


# ------------------------------------------------------------------
# Type registry (result_type names → Python types)
# ------------------------------------------------------------------

def _resolve_type(name: str) -> type:
    from src.engine.models.transient import (
        PromptUnit, RoutingDecision, RoutingReport, WorkReport,
    )
    _TYPES: dict[str, type] = {
        "str": str,
        "int": int,
        "dict": dict,
        "list": list,
        "PromptUnit": PromptUnit,
        "list[PromptUnit]": list[PromptUnit],
        "RoutingDecision": RoutingDecision,
        "list[RoutingDecision]": list[RoutingDecision],
        "RoutingReport": RoutingReport,
        "WorkReport": WorkReport,
    }
    return _TYPES.get(name, str)
