#!/usr/bin/env python3
"""Interpreter for the Relational Expression Syntax (RES)."""
from __future__ import annotations

import argparse
from pathlib import Path
from typing import Any, Dict, List, Sequence

from res_parser import ResSyntaxError, parse_expression

LOG_PATH = Path("res_interpreter.log")


class EvaluationError(RuntimeError):
    pass


def log(message: str) -> None:
    with LOG_PATH.open("a", encoding="utf-8") as handle:
        handle.write(message + "\n")


class Environment:
    def __init__(self) -> None:
        self.values: Dict[str, Any] = {}

    def bind(self, name: str, value: Any) -> None:
        log(f"Bound '{name}'")
        self.values[name] = value

    def lookup(self, name: str) -> Any:
        if name in self.values:
            return self.values[name]
        raise EvaluationError(f"Unbound symbol '{name}'")


def primitive_relationlessness() -> Dict[str, Any]:
    return {"type": "relationlessness"}


def primitive_reflex(recognition: Any) -> Dict[str, Any]:
    return {"type": "reflex", "payload": recognition}


def eval_res(expr: Any, env: Environment) -> Any:
    if isinstance(expr, str):
        if expr.startswith('"') and expr.endswith('"'):
            return expr[1:-1]
        return env.lookup(expr)
    if isinstance(expr, list):
        if not expr:
            raise EvaluationError("Cannot evaluate empty list")
        head = eval_res(expr[0], env)
        args = [eval_res(arg, env) for arg in expr[1:]]
        if callable(head):
            result = head(*args)
            log(f"Executed function with result {result}")
            return result
        raise EvaluationError(f"Head {expr[0]!r} did not evaluate to a callable")
    raise TypeError(f"Unsupported expression node: {expr!r}")


def parse_block(block: str):
    return parse_expression(block)


def evaluate_blocks(blocks: Sequence[str], env: Environment, validate_only: bool) -> None:
    for block in blocks:
        expr = parse_block(block)
        if isinstance(expr, list) and expr and expr[0] == "fn" and len(expr) == 4 and isinstance(expr[1], str):
            name = expr[1]
            params_raw = expr[2]
            if not all(isinstance(p, str) for p in params_raw):
                raise EvaluationError(f"Parameters of '{name}' must be symbols")
            body = expr[3]

            def make_closure(parameters: List[str], body_expr: Any):
                def closure(*args):
                    if len(args) != len(parameters):
                        raise EvaluationError(
                            f"Function '{name}' expected {len(parameters)} args, got {len(args)}"
                        )
                    old_bindings = {}
                    for param, value in zip(parameters, args):
                        if param in env.values:
                            old_bindings[param] = env.values[param]
                        env.values[param] = value
                    try:
                        return eval_res(body_expr, env)
                    finally:
                        for param in parameters:
                            env.values.pop(param, None)
                        env.values.update(old_bindings)

                closure.__name__ = name
                return closure

            closure = make_closure(list(params_raw), body)
            env.bind(name, closure)
        else:
            value = eval_res(expr, env)
            if not validate_only:
                log(f"Evaluated expression -> {value}")


def read_res_file(path: Path) -> List[str]:
    blocks: List[str] = []
    buffer: List[str] = []
    with path.open("r", encoding="utf-8") as handle:
        for line in handle:
            stripped = line.strip()
            if not stripped:
                if buffer:
                    blocks.append("\n".join(buffer))
                    buffer = []
                continue
            buffer.append(line)
    if buffer:
        blocks.append("\n".join(buffer))
    return blocks


def main() -> None:
    parser = argparse.ArgumentParser(description="RES interpreter")
    parser.add_argument("res_file", type=Path, nargs="?", default=Path("relationality.res"))
    parser.add_argument("--validate", action="store_true", help="Only validate definitions")
    args = parser.parse_args()

    LOG_PATH.write_text("", encoding="utf-8")

    env = Environment()
    env.bind("Relationlessness", primitive_relationlessness())
    env.bind("Reflex", primitive_reflex)

    blocks = read_res_file(args.res_file)
    try:
        evaluate_blocks(blocks, env, args.validate)
    except (EvaluationError, ResSyntaxError) as err:
        log(f"ERROR: {err}")
        raise SystemExit(f"Interpreter error: {err}") from err

    log("Interpretation complete")
    print(f"Log written to {LOG_PATH}")


if __name__ == "__main__":
    main()
