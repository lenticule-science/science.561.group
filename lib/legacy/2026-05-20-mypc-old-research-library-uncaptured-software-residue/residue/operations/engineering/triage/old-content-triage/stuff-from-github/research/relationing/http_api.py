"""
FastAPI application exposing the relational core over HTTP.

This module defines a small JSON/HTTP surface on top of the finite
BoolHA and ThreeHA models and the λ_R language, using the calculator
helpers in :mod:`relationing.core` as its engine.

The service is intentionally minimal and focuses on:

- Heyting-formula evaluation in BoolHA and ThreeHA;
- λ_R sequent validity checks; and
- denotation of a small fragment of closed λ_R terms.

It is designed to be served via an ASGI server such as ``uvicorn``:

    uvicorn relationing.http_api:app
"""

from __future__ import annotations

from pathlib import Path
from typing import Literal, Sequence

from fastapi import FastAPI, HTTPException
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel

from relationing.core import (
    BoolHA,
    ThreeHA,
    Type,
    Term,
    bool_sequent_valid,
    denote_in_bool_structure,
    denote_in_three_structure,
    three_sequent_valid,
)


CarrierName = Literal["bool", "three"]


class TypeExpr(BaseModel):
    """JSON representation of a λ_R Type."""

    kind: Literal["atom", "bottom", "top", "and", "or", "imp"]
    atom: str | None = None
    left: "TypeExpr | None" = None
    right: "TypeExpr | None" = None

    def to_type(self) -> Type:
        if self.kind == "atom":
            if not self.atom:
                raise ValueError("atom type requires a name")
            return Type.atom(self.atom)
        if self.kind == "bottom":
            return Type.bottom()
        if self.kind == "top":
            return Type.top()
        if self.kind in ("and", "or", "imp"):
            if self.left is None or self.right is None:
                raise ValueError(f"{self.kind} type requires left and right")
            left = self.left.to_type()
            right = self.right.to_type()
            if self.kind == "and":
                return Type.and_(left, right)
            if self.kind == "or":
                return Type.or_(left, right)
            return Type.imp(left, right)
        raise ValueError(f"unknown type kind {self.kind!r}")


TypeExpr.update_forward_refs()


class TermExpr(BaseModel):
    """JSON representation of a small fragment of λ_R terms.

    Currently supported tags:
    - ``star``: the ⊤ inhabitant;
    - ``reflex``: reflex(t) for a nested term;
    - ``pair``: binary product of two terms;
    - ``fst`` / ``snd``: projections from a pair.
    """

    tag: Literal["star", "reflex", "pair", "fst", "snd"]
    inner: "TermExpr | None" = None
    left: "TermExpr | None" = None
    right: "TermExpr | None" = None

    def to_term(self) -> Term:
        if self.tag == "star":
            return Term.star()
        if self.tag == "reflex":
            if self.inner is None:
                raise ValueError("reflex term requires an inner term")
            return Term.reflex(self.inner.to_term())
        if self.tag == "pair":
            if self.left is None or self.right is None:
                raise ValueError("pair term requires left and right terms")
            return Term.pair(self.left.to_term(), self.right.to_term())
        if self.tag == "fst":
            if self.inner is None:
                raise ValueError("fst term requires an inner term")
            return Term.fst(self.inner.to_term())
        if self.tag == "snd":
            if self.inner is None:
                raise ValueError("snd term requires an inner term")
            return Term.snd(self.inner.to_term())
        raise ValueError(f"unsupported term tag {self.tag!r}")


TermExpr.update_forward_refs()


class HeytingEvaluateRequest(BaseModel):
    carrier: CarrierName
    formula: TypeExpr
    atoms: Sequence[str]


class HeytingEvaluateResponse(BaseModel):
    carrier: CarrierName
    valid: bool


class SequentRequest(BaseModel):
    carrier: CarrierName
    assumptions: Sequence[TypeExpr]
    conclusion: TypeExpr
    atoms: Sequence[str]


class SequentResponse(BaseModel):
    carrier: CarrierName
    valid: bool


class DenoteRequest(BaseModel):
    carrier: CarrierName
    term: TermExpr


class DenoteResponse(BaseModel):
    carrier: CarrierName
    value: bool | int


app = FastAPI(title="Relational Core HTTP API", version="0.1.0")


_DOCS_HTML_DIR = Path(__file__).resolve().parent.parent / "docs" / "_build" / "html"

if _DOCS_HTML_DIR.exists():
    app.mount(
        "/sphinx",
        StaticFiles(directory=str(_DOCS_HTML_DIR), html=True),
        name="sphinx-docs",
    )


def _check_atoms(atoms: Sequence[str]) -> None:
    if len(set(atoms)) != len(list(atoms)):
        raise HTTPException(status_code=400, detail="atom names must be distinct")


@app.post("/api/v1/heyting/evaluate", response_model=HeytingEvaluateResponse)
def heyting_evaluate(req: HeytingEvaluateRequest) -> HeytingEvaluateResponse:
    """Check whether a formula is valid in the chosen carrier."""

    _check_atoms(req.atoms)
    ty = req.formula.to_type()
    if req.carrier == "bool":
        valid = bool_sequent_valid([], ty, list(req.atoms))
    elif req.carrier == "three":
        valid = three_sequent_valid([], ty, list(req.atoms))
    else:  # pragma: no cover - guarded by CarrierName
        raise HTTPException(status_code=400, detail="unknown carrier")
    return HeytingEvaluateResponse(carrier=req.carrier, valid=valid)


@app.post("/api/v1/lambda/sequent-valid", response_model=SequentResponse)
def lambda_sequent_valid(req: SequentRequest) -> SequentResponse:
    """Check Γ ⊢ A in a finite Heyting model."""

    _check_atoms(req.atoms)
    assumptions = [t.to_type() for t in req.assumptions]
    conclusion = req.conclusion.to_type()
    if req.carrier == "bool":
        valid = bool_sequent_valid(assumptions, conclusion, list(req.atoms))
    elif req.carrier == "three":
        valid = three_sequent_valid(assumptions, conclusion, list(req.atoms))
    else:  # pragma: no cover - guarded by CarrierName
        raise HTTPException(status_code=400, detail="unknown carrier")
    return SequentResponse(carrier=req.carrier, valid=valid)


@app.post("/api/v1/lambda/denote", response_model=DenoteResponse)
def lambda_denote(req: DenoteRequest) -> DenoteResponse:
    """Denote a closed λ_R term in a finite model."""

    term = req.term.to_term()
    if req.carrier == "bool":
        v: BoolHA = denote_in_bool_structure(term)
        return DenoteResponse(carrier="bool", value=v.value)
    if req.carrier == "three":
        v3: ThreeHA = denote_in_three_structure(term)
        return DenoteResponse(carrier="three", value=v3.value)
    raise HTTPException(status_code=400, detail="unknown carrier")


__all__ = [
    "app",
    "TypeExpr",
    "TermExpr",
    "HeytingEvaluateRequest",
    "HeytingEvaluateResponse",
    "SequentRequest",
    "SequentResponse",
    "DenoteRequest",
    "DenoteResponse",
]
