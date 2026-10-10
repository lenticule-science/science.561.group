"""Boot sequence unit test — all phases pass on a fresh root.

The phase list grew when the v0.2 OS layer was added: the boot now
promotes through runlevels 0→1→3 and bootstraps the default captain
between them.
"""

from __future__ import annotations

from pathlib import Path

from init_boot.boot import boot


def test_full_boot_succeeds(tmp_path: Path):
    ctx = boot(root=tmp_path, node_id="test-node", host="0.0.0.0", port=5000)
    assert ctx.failed_phase is None
    assert ctx.self_test is not None
    assert ctx.self_test.ok, ctx.self_test.failed
    assert (tmp_path / "events.jsonl").exists()
    assert (tmp_path / "config.json").exists()
    phase_names = [p["phase"] for p in ctx.phase_log]
    assert phase_names == [
        "container_check",
        "persistent_attach",
        "identity_activate",
        "log_attach",
        "fiber_reconcile",
        "runlevel_substrate_only",
        "bootstrap_load",
        "rule_activate",
        "self_test",
        "personnel_migration",
        "bootstrap_users",
        "runlevel_promote",
        "heartbeat_start",
        "ready",
    ]


def test_re_boot_increments_boot_count(tmp_path: Path):
    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.config["boot_count"] == 2


def test_default_path_first_boot_reports_captain_creation(tmp_path: Path):
    """Default path (no $SUBSTRATE_BOOTSTRAP_MANIFEST) — first boot must
    report user:captain in BootstrapResult.created_slugs and surface the
    bearer token in result.tokens, then re-boot must report neither.

    Regression for the prior two-step default path which discarded the
    creation telemetry by re-running ensure_users_from_manifest after
    ensure_default_captain. Spec: ``specs/init-boot/boot-sequence.md`` §4.1
    (BootContext outputs reflect the real first-boot effect).
    """
    ctx1 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx1.failed_phase is None
    assert ctx1.bootstrap_result is not None
    assert ctx1.bootstrap_result.created_slugs == ["user:captain"]
    # First boot: no prior hash on file, manifest_changed reserved for
    # prior!=current transitions per BootstrapResult semantics.
    assert ctx1.bootstrap_result.prior_manifest_hash is None
    assert ctx1.bootstrap_result.manifest_changed is False
    assert "user:captain" in ctx1.bootstrap_result.tokens
    assert ctx1.bootstrap_user_created is True
    assert ctx1.bootstrap_user_slug == "user:captain"

    ctx2 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx2.failed_phase is None
    assert ctx2.bootstrap_result is not None
    assert ctx2.bootstrap_result.created_slugs == []
    assert ctx2.bootstrap_result.existing_slugs == ["user:captain"]
    assert ctx2.bootstrap_result.manifest_changed is False
    assert ctx2.bootstrap_result.tokens == {}
    assert ctx2.bootstrap_user_created is False
    assert ctx2.bootstrap_user_slug == "user:captain"


def test_boot_degrades_when_fiber_diverges_from_log(tmp_path: Path):
    """Spec §4.2 step 3: projection divergence transitions boot to degraded.

    We boot once to establish a healthy substrate (events + fibers in
    sync), then corrupt a per-user fiber's history on disk so its
    history no longer matches the events.jsonl truth, and re-boot. The
    ``fiber_reconcile`` phase must fail (strict-mode divergence
    detection) rather than silently rebuild.
    """
    from storage.storage_layout import StorageLayout

    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    layout = StorageLayout(tmp_path)
    fiber = layout.get_fiber("user:captain")
    assert fiber is not None and fiber.get("history"), (
        "fixture precondition: captain fiber must have history after boot"
    )
    layout.put_fiber("user:captain", {**fiber, "history": []})

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase == "fiber_reconcile"
    record = next(p for p in ctx.phase_log if p["phase"] == "fiber_reconcile")
    assert record["ok"] is False
    assert "PCC_PROJECTION_DIVERGED" in record.get("error", "")
