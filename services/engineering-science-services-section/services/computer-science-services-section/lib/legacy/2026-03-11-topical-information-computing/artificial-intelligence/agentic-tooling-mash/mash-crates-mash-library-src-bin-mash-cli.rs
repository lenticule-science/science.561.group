//! `mash` — the MASH command-line tool.
//!
//! Short-lived operations against a running hub: witness a claim,
//! subscribe and print a predicate's settlements, send a DM to an
//! agent account, ping the hub to confirm it's responsive.
//!
//! Long-lived operations (hub boot, port supervision) live in
//! dedicated subprocess binaries ([`mash-conduit-stdio`],
//! [`mash-conduit-telnet`]) or the hub binary itself — not here.
//! The CLI is the operator-facing probe/poke surface.
//!
//! # Usage
//!
//! ```text
//! mash ping
//! mash doctor [--root PATH] [--strict]
//! mash witness <subject> <predicate> <object>
//! mash watch <predicate> [--limit N]
//! mash harness publish [--root PATH] [--write] [--submit]
//! mash os boot [--submit]
//! mash os plan
//! mash os status [--idle-ms N]
//! mash task llm [--submit] [--task ID] [--run ID] [--op ID] [--priority 1-4] [--work-type TYPE] [--context PATH] [--depends-on TASK] [--deadline ISO] <prompt>
//! mash task status [TASK] [--idle-ms N]
//! mash dm <recipient-account> <body>
//! ```
//!
//! # Configuration
//!
//! - `MASH_SOCKET` — hub socket path. Default `.mash/sock`.

use std::collections::BTreeMap;
use std::path::{Component, Path, PathBuf};
use std::time::{SystemTime, UNIX_EPOCH};

use anyhow::{anyhow, bail, Context, Result};
use mash_engine::algebra::Value;
use mash_engine::sdk::agent::{Agent, Projection};
use mash_engine::sdk::client::{Claim, ClientConfig, Connection, InboundEvent};
use tracing_subscriber::EnvFilter;

use mash_library::discourse::conduit::HAS_BODY;
use mash_library::discourse::{ADDRESSED_TO, MESSAGE, WAS_SAID_BY, WAS_UTTERED_AT};
use mash_library::execution::PRODUCED_COMPLETION;
use mash_library::foundation::{IS_A_PREDICATE, IS_A_TERM};
use mash_library::governance::os561::{
    runtime_processes, Group561Os, HAS_PROCESS_ID, HAS_RUNTIME_LAUNCH, IS_RUNTIME_EXITED,
    IS_RUNTIME_RUNNING, MASH_WORKDIR, PROCESS_HUB, RUNS_RUNTIME_PROCESS, RUNTIME_EXITED_AT,
    RUNTIME_EXITED_WITH, RUNTIME_STARTED_AT, WORKER_REPOSITORY_LLM,
};
use mash_library::operation::approval::HAS_ALL_APPROVALS_SATISFIED;
use mash_library::operation::{
    COMPLETED_AT, EXITED_WITH_CODE, HAS_FUNCTION, IS_COMPLETED, IS_FAILED, IS_INTENT_SET,
    IS_PENDING, IS_RUNNING, LLM_FUNCTION, OPERATION, RUNS_COMMAND, WROTE_STDERR,
};
use mash_library::planning::run::{
    ATTEMPT_NUMBER, HAS_ATTEMPT, HAS_DEADLINE, HAS_MAX_ATTEMPTS, HAS_RUN, IS_RUN_ACTIVE,
    IS_RUN_CANCELLED, IS_RUN_COMPLETED, IS_RUN_FAILED, RUN,
};
use mash_library::planning::task::{
    DEPENDS_ON, HAS_ALL_DEPENDENCIES_SATISFIED, HAS_COMMAND, HAS_CONTEXT_PATH, HAS_OPERATION,
    HAS_OPERATION_COMPLETED, HAS_PRIORITY, HAS_TARGET as TASK_HAS_TARGET, HAS_WORK_TYPE,
    IS_ASSIGNED_TO_TASK, IS_TASK_COMPLETED, IS_TASK_FAILED, TASK,
};
use mash_library::projection::harness::{
    plan_publication, HarnessCollector, HarnessPublicationArtifact, HarnessPublicationPlan,
    HAS_BODY as HARNESS_HAS_BODY, HAS_DEPLOY_PATH,
};
use mash_library::projection::harness::{HAS_DESCRIPTION, HAS_NAME};

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_env_filter(
            EnvFilter::try_from_default_env().unwrap_or_else(|_| EnvFilter::new("warn")),
        )
        .init();

    let mut args = std::env::args().skip(1);
    let Some(subcommand) = args.next() else {
        print_usage();
        std::process::exit(2);
    };

    match subcommand.as_str() {
        "ping" => ping().await,
        "doctor" => doctor(args.collect()).await,
        "witness" => witness(args.collect()).await,
        "watch" => watch(args.collect()).await,
        "fiber" => fiber(args.collect()).await,
        "harness" => harness(args.collect()).await,
        "os" => os(args.collect()).await,
        "task" => task(args.collect()).await,
        "dm" => dm(args.collect()).await,
        "help" | "--help" | "-h" => {
            print_usage();
            Ok(())
        }
        other => {
            eprintln!("unknown subcommand: {other}");
            print_usage();
            std::process::exit(2);
        }
    }
}

fn print_usage() {
    eprintln!(
        "mash — MASH command-line tool\n\n\
         USAGE:\n\
         \x20 mash ping\n\
         \x20 mash doctor [--root PATH] [--strict]\n\
         \x20 mash witness <subject> <predicate> <object>\n\
         \x20 mash watch <predicate> [--limit N]\n\
         \x20 mash fiber <predicate> [--value t|f|both|none] [--json] [--idle-ms N]\n\
         \x20 mash harness publish [--root PATH] [--write] [--submit]\n\
         \x20 mash os boot [--submit]\n\
         \x20 mash os plan\n\
         \x20 mash os status [--idle-ms N]\n\
         \x20 mash task llm [--submit] [--task ID] [--run ID] [--op ID] [--priority 1-4] [--work-type TYPE] [--context PATH] [--depends-on TASK] [--deadline ISO] <prompt>\n\
         \x20 mash task status [TASK] [--idle-ms N]\n\
         \x20 mash dm <recipient-account> <body>\n\n\
         ENV:\n\
         \x20 MASH_SOCKET   hub socket path (default: .mash/sock)"
    );
}

fn socket_path() -> PathBuf {
    std::env::var_os("MASH_SOCKET").map_or_else(|| PathBuf::from(".mash/sock"), PathBuf::from)
}

async fn open(subs: Vec<String>, identity: &str) -> Result<Connection> {
    let client = ClientConfig {
        socket_path: socket_path(),
        identity: identity.to_owned(),
        version: env!("CARGO_PKG_VERSION").to_owned(),
        subscriptions: subs,
    };
    Connection::open(client)
        .await
        .context("open hub connection")
}

// ─────────────────────────────────────────────────────────────────────
// doctor — first-stop systems diagnostic for future agents
// ─────────────────────────────────────────────────────────────────────

const DOCTOR_USAGE: &str = "mash doctor [--root PATH] [--strict]";

