---
title: "github-issues-driver — GitHub Issues bidirectional bridge"
description: "Bidirectional bridge between substrate task cells and GitHub Issues. Issues, comments, labels, assignees, state transitions flow both ways. Webhook ingestion plus REST polling fallback. Substrate is canonical for OS-originated tasks; GitHub is canonical for externally-filed issues; disagreements project to ⊤."
kind: spec
status: normative
version: "0.4"
---

# github-issues-driver

Bridges substrate task cells with GitHub Issues.
The captain's engineering work that already lives in GitHub-hosted repositories — bug reports, feature requests, contributor-filed issues — flows into the OS as typed substrate cells.
OS-originated tasks routed to a GitHub-tracked component project surface there as Issues.
GitHub-side mutations (comments, label changes, assignee changes, state transitions) flow back as substrate events.

Per [decisions/external-systems-get-drivers-peers-get-federation.md](../../decisions/external-systems-get-drivers-peers-get-federation.md): GitHub is an external system, not a 561 federation peer, so the bridge is a driver per [drivers/driver-model.md](driver-model.md), not a federation handshake per [network/federation-protocol.md](../network/federation-protocol.md).
Per [decisions/network-protocols-are-real-bindings.md](../../decisions/network-protocols-are-real-bindings.md): the wire layer is GitHub's published REST + webhook surface (https://docs.github.com/en/rest, https://docs.github.com/en/webhooks); the spec binds it to substrate cells but does not re-document it.

## 1. Driver record

```json
{
  "kind": "driver",
  "slug": "driver:github-issues",
  "version": "0.4.0",
  "capabilities-required": [
    {"predicate": "respond", "target-pattern": "task:*|gh-issue:*|gh-comment:*"},
    {"predicate": "set", "target-pattern": "task:*|gh-issue:*|gh-comment:*|gh-repo:*|gh-label:*|gh-user:*"},
    {"predicate": "network-https-connect", "target-pattern": "api.github.com:443"},
    {"predicate": "network-https-listen", "target-pattern": "*/webhooks/github"},
    {"predicate": "secret-decrypt", "target-pattern": "secret:github-credential:*"}
  ],
  "capabilities-grants": [
    {"predicate": "github-issue-read", "target-pattern": "gh-issue:*"},
    {"predicate": "github-issue-write", "target-pattern": "gh-issue:*"},
    {"predicate": "github-comment-write", "target-pattern": "gh-comment:*"}
  ],
  "implementation-language": "rust",
  "implementation-package": "substrate-driver-github-issues",
  "implementation-version": ">=0.4.0",
  "extracts": ["github-webhook-receive", "github-rest-poll-issues", "github-rest-poll-comments"],
  "applies": ["github-create-issue", "github-update-issue", "github-create-comment", "github-update-state", "github-update-labels", "github-update-assignees"],
  "composes": ["task-and-issue-merge"]
}
```

## 2. Cell mapping

### 2.1 Repositories

A configured GitHub repository is a substrate entity:

```json
{"subject": "gh-repo:<owner>/<repo>", "predicate": "kind", "object": "gh-repo", "value": "True"}
{"subject": "gh-repo:<owner>/<repo>", "predicate": "github-node-id", "object": "<base64-node-id>", "value": "True"}
{"subject": "gh-repo:<owner>/<repo>", "predicate": "default-branch", "object": "main", "value": "True"}
{"subject": "gh-repo:<owner>/<repo>", "predicate": "uses-credential", "object": "secret:github-credential:<slug>", "value": "True"}
{"subject": "gh-repo:<owner>/<repo>", "predicate": "webhook-id", "object": "<github-hook-id>", "value": "True"}
{"subject": "gh-repo:<owner>/<repo>", "predicate": "binds-substrate-project", "object": "project:<slug>", "value": "True"}
```

The `binds-substrate-project` predicate names the substrate project (per the v0.7 tasks app) whose tasks may project into this repository's issues.

