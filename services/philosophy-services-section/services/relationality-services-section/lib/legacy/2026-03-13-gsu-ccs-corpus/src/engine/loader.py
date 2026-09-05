"""Load all department context files from markdown into the Unit table.

Run once at engine startup (or to reset DB to file state).
Idempotent: clears all Unit records then reloads from markdown.
"""
from __future__ import annotations

import re
from pathlib import Path

from sqlmodel import Session, delete

from src.engine.db import get_engine
import yaml

from src.engine.models.unit import (
    Unit,
    ContentFileUnit,
    IdeaContent,
    MemoryEntryContent,
    MessageContent,
    PrincipleContent,
    RawSectionContent,
    RunbookContent,
    WorkflowContent,
    WorkItemContent,
    WorkUnitContent,
)

REPO_DIR = Path(__file__).parent.parent.parent
DEPARTMENTS = ["root", "math", "proof", "spec", "src"]


def dept_path(dept: str, filename: str) -> Path:
    if dept == "root":
        return REPO_DIR / filename
    return REPO_DIR / dept / filename


def load_all() -> None:
    """Clear Unit table and reload from all markdown files."""
    with Session(get_engine()) as session:
        session.exec(delete(Unit))
        for dept in DEPARTMENTS:
            _load_inbox(dept, session)
            _load_plans(dept, session)
            _load_memory(dept, session)
            _load_soul(dept, session)
            _load_ideas(dept, session)
        _load_content_dir(REPO_DIR / "math",     "MathUnit", "math", session)
        _load_content_dir(REPO_DIR / "spec",     "SpecUnit", "spec", session)
        _load_content_dir(REPO_DIR / "skills",   "Skill",    "root", session)
        _load_content_dir(REPO_DIR / "math" / "skills", "Skill", "math", session)
        _load_content_dir(REPO_DIR / "spec" / "skills", "Skill", "spec", session)
        _load_content_dir(REPO_DIR / "src"  / "skills", "Skill", "src",  session)
        _load_runbooks(session)
        session.commit()


# ------------------------------------------------------------------
# INBOX.md  ->  kind: Message
# ------------------------------------------------------------------

def _load_inbox(dept: str, session: Session) -> None:
    path = dept_path(dept, "INBOX.md")
    if not path.exists():
        return
    text = path.read_text(encoding="utf-8")
    for i, chunk in enumerate(re.split(r"\n(?=### Message\b)", text)):
        unit = _parse_message(chunk, dept)
        if unit:
            session.add(unit)
        elif chunk.strip() and not chunk.strip().startswith("#"):
            session.add(Unit.make("RawSection", dept, RawSectionContent(
                heading=f"INBOX malformed chunk {i}",
                body=chunk.strip(),
                sort_order=i,
                malformed=True,
            )))


def _parse_message(chunk: str, department: str) -> Unit | None:
    if not chunk.startswith("### Message"):
        return None

    def _field(name: str) -> str:
        m = re.search(rf"^- {name}: (.+)$", chunk, re.MULTILINE)
        return m.group(1).strip() if m else ""

    from_dept = _field("from")
    date      = _field("date")
    msg_type  = _field("type")
    if not from_dept or not date or not msg_type:
        return None

    urgency  = _field("urgency") or "Normal"
    subject  = _field("subject")
    status   = _field("status") or "unread"

    body_m = re.search(r"(?:^- \w+: .+\n)+\n(.+)", chunk, re.DOTALL | re.MULTILINE)
    body   = body_m.group(1).strip() if body_m else ""

    return Unit.make("Message", department, MessageContent(
        from_department=from_dept,
        date=date,
        msg_type=msg_type,
        urgency=urgency,
        subject=subject,
        status=status,
        body=body,
    ))


# ------------------------------------------------------------------
# PLANS.md  ->  kind: WorkItem | Workflow | WorkUnit | RawSection
# ------------------------------------------------------------------