async fn doctor(args: Vec<String>) -> Result<()> {
    let mut root = PathBuf::from(".");
    let mut strict = false;
    let mut iter = args.into_iter();
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--root" => {
                root = PathBuf::from(
                    iter.next()
                        .ok_or_else(|| anyhow!("--root requires a path"))?,
                );
            }
            "--strict" => strict = true,
            "help" | "--help" | "-h" => {
                eprintln!("usage: {DOCTOR_USAGE}");
                return Ok(());
            }
            other => bail!("unknown doctor flag: {other}"),
        }
    }

    let report = build_doctor_report(&root).await;
    print!("{}", report.render());
    if report.should_exit_nonzero(strict) {
        std::process::exit(1);
    }
    Ok(())
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum DoctorSeverity {
    Ok,
    Warn,
    Fail,
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct DoctorCheck {
    severity: DoctorSeverity,
    label: String,
    detail: String,
}

#[derive(Debug, Default)]
struct DoctorReport {
    checks: Vec<DoctorCheck>,
}

impl DoctorReport {
    fn ok(&mut self, label: impl Into<String>, detail: impl Into<String>) {
        self.push(DoctorSeverity::Ok, label, detail);
    }

    fn warn(&mut self, label: impl Into<String>, detail: impl Into<String>) {
        self.push(DoctorSeverity::Warn, label, detail);
    }

    fn fail(&mut self, label: impl Into<String>, detail: impl Into<String>) {
        self.push(DoctorSeverity::Fail, label, detail);
    }

    fn push(
        &mut self,
        severity: DoctorSeverity,
        label: impl Into<String>,
        detail: impl Into<String>,
    ) {
        self.checks.push(DoctorCheck {
            severity,
            label: label.into(),
            detail: detail.into(),
        });
    }

    fn count(&self, severity: DoctorSeverity) -> usize {
        self.checks
            .iter()
            .filter(|check| check.severity == severity)
            .count()
    }

    fn should_exit_nonzero(&self, strict: bool) -> bool {
        self.count(DoctorSeverity::Fail) > 0 || (strict && self.count(DoctorSeverity::Warn) > 0)
    }

    fn render(&self) -> String {
        let mut out = String::new();
        out.push_str("mash doctor\n");
        for check in &self.checks {
            let marker = match check.severity {
                DoctorSeverity::Ok => "ok",
                DoctorSeverity::Warn => "warn",
                DoctorSeverity::Fail => "fail",
            };
            out.push_str(&format!("[{marker}] {}: {}\n", check.label, check.detail));
        }
        out.push_str(&format!(
            "summary ok={} warn={} fail={}\n",
            self.count(DoctorSeverity::Ok),
            self.count(DoctorSeverity::Warn),
            self.count(DoctorSeverity::Fail)
        ));
        out
    }
}

async fn build_doctor_report(root: &Path) -> DoctorReport {
    let mut report = DoctorReport::default();
    check_workspace_layout(&mut report, root);
    check_tooling(&mut report);
    check_runtime_plan(&mut report);
    check_boot_claims(&mut report);
    check_harness_plan(&mut report);
    check_hub_reachability(&mut report).await;
    report
}

fn check_workspace_layout(report: &mut DoctorReport, root: &Path) {
    match root.canonicalize() {
        Ok(path) => report.ok("workspace root", path.display().to_string()),
        Err(err) => {
            report.fail("workspace root", format!("{} ({err})", root.display()));
            return;
        }
    }

    for (label, relative) in [
        ("workspace manifest", "Cargo.toml"),
        ("engine manifest", "crates/mash-engine/Cargo.toml"),
        ("library manifest", "crates/mash-library/Cargo.toml"),
        ("crate taxonomy check", "scripts/check-crate-taxonomy.sh"),
    ] {
        let path = root.join(relative);
        if path.is_file() {
            report.ok(label, relative);
        } else {
            report.fail(label, format!("missing {relative}"));
        }
    }
}

fn check_tooling(report: &mut DoctorReport) {
    if command_available("cargo") {
        report.ok("cargo", "available on PATH");
    } else {
        report.fail("cargo", "not found on PATH");
    }

    let llm_bin = std::env::var("MASH_LLM_BIN").unwrap_or_else(|_| "claude".to_owned());
    if command_available(&llm_bin) {
        report.ok("llm effector command", llm_bin);
    } else {
        report.warn(
            "llm effector command",
            format!("{llm_bin:?} not found on PATH; LLM tasks can still be minted"),
        );
    }
}

fn command_available(program: &str) -> bool {
    let path = Path::new(program);
    if path.components().count() > 1 {
        return executable_file(path);
    }
    let Some(paths) = std::env::var_os("PATH") else {
        return false;
    };
    std::env::split_paths(&paths).any(|dir| executable_file(&dir.join(program)))
}

fn executable_file(path: &Path) -> bool {
    path.is_file()
}

fn check_runtime_plan(report: &mut DoctorReport) {
    let processes = runtime_processes();
    if processes.is_empty() {
        report.fail("runtime plan", "no runtime processes declared");
        return;
    }
    report.ok(
        "runtime plan",
        format!("{} processes declared", processes.len()),
    );

    let hub_count = processes
        .iter()
        .filter(|process| process.subject == PROCESS_HUB)
        .count();
    if hub_count == 1 {
        report.ok("runtime hub", PROCESS_HUB);
    } else {
        report.fail(
            "runtime hub",
            format!("expected exactly one {PROCESS_HUB}, found {hub_count}"),
        );
    }

    let non_cargo: Vec<_> = processes
        .iter()
        .filter(|process| !process.command.starts_with("cargo run "))
        .map(|process| process.subject)
        .collect();
    if non_cargo.is_empty() {
        report.ok("runtime commands", "all commands are cargo-run launchers");
    } else {
        report.fail(
            "runtime commands",
            format!("non cargo-run commands: {}", non_cargo.join(",")),
        );
    }

    let wrong_cwd: Vec<_> = processes
        .iter()
        .filter(|process| process.working_directory != MASH_WORKDIR)
        .map(|process| process.subject)
        .collect();
    if wrong_cwd.is_empty() {
        report.ok("runtime cwd", MASH_WORKDIR);
    } else {
        report.fail(
            "runtime cwd",
            format!("unexpected cwd on {}", wrong_cwd.join(",")),
        );
    }

    let effectors = processes
        .iter()
        .filter(|process| process.effector_kind.is_some())
        .count();
    if effectors >= 3 {
        report.ok("runtime effectors", format!("{effectors} declared"));
    } else {
        report.warn("runtime effectors", format!("only {effectors} declared"));
    }
}

fn check_boot_claims(report: &mut DoctorReport) {
    let claims = os_boot_claims();
    if claims.is_empty() {
        report.fail("boot claims", "os boot emits no claims");
        return;
    }
    report.ok("boot claims", format!("{} claims", claims.len()));

    for predicate in [HAS_PRIORITY, HAS_WORK_TYPE, HAS_CONTEXT_PATH, HAS_RUN] {
        if has_claim_subject_predicate(&claims, predicate, IS_A_PREDICATE) {
            report.ok("planning predicate", predicate);
        } else {
            report.fail("planning predicate", format!("missing {predicate}"));
        }
    }

    for term in [TASK, RUN, OPERATION, PROCESS_HUB] {
        if has_claim_subject_predicate(&claims, term, IS_A_TERM) {
            report.ok("boot term", term);
        } else {
            report.fail("boot term", format!("missing {term}"));
        }
    }
}

fn has_claim_subject_predicate(claims: &[Claim], subject: &str, predicate: &str) -> bool {
    claims
        .iter()
        .any(|claim| claim.subject == subject && claim.predicate == predicate)
}

fn check_harness_plan(report: &mut DoctorReport) {
    let mut collector = HarnessCollector::new();
    for claim in repository_harness_claims() {
        let _ = collector.ingest(&claim.subject, &claim.predicate, &claim.object, Value::True);
    }
    let plan = plan_publication(&collector.components(), "repository");
    if plan.artifacts.is_empty() {
        report.fail("harness publication", "no artifacts planned");
    } else {
        report.ok(
            "harness publication",
            format!("{} artifacts planned", plan.artifacts.len()),
        );
    }
    if plan.errors.is_empty() {
        report.ok("harness publication errors", "none");
    } else {
        report.warn(
            "harness publication errors",
            format!("{} components skipped", plan.errors.len()),
        );
    }
}

async fn check_hub_reachability(report: &mut DoctorReport) {
    let socket = socket_path();
    if socket.exists() {
        report.ok("hub socket", socket.display().to_string());
    } else {
        report.warn("hub socket", format!("not present at {}", socket.display()));
    }

    match open(Vec::new(), "mash-cli-doctor").await {
        Ok(connection) => report.ok(
            "hub connection",
            format!("session {}", connection.session()),
        ),
        Err(err) => report.warn(
            "hub connection",
            format!("{err}; socket={}", socket.display()),
        ),
    }
}

// ─────────────────────────────────────────────────────────────────────
// harness — publish local agent harness files
// ─────────────────────────────────────────────────────────────────────

async fn harness(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let subcommand = iter
        .next()
        .ok_or_else(|| anyhow!("usage: mash harness publish [--root PATH] [--write] [--submit]"))?;
    match subcommand.as_str() {
        "publish" => harness_publish(iter.collect()).await,
        "help" | "--help" | "-h" => {
            eprintln!("usage: mash harness publish [--root PATH] [--write] [--submit]");
            Ok(())
        }
        other => bail!("unknown harness subcommand: {other}"),
    }
}

async fn harness_publish(args: Vec<String>) -> Result<()> {
    let mut root = PathBuf::from(".");
    let mut write = false;
    let mut submit = false;
    let mut iter = args.into_iter();
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--root" => {
                let value = iter
                    .next()
                    .ok_or_else(|| anyhow!("--root requires a path"))?;
                root = PathBuf::from(value);
            }
            "--write" => write = true,
            "--dry-run" => write = false,
            "--submit" => submit = true,
            other => bail!("unknown flag: {other}"),
        }
    }

    let mut collector = HarnessCollector::new();
    for claim in repository_harness_claims() {
        let _ = collector.ingest(&claim.subject, &claim.predicate, &claim.object, Value::True);
    }
    let plan = plan_publication(&collector.components(), "repository");
    for error in &plan.errors {
        eprintln!("skip {}: {}", error.subject, error.reason);
    }
    if plan.artifacts.is_empty() {
        bail!("harness publish produced no files");
    }

    println!(
        "publication={} ensemble={} artifacts={} claims={}",
        plan.publication_id,
        plan.ensemble_subject,
        plan.artifacts.len(),
        plan.claims.len()
    );

    if submit {
        submit_publication_plan(&plan).await?;
        println!("submitted {} claims to hub", plan.claims.len());
    }

    for artifact in &plan.artifacts {
        let target = checked_target_path(&root, &artifact.path)?;
        if write {
            let outcome = write_artifact_file(&target, artifact)?;
            println!(
                "{outcome} {} op={} file={} sha256={} bytes={}",
                target.display(),
                artifact.operation_subject,
                artifact.file_subject,
                artifact.sha256,
                artifact.body.len()
            );
        } else {
            println!(
                "would write {} op={} file={} sha256={} bytes={}",
                target.display(),
                artifact.operation_subject,
                artifact.file_subject,
                artifact.sha256,
                artifact.body.len()
            );
        }
    }
    if !write && !submit {
        println!("dry-run only; pass --write to materialize files or --submit to witness claims");
    }
    Ok(())
}