### 2.2 Issues

```json
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "kind", "object": "gh-issue", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "of-repo", "object": "gh-repo:<owner>/<repo>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "github-node-id", "object": "<base64-node-id>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "title", "object": "<title-text>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "body-cell", "object": "cell:<sha256-of-body>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "state", "object": "open|closed", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "state-reason", "object": "completed|not-planned|reopened|None", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "label", "object": "gh-label:<owner>/<repo>:<name>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "assignee", "object": "gh-user:<login>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "author", "object": "gh-user:<login>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "created-at-wall-clock", "object": "<rfc3339>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "updated-at-wall-clock", "object": "<rfc3339>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "github-etag", "object": "<etag>", "value": "True"}
```

Issue body text is stored as a content-addressed cell (`body-cell`); the metadata cells reference it.
Edits to the body produce new content-cells with `supersedes` predicates per [decisions/inter-session-messaging-is-substrate-cells.md](../../decisions/inter-session-messaging-is-substrate-cells.md) §"What it rules out" (no in-place mutation).

### 2.3 Comments

```json
{"subject": "gh-comment:<owner>/<repo>#<number>:<comment-id>", "predicate": "kind", "object": "gh-comment", "value": "True"}
{"subject": "gh-comment:<owner>/<repo>#<number>:<comment-id>", "predicate": "of-issue", "object": "gh-issue:<owner>/<repo>#<number>", "value": "True"}
{"subject": "gh-comment:<owner>/<repo>#<number>:<comment-id>", "predicate": "body-cell", "object": "cell:<sha256-of-body>", "value": "True"}
{"subject": "gh-comment:<owner>/<repo>#<number>:<comment-id>", "predicate": "author", "object": "gh-user:<login>", "value": "True"}
{"subject": "gh-comment:<owner>/<repo>#<number>:<comment-id>", "predicate": "created-at-wall-clock", "object": "<rfc3339>", "value": "True"}
```

### 2.4 Labels and users

```json
{"subject": "gh-label:<owner>/<repo>:<name>", "predicate": "kind", "object": "gh-label", "value": "True"}
{"subject": "gh-label:<owner>/<repo>:<name>", "predicate": "color", "object": "<6-hex>", "value": "True"}

{"subject": "gh-user:<login>", "predicate": "kind", "object": "gh-user", "value": "True"}
{"subject": "gh-user:<login>", "predicate": "github-node-id", "object": "<base64-node-id>", "value": "True"}
{"subject": "gh-user:<login>", "predicate": "binds-personnel", "object": "personnel:<slug>", "value": "True"}
```

The `binds-personnel` predicate is optional; when present it lets closure rules cross-reference GitHub identities and the OS's personnel records (per [specs/security/persona-and-personnel.md](../security/persona-and-personnel.md)).

### 2.5 Substrate task ↔ GitHub issue link

Every binding is a substrate cell, not a side-table:

```json
{"subject": "task:<slug>", "predicate": "projects-to-github-issue", "object": "gh-issue:<owner>/<repo>#<number>", "value": "True"}
{"subject": "gh-issue:<owner>/<repo>#<number>", "predicate": "projected-from-task", "object": "task:<slug>", "value": "True"}
```

Both directions are asserted at link time; either is queryable; closure rules use the symmetric pair to keep the two records in sync.

## 3. Three operations

### 3.1 Extract (GitHub → substrate)

Two paths feed the substrate; both produce the same cell shapes:

1. **Webhook ingestion (primary).** GitHub POSTs `issues`, `issue_comment`, and `label` events to the configured webhook endpoint.
  The payload is verified via the webhook's HMAC-SHA-256 signature (`X-Hub-Signature-256` header) against the webhook secret stored under `secret:github-webhook-secret:<repo-slug>`.
  On verification, the payload is translated to substrate cells via the §2 mapping and the new cells are appended through standard `respond` calls with `sender = driver:github-issues`.

