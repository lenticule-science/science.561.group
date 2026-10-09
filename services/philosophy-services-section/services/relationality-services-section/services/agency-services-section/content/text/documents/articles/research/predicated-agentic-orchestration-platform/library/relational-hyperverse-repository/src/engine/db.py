"""SQLite engine with WAL mode. Single shared engine per process."""
from __future__ import annotations

from pathlib import Path
from sqlalchemy import text
from sqlmodel import SQLModel, Session, create_engine

REPO_DIR = Path(__file__).parent.parent.parent
DB_PATH = REPO_DIR / "src" / "engine" / "_repo.db"   # generated, not committed

_engine = None


def get_engine():
    global _engine
    if _engine is None:
        _engine = _build_engine()
    return _engine


def _build_engine(path: Path = DB_PATH):
    path.parent.mkdir(parents=True, exist_ok=True)

    engine = create_engine(
        f"sqlite:///{path}",
        echo=False,
        connect_args={"check_same_thread": False},
    )

    with engine.connect() as conn:
        conn.execute(text("PRAGMA journal_mode=WAL"))
        conn.execute(text("PRAGMA synchronous=NORMAL"))
        conn.execute(text("PRAGMA foreign_keys=ON"))
        conn.commit()

    # Import Unit so SQLModel.metadata is fully populated
    from src.engine.models.unit import Unit  # noqa: F401
    SQLModel.metadata.create_all(engine)
    return engine


def new_session() -> Session:
    return Session(get_engine())
