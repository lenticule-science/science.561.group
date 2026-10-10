"""Compare the RelMath Lean DAG with the PyMetroLogic Python DAG.

The comparison is intentionally provenance-first:

* Lean coverage is measured through ``docs/THEORY.md`` rows that mention both a
  Lean module and a ``pymetrologic.<module>`` realization.
* Python import topology is extracted from source imports, not from runtime
  imports, so the tool stays cheap and deterministic.
* Unledgered Python modules are not automatically bad. They are prompts for
  either adding provenance, moving experiments back to notebooks, or marking
  them as infrastructure.
"""

from __future__ import annotations

import argparse
import ast
import json
import re
from dataclasses import asdict, dataclass
from pathlib import Path

IMPORT_RE = re.compile(r"^\s*import\s+([A-Za-z0-9_.]+)\s*$", re.MULTILINE)
LEAN_REF_RE = re.compile(
    r"`(RelMath(?:\.[A-Za-z0-9_]+)*|[A-Za-z][A-Za-z0-9_.]*(?:\.[A-Za-z0-9_]+)+)`"
)
PY_REF_RE = re.compile(r"`(pymetrologic(?:\.[A-Za-z_][A-Za-z0-9_]*)*)(?=`|[\s,;/)])")
ROOT_SYMBOL_REFS = frozenset({"pymetrologic.four"})
SUPPORT_PY_MODULES = frozenset(
    {
        "pymetrologic.__main__",
        "pymetrologic.calculus.__main__",
        "pymetrologic.calculus.examples",
        "pymetrologic.calculus.viz",
    }
)


@dataclass(frozen=True)
class Dag:
    """A directed import graph keyed by module name."""

    nodes: tuple[str, ...]
    edges: dict[str, tuple[str, ...]]


@dataclass(frozen=True)
class LedgerRow:
    """One THEORY.md row that links Lean source to PyMetroLogic realization."""

    lean_modules: tuple[str, ...]
    python_modules: tuple[str, ...]
    text: str


@dataclass(frozen=True)
class CoverageReport:
    """Lean/PyMetroLogic coverage snapshot."""

    lean_modules: int
    lean_edges: int
    py_modules: int
    py_edges: int
    ledger_rows: int
    lean_coverage_ratio: float
    py_provenance_ratio: float
    ledgered_lean_modules: tuple[str, ...]
    ledgered_py_modules: tuple[str, ...]
    support_py_modules: tuple[str, ...]
    unledgered_lean_modules: tuple[str, ...]
    unledgered_py_modules: tuple[str, ...]
    missing_py_modules: tuple[str, ...]
    py_modules_without_tests: tuple[str, ...]


@dataclass(frozen=True)
class ModuleQuery:
    """A local DAG/provenance neighborhood for one Lean or PyMetroLogic module."""

    module: str
    kind: str
    exists: bool
    ledgered: bool
    imports: tuple[str, ...]
    imported_by: tuple[str, ...]
    realized_by: tuple[str, ...]
    realizes: tuple[str, ...]
    unledgered_imports: tuple[str, ...]
    missing_py_realizations: tuple[str, ...]
    ledger_rows: tuple[str, ...]


def _repo_root_from_site(site_root: Path) -> Path:
    return site_root.parents[1]


def find_lean_root(repo_root: Path, explicit: Path | None = None) -> Path:
    """Find the active RelMath Lake project."""

    candidates = [explicit] if explicit is not None else []
    candidates.extend(
        [
            repo_root / "lean",
            *sorted((repo_root / "sites").glob("relmath*.emsenn.net")),
        ]
    )
    for candidate in candidates:
        if candidate is not None and (candidate / "RelMath.lean").exists():
            return candidate.resolve()
    msg = "could not find a RelMath Lean root; pass --lean-root"
    raise SystemExit(msg)


def lean_module_name(path: Path, lean_root: Path) -> str:
    """Return the Lean module name for a file under the Lean project."""

    if path.name == "RelMath.lean":
        return "RelMath"
    rel = path.relative_to(lean_root).with_suffix("")
    return ".".join(rel.parts)


def py_module_name(path: Path, py_root: Path) -> str:
    """Return the PyMetroLogic module name for a source file."""

    rel = path.relative_to(py_root).with_suffix("")
    if rel.name == "__init__":
        parts = rel.parent.parts
        return ".".join(("pymetrologic", *parts)) if parts else "pymetrologic"
    return ".".join(("pymetrologic", *rel.parts))


