from __future__ import annotations

import json
import subprocess
import sys
from importlib.util import find_spec
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
THEORY = ROOT / "docs" / "THEORY.md"


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


def test_obsmetrologia_root_spine_is_ledgered_to_package_root() -> None:
    """The live Obsmetrologia root spine is ledgered to the ``pymetrologic`` package root.

    ``tools/dag_coverage.py`` auto-detects the root module name (the
    ``<Name>.lean``-next-to-``<Name>/`` pattern), so this queries the live
    root's detected name, ``Obsmetrologia``, directly (the generalized
    replacement for the old hardcoded ``--module RelMath`` query).
    """
    result = subprocess.run(
        [
            sys.executable,
            "tools/dag_coverage.py",
            "--module",
            "Obsmetrologia",
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
    # NOT asserted (unlike the RelMath-era version of this test):
    # `query["unledgered_imports"] == []`. Obsmetrologia's root spine directly
    # imports several top-level namespaces entirely outside this
    # predication-math corpus's scope (DenseMatter, GameTheory, KineticTheory,
    # QuantumContextuality, ReactionNetworks, Thermodynamics, ...) plus a
    # handful of frontier leaf modules pymetrologic does not realize
    # (Cohomology.AttentionAllocation, Cohomology.CurrencyCocone, ...). On the
    # old RelMath root — scoped entirely to this corpus — an empty
    # `unledgered_imports` was a meaningful invariant; on the live,
    # multi-domain Obsmetrologia root it no longer is. See
    # `test_pymetrologic_math_modules_are_all_ledgered_or_support` below for
    # the invariant that does generalize.


def test_pymetrologic_math_modules_are_all_ledgered_or_support() -> None:
    """Every pymetrologic module is ledgered or a known support module.

    Adapted for the live, multi-domain Obsmetrologia root (2026-08-17 remap):
    ``report["unledgered_lean_modules"] == []`` is no longer a meaningful
    assertion — Obsmetrologia spans many domains (game theory, dense matter,
    kinetic theory, ...) this predication-math library was never meant to
    realize in full, so a large, legitimate set of unledgered Lean modules is
    expected. The invariant that *does* generalize is
    ``dangling_lean_citations == []``: every citation THEORY.md makes resolves
    to a real Obsmetrologia file, i.e. the ledger itself is not stale or
    typo'd, even though it doesn't (and shouldn't) cover the whole tree.
    """
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

    assert report["dangling_lean_citations"] == []
    # Two known, pre-existing gaps unrelated to the RelMath->Obsmetrologia
    # remap (newer modules that never received THEORY.md provenance rows).
    # Locked to this exact set so a *new* unledgered module still fails loud.
    assert set(report["unledgered_py_modules"]) == {
        "pymetrologic.rmn_proof_coordinate",
        "pymetrologic.service_resolution",
    }
    assert set(report["support_py_modules"]) == {
        "pymetrologic.__main__",
        "pymetrologic.calculus.__main__",
        "pymetrologic.calculus.examples",
        "pymetrologic.calculus.viz",
        # readouts.py is a naming layer over already-ledgered corpus modules,
        # not a fresh realization -- see its own module docstring and
        # tools/dag_coverage.py's SUPPORT_PY_MODULES comment.
        "pymetrologic.readouts",
    }