async fn submit_publication_plan(plan: &HarnessPublicationPlan) -> Result<()> {
    submit_claims("mash-cli-harness-publish", &plan.claims).await
}

async fn submit_claims(identity: &str, claims: &[Claim]) -> Result<()> {
    let connection = open(Vec::new(), identity).await?;
    let handle = connection.handle();
    for claim in claims {
        handle
            .witness(&claim.subject, &claim.predicate, &claim.object)
            .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    }
    tokio::time::sleep(std::time::Duration::from_millis(50)).await;
    Ok(())
}

// ─────────────────────────────────────────────────────────────────────
// os — boot the 561 operating profile
// ─────────────────────────────────────────────────────────────────────

async fn os(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let subcommand = iter
        .next()
        .ok_or_else(|| anyhow!("usage: mash os <boot|plan|status>"))?;
    match subcommand.as_str() {
        "boot" => os_boot(iter.collect()).await,
        "plan" => {
            os_plan(iter.collect())?;
            Ok(())
        }
        "status" => os_status(iter.collect()).await,
        "help" | "--help" | "-h" => {
            eprintln!("usage: mash os <boot|plan|status>");
            Ok(())
        }
        other => bail!("unknown os subcommand: {other}"),
    }
}

async fn os_boot(args: Vec<String>) -> Result<()> {
    let mut submit = false;
    for arg in args {
        match arg.as_str() {
            "--submit" => submit = true,
            "--dry-run" => submit = false,
            other => bail!("unknown flag: {other}"),
        }
    }

    let claims = os_boot_claims();
    println!(
        "os=561 profile=group561 claims={} submit={}",
        claims.len(),
        submit
    );
    if submit {
        submit_claims("mash-cli-os-boot", &claims).await?;
        println!("submitted {} claims to hub", claims.len());
    } else {
        println!("dry-run only; pass --submit to witness OS claims");
    }
    Ok(())
}

fn os_boot_claims() -> Vec<Claim> {
    let mut claims = Vec::new();
    claims.extend(mash_library::foundation::Foundation.claims());
    claims.extend(mash_library::presence::Presence.claims());
    claims.extend(mash_library::operation::Ops.claims());
    claims.extend(mash_library::operation::dispatch::Dispatch.claims());
    claims.extend(mash_library::operation::worker::Workers.claims());
    claims.extend(mash_library::operation::capability::Capability.claims());
    claims.extend(mash_library::planning::task::Task.claims());
    claims.extend(mash_library::planning::run::Run.claims());
    claims.extend(mash_library::governance::Offices.claims());
    claims.extend(mash_library::storage::Fs.claims());
    claims.extend(mash_library::projection::harness::Harness.claims());
    claims.extend(Group561Os.claims());
    claims
}

fn os_plan(args: Vec<String>) -> Result<()> {
    if !args.is_empty() {
        bail!("usage: mash os plan");
    }
    println!("os=561 runtime-processes={}", runtime_processes().len());
    for process in runtime_processes() {
        println!(
            "{}\n  label={}\n  cwd={}\n  command={}",
            process.subject, process.label, process.working_directory, process.command
        );
        for env in process.env {
            println!("  env={env}");
        }
        if let Some(kind) = process.effector_kind {
            println!("  effector-kind={kind}");
        }
    }
    Ok(())
}

async fn os_status(args: Vec<String>) -> Result<()> {
    let mut idle_ms: u64 = 300;
    let mut iter = args.into_iter();
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--idle-ms" => {
                let v = iter
                    .next()
                    .ok_or_else(|| anyhow!("--idle-ms requires a number"))?;
                idle_ms = v
                    .parse()
                    .map_err(|_| anyhow!("--idle-ms value must be a number"))?;
            }
            other => bail!("unknown flag: {other}"),
        }
    }

    let subscriptions = runtime_status_predicates()
        .into_iter()
        .map(str::to_owned)
        .collect();
    let mut connection = open(subscriptions, "mash-cli-os-status").await?;
    let snapshot = collect_runtime_status(&mut connection, idle_ms).await;
    for process in runtime_processes() {
        let line = snapshot.line_for_process(process.subject);
        println!("{} label={} {line}", process.subject, process.label);
    }
    Ok(())
}

fn runtime_status_predicates() -> Vec<&'static str> {
    vec![
        HAS_RUNTIME_LAUNCH,
        RUNS_RUNTIME_PROCESS,
        HAS_PROCESS_ID,
        RUNTIME_STARTED_AT,
        RUNTIME_EXITED_AT,
        RUNTIME_EXITED_WITH,
        IS_RUNTIME_RUNNING,
        IS_RUNTIME_EXITED,
    ]
}

#[derive(Debug, Default)]
struct RuntimeStatusSnapshot {
    launches_by_process: BTreeMap<String, Vec<String>>,
    launches: BTreeMap<String, RuntimeLaunchStatus>,
}

#[derive(Debug, Default)]
struct RuntimeLaunchStatus {
    process: Option<String>,
    pid: Option<String>,
    started_at: Option<String>,
    exited_at: Option<String>,
    exited_with: Option<String>,
    running: bool,
    exited: bool,
}

async fn collect_runtime_status(
    connection: &mut Connection,
    idle_ms: u64,
) -> RuntimeStatusSnapshot {
    let idle = std::time::Duration::from_millis(idle_ms);
    let mut snapshot = RuntimeStatusSnapshot::default();
    loop {
        match tokio::time::timeout(idle, connection.next_event_or_shutdown()).await {
            Ok(Some(InboundEvent::Settled { claim, .. })) => {
                snapshot.ingest(&claim.subject, &claim.predicate, &claim.object, claim.value);
            }
            Ok(Some(InboundEvent::HubError { code, message })) => {
                eprintln!("hub-error [{code}]: {message}");
            }
            Ok(Some(InboundEvent::Closed)) | Ok(None) => break,
            Err(_) => break,
        }
    }
    snapshot
}

impl RuntimeStatusSnapshot {
    fn ingest(&mut self, subject: &str, predicate: &str, object: &str, value: Value) {
        if value != Value::True {
            return;
        }
        match predicate {
            HAS_RUNTIME_LAUNCH => {
                self.launches_by_process
                    .entry(subject.to_owned())
                    .or_default()
                    .push(object.to_owned());
                self.launches
                    .entry(object.to_owned())
                    .or_default()
                    .process
                    .get_or_insert_with(|| subject.to_owned());
            }
            RUNS_RUNTIME_PROCESS => {
                self.launches
                    .entry(subject.to_owned())
                    .or_default()
                    .process
                    .get_or_insert_with(|| object.to_owned());
                self.launches_by_process
                    .entry(object.to_owned())
                    .or_default()
                    .push(subject.to_owned());
            }
            HAS_PROCESS_ID => {
                self.launches
                    .entry(subject.to_owned())
                    .or_default()
                    .pid
                    .get_or_insert_with(|| object.to_owned());
            }
            RUNTIME_STARTED_AT => {
                self.launches
                    .entry(subject.to_owned())
                    .or_default()
                    .started_at
                    .get_or_insert_with(|| object.to_owned());
            }
            RUNTIME_EXITED_AT => {
                self.launches
                    .entry(subject.to_owned())
                    .or_default()
                    .exited_at
                    .get_or_insert_with(|| object.to_owned());
            }
            RUNTIME_EXITED_WITH => {
                self.launches
                    .entry(subject.to_owned())
                    .or_default()
                    .exited_with
                    .get_or_insert_with(|| object.to_owned());
            }
            IS_RUNTIME_RUNNING => {
                self.launches.entry(subject.to_owned()).or_default().running = true;
            }
            IS_RUNTIME_EXITED => {
                self.launches.entry(subject.to_owned()).or_default().exited = true;
            }
            _ => {}
        }
    }

