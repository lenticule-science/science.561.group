"""BuildMathAgent: runs the math corpus build and returns a typed result.

This is a subprocess wrapper, not an LLM agent. No Claude call is made.
Kept in agents/ for interface consistency -- callers treat it like any other agent.
"""
from __future__ import annotations

import subprocess

from src.engine.models.transient import BuildResult
from src.engine.paths import REPO_DIR


async def run() -> BuildResult:
    result = subprocess.run(
        ["python3", "src/pipeline/build.py"],
        cwd=REPO_DIR,
        capture_output=True,
        text=True,
    )
    if result.returncode == 0:
        return BuildResult(status="ok", message="build clean")
    return BuildResult(
        status="error",
        message=(result.stderr or result.stdout).strip(),
    )