def _load_plans(dept: str, session: Session) -> None:
    path = dept_path(dept, "PLANS.md")
    if not path.exists():
        return
    text = path.read_text(encoding="utf-8")

    raw_sections = re.split(r"\n(?=## )", text)
    sort = 0

    preamble = raw_sections[0].strip()
    if preamble and not preamble.startswith("#"):
        session.add(Unit.make("RawSection", dept, RawSectionContent(
            heading="preamble", body=preamble, sort_order=-1
        )))

    for section in raw_sections[1:]:
        heading_m = re.match(r"## (.+)", section)
        if not heading_m:
            continue
        heading = heading_m.group(1).strip()

        subsections = re.split(r"\n(?=### )", section)
        for sub in subsections[1:]:
            sub_m = re.match(r"### (.+)", sub)
            if not sub_m:
                continue
            sub_heading = sub_m.group(1).strip()

            produces_m = re.search(r"\*\*Produces:\*\* (.+)", sub)
            action_m   = re.search(r"\*\*Action:\*\* (.+)", sub)

            if produces_m:
                # Workflow format (math/proof style)
                complete_m = re.search(r"\*\*Complete when:\*\* (.+)", sub)
                status_m   = re.search(r"\*\*Status:\*\* (.+)", sub)
                wf = Unit.make("Workflow", dept, WorkflowContent(
                    name=sub_heading,
                    produces=produces_m.group(1).strip(),
                    complete_when=complete_m.group(1).strip() if complete_m else "",
                    status=status_m.group(1).strip() if status_m else "open",
                ))
                session.add(wf)

                for order, (done_char, wu_text) in enumerate(
                    re.findall(r"- \[([ x])\] (.+)", sub)
                ):
                    session.add(Unit.make("WorkUnit", dept, WorkUnitContent(
                        workflow_name=sub_heading,
                        text=wu_text.strip(),
                        done=(done_char == "x"),
                        sort_order=order,
                    )))

            elif action_m:
                # WorkItem format (spec/root/src style)
                added_m      = re.search(r"\*\*Added:\*\* (.+)", sub)
                status_m     = re.search(r"\*\*Status:\*\* (.+)", sub)
                why_m        = re.search(r"\*\*Why:\*\* (.+)", sub)
                why_block_m  = re.search(r"\*\*Why blocked:\*\* (.+)", sub)
                session.add(Unit.make("WorkItem", dept, WorkItemContent(
                    identifier=sub_heading,
                    added=added_m.group(1).strip() if added_m else "",
                    status=status_m.group(1).strip() if status_m else "open",
                    action=action_m.group(1).strip(),
                    why=why_m.group(1).strip() if why_m else "",
                    why_blocked=why_block_m.group(1).strip() if why_block_m else "",
                )))

            else:
                # Unknown sub-section -- preserve as RawSection
                session.add(Unit.make("RawSection", dept, RawSectionContent(
                    heading=f"{heading} / {sub_heading}",
                    body=sub,
                    sort_order=sort,
                )))
            sort += 1

        if len(subsections) == 1:
            session.add(Unit.make("RawSection", dept, RawSectionContent(
                heading=heading,
                body=section,
                sort_order=sort,
            )))
            sort += 1


# ------------------------------------------------------------------
# MEMORY.md  ->  kind: MemoryEntry
# ------------------------------------------------------------------

def _load_memory(dept: str, session: Session) -> None:
    path = dept_path(dept, "MEMORY.md")
    if not path.exists():
        return
    text = path.read_text(encoding="utf-8")
    for i, section in enumerate(re.split(r"\n(?=## )", text)[1:]):
        # Accept both -- (ASCII) and en/em-dash separators from older files
        m = re.match(r"## (\d{4}-\d{2}-\d{2}) (?:--|[\u2013\u2014]) (.+)", section)
        if not m:
            session.add(Unit.make("RawSection", dept, RawSectionContent(
                heading=f"MEMORY malformed section {i}",
                body=section.strip(),
                sort_order=i,
                malformed=True,
            )))
            continue
        date, topic = m.group(1), m.group(2).strip()
        body = section[m.end():].strip()
        session.add(Unit.make("MemoryEntry", dept, MemoryEntryContent(
            date=date, topic=topic, body=body
        )))