    fn line_for_process(&self, process: &str) -> String {
        let Some(launch) = self.latest_launch_for_process(process) else {
            return "state=unknown".to_owned();
        };
        let Some(status) = self.launches.get(launch) else {
            return format!("state=unknown launch={launch}");
        };
        let state = if status.exited || status.exited_at.is_some() || status.exited_with.is_some() {
            "exited"
        } else if status.running || status.started_at.is_some() {
            "running"
        } else {
            "observed"
        };
        let pid = status.pid.as_deref().unwrap_or("-");
        let started = status.started_at.as_deref().unwrap_or("-");
        let exited = status.exited_at.as_deref().unwrap_or("-");
        let exit = status.exited_with.as_deref().unwrap_or("-");
        format!(
            "state={state} launch={launch} pid={pid} started={started} exited={exited} exit={exit}"
        )
    }

    fn latest_launch_for_process(&self, process: &str) -> Option<&str> {
        self.launches_by_process
            .get(process)?
            .iter()
            .max_by(|a, b| {
                let a_key = self
                    .launches
                    .get(*a)
                    .and_then(|status| status.started_at.as_deref())
                    .unwrap_or(a);
                let b_key = self
                    .launches
                    .get(*b)
                    .and_then(|status| status.started_at.as_deref())
                    .unwrap_or(b);
                a_key.cmp(b_key)
            })
            .map(String::as_str)
    }
}

// ─────────────────────────────────────────────────────────────────────
// task — mint agentic work for the local MASH runtime
// ─────────────────────────────────────────────────────────────────────

async fn task(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let subcommand = iter
        .next()
        .ok_or_else(|| anyhow!("usage: {}", TASK_LLM_USAGE))?;
    match subcommand.as_str() {
        "llm" => task_llm(iter.collect()).await,
        "status" => task_status(iter.collect()).await,
        "help" | "--help" | "-h" => {
            eprintln!("usage: {TASK_LLM_USAGE}");
            eprintln!("usage: {TASK_STATUS_USAGE}");
            Ok(())
        }
        other => bail!("unknown task subcommand: {other}"),
    }
}

const TASK_LLM_USAGE: &str = "mash task llm [--submit] [--task ID] [--run ID] [--op ID] [--priority 1-4] [--work-type TYPE] [--context PATH] [--depends-on TASK] [--deadline ISO] <prompt>";
const TASK_STATUS_USAGE: &str = "mash task status [TASK] [--idle-ms N]";

async fn task_status(args: Vec<String>) -> Result<()> {
    let mut task_filter: Option<String> = None;
    let mut idle_ms: u64 = 300;
    let mut iter = args.into_iter();
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--idle-ms" => {
                let value = iter
                    .next()
                    .ok_or_else(|| anyhow!("--idle-ms requires a number"))?;
                idle_ms = value
                    .parse()
                    .map_err(|_| anyhow!("--idle-ms value must be a number"))?;
            }
            other if other.starts_with("--") => bail!("unknown flag: {other}"),
            other => {
                if task_filter.is_some() {
                    bail!("usage: {TASK_STATUS_USAGE}");
                }
                task_filter = Some(other.to_owned());
            }
        }
    }

    let subscriptions = task_status_predicates()
        .into_iter()
        .map(str::to_owned)
        .collect();
    let mut connection = open(subscriptions, "mash-cli-task-status").await?;
    let snapshot = collect_task_status(&mut connection, idle_ms).await;
    let lines = snapshot.lines(task_filter.as_deref());
    if lines.is_empty() {
        if let Some(task) = task_filter {
            println!("{task} state=unknown");
        } else {
            println!("no tasks observed");
        }
        return Ok(());
    }
    for line in lines {
        println!("{line}");
    }
    Ok(())
}

fn task_status_predicates() -> Vec<&'static str> {
    vec![
        IS_A_TERM,
        HAS_COMMAND,
        TASK_HAS_TARGET,
        HAS_PRIORITY,
        HAS_WORK_TYPE,
        HAS_CONTEXT_PATH,
        DEPENDS_ON,
        HAS_ALL_DEPENDENCIES_SATISFIED,
        HAS_ALL_APPROVALS_SATISFIED,
        mash_library::time::lifecycle::IS_CLOSED,
        HAS_RUN,
        HAS_OPERATION,
        HAS_OPERATION_COMPLETED,
        IS_TASK_COMPLETED,
        IS_TASK_FAILED,
        HAS_ATTEMPT,
        HAS_DEADLINE,
        HAS_MAX_ATTEMPTS,
        IS_RUN_ACTIVE,
        IS_RUN_COMPLETED,
        IS_RUN_FAILED,
        IS_RUN_CANCELLED,
        HAS_FUNCTION,
        RUNS_COMMAND,
        IS_ASSIGNED_TO_TASK,
        ATTEMPT_NUMBER,
        IS_PENDING,
        IS_RUNNING,
        IS_COMPLETED,
        IS_FAILED,
        COMPLETED_AT,
        EXITED_WITH_CODE,
        WROTE_STDERR,
        PRODUCED_COMPLETION,
    ]
}

#[derive(Debug, Default)]
struct TaskStatusSnapshot {
    tasks: BTreeMap<String, TaskStatus>,
    runs: BTreeMap<String, RunStatus>,
    ops: BTreeMap<String, OpStatus>,
}

#[derive(Debug, Default)]
struct TaskStatus {
    command: Option<String>,
    target: Option<String>,
    priority: Option<String>,
    work_type: Option<String>,
    contexts: Vec<String>,
    dependencies: Vec<String>,
    all_dependencies_satisfied: bool,
    all_approvals_satisfied: bool,
    closed: bool,
    runs: Vec<String>,
    operations: Vec<String>,
    completed_operations: Vec<String>,
    completed: bool,
    failed: bool,
}

#[derive(Debug, Default)]
struct RunStatus {
    attempts: Vec<String>,
    deadline: Option<String>,
    max_attempts: Option<String>,
    active: bool,
    completed: bool,
    failed: bool,
    cancelled: bool,
}

#[derive(Debug, Default)]
struct OpStatus {
    task: Option<String>,
    function: Option<String>,
    prompt: Option<String>,
    attempt_number: Option<String>,
    pending: bool,
    running: bool,
    completed: bool,
    failed: bool,
    completed_at: Option<String>,
    exited_with: Option<String>,
    stderr: Option<String>,
    completion: Option<String>,
}

async fn collect_task_status(connection: &mut Connection, idle_ms: u64) -> TaskStatusSnapshot {
    let idle = std::time::Duration::from_millis(idle_ms);
    let mut snapshot = TaskStatusSnapshot::default();
    loop {
        match tokio::time::timeout(idle, connection.next_event_or_shutdown()).await {
            Ok(Some(InboundEvent::Settled { claim, .. })) => {
                snapshot.ingest(&claim.subject, &claim.predicate, &claim.object, claim.value);
            }
            Ok(Some(InboundEvent::HubError { code, message })) => {
                eprintln!("hub-error [{code}]: {message}");
            }
            Ok(Some(InboundEvent::Closed)) | Ok(None) => break,
            Err(_) => break,
        }
    }
    snapshot
}

