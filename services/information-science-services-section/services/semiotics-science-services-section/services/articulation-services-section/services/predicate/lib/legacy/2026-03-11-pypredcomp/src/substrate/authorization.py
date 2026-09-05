"""Authorization via per-edge accessibility cells — the authz fiber projection.

The substrate stores a single accessibility relation R as a flat catalogue
of :class:`AccessibilityCell` records, partitioned by surface tag
(governance, trust-boundary, federation, capability, authentication,
agent-self-queueing). :func:`box_R` evaluates a request against R at a
(world_from, world_to) edge by truth-meeting the request value with each
matching cell's allowed value, then truth-meeting across parallel edges.
:func:`authz_check` is the convenience wrapper for the authentication
surface used by :func:`substrate.respond.respond`.

Default policy: an absent accessibility relation means closed (deny).
:func:`authz_check` is off by default; :func:`respond` auto-enables it
once the operator installs at least one cell on the authentication surface.

Spec ground:

* ``specs/security/capability-model.md`` — the v0.2 capability fiber spec;
  in particular §"per-stratum capability fiber" for the ``at_stratum``
  scoping enforced by :func:`_matching_cells` / :func:`box_R` /
  :func:`authz_check`.
* ``decisions/authorization-is-modal-restriction.md`` — the unification
  decision: capability discipline, federation trust, persona/personnel
  session-open, governance authority, account auth, and agent
  self-queueing are six engineering surfaces of one substrate primitive,
  $\\Box_R$ (this module's :func:`box_R`).
* ``decisions/capability-not-acl.md`` — the discipline rule: the
  substrate has no ACLs and no ``setuid`` analogue; authority is a
  fiber composed via $\\Rightarrow$ and is non-amplifying by
  construction (``functional-runtime-platform/theorems/capability-non-amplification``).
* ``specs/kernel/respond.md`` §2 — the Phase-0 invocation site: every
  ``respond`` carries a ``sender`` whose authz fiber, projected from
  the boundary entity per
  ``specs/security/user-as-boundary.md`` §2.2 and
  ``decisions/identity-is-boundary-projection.md``, is restricted at
  the (sender → target) edge by :func:`authz_check` before any state
  is mutated.
* Theory grounding: row 2 of ``references/theory-for-developers.md``
  (the adjunction $a \\odot p \\le_t q \\iff p \\le_t (a \\Rightarrow q)$ —
  authorisation IS the $\\Rightarrow$ direction of the adjoint to the
  Phase-3 fusion $\\odot$) and row 8 (capability and authorisation as
  modal restriction; $\\Box_R$ is the substrate-wide primitive).

Restriction is algebraic — no raise. Per
``decisions/capability-not-acl.md`` (the algebra IS the capability
check) and t02-41, neither this module nor the Phase-0 gate in
:mod:`substrate.respond` raises on insufficient authority. A non-TRUE
box value is the algebraic content of "this sender's authority
restricts the requested predicate to $\\bot$" — the gate records the
:class:`AuthzDecision` on the respond context and the pipeline
short-circuits; no event is emitted, no fiber advances. Consumers
inspect ``RespondResult.authz_decision`` for the outcome. The
:data:`substrate.error_codes.PCC_AUTHZ_DENIED` constant is retained
for federation/driver wire compatibility but is no longer raised
anywhere in :mod:`substrate`.
"""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, Field

from substrate.algebra import BilatticeValue, truth_meet
from substrate.canonicalization import canonical, cid

AuthorizationSurface = Literal[
    "governance",
    "trust-boundary",
    "federation",
    "capability",
    "authentication",
    "agent-self-queueing",
]


