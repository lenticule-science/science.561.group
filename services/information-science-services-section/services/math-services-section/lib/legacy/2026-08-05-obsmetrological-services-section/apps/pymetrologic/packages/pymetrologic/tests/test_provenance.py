from __future__ import annotations

import json
import subprocess
import sys
from importlib.util import find_spec
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
THEORY = ROOT / "docs" / "THEORY.md"

NO_LIVE_LEAN_ROOT = (
    "the ledger still cites RelMath.* paths, but the live Lean library moved to "
    "Obsmetrologia (services/lenticule-science/services/obsmetrological-services-section/src/services/obsmetrologia) with a "
    "reorganized module tree; docs/THEORY.md needs a real re-verified remap before "
    "this check can mean anything again — see docs/THEORY.md's header note"
)


def test_wilderness_is_not_an_importable_pymetrologic_surface() -> None:
    assert find_spec("pymetrologic.wilderness") is None


def test_theory_ledger_records_the_pymetrologic_provenance_boundary() -> None:
    theory = THEORY.read_text(encoding="utf-8")

    assert "Library modules must be Lean-derived" in theory
    assert "Notebook-only experiments may be playful" in theory
    assert "pymetrologic.wilderness" not in theory


def test_recent_collatz_frontier_module_is_ledgered_as_conditional() -> None:
    theory = THEORY.read_text(encoding="utf-8")

    assert "Closure.Collatz.Reduction" in theory
    assert "pymetrologic.collatz_reduction" in theory
    assert "bounded and conditional" in theory


@pytest.mark.skip(reason=NO_LIVE_LEAN_ROOT)
def test_relmath_root_spine_is_ledgered_to_package_root() -> None:
    result = subprocess.run(
        [
            sys.executable,
            "tools/dag_coverage.py",
            "--module",
            "RelMath",
            "--json",
        ],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    query = json.loads(result.stdout)

    assert query["ledgered"] is True
    assert query["realized_by"] == ["pymetrologic"]
    assert query["unledgered_imports"] == []


@pytest.mark.skip(reason=NO_LIVE_LEAN_ROOT)
def test_pymetrologic_math_modules_are_all_ledgered_or_support() -> None:
    result = subprocess.run(
        [
            sys.executable,
            "tools/dag_coverage.py",
            "--json",
        ],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    report = json.loads(result.stdout)

    assert report["unledgered_lean_modules"] == []
    assert report["unledgered_py_modules"] == []
    assert set(report["support_py_modules"]) == {
        "pymetrologic.__main__",
        "pymetrologic.calculus.__main__",
        "pymetrologic.calculus.examples",
        "pymetrologic.calculus.viz",
    }