impl TaskStatusSnapshot {
    fn ingest(&mut self, subject: &str, predicate: &str, object: &str, value: Value) {
        if value != Value::True {
            return;
        }
        match predicate {
            IS_A_TERM if object == TASK => {
                self.tasks.entry(subject.to_owned()).or_default();
            }
            HAS_COMMAND => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .command
                    .get_or_insert_with(|| object.to_owned());
            }
            TASK_HAS_TARGET => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .target
                    .get_or_insert_with(|| object.to_owned());
            }
            HAS_PRIORITY => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .priority
                    .get_or_insert_with(|| object.to_owned());
            }
            HAS_WORK_TYPE => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .work_type
                    .get_or_insert_with(|| object.to_owned());
            }
            HAS_CONTEXT_PATH => {
                push_unique(
                    &mut self.tasks.entry(subject.to_owned()).or_default().contexts,
                    object,
                );
            }
            DEPENDS_ON => {
                push_unique(
                    &mut self
                        .tasks
                        .entry(subject.to_owned())
                        .or_default()
                        .dependencies,
                    object,
                );
            }
            HAS_ALL_DEPENDENCIES_SATISFIED => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .all_dependencies_satisfied = true;
            }
            HAS_ALL_APPROVALS_SATISFIED => {
                self.tasks
                    .entry(subject.to_owned())
                    .or_default()
                    .all_approvals_satisfied = true;
            }
            p if p == mash_library::time::lifecycle::IS_CLOSED => {
                self.tasks.entry(subject.to_owned()).or_default().closed = true;
            }
            HAS_RUN => {
                push_unique(
                    &mut self.tasks.entry(subject.to_owned()).or_default().runs,
                    object,
                );
                self.runs.entry(object.to_owned()).or_default();
            }
            HAS_OPERATION => {
                push_unique(
                    &mut self.tasks.entry(subject.to_owned()).or_default().operations,
                    object,
                );
                self.ops
                    .entry(object.to_owned())
                    .or_default()
                    .task
                    .get_or_insert_with(|| subject.to_owned());
            }
            HAS_OPERATION_COMPLETED => {
                push_unique(
                    &mut self
                        .tasks
                        .entry(subject.to_owned())
                        .or_default()
                        .completed_operations,
                    object,
                );
            }
            IS_TASK_COMPLETED => {
                self.tasks.entry(subject.to_owned()).or_default().completed = true;
            }
            IS_TASK_FAILED => {
                self.tasks.entry(subject.to_owned()).or_default().failed = true;
            }
            HAS_ATTEMPT => {
                push_unique(
                    &mut self.runs.entry(subject.to_owned()).or_default().attempts,
                    object,
                );
                self.ops.entry(object.to_owned()).or_default();
            }
            HAS_DEADLINE => {
                self.runs
                    .entry(subject.to_owned())
                    .or_default()
                    .deadline
                    .get_or_insert_with(|| object.to_owned());
            }
            HAS_MAX_ATTEMPTS => {
                self.runs
                    .entry(subject.to_owned())
                    .or_default()
                    .max_attempts
                    .get_or_insert_with(|| object.to_owned());
            }
            IS_RUN_ACTIVE => self.runs.entry(subject.to_owned()).or_default().active = true,
            IS_RUN_COMPLETED => self.runs.entry(subject.to_owned()).or_default().completed = true,
            IS_RUN_FAILED => self.runs.entry(subject.to_owned()).or_default().failed = true,
            IS_RUN_CANCELLED => self.runs.entry(subject.to_owned()).or_default().cancelled = true,
            HAS_FUNCTION => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .function
                    .get_or_insert_with(|| object.to_owned());
            }
            RUNS_COMMAND => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .prompt
                    .get_or_insert_with(|| object.to_owned());
            }
            IS_ASSIGNED_TO_TASK => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .task
                    .get_or_insert_with(|| object.to_owned());
            }
            ATTEMPT_NUMBER => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .attempt_number
                    .get_or_insert_with(|| object.to_owned());
            }
            IS_PENDING => self.ops.entry(subject.to_owned()).or_default().pending = true,
            IS_RUNNING => self.ops.entry(subject.to_owned()).or_default().running = true,
            IS_COMPLETED => self.ops.entry(subject.to_owned()).or_default().completed = true,
            IS_FAILED => self.ops.entry(subject.to_owned()).or_default().failed = true,
            COMPLETED_AT => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .completed_at
                    .get_or_insert_with(|| object.to_owned());
            }
            EXITED_WITH_CODE => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .exited_with
                    .get_or_insert_with(|| object.to_owned());
            }
            WROTE_STDERR => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .stderr
                    .get_or_insert_with(|| object.to_owned());
            }
            PRODUCED_COMPLETION => {
                self.ops
                    .entry(subject.to_owned())
                    .or_default()
                    .completion
                    .get_or_insert_with(|| object.to_owned());
            }
            _ => {}
        }
    }

    fn lines(&self, task_filter: Option<&str>) -> Vec<String> {
        let mut lines = Vec::new();
        if let Some(task) = task_filter {
            if let Some(status) = self.tasks.get(task) {
                lines.extend(self.lines_for_task(task, status));
            }
            return lines;
        }
        for (task, status) in &self.tasks {
            lines.extend(self.lines_for_task(task, status));
        }
        lines
    }

    fn lines_for_task(&self, task: &str, status: &TaskStatus) -> Vec<String> {
        let mut out = Vec::new();
        let state = self.task_state(status);
        let priority = status.priority.as_deref().unwrap_or("-");
        let work_type = status.work_type.as_deref().unwrap_or("-");
        let target = status.target.as_deref().unwrap_or("-");
        let command = status.command.as_deref().unwrap_or("-");
        out.push(format!(
            "{task} state={state} priority={priority} work-type={work_type} target={target} command={}",
            summarize_field(command, 96)
        ));
        if !status.contexts.is_empty() {
            out.push(format!("  context={}", status.contexts.join(",")));
        }
        if !status.dependencies.is_empty() {
            let deps = if status.all_dependencies_satisfied {
                "satisfied"
            } else {
                "waiting"
            };
            out.push(format!(
                "  dependencies={deps} [{}]",
                status.dependencies.join(",")
            ));
        }
        for run in &status.runs {
            let Some(run_status) = self.runs.get(run) else {
                out.push(format!("  run={run} state=unknown"));
                continue;
            };
            out.push(format!(
                "  run={run} state={} attempts={} max-attempts={} deadline={}",
                run_state(run_status),
                run_status.attempts.len(),
                run_status.max_attempts.as_deref().unwrap_or("-"),
                run_status.deadline.as_deref().unwrap_or("-")
            ));
        }
        for op in &status.operations {
            let Some(op_status) = self.ops.get(op) else {
                out.push(format!("  op={op} state=unknown"));
                continue;
            };
            out.push(format!(
                "  op={op} state={} function={} attempt={} completed-at={} exit={}",
                op_state(op_status),
                op_status.function.as_deref().unwrap_or("-"),
                op_status.attempt_number.as_deref().unwrap_or("-"),
                op_status.completed_at.as_deref().unwrap_or("-"),
                op_status.exited_with.as_deref().unwrap_or("-")
            ));
            if let Some(completion) = &op_status.completion {
                out.push(format!(
                    "    completion={}",
                    summarize_field(completion, 120)
                ));
            }
            if let Some(stderr) = &op_status.stderr {
                out.push(format!("    stderr={}", summarize_field(stderr, 120)));
            }
        }
        out
    }

    fn task_state(&self, status: &TaskStatus) -> &'static str {
        if status.failed
            || status
                .runs
                .iter()
                .any(|run| self.runs.get(run).is_some_and(|s| s.failed || s.cancelled))
            || status
                .operations
                .iter()
                .any(|op| self.ops.get(op).is_some_and(|s| s.failed))
        {
            return "failed";
        }
        if status.completed
            || (!status.operations.is_empty()
                && status.operations.iter().all(|op| {
                    self.ops.get(op).is_some_and(|s| s.completed)
                        || status.completed_operations.iter().any(|done| done == op)
                }))
        {
            return "completed";
        }
        if status
            .operations
            .iter()
            .any(|op| self.ops.get(op).is_some_and(|s| s.running))
            || status
                .runs
                .iter()
                .any(|run| self.runs.get(run).is_some_and(|s| s.active))
        {
            return "running";
        }
        if status.closed && status.all_dependencies_satisfied && status.all_approvals_satisfied {
            return "ready";
        }
        if !status.dependencies.is_empty() && !status.all_dependencies_satisfied {
            return "waiting-dependencies";
        }
        "declared"
    }
}

fn run_state(status: &RunStatus) -> &'static str {
    if status.cancelled {
        "cancelled"
    } else if status.failed {
        "failed"
    } else if status.completed {
        "completed"
    } else if status.active {
        "active"
    } else {
        "pending"
    }
}

fn op_state(status: &OpStatus) -> &'static str {
    if status.failed {
        "failed"
    } else if status.completed {
        "completed"
    } else if status.running {
        "running"
    } else if status.pending {
        "pending"
    } else {
        "declared"
    }
}

fn push_unique(items: &mut Vec<String>, value: &str) {
    if !items.iter().any(|item| item == value) {
        items.push(value.to_owned());
    }
}

fn summarize_field(value: &str, max_chars: usize) -> String {
    let mut out = String::new();
    let mut count = 0;
    for c in value.chars() {
        if count >= max_chars {
            out.push_str("...");
            return out;
        }
        if c == '\n' {
            out.push_str("\\n");
        } else {
            out.push(c);
        }
        count += 1;
    }
    out
}

#[derive(Debug, Clone)]
struct LlmTaskSpec {
    task: String,
    run: String,
    op: String,
    prompt: String,
    priority: String,
    work_type: String,
    contexts: Vec<String>,
    dependencies: Vec<String>,
    deadline: Option<String>,
}