def lean_dag(lean_root: Path) -> Dag:
    """Extract the import DAG from ``lean/RelMath`` plus ``lean/RelMath.lean``."""

    files = [lean_root / "RelMath.lean", *sorted((lean_root / "RelMath").rglob("*.lean"))]
    nodes = tuple(lean_module_name(path, lean_root) for path in files if path.exists())
    node_set = set(nodes)
    edges: dict[str, tuple[str, ...]] = {}
    for path in files:
        if not path.exists():
            continue
        module = lean_module_name(path, lean_root)
        imports = tuple(
            sorted(
                imported
                for imported in IMPORT_RE.findall(path.read_text(encoding="utf-8"))
                if imported.startswith("RelMath") and imported in node_set
            )
        )
        edges[module] = imports
    return Dag(tuple(sorted(nodes)), edges)


def _relative_import_base(
    module: str,
    level: int,
    imported: str | None,
    *,
    is_package: bool,
) -> str:
    parts = module.split(".") if is_package else module.split(".")[:-1]
    ascents = level - 1
    if ascents:
        parts = parts[:-ascents]
    if imported:
        parts.extend(imported.split("."))
    return ".".join(parts)


def py_dag(py_root: Path) -> Dag:
    """Extract internal PyMetroLogic import edges from Python source."""

    files = sorted(path for path in py_root.rglob("*.py") if path.name != "__pycache__")
    modules = tuple(py_module_name(path, py_root) for path in files)
    module_set = set(modules)
    edges: dict[str, tuple[str, ...]] = {}
    for path in files:
        module = py_module_name(path, py_root)
        is_package = path.name == "__init__.py"
        tree = ast.parse(path.read_text(encoding="utf-8"), filename=str(path))
        found: set[str] = set()
        for node in ast.walk(tree):
            if isinstance(node, ast.Import):
                for alias in node.names:
                    name = alias.name
                    if name.startswith("pymetrologic."):
                        candidate = _normalize_py_ref(name, module_set)
                        if candidate in module_set:
                            found.add(candidate)
            elif isinstance(node, ast.ImportFrom):
                if node.module and node.module.startswith("pymetrologic"):
                    base = _normalize_py_ref(node.module, module_set)
                    if base in module_set:
                        found.add(base)
                    for alias in node.names:
                        candidate = f"{base}.{alias.name}"
                        if candidate in module_set:
                            found.add(candidate)
                elif node.level:
                    base = _relative_import_base(
                        module,
                        node.level,
                        node.module,
                        is_package=is_package,
                    )
                    if base in module_set:
                        found.add(base)
                    for alias in node.names:
                        candidate = ".".join((base, alias.name))
                        if candidate in module_set:
                            found.add(candidate)
        found.discard(module)
        edges[module] = tuple(sorted(found))
    return Dag(tuple(sorted(modules)), edges)


def read_ledger(theory_path: Path) -> tuple[LedgerRow, ...]:
    """Read Lean-to-PyMetroLogic provenance rows from ``docs/THEORY.md``."""

    rows: list[LedgerRow] = []
    for line in theory_path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("| **"):
            continue
        py_modules = tuple(ref for ref in PY_REF_RE.findall(line) if ref not in ROOT_SYMBOL_REFS)
        lean_modules = tuple(
            f"RelMath.{name}" if "." in name and not name.startswith("RelMath.") else name
            for name in LEAN_REF_RE.findall(line)
            if not name.startswith("pymetrologic.")
        )
        if py_modules:
            rows.append(
                LedgerRow(
                    lean_modules=tuple(dict.fromkeys(lean_modules)),
                    python_modules=tuple(dict.fromkeys(py_modules)),
                    text=line,
                )
            )
    return tuple(rows)


def build_report(
    lean: Dag,
    py: Dag,
    ledger: tuple[LedgerRow, ...],
    tests_root: Path,
) -> CoverageReport:
    """Build a coarse coverage report from DAGs and the theory ledger."""

    lean_nodes = set(lean.nodes)
    py_nodes = set(py.nodes)
    math_py_nodes = py_nodes - SUPPORT_PY_MODULES
    ledgered_lean = _ledgered_lean_modules(ledger)
    ledgered_py = _ledgered_py_modules(ledger, py_nodes)
    missing_py = tuple(sorted(module for module in ledgered_py if module not in py_nodes))
    test_files = {path.stem.removeprefix("test_") for path in tests_root.glob("test_*.py")}
    py_without_tests = tuple(
        sorted(
            module
            for module in py_nodes
            if module.split(".")[-1] not in test_files
            and module != "pymetrologic.__main__"
            and module != "pymetrologic"
        )
    )
    return CoverageReport(
        lean_modules=len(lean_nodes),
        lean_edges=_edge_count(lean),
        py_modules=len(py_nodes),
        py_edges=_edge_count(py),
        ledger_rows=len(ledger),
        lean_coverage_ratio=_ratio(len(ledgered_lean & lean_nodes), len(lean_nodes)),
        py_provenance_ratio=_ratio(len(ledgered_py & math_py_nodes), len(math_py_nodes)),
        ledgered_lean_modules=tuple(sorted(ledgered_lean & lean_nodes)),
        ledgered_py_modules=tuple(sorted(ledgered_py & py_nodes)),
        support_py_modules=tuple(sorted(SUPPORT_PY_MODULES & py_nodes)),
        unledgered_lean_modules=tuple(sorted(lean_nodes - ledgered_lean)),
        unledgered_py_modules=tuple(sorted(math_py_nodes - ledgered_py)),
        missing_py_modules=missing_py,
        py_modules_without_tests=py_without_tests,
    )