# ------------------------------------------------------------------
# SOUL.md  ->  kind: Principle
# ------------------------------------------------------------------

def _load_soul(dept: str, session: Session) -> None:
    path = dept_path(dept, "SOUL.md")
    if not path.exists():
        return
    text = path.read_text(encoding="utf-8")
    for section in re.split(r"\n(?=## )", text)[1:]:
        m = re.match(r"## (.+)", section)
        if not m:
            continue
        name = m.group(1).strip()
        body = section[m.end():].strip()
        session.add(Unit.make("Principle", dept, PrincipleContent(
            name=name, body=body
        )))


# ------------------------------------------------------------------
# IDEAS.md  ->  kind: Idea
# ------------------------------------------------------------------

def _load_ideas(dept: str, session: Session) -> None:
    path = dept_path(dept, "IDEAS.md")
    if not path.exists():
        return
    text = path.read_text(encoding="utf-8")

    done_m = re.search(r"## Done[^\n]*\n(.*?)(?=\n## |\Z)", text, re.DOTALL)
    if done_m:
        for idea_text, output_file in re.findall(
            r"\| ([^|]+) \| (`?[^|`]+`?) \|", done_m.group(1)
        ):
            if idea_text.strip() in ("Idea", "---", "-"):
                continue
            session.add(Unit.make("Idea", dept, IdeaContent(
                text=idea_text.strip(),
                done=True,
                output_file=output_file.strip().strip("`"),
            )))

    active_text = text[:done_m.start()] if done_m else text
    for chunk in re.split(r"\n---\n", active_text):
        chunk = chunk.strip()
        if not chunk or chunk.startswith("#"):
            continue
        session.add(Unit.make("Idea", dept, IdeaContent(text=chunk, done=False)))


# ------------------------------------------------------------------
# Content dirs (math/, spec/, skills/)  ->  MathUnit | SpecUnit | Skill
# ------------------------------------------------------------------

def _load_content_dir(directory: Path, kind: str, dept: str, session: Session) -> None:
    """Load all .md files in directory (non-recursive) as ContentFileUnit."""
    if not directory.exists():
        return
    for path in sorted(directory.glob("*.md")):
        _load_content_file(path, kind, dept, session)


def _load_content_file(path: Path, kind: str, dept: str, session: Session) -> None:
    text = path.read_text(encoding="utf-8")
    frontmatter: dict = {}
    body = text

    if text.startswith("---"):
        end = text.find("\n---", 3)
        if end != -1:
            try:
                frontmatter = yaml.safe_load(text[3:end]) or {}
            except Exception:
                pass
            body = text[end + 4:].strip()

    rel_path = str(path.relative_to(REPO_DIR))
    session.add(Unit.make(kind, dept, ContentFileUnit(
        id=str(frontmatter.get("id", path.stem)),
        description=str(frontmatter.get("description", "")),
        body=body,
        source_path=rel_path,
    )))


# ------------------------------------------------------------------
# runbooks/  ->  kind: Runbook
# ------------------------------------------------------------------

def _load_runbooks(session: Session) -> None:
    runbooks_dir = REPO_DIR / "runbooks"
    if not runbooks_dir.exists():
        return
    for path in sorted(runbooks_dir.glob("*.yaml")):
        try:
            source = path.read_text(encoding="utf-8")
            parsed = yaml.safe_load(source)
            session.add(Unit.make("Runbook", "root", RunbookContent(
                skill_closure_kind=parsed.get("skill-closure-kind", "process"),
                inputs=parsed.get("inputs", []),
                outputs=parsed.get("outputs", []),
                steps=parsed.get("steps", []),
                source_yaml=source,
            )))
        except Exception:
            pass