async fn task_llm(args: Vec<String>) -> Result<()> {
    let mut submit = false;
    let mut task: Option<String> = None;
    let mut run: Option<String> = None;
    let mut op: Option<String> = None;
    let mut priority = "3".to_owned();
    let mut work_type = "agentic-llm".to_owned();
    let mut contexts = Vec::new();
    let mut dependencies = Vec::new();
    let mut deadline = None;
    let mut prompt_parts = Vec::new();
    let mut iter = args.into_iter();
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--submit" => submit = true,
            "--dry-run" => submit = false,
            "--task" => {
                task = Some(
                    iter.next()
                        .ok_or_else(|| anyhow!("--task requires an id"))?,
                );
            }
            "--run" => {
                run = Some(iter.next().ok_or_else(|| anyhow!("--run requires an id"))?);
            }
            "--op" => {
                op = Some(iter.next().ok_or_else(|| anyhow!("--op requires an id"))?);
            }
            "--priority" => {
                let value = iter
                    .next()
                    .ok_or_else(|| anyhow!("--priority requires 1|2|3|4"))?;
                priority = parse_priority(&value)?;
            }
            "--work-type" => {
                work_type = iter
                    .next()
                    .ok_or_else(|| anyhow!("--work-type requires a label"))?;
            }
            "--context" => {
                let value = iter
                    .next()
                    .ok_or_else(|| anyhow!("--context requires a repo-relative path"))?;
                contexts.push(validate_repo_relative_path(&value)?);
            }
            "--depends-on" => {
                dependencies
                    .push(iter.next().ok_or_else(|| {
                        anyhow!("--depends-on requires an existing task subject")
                    })?);
            }
            "--deadline" => {
                deadline = Some(
                    iter.next()
                        .ok_or_else(|| anyhow!("--deadline requires an ISO timestamp"))?,
                );
            }
            other if other.starts_with("--") => bail!("unknown flag: {other}"),
            other => {
                prompt_parts.push(other.to_owned());
                prompt_parts.extend(iter);
                break;
            }
        }
    }
    let prompt = prompt_parts.join(" ");
    if prompt.trim().is_empty() {
        bail!("usage: {TASK_LLM_USAGE}");
    }

    let seed = mint_cli_task_seed();
    let spec = LlmTaskSpec {
        task: task.unwrap_or_else(|| format!("task:cli-llm:{seed}")),
        run: run.unwrap_or_else(|| format!("run:cli-llm:{seed}")),
        op: op.unwrap_or_else(|| format!("op:cli-llm:{seed}")),
        prompt,
        priority,
        work_type,
        contexts,
        dependencies,
        deadline,
    };
    let claims = llm_task_claims(&spec);
    println!(
        "task=llm task={} run={} op={} priority={} work-type={} claims={} submit={submit}",
        spec.task,
        spec.run,
        spec.op,
        spec.priority,
        spec.work_type,
        claims.len()
    );
    for claim in &claims {
        println!("({}, {}, {})", claim.subject, claim.predicate, claim.object);
    }
    if submit {
        submit_claims("mash-cli-task-llm", &claims).await?;
        println!("submitted {} claims to hub", claims.len());
    } else {
        println!("dry-run only; pass --submit to witness task claims");
    }
    Ok(())
}

fn mint_cli_task_seed() -> u128 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_nanos())
        .unwrap_or(0)
}

fn parse_priority(value: &str) -> Result<String> {
    match value {
        "1" | "2" | "3" | "4" => Ok(value.to_owned()),
        other => bail!("--priority must be one of 1|2|3|4, got {other:?}"),
    }
}

fn validate_repo_relative_path(value: &str) -> Result<String> {
    let path = Path::new(value);
    if path.as_os_str().is_empty() || path.is_absolute() {
        bail!("context path must be non-empty and relative: {value}");
    }
    for component in path.components() {
        if matches!(
            component,
            Component::ParentDir | Component::RootDir | Component::Prefix(_)
        ) {
            bail!("context path escapes repository root: {value}");
        }
    }
    Ok(value.to_owned())
}

fn llm_task_claims(spec: &LlmTaskSpec) -> Vec<Claim> {
    let mut claims = vec![
        Claim::new(&spec.task, IS_A_TERM, TASK),
        Claim::new(&spec.task, HAS_COMMAND, &spec.prompt),
        Claim::new(&spec.task, TASK_HAS_TARGET, WORKER_REPOSITORY_LLM),
        Claim::new(&spec.task, HAS_PRIORITY, &spec.priority),
        Claim::new(&spec.task, HAS_WORK_TYPE, &spec.work_type),
        Claim::new(&spec.task, HAS_ALL_APPROVALS_SATISFIED, &spec.task),
        Claim::new(
            &spec.task,
            mash_library::time::lifecycle::IS_CLOSED,
            &spec.task,
        ),
        Claim::new(&spec.task, HAS_RUN, &spec.run),
        Claim::new(&spec.task, HAS_OPERATION, &spec.op),
        Claim::new(&spec.run, IS_A_TERM, RUN),
        Claim::new(&spec.run, HAS_ATTEMPT, &spec.op),
        Claim::new(&spec.run, HAS_MAX_ATTEMPTS, "1"),
        Claim::new(&spec.run, IS_RUN_ACTIVE, &spec.run),
        Claim::new(&spec.op, IS_A_TERM, OPERATION),
        Claim::new(&spec.op, HAS_FUNCTION, LLM_FUNCTION),
        Claim::new(&spec.op, RUNS_COMMAND, render_llm_prompt(spec)),
        Claim::new(&spec.op, IS_PENDING, &spec.op),
        Claim::new(&spec.op, IS_ASSIGNED_TO_TASK, &spec.task),
        Claim::new(&spec.op, ATTEMPT_NUMBER, "1"),
        Claim::new(&spec.op, IS_INTENT_SET, WORKER_REPOSITORY_LLM),
    ];
    for context in &spec.contexts {
        claims.push(Claim::new(&spec.task, HAS_CONTEXT_PATH, context));
    }
    for dependency in &spec.dependencies {
        claims.push(Claim::new(&spec.task, DEPENDS_ON, dependency));
    }
    if spec.dependencies.is_empty() {
        claims.push(Claim::new(
            &spec.task,
            HAS_ALL_DEPENDENCIES_SATISFIED,
            &spec.task,
        ));
    }
    if let Some(deadline) = &spec.deadline {
        claims.push(Claim::new(&spec.run, HAS_DEADLINE, deadline));
    }
    claims
}

fn render_llm_prompt(spec: &LlmTaskSpec) -> String {
    if spec.contexts.is_empty() {
        return spec.prompt.clone();
    }
    let mut out = String::from("Repository context paths:\n");
    for context in &spec.contexts {
        out.push_str("- ");
        out.push_str(context);
        out.push('\n');
    }
    out.push_str("\nTask:\n");
    out.push_str(&spec.prompt);
    out
}

fn repository_harness_claims() -> Vec<Claim> {
    vec![
        Claim::new("harness-doc:claude", HAS_NAME, "Repository Agent Guide"),
        Claim::new(
            "harness-doc:claude",
            HAS_DESCRIPTION,
            "Operating instructions for agent work in this repository.",
        ),
        Claim::new("harness-doc:claude", HAS_DEPLOY_PATH, "CLAUDE.md"),
        Claim::new("harness-doc:claude", HARNESS_HAS_BODY, CLAUDE_MD_BODY),
        Claim::new("harness-command:mash-orient", HAS_NAME, "mash-orient"),
        Claim::new(
            "harness-command:mash-orient",
            HAS_DESCRIPTION,
            "Inspect MASH status and current harness/orchestration state.",
        ),
        Claim::new(
            "harness-command:mash-orient",
            HARNESS_HAS_BODY,
            MASH_ORIENT_COMMAND_BODY,
        ),
    ]
}

fn checked_target_path(root: &Path, relative: &Path) -> Result<PathBuf> {
    if relative.is_absolute() {
        bail!("harness path must be relative: {}", relative.display());
    }
    for component in relative.components() {
        if matches!(
            component,
            Component::ParentDir | Component::RootDir | Component::Prefix(_)
        ) {
            bail!("harness path escapes root: {}", relative.display());
        }
    }
    Ok(root.join(relative))
}

fn write_artifact_file(path: &Path, artifact: &HarnessPublicationArtifact) -> Result<&'static str> {
    if let Some(parent) = path.parent().filter(|p| !p.as_os_str().is_empty()) {
        std::fs::create_dir_all(parent).with_context(|| format!("create {}", parent.display()))?;
    }
    if matches!(
        std::fs::read_to_string(path),
        Ok(existing) if existing == artifact.body
    ) {
        return Ok("unchanged");
    }
    let filename = path
        .file_name()
        .and_then(|name| name.to_str())
        .ok_or_else(|| anyhow!("invalid output path {}", path.display()))?;
    let tmp = path.with_file_name(format!(".{filename}.mash-tmp"));
    std::fs::write(&tmp, &artifact.body).with_context(|| format!("write {}", tmp.display()))?;
    std::fs::rename(&tmp, path)
        .with_context(|| format!("rename {} to {}", tmp.display(), path.display()))?;
    Ok("wrote")
}

const CLAUDE_MD_BODY: &str = r#"# Repository Agent Guide

This file is generated by `mash harness publish`.

## Operating Rules

- Work inside the scope the user requested.
- Preserve unrelated user changes in the worktree.
- Do not run destructive Git commands unless explicitly requested.
- Prefer `rg` for searching and inspect code before designing abstractions.
- For MASH work, operate from `operations/engineering/tools/agentics/mash`.

## MASH

MASH is the repository-local agentic orchestration substrate. Its
current production shape is the consolidated `mash-engine` and
`mash-library` workspace. Treat older `mash-vocab-*`, `mash-port-*`,
and `mash-scene-*` names as historical unless a current file proves
otherwise.