def build_module_query(
    lean: Dag,
    py: Dag,
    ledger: tuple[LedgerRow, ...],
    module: str,
) -> ModuleQuery:
    """Build a local DAG/provenance query for one module."""

    lean_nodes = set(lean.nodes)
    py_nodes = set(py.nodes)
    ledgered_lean = _ledgered_lean_modules(ledger)
    ledgered_py = _ledgered_py_modules(ledger, py_nodes)
    lean_imported_by = _reverse_edges(lean)
    py_imported_by = _reverse_edges(py)

    if module.startswith("pymetrologic."):
        module = _normalize_py_ref(module, py_nodes)

    if module in lean_nodes:
        related_rows = tuple(row for row in ledger if module in row.lean_modules)
        realized_by = tuple(
            sorted(
                {
                    _normalize_py_ref(py_module, py_nodes)
                    for row in related_rows
                    for py_module in row.python_modules
                }
            )
        )
        return ModuleQuery(
            module=module,
            kind="lean",
            exists=True,
            ledgered=module in ledgered_lean,
            imports=lean.edges.get(module, ()),
            imported_by=lean_imported_by.get(module, ()),
            realized_by=tuple(module for module in realized_by if module in py_nodes),
            realizes=(),
            unledgered_imports=tuple(
                dependency
                for dependency in lean.edges.get(module, ())
                if dependency not in ledgered_lean
            ),
            missing_py_realizations=tuple(
                module for module in realized_by if module not in py_nodes
            ),
            ledger_rows=tuple(row.text for row in related_rows),
        )

    if module in py_nodes:
        related_rows = tuple(
            row
            for row in ledger
            if module
            in {_normalize_py_ref(py_module, py_nodes) for py_module in row.python_modules}
        )
        return ModuleQuery(
            module=module,
            kind="python",
            exists=True,
            ledgered=module in ledgered_py,
            imports=py.edges.get(module, ()),
            imported_by=py_imported_by.get(module, ()),
            realized_by=(),
            realizes=tuple(
                sorted(
                    {
                        lean_module
                        for row in related_rows
                        for lean_module in row.lean_modules
                        if lean_module in lean_nodes
                    }
                )
            ),
            unledgered_imports=tuple(
                dependency
                for dependency in py.edges.get(module, ())
                if dependency not in ledgered_py
            ),
            missing_py_realizations=(),
            ledger_rows=tuple(row.text for row in related_rows),
        )

    return ModuleQuery(
        module=module,
        kind="missing",
        exists=False,
        ledgered=False,
        imports=(),
        imported_by=(),
        realized_by=(),
        realizes=(),
        unledgered_imports=(),
        missing_py_realizations=(),
        ledger_rows=(),
    )


def _normalize_py_ref(module: str, py_nodes: set[str]) -> str:
    """Map a ledger reference to the nearest real PyMetroLogic module prefix."""

    parts = module.split(".")
    while len(parts) > 1:
        candidate = ".".join(parts)
        if candidate in py_nodes:
            return candidate
        parts.pop()
    return module


def _ledgered_lean_modules(ledger: tuple[LedgerRow, ...]) -> set[str]:
    return {
        module
        for row in ledger
        for module in row.lean_modules
        if module == "RelMath" or module.startswith("RelMath.")
    }


def _ledgered_py_modules(ledger: tuple[LedgerRow, ...], py_nodes: set[str]) -> set[str]:
    return {_normalize_py_ref(module, py_nodes) for row in ledger for module in row.python_modules}