class AccessibilityCell(BaseModel):
    """One edge (world_from, world_to, allowed_value) on one surface.

    The optional ``at_stratum`` field bounds the cell's applicability to a
    single stratum of the substrate. Per
    ``specs/security/capability-model.md`` §"per-stratum capability fiber"
    and ``specs/security/user-as-boundary.md`` §4: a sender wishing to act
    at the saturated or settled stratum (e.g. retracting a derived cell)
    must hold an accessibility cell whose ``at_stratum`` matches that
    stratum, or whose ``at_stratum`` is ``None`` (legacy stratum-agnostic
    grant — applies at every stratum).
    """

    model_config = ConfigDict(extra="forbid")

    id: str | None = None
    surface: AuthorizationSurface = "authentication"
    world_from: str
    world_to: str
    allowed_value: BilatticeValue = BilatticeValue.TRUE
    # Optional stratum scope per ``specs/security/capability-model.md``
    # §"per-stratum capability fiber". ``None`` = applies at every stratum
    # (legacy v0.2-pre behaviour). Non-None must be a member of the
    # spec'd stratum set; validation is delegated to the consumer
    # (``box_R``) so the gate fails closed on unknown values rather than
    # the cell load failing at parse time.
    at_stratum: str | None = None
    metadata: dict[str, Any] | None = None

    def canonical_body(self) -> dict[str, Any]:
        body = self.model_dump(mode="json")
        body.pop("id", None)
        return body

    def with_id(self) -> "AccessibilityCell":
        return self.model_copy(update={"id": cid(self.canonical_body())})


def write_accessibility(layout: Any, cell: AccessibilityCell) -> tuple[str, Path]:
    """Hash-and-write an accessibility cell. Returns ``(id, path)``."""
    if cell.id is None:
        cell = cell.with_id()
    body = {"id": cell.id, **cell.canonical_body()}
    path = layout.accessibility_path(cell.id)
    layout._atomic_write(path, canonical(body))
    return cell.id, path


def read_accessibility(layout: Any) -> list[AccessibilityCell]:
    """Walk ``$ROOT/accessibility/`` and load every cell."""
    d: Path = layout.accessibility_dir()
    if not d.exists():
        return []
    out: list[AccessibilityCell] = []
    for shard in sorted(d.iterdir()):
        if not shard.is_dir():
            continue
        for f in sorted(shard.iterdir()):
            if not f.is_file() or not f.name.endswith(".json"):
                continue
            body = json.loads(f.read_bytes().decode("utf-8"))
            out.append(AccessibilityCell(**body))
    return out


def has_accessibility_relation(
    layout: Any,
    *,
    surface: AuthorizationSurface | None = None,
) -> bool:
    """True iff at least one accessibility cell exists (optionally on ``surface``).

    Used by :func:`respond` to decide whether to auto-enable the gate;
    surface-aware so installing a single governance cell does not start
    denying every request on the authentication surface.
    """
    d: Path = layout.accessibility_dir()
    if not d.exists():
        return False
    for shard in d.iterdir():
        if not shard.is_dir():
            continue
        for f in shard.iterdir():
            if not (f.is_file() and f.name.endswith(".json")):
                continue
            if surface is None:
                return True
            try:
                body = json.loads(f.read_bytes().decode("utf-8"))
            except (OSError, json.JSONDecodeError):
                continue
            if body.get("surface") == surface:
                return True
    return False


# ---------------------------------------------------------------------------
# Box_R operator
# ---------------------------------------------------------------------------


_VALID_STRATA: frozenset[str] = frozenset({"asserted", "saturated", "settled"})


def _matching_cells(
    cells: list[AccessibilityCell],
    *,
    surface: AuthorizationSurface,
    world_from: str,
    world_to: str,
    stratum: str | None = None,
) -> list[AccessibilityCell]:
    """Per-stratum cell filter.

    A cell with ``at_stratum is None`` matches every request (legacy
    stratum-agnostic grant). A cell with a specific ``at_stratum``
    matches only when ``stratum`` is supplied AND equal. When the caller
    requests a non-None stratum, an accessibility cell whose
    ``at_stratum`` is ``None`` still applies — this lets a deployment
    grant blanket authority without restating every stratum, while
    still letting per-stratum grants exist alongside.
    """
    return [
        c for c in cells
        if c.surface == surface
        and c.world_from == world_from
        and c.world_to == world_to
        and (c.at_stratum is None or c.at_stratum == stratum)
    ]