Useful checks:

```bash
cargo run -p mash-library --bin mash -- doctor
cargo check --workspace
cargo test --workspace
scripts/check-crate-taxonomy.sh
```
"#;

const MASH_ORIENT_COMMAND_BODY: &str = r#"Inspect the current MASH state for agentic orchestration work.

Steps:

1. Work from `operations/engineering/tools/agentics/mash`.
2. Run `mash doctor` first; treat failures as blockers and warnings as orientation.
3. Run `mash os plan` to inspect the declared runtime.
4. If the hub is running, run `mash os status` to inspect observed launches.
5. Use `mash task llm --priority 2 --context <path> --submit <prompt>` to submit agentic work through the substrate.
6. Use `mash task status` to inspect task/run/op accountability traces.
7. Run `git status --short .`.
8. Search for stale split-crate references with `rg`.
9. Run `cargo check --workspace`.
10. Summarize what is implemented now versus what is only documented.
"#;

// ─────────────────────────────────────────────────────────────────────
// ping — confirm hub is up
// ─────────────────────────────────────────────────────────────────────

async fn ping() -> Result<()> {
    let connection = open(Vec::new(), "mash-cli-ping").await?;
    println!("hub reachable (session: {})", connection.session());
    Ok(())
}

// ─────────────────────────────────────────────────────────────────────
// witness — fire one claim at the hub
// ─────────────────────────────────────────────────────────────────────

async fn witness(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let subject = iter
        .next()
        .ok_or_else(|| anyhow!("usage: mash witness <subject> <predicate> <object>"))?;
    let predicate = iter
        .next()
        .ok_or_else(|| anyhow!("witness: missing <predicate>"))?;
    let object = iter
        .next()
        .ok_or_else(|| anyhow!("witness: missing <object>"))?;
    if iter.next().is_some() {
        bail!("witness: too many arguments");
    }
    let connection = open(Vec::new(), "mash-cli-witness").await?;
    let handle = connection.handle();
    handle
        .witness(&subject, &predicate, &object)
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    // Small flush delay — the outbound mpsc is unbounded, so the
    // send returns instantly. We need the writer task to drain
    // before we drop the connection or the assert is lost.
    tokio::time::sleep(std::time::Duration::from_millis(50)).await;
    println!("witnessed ({subject}, {predicate}, {object}) at True");
    Ok(())
}

// ─────────────────────────────────────────────────────────────────────
// watch — subscribe to a predicate and print settlements
// ─────────────────────────────────────────────────────────────────────

async fn watch(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let predicate = iter
        .next()
        .ok_or_else(|| anyhow!("usage: mash watch <predicate> [--limit N]"))?;
    let mut limit: Option<u64> = None;
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--limit" => {
                let v = iter
                    .next()
                    .ok_or_else(|| anyhow!("--limit requires a value"))?;
                limit = Some(
                    v.parse()
                        .map_err(|_| anyhow!("--limit value must be a number"))?,
                );
            }
            other => bail!("unknown flag: {other}"),
        }
    }

    let mut connection = open(vec![predicate.clone()], "mash-cli-watch").await?;
    eprintln!("watching {predicate} (Ctrl-C to stop)");
    let mut n: u64 = 0;
    while let Some(event) = connection.next_event_or_shutdown().await {
        match event {
            InboundEvent::Settled { claim, .. } => {
                let v = match claim.value {
                    Value::True => "T",
                    Value::False => "F",
                    Value::Both => "B",
                    Value::None => "N",
                };
                println!(
                    "[{v}] ({}, {}, {})",
                    claim.subject, claim.predicate, claim.object
                );
                n += 1;
                if let Some(k) = limit {
                    if n >= k {
                        break;
                    }
                }
            }
            InboundEvent::HubError { code, message } => {
                eprintln!("hub-error [{code}]: {message}");
            }
            InboundEvent::Closed => break,
        }
    }
    Ok(())
}

// ─────────────────────────────────────────────────────────────────────
// fiber — snapshot every cell of a predicate and exit
// ─────────────────────────────────────────────────────────────────────

async fn fiber(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let predicate = iter.next().ok_or_else(|| {
        anyhow!("usage: mash fiber <predicate> [--value t|f|both|none] [--json] [--idle-ms N]")
    })?;

    let mut value_filter: Option<Value> = None;
    let mut json = false;
    let mut idle_ms: u64 = 300;
    while let Some(arg) = iter.next() {
        match arg.as_str() {
            "--value" => {
                let v = iter
                    .next()
                    .ok_or_else(|| anyhow!("--value requires t|f|both|none"))?;
                value_filter = Some(parse_value_filter(&v)?);
            }
            "--json" => json = true,
            "--idle-ms" => {
                let v = iter
                    .next()
                    .ok_or_else(|| anyhow!("--idle-ms requires a number"))?;
                idle_ms = v
                    .parse()
                    .map_err(|_| anyhow!("--idle-ms value must be a number"))?;
            }
            other => bail!("unknown flag: {other}"),
        }
    }

    let mut connection = open(vec![predicate.clone()], "mash-cli-fiber").await?;

    // Drain the subscription's fiber replay. The hub has no "replay
    // done" signal on the wire, so fall back to an idle-timeout: exit
    // after `idle_ms` of silence on the inbound channel. Live cascade
    // activity during the window is included in the snapshot — this
    // reports the fiber at the moment of query, not transactionally.
    let idle = std::time::Duration::from_millis(idle_ms);
    let mut cells: Vec<(String, String, String, Value)> = Vec::new();
    loop {
        match tokio::time::timeout(idle, connection.next_event_or_shutdown()).await {
            Ok(Some(InboundEvent::Settled { claim, .. })) => {
                if let Some(want) = value_filter {
                    if claim.value != want {
                        continue;
                    }
                }
                cells.push((claim.subject, claim.predicate, claim.object, claim.value));
            }
            Ok(Some(InboundEvent::HubError { code, message })) => {
                eprintln!("hub-error [{code}]: {message}");
            }
            Ok(Some(InboundEvent::Closed)) | Ok(None) => break,
            Err(_) => break,
        }
    }

    cells.sort_by(|a, b| a.0.cmp(&b.0).then_with(|| a.2.cmp(&b.2)));

    if json {
        for (s, p, o, v) in &cells {
            let obj = serde_json::json!({
                "subject": s,
                "predicate": p,
                "object": o,
                "value": v.as_str(),
            });
            println!("{obj}");
        }
    } else {
        for (s, p, o, v) in &cells {
            let marker = match v {
                Value::True => "T",
                Value::False => "F",
                Value::Both => "B",
                Value::None => "N",
            };
            println!("[{marker}] ({s}, {p}, {o})");
        }
        eprintln!("({} cells in fiber of {predicate})", cells.len());
    }
    Ok(())
}

fn parse_value_filter(s: &str) -> Result<Value> {
    match s {
        "t" | "true" | "True" | "T" => Ok(Value::True),
        "f" | "false" | "False" | "F" => Ok(Value::False),
        "both" | "Both" | "B" => Ok(Value::Both),
        "none" | "None" | "N" => Ok(Value::None),
        other => bail!("--value must be one of t|f|both|none, got {other:?}"),
    }
}

// ─────────────────────────────────────────────────────────────────────
// dm — send a direct message to an agent account
// ─────────────────────────────────────────────────────────────────────