2. **REST polling (fallback).** When webhooks are unconfigured, behind a NAT, or recovering from missed events, the driver polls `GET /repos/{owner}/{repo}/issues?since=<last-poll-wall-clock>&state=all` and `GET /repos/{owner}/{repo}/issues/comments?since=<last-poll-wall-clock>` per the GitHub REST API (https://docs.github.com/en/rest/issues).
  Conditional requests use the per-issue `github-etag` cell to short-circuit unchanged issues.
  Default poll interval is 60s; configurable via `(gh-repo:<...>, poll-interval-seconds, <int>)`.

Either path's output is the same set of cell mutations; downstream closure rules cannot tell which path produced a cell.

### 3.2 Apply (substrate → GitHub)

Closure rules produce intent-cells; the driver's listener subscribes to firings and translates to REST calls:

| Intent cell | REST call |
|---|---|
| `(task:<slug>, project-to-github, gh-repo:<owner>/<repo>, t)` | `POST /repos/{owner}/{repo}/issues` |
| `(gh-issue:<...>, set-title, "<text>", t)` | `PATCH /repos/{owner}/{repo}/issues/{number}` |
| `(gh-issue:<...>, set-state, closed, t)` with `(gh-issue:<...>, set-state-reason, completed, t)` | `PATCH /repos/{owner}/{repo}/issues/{number}` |
| `(gh-issue:<...>, set-labels, [<gh-label>], t)` | `PUT /repos/{owner}/{repo}/issues/{number}/labels` |
| `(gh-issue:<...>, set-assignees, [<gh-user>], t)` | `POST /repos/{owner}/{repo}/issues/{number}/assignees` |
| `(gh-issue:<...>, post-comment, "<body>", t)` | `POST /repos/{owner}/{repo}/issues/{number}/comments` |

The REST call is bounded by the driver's capability fiber via $\Rightarrow$ per [drivers/driver-model.md](driver-model.md) §5.
On HTTP success, the driver re-extracts the affected entity (single-issue or single-comment GET) so substrate state reflects GitHub's authoritative response (which may have applied transformations — e.g., label normalization).

### 3.3 Compose

When extract and apply produce overlapping mutations on the same cell within the same heartbeat tick — for example, an OS-originated retitling of `task:T` produces an apply, while in flight a GitHub-side editor also retitled the issue — the per-cell merge runs $\odot$ per [decisions/bilattice-as-the-value-domain.md](../../decisions/bilattice-as-the-value-domain.md):

- Equal values → settle at the agreed value.
- Different values → settle at $\top$ on the disputed predicate; closure rules surface the disagreement to the operator.

The merge rule is implemented via the standard substrate $\odot$ pass; the driver does not implement a separate conflict resolver.

## 4. Sync direction and conflict policy

| Predicate scope | Canonical side | Disagreement |
|---|---|---|
| OS-originated `task:*` projected to GitHub | Substrate is canonical. GitHub-side edits to fields the substrate authored produce $\top$; the substrate's value wins downstream consumers. | $\top$ surfaces; closure rules emit a `(task:<slug>, has-github-disagreement, gh-issue:<...>) = True` cell. |
| Externally-filed `gh-issue:*` (no `projected-from-task`) | GitHub is canonical. Substrate-side edits to such issues are an error unless the issue has been linked to a substrate task via `projects-to-github-issue`. | Edits without a link return `PCD_GITHUB_NOT_AUTHORITATIVE`. |
| Linked records, fields neither side claims as authoritative (e.g., third-party labels, comments by third parties) | Both sides hold; $\odot$ settles. | Equal: agreement. Different: $\top$. |
| Issue numbers, GitHub node ids, GitHub etags | GitHub is always canonical. The substrate never authors these. | N/A — substrate-side edit is a code bug. |

The bilattice's $\top$ value is the explicit "both sides disagree" signal; downstream closure rules MUST handle $\top$ rather than treating it as an error per [decisions/bilattice-as-the-value-domain.md](../../decisions/bilattice-as-the-value-domain.md).

## 5. Authentication

Two authentication modes; both follow [security/secrets-management.md](../security/secrets-management.md):

### 5.1 Personal Access Token (fine-grained, recommended)

```json
{"subject": "secret:github-credential:<slug>", "predicate": "kind", "object": "secret", "value": "True"}
{"subject": "secret:github-credential:<slug>", "predicate": "secret-kind", "object": "github-pat", "value": "True"}
{"subject": "secret:github-credential:<slug>", "predicate": "owned-by", "object": "personnel:<slug>", "value": "True"}
{"subject": "secret:github-credential:<slug>", "predicate": "encrypted-region-cell", "object": "cell:<...>", "value": "True"}
{"subject": "secret:github-credential:<slug>", "predicate": "scope-allows", "object": "repo:<owner>/<repo>", "value": "True"}
```

The decrypted PAT is sent as `Authorization: Bearer <token>` per https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api.
The driver reads the secret per [security/secrets-management.md](../security/secrets-management.md) §3.

### 5.2 GitHub App installation

For multi-user / organization deployments.
The substrate stores:

```json
{"subject": "secret:github-app:<slug>", "predicate": "secret-kind", "object": "github-app-private-key", "value": "True"}
{"subject": "secret:github-app:<slug>", "predicate": "github-app-id", "object": "<numeric>", "value": "True"}
{"subject": "secret:github-app:<slug>", "predicate": "encrypted-region-cell", "object": "cell:<...>", "value": "True"}
```

The driver mints short-lived installation tokens per https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app. Tokens are held in transient cells with `expires-at-ord`; refresh is a closure rule firing on the heartbeat tick.

### 5.3 Webhook secret

Each `gh-repo:<...>` has a paired `secret:github-webhook-secret:<...>` whose plaintext is GitHub's HMAC key.
Inbound webhook payloads are rejected with `PCD_GITHUB_WEBHOOK_SIGNATURE_INVALID` if `X-Hub-Signature-256` does not match.

## 6. Webhook ingestion

The driver listens on `POST /webhooks/github/<repo-slug>` (per [network/http-addressing.md](../network/http-addressing.md)).
Per https://docs.github.com/en/webhooks:

1. Verify `X-Hub-Signature-256` HMAC-SHA-256 against the webhook secret.
2. Verify `X-GitHub-Event` is one of `issues`, `issue_comment`, `label`, `ping`.
  Other events are 200-acked and ignored.
3. Decode JSON payload.
4. Translate to substrate cells per §2.
5. Append cells via `respond` with `sender = driver:github-issues`, `evidence = { webhook-delivery-id: <X-GitHub-Delivery> }`.
6. Return 204.

The `X-GitHub-Delivery` UUID is recorded as `(gh-issue:<...>, last-webhook-delivery-id, <uuid>)` for replay-deduplication: a re-delivered webhook with a known delivery-id is acked but produces no new cells.

## 7. REST polling and rate-limit handling

REST calls respect GitHub's documented rate limits (https://docs.github.com/en/rest/overview/rate-limits-for-the-rest-api):

- Authenticated PAT: 5,000 requests / hour / token.
- GitHub App installation: 5,000–15,000 requests / hour depending on installation size.
- The `X-RateLimit-Remaining` and `X-RateLimit-Reset` response headers are recorded as `(secret:github-credential:<slug>, ratelimit-remaining, <int>)` and `(secret:github-credential:<slug>, ratelimit-reset-wall-clock, <rfc3339>)` substrate cells per call.
  A closure rule slows polling when remaining < 200.
- A `403` with `X-RateLimit-Remaining: 0` returns `PCD_GITHUB_RATE_LIMITED`; the driver waits until `reset` per the standard restart policy `always-with-backoff` per [drivers/driver-model.md](driver-model.md) §4.
- A `403` carrying `Retry-After` (secondary rate limit) honors the header.

Conditional requests (`If-None-Match: <github-etag>`) avoid consuming rate-limit budget for unchanged resources per https://docs.github.com/en/rest/overview/best-practices-for-using-the-rest-api.

## 8. Retry and idempotency

- Apply operations are retried on transient errors (5xx, 502/503/504, network timeouts) with exponential backoff (1s, 2s, 4s, 8s, max 60s, max 5 retries).
- POST operations include a substrate-generated UUID as `X-Substrate-Idempotency-Key` header (informational; GitHub does not honor it but the driver uses it locally to suppress duplicate retries within a session).
- A failed apply operation transitions the driver record's per-intent state to `(intent:<id>, github-apply-state, failed, t)`; retry policy fires from a closure rule per the substrate's standard supervision discipline.

## 9. Signed-event model

Per [decisions/federation-by-construction.md](../../decisions/federation-by-construction.md) and [decisions/federation-signatures-ed25519.md](../../decisions/federation-signatures-ed25519.md):

- Cells produced by extract carry `sender = driver:github-issues` in their event envelope; the driver's identity is signed by the substrate's Ed25519 key per the standard event-signing path.
- The original GitHub-side authorship is recorded as a substrate predicate (`(gh-issue:<...>, author, gh-user:<login>)`); GitHub's identity is NOT a substrate signing principal — `gh-user` records are inert reference cells, not signers.
- Federated peers receiving GitHub-bridged cells from a 561 peer verify the peer's signature in the standard way; the cell content shows that the peer's `driver:github-issues` was the proximate sender.
  A peer cannot impersonate GitHub the upstream.

This means: an audit can answer "which 561 node received this from GitHub" and "what was the GitHub-reported author at the time of receipt" — but the substrate does not pretend to verify GitHub identity claims cryptographically.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCD_GITHUB_AUTH_FAILED` | The credential (PAT or installation token) was rejected by GitHub (401). |
| `PCD_GITHUB_NOT_FOUND` | The referenced repo / issue / comment does not exist on GitHub (404). |
| `PCD_GITHUB_RATE_LIMITED` | Primary or secondary rate limit hit; backoff in progress. |
| `PCD_GITHUB_WEBHOOK_SIGNATURE_INVALID` | Inbound webhook's HMAC-SHA-256 did not verify. |
| `PCD_GITHUB_NOT_AUTHORITATIVE` | Substrate-side mutation attempted on an externally-filed issue not linked to a substrate task. |
| `PCD_GITHUB_PAYLOAD_MALFORMED` | Webhook or REST response did not match the expected schema. |
| `PCD_GITHUB_INSTALLATION_REVOKED` | The GitHub App installation was uninstalled by the repository owner; driver enters `degraded`. |
| `PCD_GITHUB_REPO_ARCHIVED` | The bound repository is archived; mutations rejected by GitHub. |

Standard `PCD_DRIVER_*` codes from [drivers/driver-model.md](driver-model.md) §10 apply to lifecycle.

## 11. Implementation

### Rust (v0.4+)

- `octocrab` crate (https://github.com/XAMPPRocky/octocrab) for the REST surface.
- `axum` or the substrate's existing HTTP server for the webhook listener.
- `hmac` + `sha2` crates for HMAC-SHA-256 signature verification.
- `jsonwebtoken` for GitHub App installation-token minting.
- Driver crate: `substrate-driver-github-issues`.

### Python (parity, v0.4+)

- `httpx` for REST client.
- `aiohttp` or substrate's HTTP server for the webhook listener.
- `cryptography` for HMAC-SHA-256 and JWT.
- Driver class: `substrate.drivers.github_issues.
  GitHubIssuesDriver`.

Cross-language cells produced from the same GitHub event payload MUST be byte-identical per [conformance-vectors.md](../conformance-vectors.md) §7.

## 12. Conformance

The github-issues-driver passes:

1. **Round-trip.** Asserting `(task:T, project-to-github, gh-repo:<owner>/<repo>, t)` produces a substrate-resident `gh-issue:<owner>/<repo>#N`.
  A simulated GitHub webhook closing the issue produces `(gh-issue:<...>, state, closed, t)` and a closure-rule firing settles `(task:T, status, completed, t)`.
  A second close-webhook with the same `X-GitHub-Delivery` is acked but produces no further substrate cells.
2. **Webhook signature verification.** A webhook payload with a valid `X-Hub-Signature-256` is admitted; an invalid signature is rejected with `PCD_GITHUB_WEBHOOK_SIGNATURE_INVALID`; in both cases the substrate state reflects the documented outcome.
3. **REST poll fallback.** With webhook delivery suppressed, the driver's poll loop fetches the same issue mutation within the configured poll interval; the resulting substrate cells are byte-identical to the webhook-path cells.
4. **Rate-limit backoff.** A simulated `403` with `X-RateLimit-Remaining: 0` and a `reset` 60s in the future causes the driver to suspend polling until reset; no `PCD_DRIVER_FAILED` transition occurs.
5. **Bilattice merge.** Concurrent OS-side and GitHub-side retitles (different titles) settle the title cell at $\top$; a `(task:<...>, has-github-disagreement, gh-issue:<...>) = True` cell appears.
6. **Capability denial.** A session whose boundary lacks `github-issue-write` against the target repo cannot fire the `project-to-github` intent; the standard `PCA_SCOPE_INSUFFICIENT` repair-log entry is preserved.
7. **Cross-language equivalence.** A documented webhook payload produces byte-identical substrate cells in Rust and Python implementations.
8. **Externally-filed issue.** A webhook for a newly-filed issue with no prior substrate task creates a `gh-issue:<...>` cell whose `projected-from-task` is absent; an attempt to mutate the issue from the substrate without first linking returns `PCD_GITHUB_NOT_AUTHORITATIVE`.

A round-trip vector (one issue created from substrate, mutated on GitHub, settled back into substrate) is the v0.4 plan's gating fixture per [milestones/v0.4-federation.md](../../milestones/v0.4-federation.md) t04-50.

## 13. Plan 9 / Unix analogue

| Unix concept | github-issues-driver analogue |
|---|---|
| `getmail` / `fetchmail` (POP/IMAP-to-mbox) | REST polling: external store → local cells. |
| `procmail` rule firing on new mail | Closure rule firing on new `gh-issue:*` cells. |
| `inotify` on a host directory | Webhook ingestion: external push → substrate. |
| `git remote update` (fetch from upstream) | The driver's extract pass against GitHub's REST. |
| FUSE-mounted GitHub Issues filesystem (e.g., Plan 9-style `/n/github/issues/...`) | The substrate-cell projection of `gh-issue:*` is the "filesystem" view; closure rules and the v0.7 tasks app are clients. |
| `cron`-driven polling job | The `(driver:github-issues, poll-interval-seconds, ...)` schedule on the heartbeat. |

## 14. References

- GitHub REST API: https://docs.github.com/en/rest
- Issues endpoint: https://docs.github.com/en/rest/issues
- Comments endpoint: https://docs.github.com/en/rest/issues/comments
- Webhooks: https://docs.github.com/en/webhooks
- Webhook event payloads: https://docs.github.com/en/webhooks/webhook-events-and-payloads
- HMAC signature verification: https://docs.github.com/en/webhooks/using-webhooks/validating-webhook-deliveries
- Rate limits: https://docs.github.com/en/rest/overview/rate-limits-for-the-rest-api
- REST best practices: https://docs.github.com/en/rest/overview/best-practices-for-using-the-rest-api
- PAT authentication: https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api
- GitHub App authentication: https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app