def box_R(
    *,
    requested_value: BilatticeValue,
    surface: AuthorizationSurface,
    world_from: str,
    world_to: str,
    cells: list[AccessibilityCell],
    stratum: str | None = None,
) -> BilatticeValue:
    """Restrict ``requested_value`` by R at the (world_from → world_to) edge.

    Evaluation: per-edge truth-meet of the request with each matching
    cell's ``allowed_value``, then truth-meet across all parallel edges.
    A pair with no matching cells reduces to truth-meet against ``NONE``
    (default-deny).

    The optional ``stratum`` parameter projects R onto the per-stratum
    sub-relation per ``specs/security/capability-model.md`` §"per-stratum
    capability fiber": only cells whose ``at_stratum`` is ``None`` or
    matches ``stratum`` participate. Unknown stratum values fail closed
    (no cells match → default-deny truth-meet against ``NONE``).

    Why per-edge first: knowledge-join of contradictory grants
    (TRUE + FALSE = BOTH) followed by truth-meet would over-permit
    under contradiction. Per-edge truth-meet bottoms out at FALSE.
    """
    if stratum is not None and stratum not in _VALID_STRATA:
        # Fail closed — an unknown stratum string can never resolve to
        # a grant; treat as "no matching cells" so the gate denies.
        return truth_meet(requested_value, BilatticeValue.NONE)
    matches = _matching_cells(
        cells,
        surface=surface,
        world_from=world_from,
        world_to=world_to,
        stratum=stratum,
    )
    if not matches:
        return truth_meet(requested_value, BilatticeValue.NONE)
    boxed = truth_meet(requested_value, matches[0].allowed_value)
    for c in matches[1:]:
        boxed = truth_meet(boxed, truth_meet(requested_value, c.allowed_value))
    return boxed


# ---------------------------------------------------------------------------
# Authentication-surface convenience
# ---------------------------------------------------------------------------


class AuthzDecision(BaseModel):
    """The outcome of :func:`authz_check`: allow/deny plus the witness data.

    The optional ``stratum`` field records the stratum at which the
    decision was evaluated per ``specs/security/capability-model.md``
    §"per-stratum capability fiber". ``None`` means the decision was
    stratum-agnostic (legacy callers / payload-default asserts).
    """

    model_config = ConfigDict(extra="forbid")

    allowed: bool
    surface: AuthorizationSurface
    world_from: str
    world_to: str
    requested_value: BilatticeValue = BilatticeValue.TRUE
    box_value: BilatticeValue
    matched_cells: list[str] = Field(default_factory=list)
    stratum: str | None = None


def authz_check(
    *,
    layout: Any,
    sender: str,
    target: str,
    surface: AuthorizationSurface = "authentication",
    requested_value: BilatticeValue = BilatticeValue.TRUE,
    stratum: str | None = None,
) -> AuthzDecision:
    """Apply :func:`box_R` at the (sender → target) edge.

    ``allowed`` is True iff the resulting box value is ``TRUE``. Any other
    value (FALSE, NONE, BOTH) denies. A ``BOTH`` outcome indicates a
    contradictory grant — the inconsistency catalogue records it as a
    ⊤-cell; the caller can re-query and inspect ``box_value``.

    The optional ``stratum`` parameter projects the check onto the
    per-stratum capability fiber per
    ``specs/security/capability-model.md`` §"per-stratum capability
    fiber"; cells whose ``at_stratum`` is ``None`` always participate,
    plus cells whose ``at_stratum`` matches ``stratum``.
    ``matched_cells`` is the post-projection set; the licensing
    capability id(s) recorded on a retraction-emit audit-log cell are
    drawn from this list.
    """
    cells = read_accessibility(layout)
    # Mirror ``box_R``'s fail-closed guard: an unknown stratum has an
    # empty match set per ``capability-model.md`` §3a — the witness
    # data must reflect that, otherwise an auditor reading
    # ``matched_cells`` on a denied decision sees grants that did not
    # in fact participate in the projection.
    if stratum is not None and stratum not in _VALID_STRATA:
        matched: list[AccessibilityCell] = []
    else:
        matched = _matching_cells(
            cells,
            surface=surface,
            world_from=sender,
            world_to=target,
            stratum=stratum,
        )
    box_value = box_R(
        requested_value=requested_value,
        surface=surface,
        world_from=sender,
        world_to=target,
        cells=cells,
        stratum=stratum,
    )
    return AuthzDecision(
        allowed=(box_value == BilatticeValue.TRUE),
        surface=surface,
        world_from=sender,
        world_to=target,
        requested_value=requested_value,
        box_value=box_value,
        matched_cells=sorted(c.id for c in matched if c.id is not None),
        stratum=stratum,
    )