async fn dm(args: Vec<String>) -> Result<()> {
    let mut iter = args.into_iter();
    let recipient = iter
        .next()
        .ok_or_else(|| anyhow!("usage: mash dm <recipient-account> <body>"))?;
    let body = iter.collect::<Vec<_>>().join(" ");
    if body.is_empty() {
        bail!("dm: empty body");
    }
    let connection = open(Vec::new(), "mash-cli-dm").await?;
    let handle = connection.handle();

    let secs = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs())
        .unwrap_or(0);
    let msg = format!("msg:cli:{secs}");
    let sender = std::env::var("MASH_CLI_SENDER").unwrap_or_else(|_| "speaker:cli".to_owned());

    handle
        .witness(&msg, IS_A_TERM, MESSAGE)
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    handle
        .witness(&msg, WAS_SAID_BY, &sender)
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    handle
        .witness(&msg, ADDRESSED_TO, &recipient)
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    handle
        .witness(&msg, HAS_BODY, &body)
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;
    handle
        .witness(&msg, WAS_UTTERED_AT, &format!("{secs}"))
        .map_err(|e| anyhow!("witness dropped: {e:?}"))?;

    tokio::time::sleep(std::time::Duration::from_millis(100)).await;
    println!("dm sent to {recipient} (msg: {msg})");
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use mash_library::governance::os561::PROCESS_HUB;

    #[test]
    fn runtime_status_uses_latest_launch_and_exit_facts() {
        let mut snapshot = RuntimeStatusSnapshot::default();
        snapshot.ingest(
            PROCESS_HUB,
            HAS_RUNTIME_LAUNCH,
            "runtime-launch:old",
            Value::True,
        );
        snapshot.ingest(
            "runtime-launch:old",
            RUNTIME_STARTED_AT,
            "2026-04-29T00:00:00.000Z",
            Value::True,
        );
        snapshot.ingest(
            PROCESS_HUB,
            HAS_RUNTIME_LAUNCH,
            "runtime-launch:new",
            Value::True,
        );
        snapshot.ingest(
            "runtime-launch:new",
            RUNTIME_STARTED_AT,
            "2026-04-29T01:00:00.000Z",
            Value::True,
        );
        snapshot.ingest("runtime-launch:new", HAS_PROCESS_ID, "123", Value::True);
        snapshot.ingest(
            "runtime-launch:new",
            RUNTIME_EXITED_WITH,
            "exit status: 1",
            Value::True,
        );

        let line = snapshot.line_for_process(PROCESS_HUB);
        assert!(line.contains("state=exited"));
        assert!(line.contains("launch=runtime-launch:new"));
        assert!(line.contains("pid=123"));
        assert!(line.contains("exit=exit status: 1"));
    }

    #[test]
    fn doctor_report_counts_warnings_and_failures() {
        let mut report = DoctorReport::default();
        report.ok("workspace", "present");
        report.warn("hub", "not running");
        report.fail("manifest", "missing");

        assert_eq!(report.count(DoctorSeverity::Ok), 1);
        assert_eq!(report.count(DoctorSeverity::Warn), 1);
        assert_eq!(report.count(DoctorSeverity::Fail), 1);
        assert!(report.should_exit_nonzero(false));
        assert!(report.render().contains("summary ok=1 warn=1 fail=1"));
    }

    #[test]
    fn doctor_strict_mode_treats_warnings_as_blockers() {
        let mut report = DoctorReport::default();
        report.ok("workspace", "present");
        report.warn("hub", "not running");

        assert!(!report.should_exit_nonzero(false));
        assert!(report.should_exit_nonzero(true));
    }

    #[test]
    fn doctor_boot_claims_cover_agentic_orchestration_surface() {
        let claims = os_boot_claims();
        for predicate in [HAS_PRIORITY, HAS_WORK_TYPE, HAS_CONTEXT_PATH, HAS_RUN] {
            assert!(
                has_claim_subject_predicate(&claims, predicate, IS_A_PREDICATE),
                "missing predicate declaration for {predicate}"
            );
        }
        for term in [TASK, RUN, OPERATION, PROCESS_HUB] {
            assert!(
                has_claim_subject_predicate(&claims, term, IS_A_TERM),
                "missing boot term declaration for {term}"
            );
        }
    }

    #[test]
    fn doctor_runtime_plan_has_a_single_cargo_run_hub() {
        let processes = runtime_processes();
        assert_eq!(
            processes
                .iter()
                .filter(|process| process.subject == PROCESS_HUB)
                .count(),
            1
        );
        assert!(processes
            .iter()
            .all(|process| process.command.starts_with("cargo run ")));
        assert!(processes
            .iter()
            .all(|process| process.working_directory == MASH_WORKDIR));
        assert!(
            processes
                .iter()
                .filter(|process| process.effector_kind.is_some())
                .count()
                >= 3
        );
    }

    #[test]
    fn llm_task_claims_emit_scheduler_contract() {
        let spec = LlmTaskSpec {
            task: "task:test".to_owned(),
            run: "run:test".to_owned(),
            op: "op:test".to_owned(),
            prompt: "summarize the runtime".to_owned(),
            priority: "2".to_owned(),
            work_type: "research".to_owned(),
            contexts: vec!["operations/science/research/spatiotemporal-knowledge".to_owned()],
            dependencies: Vec::new(),
            deadline: Some("2026-04-30T00:00:00Z".to_owned()),
        };
        let claims = llm_task_claims(&spec);
        assert!(claims.iter().any(|claim| claim.subject == "task:test"
            && claim.predicate == HAS_PRIORITY
            && claim.object == "2"));
        assert!(claims.iter().any(|claim| claim.subject == "task:test"
            && claim.predicate == HAS_CONTEXT_PATH
            && claim.object == "operations/science/research/spatiotemporal-knowledge"));
        assert!(claims.iter().any(|claim| claim.subject == "task:test"
            && claim.predicate == HAS_RUN
            && claim.object == "run:test"));
        assert!(claims.iter().any(|claim| claim.subject == "run:test"
            && claim.predicate == HAS_ATTEMPT
            && claim.object == "op:test"));
        assert!(claims.iter().any(|claim| claim.subject == "run:test"
            && claim.predicate == HAS_DEADLINE
            && claim.object == "2026-04-30T00:00:00Z"));
        assert!(claims.iter().any(|claim| claim.subject == "op:test"
            && claim.predicate == RUNS_COMMAND
            && claim.object.contains("Repository context paths:")));
        assert!(claims.iter().any(|claim| claim.subject == "op:test"
            && claim.predicate == IS_INTENT_SET
            && claim.object == WORKER_REPOSITORY_LLM));
        assert!(!claims
            .iter()
            .any(|claim| claim.predicate == "is-ready-to-run-on-llm"));
    }

    #[test]
    fn llm_task_with_dependencies_does_not_close_dependency_rollup() {
        let spec = LlmTaskSpec {
            task: "task:test".to_owned(),
            run: "run:test".to_owned(),
            op: "op:test".to_owned(),
            prompt: "continue after prep".to_owned(),
            priority: "3".to_owned(),
            work_type: "agentic-llm".to_owned(),
            contexts: Vec::new(),
            dependencies: vec!["task:prep".to_owned()],
            deadline: None,
        };
        let claims = llm_task_claims(&spec);
        assert!(claims.iter().any(|claim| claim.subject == "task:test"
            && claim.predicate == DEPENDS_ON
            && claim.object == "task:prep"));
        assert!(!claims.iter().any(|claim| claim.subject == "task:test"
            && claim.predicate == HAS_ALL_DEPENDENCIES_SATISFIED));
    }

    #[test]
    fn context_paths_must_be_repo_relative() {
        assert!(validate_repo_relative_path("operations/science").is_ok());
        assert!(validate_repo_relative_path("../outside").is_err());
        assert!(validate_repo_relative_path("/tmp/outside").is_err());
    }

    #[test]
    fn task_status_rolls_up_task_run_and_op() {
        let mut snapshot = TaskStatusSnapshot::default();
        snapshot.ingest("task:t", IS_A_TERM, TASK, Value::True);
        snapshot.ingest("task:t", HAS_COMMAND, "summarize context", Value::True);
        snapshot.ingest("task:t", HAS_PRIORITY, "2", Value::True);
        snapshot.ingest("task:t", HAS_WORK_TYPE, "research", Value::True);
        snapshot.ingest(
            "task:t",
            HAS_CONTEXT_PATH,
            "operations/science",
            Value::True,
        );
        snapshot.ingest(
            "task:t",
            HAS_ALL_DEPENDENCIES_SATISFIED,
            "task:t",
            Value::True,
        );
        snapshot.ingest("task:t", HAS_ALL_APPROVALS_SATISFIED, "task:t", Value::True);
        snapshot.ingest(
            "task:t",
            mash_library::time::lifecycle::IS_CLOSED,
            "task:t",
            Value::True,
        );
        snapshot.ingest("task:t", HAS_RUN, "run:r", Value::True);
        snapshot.ingest("task:t", HAS_OPERATION, "op:o", Value::True);
        snapshot.ingest("run:r", HAS_ATTEMPT, "op:o", Value::True);
        snapshot.ingest("run:r", HAS_MAX_ATTEMPTS, "1", Value::True);
        snapshot.ingest("run:r", IS_RUN_ACTIVE, "run:r", Value::True);
        snapshot.ingest("op:o", HAS_FUNCTION, LLM_FUNCTION, Value::True);
        snapshot.ingest("op:o", ATTEMPT_NUMBER, "1", Value::True);
        snapshot.ingest("op:o", IS_COMPLETED, "op:o", Value::True);
        snapshot.ingest("op:o", COMPLETED_AT, "2026-04-29T00:00:00Z", Value::True);
        snapshot.ingest("op:o", PRODUCED_COMPLETION, "result text", Value::True);

        let lines = snapshot.lines(Some("task:t"));
        assert!(lines.iter().any(|line| line.contains("state=completed")));
        assert!(lines.iter().any(|line| line.contains("priority=2")));
        assert!(lines
            .iter()
            .any(|line| line.contains("context=operations/science")));
        assert!(lines
            .iter()
            .any(|line| line.contains("run=run:r state=active")));
        assert!(lines
            .iter()
            .any(|line| line.contains("op=op:o state=completed")));
        assert!(lines
            .iter()
            .any(|line| line.contains("completion=result text")));
    }
}
