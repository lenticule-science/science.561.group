"""Boot sequence — 9 phases per ``specs/init-boot/boot-sequence.md``.

The runtime calls :func:`boot` once on startup; ``ready`` requires every
phase to succeed. Any failure transitions to ``degraded`` and surfaces on
``/health/ready``.
"""

from __future__ import annotations

import logging
import os
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

from init_boot.bootstrap_users import (
    BootstrapResult,
    default_manifest,
    ensure_users_from_manifest,
    load_manifest_from_env,
    persist_captain_token,
)
from init_boot.fiber_reconcile import reconcile_fibers
from init_boot.personnel_migration import migrate_personnel_to_boundary
from init_boot.runlevels import Runlevel, read_runlevel, write_runlevel
from init_boot.self_test import SelfTestReport, run_self_test
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout

log = logging.getLogger("substrate.boot")


@dataclass
class BootContext:
    root: Path
    node_id: str
    port: int
    host: str
    layout: StorageLayout = field(init=False)
    event_log: EventLog = field(init=False)
    self_test: SelfTestReport | None = None
    phase_log: list[dict[str, Any]] = field(default_factory=list)
    config: dict[str, Any] = field(default_factory=dict)
    failed_phase: str | None = None
    runlevel: Runlevel = Runlevel.STOPPED
    bootstrap_user_slug: str | None = None
    bootstrap_user_created: bool = False
    bootstrap_result: BootstrapResult | None = None
    personnel_migration_summary: dict[str, Any] | None = None

    def __post_init__(self):
        self.layout = StorageLayout(self.root)
        self.event_log = EventLog(self.root)


def _record(ctx: BootContext, phase: str, ok: bool, **details) -> None:
    entry = {"phase": phase, "ok": ok, "wall_clock_ns": time.time_ns(), **details}
    ctx.phase_log.append(entry)
    log.info("[boot] %-25s ok=%s %s", phase, ok, " ".join(f"{k}={v}" for k, v in details.items()))


def _phase_container_check(ctx: BootContext) -> bool:
    # We just check that root path is writable.
    try:
        ctx.root.mkdir(parents=True, exist_ok=True)
        probe = ctx.root / ".write-probe"
        probe.write_text("ok", encoding="utf-8")
        probe.unlink()
        _record(ctx, "container_check", True, root=str(ctx.root))
        return True
    except OSError as e:
        _record(ctx, "container_check", False, error=str(e))
        return False


def _phase_persistent_attach(ctx: BootContext) -> bool:
    try:
        ctx.layout.ensure_dirs()
        cleaned = ctx.layout.cleanup_tmp()
        _record(ctx, "persistent_attach", True, tmp_cleaned=cleaned)
        return True
    except Exception as e:
        _record(ctx, "persistent_attach", False, error=str(e))
        return False


def _phase_identity_activate(ctx: BootContext) -> bool:
    try:
        existing = ctx.layout.read_config() or {}
        config = {
            "node_id": ctx.node_id,
            "spec": "substrate-v0.1",
            "host": ctx.host,
            "port": ctx.port,
            "boot_count": int(existing.get("boot_count", 0)) + 1,
        }
        ctx.layout.write_config(config)
        ctx.config = config
        _record(ctx, "identity_activate", True, node_id=ctx.node_id, boot_count=config["boot_count"])
        return True
    except Exception as e:
        _record(ctx, "identity_activate", False, error=str(e))
        return False


def _phase_log_attach(ctx: BootContext) -> bool:
    try:
        head = ctx.event_log.initialize(node_id=ctx.node_id, wall_clock_ns=time.time_ns())
        _record(ctx, "log_attach", True, head_ord=head["ord"], height=ctx.event_log.height())
        return True
    except Exception as e:
        _record(ctx, "log_attach", False, error=str(e))
        return False


