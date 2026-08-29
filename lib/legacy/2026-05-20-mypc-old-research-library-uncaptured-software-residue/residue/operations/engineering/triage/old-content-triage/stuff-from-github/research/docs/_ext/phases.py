from __future__ import annotations

from typing import Dict, List

from docutils import nodes
from sphinx.application import Sphinx
from sphinx.util.docutils import SphinxDirective


class PhaseBadge(SphinxDirective):
    """Inline badge for per-TODO phase metadata (deprecated).

    Historically this directive showed a document-level phase. Phases
    are now attached to individual TODO entries instead, so this
    directive simply renders a neutral badge.
    """

    has_content = False

    def run(self) -> List[nodes.Node]:
        text = "Phase: see TODO entries"
        node = nodes.paragraph()
        badge = nodes.inline(text=text)
        badge["classes"].append("phase-badge")
        node += badge
        return [node]


class PhasedTodoList(SphinxDirective):
    """Grouped TODO list, sorted by phase.

    This directive groups TODO entries collected by the standard
    ``sphinx.ext.todo`` extension according to a per-TODO ``:phase:``
    marker written in the TODO body. If no phase marker is found, the
    TODO is treated as ``released``.

    Convention: the first non-empty line of the TODO body may be a
    phase line of the form::

        :phase: spec-math

    or::

        phase: spec-math
    """

    has_content = False

    def run(self) -> List[nodes.Node]:
        env = self.env

        if not hasattr(env, "todo_all_todos"):
            para = nodes.paragraph()
            para += nodes.Text("No TODO entries found.")
            return [para]

        # Group TODOs by phase, where phase is inferred from the
        # TODO body itself (per-TODO phases).
        by_phase: Dict[str, List[dict]] = {}
        for todo_info in env.todo_all_todos:  # type: ignore[attr-defined]
            raw = todo_info.get("todo", "") or ""
            lines = [ln.rstrip() for ln in raw.splitlines()]

            phase = "released"
            cleaned_lines: List[str] = []
            phase_consumed = False
            for ln in lines:
                stripped = ln.strip()
                if not stripped and not cleaned_lines and not phase_consumed:
                    # Skip leading blank lines.
                    continue
                if (
                    not phase_consumed
                    and stripped.lower().startswith(":phase:")
                ):
                    phase = stripped.split(":", 2)[-1].strip() or "released"
                    phase_consumed = True
                    continue
                if (
                    not phase_consumed
                    and stripped.lower().startswith("phase:")
                ):
                    phase = stripped.split(":", 1)[-1].strip() or "released"
                    phase_consumed = True
                    continue
                cleaned_lines.append(ln)

            todo_info["_phase"] = phase  # for debugging/inspection
            todo_info["_display_text"] = "\n".join(cleaned_lines).strip()
            by_phase.setdefault(phase, []).append(todo_info)

        sections: List[nodes.Node] = []
        for phase in sorted(by_phase.keys()):
            todos = by_phase[phase]
            if not todos:
                continue

            title = nodes.title(text=f"Phase: {phase}")
            section = nodes.section()
            section += title

            bullet_list = nodes.bullet_list()
            for info in todos:
                text = (info.get("_display_text") or info.get("todo", "")).strip()
                docname = info.get("docname", "")
                lineno = info.get("lineno", 0)
                item = nodes.list_item()
                para = nodes.paragraph()

                # Phase badge for this TODO entry (shows up in HTML and PDF).
                badge = nodes.inline(text=f"[{phase}]")
                badge["classes"].append("phase-badge")
                para += badge
                para += nodes.Text(" ")

                # Source location prefix, if available, followed by the TODO text.
                prefix = f"{docname}:{lineno}: " if docname else ""
                para += nodes.Text(prefix + text)

                item += para
                bullet_list += item

            section += bullet_list
            sections.append(section)

        if not sections:
            para = nodes.paragraph()
            para += nodes.Text("No TODO entries found.")
            return [para]

        return sections


def setup(app: Sphinx) -> dict:
    app.add_directive("phase-badge", PhaseBadge)
    app.add_directive("phased-todolist", PhasedTodoList)
    return {
        "version": "0.1",
        "parallel_read_safe": True,
        "parallel_write_safe": True,
    }
