"""Message-language term calculus (per ``specs/kernel/message-language.md``).

A ``respond`` payload is a ``{predicate-id: <value>}`` dict where each
value is either a bilattice value (the common case — wire-form string
or :class:`BilatticeValue` enum) or an expression in the message
language. Each predicate value can be:

* a wire-form bilattice string (``"None"|"True"|"False"|"Both"``);
* a JSON object with one of the term tags below.

Term tags::

    {"@lit":  <BilatticeValue or any literal>}
    {"@var":  "name"}                                # bind from env
    {"@ref":  "<cell_id_or_alias>"}                  # resolve a cell record
    {"@lookup": "<predicate-id>", "in": <term>}      # predicate lookup
    {"@path": ["a", "b", "c"]}                       # nested key path on env
    {"@lambda": ["x", "y"], "body": <term>}          # abstraction
    {"@app":   <fn-term>, "args": [<term>, ...]}     # application
    {"@sigma": [<term>, ...]}                        # ⊙-fold (knowledge_join)
    {"@delta": [<term>, ...]}                        # ∨_t-fold (truth_join)
    {"@negate": <term>}                              # bilattice negation
    {"@fuse":   [<term>, <term>]}                    # Lambek ⊙
    {"@restrict": [<term>, <term>]}                  # Lambek ⇒

Built-in functions (callable via ``@app``): ``"knowledge_join"``,
``"knowledge_meet"``, ``"truth_join"``, ``"truth_meet"``, ``"fuse"``,
``"restrict"``, ``"negate"``, ``"post_close"``, ``"if"`` (3-arg),
``"eq"`` (2-arg, returns ``True``/``False`` bilattice).

The reducer is a small CEK-style step machine: each step decrements
``fuel``; β reduces lambda applications by substitution; η reduces
``{"@lambda": ["x"], "body": {"@app": f, "args": [{"@var":"x"}]}}`` to
``f``. ``PCC_FUEL_EXHAUSTED`` is raised on overflow.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Callable, Mapping

from substrate.algebra import (
    BilatticeValue,
    fuse,
    knowledge_join,
    knowledge_meet,
    negate,
    post_close,
    restrict,
    truth_join,
    truth_meet,
)
from substrate.error_codes import (
    PCC_FUEL_EXHAUSTED,
    PCM_PAYLOAD_INVALID,
    SubstrateError,
)


# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------


@dataclass
class TermEnv:
    """Runtime environment a term can read.

    ``cells`` resolves ``@ref`` to a cell-record dict (predicates only is
    fine for v0.1). ``vars`` holds lambda bindings. ``fiber_predicates``
    holds the cell currently being constructed (so terms can reference
    predicates that earlier rules have raised in the same closure cycle).
    """

    cells: Mapping[str, Mapping[str, Any]] = field(default_factory=dict)
    vars: dict[str, Any] = field(default_factory=dict)
    fiber_predicates: Mapping[str, BilatticeValue] = field(default_factory=dict)
    parent_predicates: Mapping[str, BilatticeValue] = field(default_factory=dict)

    def extend(self, **bindings: Any) -> "TermEnv":
        return TermEnv(
            cells=self.cells,
            vars={**self.vars, **bindings},
            fiber_predicates=self.fiber_predicates,
            parent_predicates=self.parent_predicates,
        )


# ---------------------------------------------------------------------------
# Builtins
# ---------------------------------------------------------------------------


def _bv(x: Any) -> BilatticeValue:
    if isinstance(x, BilatticeValue):
        return x
    if isinstance(x, str):
        return BilatticeValue(x)
    raise SubstrateError(PCM_PAYLOAD_INVALID, f"expected bilattice value, got {x!r}")


def _builtin_if(cond: Any, then_: Any, else_: Any) -> Any:
    c = _bv(cond)
    return then_ if c is BilatticeValue.TRUE or c is BilatticeValue.BOTH else else_


def _builtin_eq(a: Any, b: Any) -> BilatticeValue:
    return BilatticeValue.TRUE if a == b else BilatticeValue.FALSE


BUILTINS: dict[str, Callable[..., Any]] = {
    "knowledge_join": lambda a, b: knowledge_join(_bv(a), _bv(b)),
    "knowledge_meet": lambda a, b: knowledge_meet(_bv(a), _bv(b)),
    "truth_join": lambda a, b: truth_join(_bv(a), _bv(b)),
    "truth_meet": lambda a, b: truth_meet(_bv(a), _bv(b)),
    "fuse": lambda a, b: fuse(_bv(a), _bv(b)),
    "restrict": lambda a, b: restrict(_bv(a), _bv(b)),
    "negate": lambda a: negate(_bv(a)),
    "post_close": lambda a: post_close(_bv(a)),
    "if": _builtin_if,
    "eq": _builtin_eq,
}


# ---------------------------------------------------------------------------
# Lambda value (η-reducible)
# ---------------------------------------------------------------------------


@dataclass(frozen=True)
class Lambda:
    """First-class function value in the message language."""

    params: tuple[str, ...]
    body: Any
    env_snapshot: tuple[tuple[str, Any], ...] = ()

    def apply(self, args: list[Any], reducer: "Reducer") -> Any:
        if len(args) != len(self.params):
            raise SubstrateError(
                PCM_PAYLOAD_INVALID,
                f"lambda arity {len(self.params)} got {len(args)} args",
            )
        env = TermEnv(
            cells=reducer.env.cells,
            vars={**dict(self.env_snapshot), **dict(zip(self.params, args))},
            fiber_predicates=reducer.env.fiber_predicates,
            parent_predicates=reducer.env.parent_predicates,
        )
        sub = Reducer(env=env, fuel_remaining=reducer.fuel_remaining)
        result = sub.reduce(self.body)
        reducer.fuel_remaining = sub.fuel_remaining
        return result


# ---------------------------------------------------------------------------
# Reducer
# ---------------------------------------------------------------------------


def _is_term(obj: Any) -> bool:
    return isinstance(obj, dict) and any(k.startswith("@") for k in obj.keys())


def _term_tag(obj: dict) -> str:
    tags = [k for k in obj.keys() if k.startswith("@")]
    if len(tags) != 1:
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"a term must carry exactly one @-tag, got {tags}",
        )
    return tags[0]


@dataclass
class Reducer:
    """Single-shot reducer. ``reduce(term)`` returns the value (β/η normal)."""

    env: TermEnv
    fuel_remaining: int = 1024

    def _spend(self) -> None:
        self.fuel_remaining -= 1
        if self.fuel_remaining < 0:
            raise SubstrateError(
                PCC_FUEL_EXHAUSTED,
                "message-language reduction exhausted fuel",
            )

    def reduce(self, term: Any) -> Any:
        # Literal pass-through (non-dict, or dict without @tags).
        if not _is_term(term):
            return term

        self._spend()
        tag = _term_tag(term)

        if tag == "@lit":
            v = term["@lit"]
            if isinstance(v, str):
                try:
                    return BilatticeValue(v)
                except ValueError:
                    return v
            return v

        if tag == "@var":
            name = term["@var"]
            if name not in self.env.vars:
                raise SubstrateError(PCM_PAYLOAD_INVALID, f"unbound variable {name!r}")
            return self.env.vars[name]

        if tag == "@ref":
            ref = term["@ref"]
            cell = self.env.cells.get(ref)
            if cell is None:
                raise SubstrateError(PCM_PAYLOAD_INVALID, f"reference {ref!r} not resolvable")
            return dict(cell)

        if tag == "@lookup":
            pred = term["@lookup"]
            container = self.reduce(term.get("in", {"@var": "self"}))
            if isinstance(container, dict):
                if "predicates" in container and isinstance(container["predicates"], dict):
                    container = container["predicates"]
                v = container.get(pred, BilatticeValue.NONE.value)
                if isinstance(v, str):
                    try:
                        return BilatticeValue(v)
                    except ValueError:
                        return v
                return v
            raise SubstrateError(PCM_PAYLOAD_INVALID, f"@lookup target is not a dict")

        if tag == "@path":
            path = term["@path"]
            cur: Any = self.env.vars.get("self") or dict(self.env.fiber_predicates)
            for seg in path:
                if isinstance(cur, dict):
                    cur = cur.get(seg)
                else:
                    raise SubstrateError(PCM_PAYLOAD_INVALID, f"@path traversed past leaf at {seg!r}")
            return cur

        if tag == "@lambda":
            params = term["@lambda"]
            if isinstance(params, str):
                params = (params,)
            else:
                params = tuple(params)
            body = term.get("body")
            if body is None:
                raise SubstrateError(PCM_PAYLOAD_INVALID, "@lambda missing 'body'")
            # η reduction: λx. f(x) → f when f does not use x free.
            if (
                len(params) == 1
                and _is_term(body)
                and _term_tag(body) == "@app"
            ):
                args = body.get("args", [])
                if (
                    len(args) == 1
                    and _is_term(args[0])
                    and _term_tag(args[0]) == "@var"
                    and args[0]["@var"] == params[0]
                    and not _free_in(body["@app"], params[0])
                ):
                    return self.reduce(body["@app"])
            return Lambda(
                params=params,
                body=body,
                env_snapshot=tuple(self.env.vars.items()),
            )

        if tag == "@app":
            fn = self.reduce(term["@app"])
            args = [self.reduce(a) for a in term.get("args", [])]
            if isinstance(fn, str):
                if fn not in BUILTINS:
                    raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown builtin {fn!r}")
                return BUILTINS[fn](*args)
            if isinstance(fn, Lambda):
                return fn.apply(args, self)
            raise SubstrateError(PCM_PAYLOAD_INVALID, f"@app head is not callable: {fn!r}")

        if tag == "@sigma":
            vals = [_bv(self.reduce(t)) for t in term["@sigma"]]
            if not vals:
                return BilatticeValue.NONE
            out = vals[0]
            for v in vals[1:]:
                out = knowledge_join(out, v)
            return out

        if tag == "@delta":
            vals = [_bv(self.reduce(t)) for t in term["@delta"]]
            if not vals:
                return BilatticeValue.NONE
            out = vals[0]
            for v in vals[1:]:
                out = truth_join(out, v)
            return out

        if tag == "@negate":
            return negate(_bv(self.reduce(term["@negate"])))

        if tag == "@fuse":
            args = term["@fuse"]
            return fuse(_bv(self.reduce(args[0])), _bv(self.reduce(args[1])))

        if tag == "@restrict":
            args = term["@restrict"]
            return restrict(_bv(self.reduce(args[0])), _bv(self.reduce(args[1])))

        raise SubstrateError(PCM_PAYLOAD_INVALID, f"unknown term tag {tag!r}")


def _free_in(term: Any, var: str) -> bool:
    """True if ``var`` appears free in ``term`` (used for η-reduction)."""
    if not _is_term(term):
        return False
    tag = _term_tag(term)
    if tag == "@var":
        return term["@var"] == var
    if tag == "@lambda":
        params = term["@lambda"]
        params = (params,) if isinstance(params, str) else tuple(params)
        if var in params:
            return False
        return _free_in(term.get("body"), var)
    for v in term.values():
        if isinstance(v, list):
            if any(_free_in(x, var) for x in v):
                return True
        elif _free_in(v, var):
            return True
    return False


# ---------------------------------------------------------------------------
# High-level helpers used by ``respond`` and the closure engine
# ---------------------------------------------------------------------------


def reduce_to_bilattice(term: Any, env: TermEnv, fuel: int = 1024) -> BilatticeValue:
    """Reduce ``term`` and coerce the result to a :class:`BilatticeValue`."""
    r = Reducer(env=env, fuel_remaining=fuel)
    out = r.reduce(term)
    return _bv(out)


def reduce_payload(
    payload: dict[str, Any],
    env: TermEnv,
    *,
    fuel: int = 1024,
) -> tuple[dict[str, BilatticeValue], int]:
    """Reduce every value of a respond payload to a BilatticeValue.

    Accepts any of the canonical value shapes:

    * ``{"pred": "True"}`` — wire-form bilattice string (the common case)
    * ``{"pred": {"@lit": "True"}}`` — explicit literal term
    * ``{"pred": {"@app": "knowledge_join", "args": [...]}}`` — full term

    Returns ``(reduced_payload, fuel_remaining)``.
    """
    out: dict[str, BilatticeValue] = {}
    r = Reducer(env=env, fuel_remaining=fuel)
    for k, v in payload.items():
        if not isinstance(k, str):
            raise SubstrateError(PCM_PAYLOAD_INVALID, f"non-string predicate key {k!r}")
        if isinstance(v, BilatticeValue):
            out[k] = v
            continue
        if isinstance(v, str):
            try:
                out[k] = BilatticeValue(v)
            except ValueError as e:
                raise SubstrateError(
                    PCM_PAYLOAD_INVALID,
                    f"predicate {k!r} value {v!r} not a BilatticeValue",
                ) from e
            continue
        if isinstance(v, dict) and any(key.startswith("@") for key in v.keys()):
            reduced = r.reduce(v)
            out[k] = _bv(reduced)
            continue
        raise SubstrateError(
            PCM_PAYLOAD_INVALID,
            f"predicate {k!r} value {v!r} is neither a BilatticeValue nor a term",
        )
    return out, r.fuel_remaining