def _reverse_edges(dag: Dag) -> dict[str, tuple[str, ...]]:
    reverse: dict[str, list[str]] = {node: [] for node in dag.nodes}
    for module, dependencies in dag.edges.items():
        for dependency in dependencies:
            reverse.setdefault(dependency, []).append(module)
    return {module: tuple(sorted(importers)) for module, importers in reverse.items()}


def _edge_count(dag: Dag) -> int:
    return sum(len(dependencies) for dependencies in dag.edges.values())


def _ratio(part: int, whole: int) -> float:
    return 0.0 if whole == 0 else round(part / whole, 4)


def report_markdown(report: CoverageReport) -> str:
    """Render a compact markdown report."""

    def section(title: str, values: tuple[str, ...], limit: int = 40) -> str:
        shown = values[:limit]
        suffix = "" if len(values) <= limit else f"\n- ... {len(values) - limit} more"
        body = "\n".join(f"- `{value}`" for value in shown) or "- none"
        return f"## {title}\n\n{body}{suffix}"

    lines = [
        "# Lean / PyMetroLogic DAG Coverage",
        "",
        f"- Lean modules: {report.lean_modules} ({report.lean_edges} import edges)",
        f"- PyMetroLogic modules: {report.py_modules} ({report.py_edges} import edges)",
        f"- THEORY ledger rows: {report.ledger_rows}",
        f"- Ledgered Lean modules: {len(report.ledgered_lean_modules)} "
        f"({report.lean_coverage_ratio:.1%})",
        f"- Ledgered PyMetroLogic modules: {len(report.ledgered_py_modules)} "
        f"({report.py_provenance_ratio:.1%})",
        "",
        section("Unledgered Lean Modules", report.unledgered_lean_modules),
        "",
        section("Unledgered PyMetroLogic Modules", report.unledgered_py_modules),
        "",
        section("Support PyMetroLogic Modules", report.support_py_modules),
        "",
        section("Ledger Rows Missing Python Modules", report.missing_py_modules),
        "",
        section("PyMetroLogic Modules Without Like-Named Tests", report.py_modules_without_tests),
    ]
    return "\n".join(lines)


def query_markdown(query: ModuleQuery) -> str:
    """Render a compact module-neighborhood query."""

    def section(title: str, values: tuple[str, ...], limit: int = 30) -> str:
        shown = values[:limit]
        suffix = "" if len(values) <= limit else f"\n- ... {len(values) - limit} more"
        body = "\n".join(f"- `{value}`" for value in shown) or "- none"
        return f"## {title}\n\n{body}{suffix}"

    def ledger_section(rows: tuple[str, ...]) -> str:
        body = "\n".join(f"- {row}" for row in rows) or "- none"
        return f"## Ledger Rows\n\n{body}"

    lines = [
        f"# DAG Query: `{query.module}`",
        "",
        f"- Kind: {query.kind}",
        f"- Exists: {query.exists}",
        f"- Ledgered: {query.ledgered}",
        "",
        section("Imports", query.imports),
        "",
        section("Imported By", query.imported_by),
        "",
        section("Realized By PyMetroLogic", query.realized_by),
        "",
        section("Realizes Lean", query.realizes),
        "",
        section("Unledgered Imports", query.unledgered_imports),
        "",
        section("Missing Python Realizations", query.missing_py_realizations),
        "",
        ledger_section(query.ledger_rows),
    ]
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--site-root", type=Path, default=Path.cwd())
    parser.add_argument("--lean-root", type=Path, default=None)
    parser.add_argument("--module", help="Query one Lean or PyMetroLogic module neighborhood.")
    parser.add_argument("--json", action="store_true", help="Emit JSON instead of markdown.")
    args = parser.parse_args()

    site_root = args.site_root.resolve()
    repo_root = _repo_root_from_site(site_root)
    lean_root = find_lean_root(repo_root, args.lean_root.resolve() if args.lean_root else None)
    py_root = site_root / "packages" / "pymetrologic" / "src" / "pymetrologic"
    tests_root = site_root / "packages" / "pymetrologic" / "tests"
    theory_path = site_root / "docs" / "THEORY.md"

    lean = lean_dag(lean_root)
    py = py_dag(py_root)
    ledger = read_ledger(theory_path)
    if args.module:
        query = build_module_query(lean=lean, py=py, ledger=ledger, module=args.module)
        if args.json:
            print(json.dumps(asdict(query), indent=2, sort_keys=True))
        else:
            print(query_markdown(query))
        return 0

    report = build_report(lean=lean, py=py, ledger=ledger, tests_root=tests_root)
    if args.json:
        print(json.dumps(asdict(report), indent=2, sort_keys=True))
    else:
        print(report_markdown(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