def _phase_fiber_reconcile(ctx: BootContext) -> bool:
    """Phase 3 step 2 — fiber-cache reconcile against event-log truth.

    Per [boot-sequence.md §4.2](../../docs/dev/specs/init-boot/boot-sequence.md):
    fiber caches are structurally rebuild-from-truth; any divergence
    between the rebuilt projection and the on-disk projection raises
    ``PCC_PROJECTION_DIVERGED`` and the boot transitions to ``degraded``
    rather than trusting potentially-stale cache.

    We therefore call :func:`reconcile_fibers` with ``strict=True``: any
    history mismatch (including a missing fiber where the log has
    asserted events) is reported, the phase records the failure, and
    boot reports degraded. Subsequent reads will rebuild on demand.
    """
    try:
        repaired = reconcile_fibers(
            layout=ctx.layout, event_log=ctx.event_log, strict=True,
        )
        _record(
            ctx, "fiber_reconcile", True,
            entities_scanned=repaired["scanned"],
            entities_repaired=len(repaired["repaired"]),
        )
        return True
    except Exception as e:
        _record(ctx, "fiber_reconcile", False, error=str(e))
        return False


def _phase_bootstrap_load(ctx: BootContext) -> bool:
    # v0.1 has no bootstrap rules required — the runtime auto-loads any rules
    # already present in $ROOT/rules/.
    try:
        rules_root = ctx.root / "rules"
        count = sum(1 for _ in rules_root.rglob("*.json")) if rules_root.exists() else 0
        _record(ctx, "bootstrap_load", True, rules_present=count)
        return True
    except Exception as e:
        _record(ctx, "bootstrap_load", False, error=str(e))
        return False


def _phase_rule_activate(ctx: BootContext) -> bool:
    # Rules become "active" by inclusion in active_rule_ids passed to respond().
    # The runtime caches that set; here we just announce success.
    _record(ctx, "rule_activate", True)
    return True


def _phase_runlevel_substrate_only(ctx: BootContext) -> bool:
    """Promote to runlevel 1 (substrate-only). Kernel + filesystem live.

    Audited: a ``runlevel-transition`` event is appended so the 0→1
    boundary leaves a trail just like every later transition does.
    """
    try:
        write_runlevel(
            ctx.layout, Runlevel.SUBSTRATE_ONLY,
            event_log=ctx.event_log, node_id=ctx.node_id,
        )
        ctx.runlevel = Runlevel.SUBSTRATE_ONLY
        _record(ctx, "runlevel_substrate_only", True, level=1)
        return True
    except Exception as e:
        _record(ctx, "runlevel_substrate_only", False, error=str(e))
        return False


def _phase_self_test(ctx: BootContext) -> bool:
    report = run_self_test(ctx.layout, ctx.event_log)
    ctx.self_test = report
    _record(ctx, "self_test", report.ok, passed=len(report.passed), failed=len(report.failed))
    return report.ok


def _phase_bootstrap_users(ctx: BootContext) -> bool:
    """Provision the bootstrap-user manifest per ``specs/init-boot/boot-sequence.md`` §4.1.

    Single code path: the manifest comes from ``$SUBSTRATE_BOOTSTRAP_MANIFEST``
    when set, otherwise from :func:`default_manifest` (a single captain). Both
    flow through :func:`ensure_users_from_manifest` exactly once, so the
    returned :class:`BootstrapResult` faithfully reports first-boot vs re-boot
    (``created_slugs``, ``manifest_changed``, ``tokens``). The default-captain
    token-to-disk side-effect is preserved by routing the captain bearer token
    through :func:`persist_captain_token` after provisioning.
    """
    try:
        if os.environ.get("SUBSTRATE_BOOTSTRAP_MANIFEST"):
            manifest = load_manifest_from_env()
        else:
            manifest = default_manifest()
        result = ensure_users_from_manifest(
            layout=ctx.layout,
            event_log=ctx.event_log,
            node_id=ctx.node_id,
            manifest=manifest,
        )
        # Default-path side-effect: deliver the captain token if provisioned.
        # No-op on re-boot (tokens map is empty) and on manifests that don't
        # provision user:captain.
        persist_captain_token(result.tokens.get("user:captain", ""))
        ctx.bootstrap_result = result
        ctx.bootstrap_user_slug = (
            result.created_slugs[0] if result.created_slugs
            else (result.existing_slugs[0] if result.existing_slugs else None)
        )
        ctx.bootstrap_user_created = bool(result.created_slugs)
        _record(
            ctx, "bootstrap_users", True,
            users_in_manifest=len(manifest.users),
            created=len(result.created_slugs),
            manifest_changed=result.manifest_changed,
        )
        return True
    except Exception as e:
        _record(ctx, "bootstrap_users", False, error=str(e))
        return False


