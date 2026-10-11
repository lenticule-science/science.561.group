"""Audit the lab migration and PyMetroLogic provenance contract.

This is a workspace-level check for the long-running lab goal, not a library
test.  It verifies the concrete structural facts that make the site a thin
Python lab around one Lean-derived package.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import subprocess
import sys
import tomllib
from dataclasses import asdict, dataclass
from pathlib import Path


@dataclass(frozen=True)
class AuditItem:
    """One migration/provenance fact and the evidence used for it."""

    name: str
    passed: bool
    evidence: str


@dataclass(frozen=True)
class GoalAudit:
    """The current lab-goal audit report."""

    site_root: str
    repo_root: str
    passed: bool
    items: tuple[AuditItem, ...]


def build_audit(site_root: Path, lean_root: Path | None = None) -> GoalAudit:
    """Build the current migration/provenance audit.

    ``lean_root`` is passed straight through to ``tools/dag_coverage.py``. Left
    unset, that tool's own default discovery already tries the live
    Obsmetrologia location first (``../../lib/obsmetrologia`` from the app
    root), so no separate default-discovery logic is needed here — this
    parameter exists so a caller (or ``--lean-root`` on the CLI) can override
    it, e.g. to point at an archived RelMath-shaped checkout.
    """

    site_root = site_root.resolve()
    repo_root = site_root.parents[1]
    package_root = site_root / "packages" / "pymetrologic"
    src_root = package_root / "src" / "pymetrologic"
    pyproject = tomllib.loads((package_root / "pyproject.toml").read_text(encoding="utf-8"))
    dag_report = _dag_report(site_root, lean_root)

    items = (
        AuditItem(
            name="legacy lab path removed",
            passed=not (repo_root / "lab").exists(),
            evidence=str(repo_root / "lab"),
        ),
        AuditItem(
            name="lab site exists",
            passed=site_root.exists(),
            evidence=str(site_root),
        ),
        AuditItem(
            name="legacy exploring package removed",
            passed=not (repo_root / "lib" / "exploring-the-wilderness").exists(),
            evidence=str(repo_root / "lib" / "exploring-the-wilderness"),
        ),
        AuditItem(
            name="package distribution is PyMetroLogic",
            passed=pyproject.get("project", {}).get("name") == "PyMetroLogic",
            evidence=str(package_root / "pyproject.toml"),
        ),
        AuditItem(
            name="one pymetrologic package root",
            passed=src_root.exists() and not (src_root / "relmath").exists(),
            evidence=str(src_root),
        ),
        AuditItem(
            name="no importable wilderness subpackage",
            passed=importlib.util.find_spec("pymetrologic.wilderness") is None,
            evidence="importlib.util.find_spec('pymetrologic.wilderness')",
        ),
        AuditItem(
            name="converted wilderness material is notebook-only",
            passed=(site_root / "notebooks" / "70-wilderness-experiments.py").exists()
            and not (src_root / "wilderness.py").exists()
            and not (src_root / "wilderness").exists(),
            evidence=str(site_root / "notebooks" / "70-wilderness-experiments.py"),
        ),
        AuditItem(
            name="lean dag coverage closed",
            passed=dag_report["lean_coverage_ratio"] == 1.0
            and dag_report["unledgered_lean_modules"] == [],
            evidence="tools/dag_coverage.py --json",
        ),
        AuditItem(
            name="pymetrologic math provenance closed",
            passed=dag_report["py_provenance_ratio"] == 1.0
            and dag_report["unledgered_py_modules"] == [],
            evidence="tools/dag_coverage.py --json",
        ),
    )
    return GoalAudit(
        site_root=str(site_root),
        repo_root=str(repo_root),
        passed=all(item.passed for item in items),
        items=items,
    )


def _dag_report(site_root: Path, lean_root: Path | None = None) -> dict[str, object]:
    command = [sys.executable, "tools/dag_coverage.py", "--json"]
    if lean_root is not None:
        command.extend(["--lean-root", str(lean_root)])
    result = subprocess.run(
        command,
        cwd=site_root,
        check=True,
        capture_output=True,
        text=True,
    )
    report = json.loads(result.stdout)
    if not isinstance(report, dict):
        raise TypeError("dag_coverage.py returned a non-object JSON value")
    return report


def report_markdown(audit: GoalAudit) -> str:
    """Render the audit as compact markdown."""

    lines = [
        "# Lab Goal Audit",
        "",
        f"- Site root: `{audit.site_root}`",
        f"- Repo root: `{audit.repo_root}`",
        f"- Passed: `{audit.passed}`",
        "",
        "## Items",
        "",
    ]
    for item in audit.items:
        mark = "PASS" if item.passed else "FAIL"
        lines.append(f"- `{mark}` {item.name} — {item.evidence}")
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--site-root", type=Path, default=Path.cwd())
    parser.add_argument(
        "--lean-root",
        type=Path,
        default=None,
        help="Passed straight through to tools/dag_coverage.py; defaults to its own "
        "auto-detected live Obsmetrologia location.",
    )
    parser.add_argument("--json", action="store_true", help="Emit JSON instead of markdown.")
    args = parser.parse_args()

    audit = build_audit(args.site_root, args.lean_root)
    if args.json:
        print(json.dumps(asdict(audit), indent=2, sort_keys=True))
    else:
        print(report_markdown(audit))
    return 0 if audit.passed else 1


if __name__ == "__main__":
    raise SystemExit(main())