def _phase_personnel_migration(ctx: BootContext) -> bool:
    """Personnel-record → boundary migration per ``pt-08`` / ``t02-127``.

    Detects legacy ``personnel:*`` cells lacking a
    ``migrated-to-boundary-at-ord:*`` audit predicate, emits the
    corresponding ``boundary:*`` records (kind + four canonical projection
    fibers + carried role/grant cells) and writes the audit cell on the
    personnel side. Idempotent: a re-boot on a fully-migrated store appends
    zero events. A fresh substrate has no personnel records → no-op with
    ``migrated=[]``.

    Sequenced BEFORE ``bootstrap_users`` per pt-08 acceptance: the
    bootstrap-user routine provisions ``boundary:<slug>`` entities under the
    v0.2 four-fiber scheme, so any v0.1 ``personnel:*`` records inherited
    from a prior log must be promoted to boundaries first — otherwise a
    re-bootstrap reading current state would see two parallel identity
    universes (legacy personnel + fresh boundary). Migration runs at
    runlevel 1 (substrate-only); users come live at runlevel 3.
    """
    try:
        summary = migrate_personnel_to_boundary(
            layout=ctx.layout,
            event_log=ctx.event_log,
            node_id=ctx.node_id,
        )
        ctx.personnel_migration_summary = summary
        _record(
            ctx, "personnel_migration", True,
            scanned=summary["scanned"],
            migrated=len(summary["migrated"]),
            skipped=len(summary["skipped"]),
        )
        return True
    except Exception as e:
        _record(ctx, "personnel_migration", False, error=str(e))
        return False


def _phase_runlevel_promote(ctx: BootContext) -> bool:
    """Promote substrate to default runlevel (3 — full multi-user network)."""
    try:
        target = Runlevel.FULL
        write_runlevel(
            ctx.layout, target,
            event_log=ctx.event_log, node_id=ctx.node_id,
        )
        ctx.runlevel = target
        _record(ctx, "runlevel_promote", True, level=int(target),
                name=target.name.lower().replace("_", "-"))
        return True
    except Exception as e:
        _record(ctx, "runlevel_promote", False, error=str(e))
        return False


def _phase_heartbeat_start(ctx: BootContext) -> bool:
    # The actual asyncio heartbeat is started by the runtime after boot returns.
    _record(ctx, "heartbeat_start", True)
    return True


def _phase_ready(ctx: BootContext) -> bool:
    _record(ctx, "ready", True)
    return True


PHASES: list[tuple[str, Any]] = [
    ("container_check", _phase_container_check),
    ("persistent_attach", _phase_persistent_attach),
    ("identity_activate", _phase_identity_activate),
    ("log_attach", _phase_log_attach),
    ("fiber_reconcile", _phase_fiber_reconcile),
    ("runlevel_substrate_only", _phase_runlevel_substrate_only),
    ("bootstrap_load", _phase_bootstrap_load),
    ("rule_activate", _phase_rule_activate),
    ("self_test", _phase_self_test),
    ("personnel_migration", _phase_personnel_migration),
    ("bootstrap_users", _phase_bootstrap_users),
    ("runlevel_promote", _phase_runlevel_promote),
    ("heartbeat_start", _phase_heartbeat_start),
    ("ready", _phase_ready),
]


def boot(*, root: str | Path, node_id: str, host: str, port: int) -> BootContext:
    ctx = BootContext(root=Path(root), node_id=node_id, port=port, host=host)
    for name, fn in PHASES:
        if not fn(ctx):
            ctx.failed_phase = name
            return ctx
    return ctx
