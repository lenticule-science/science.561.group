---
title: "External systems get drivers, peers get federation"
description: "Bidirectional bridges to non-561 platforms (GitHub, GitLab, Slack, Discord, Linear, etc.) are driver records under specs/drivers/. Peer-to-peer 561 sync is the federation protocol under specs/network/federation-protocol.md. The two disciplines never mix."
kind: decision
date: "2026-05-02"
status: committed
---

# External systems get drivers, peers get federation

## What

When the OS bridges with another system that holds task / message / state records, the bridge slots into one of two disciplines, never both:

- **External systems** (GitHub, GitLab, Forgejo, Gitea, Bitbucket, Linear, Jira, Slack, Discord, Trello, Asana, Todoist, etc.) get **drivers** per [drivers/driver-model.md](../specs/drivers/driver-model.md).
  The bridge is a substrate-cell driver with capability declarations, attach/detach lifecycle, the three interfacer operations (extract / apply / compose), and a $\top$-on-disagreement merge policy.
  Authentication uses [security/secrets-management.md](../specs/security/secrets-management.md).
  The wire layer is the platform's published API (REST, GraphQL, webhooks, etc.) per [network-protocols-are-real-bindings](network-protocols-are-real-bindings.md).
- **561 confederacy peers** (other 561-OS instances run by 561 group members or trusted allies) get **federation** per [network/federation-protocol.md](../specs/network/federation-protocol.md).
  Records are content-addressed, signed Ed25519, merged via the bilattice's $\odot$ — the algebra IS the protocol per [federation-by-construction](federation-by-construction.md).
  No wire translation; same record format on both sides.

The first concrete case is GitHub Issues per [specs/drivers/github-issues-driver.md](../specs/drivers/github-issues-driver.md).
The decision generalizes: every future external-platform bridge — GitLab Issues, Linear, Jira, Forgejo, Slack channels, Discord channels, etc. — is a driver, not a federation peer.
Conversely, every future 561 confederacy node is a federation peer, not a driver.

## Why

The two cases look superficially similar (both move records between two systems) but the underlying disciplines diverge:

**Federation** assumes both sides speak the same algebra.
Records are content-addressed; the same record on both sides shares an id; merge is $\odot$ on per-cell receive; trust is a substrate cell; signing is Ed25519 over canonical bytes; everything composes without translation.
Federation is *internal* to the OS family.

**External systems** speak their own published wire format.
Records have foreign ids (issue numbers, channel ids), foreign authentication (PATs, OAuth tokens, webhook secrets), foreign rate limits, foreign authorization models.
The bridge MUST translate at the wire boundary, hold credentials securely, retry under the platform's published limits, and accept the platform's authority on platform-canonical fields.
This is exactly the interfacer pattern from `predicated-computing/concepts/interfacer`: extract (read external state), apply (push intent out), compose (merge views).

Forcing external systems through federation would require either (a) pretending GitHub is a 561 peer that signs Ed25519 over substrate canonical bytes, which it does not, or (b) building a federation-shim layer that translates between substrate canonical bytes and GitHub REST, which is exactly a driver wearing a federation costume.
The substrate already has the driver discipline; the right answer is to use it.

Forcing peers through driver discipline would require either (a) re-implementing the substrate's algebra as an external-API surface for every peer, losing the by-construction federation property of [federation-by-construction](federation-by-construction.md), or (b) treating the substrate's own peer-sync as "just another driver," which loses the $\odot$-merge-is-the-protocol guarantee.

The two disciplines are therefore disjoint by design.
A given record bridge slots into exactly one.

Source: this conversation (2026-05-02); concrete trigger is the captain's `github-issues-integration.md` idea, which proposed the bridge as an MCP server or mash subcommand.
Both alternatives would have the same problem — they would split sync logic between the substrate and an opaque external integration.
The driver discipline keeps the bridge inside the substrate's algebra and capability fiber.

## What it rules out

- Treating GitHub (or any external SaaS / OSS hosted platform) as a federation peer in `specs/network/federation-protocol.md`'s sense.
- Treating other 561 confederacy nodes as drivers.
  The 561 peers exchange records through federation, not through a driver shim.
- A "hybrid" model where some predicates federate and others driver-bridge to the same external system.
  A single bridge speaks one discipline.
- Per-platform federation handshakes that would require GitHub or Slack to learn substrate canonical bytes.
- A driver that terminates at the substrate-internal record layer rather than the platform's wire format.
  Drivers exist precisely to bridge wire-format gaps.

## What it does not constrain

- The number of drivers for related platforms.
  GitLab Issues is a separate driver from GitHub Issues; Forgejo is its own; Linear is its own.
  Each driver-spec lives in its own `specs/drivers/<platform>-issues-driver.md` (or `<platform>-driver.md`) file.
- Whether a driver bridges one direction or both.
  Most v0.3+ drivers (smtp-imap, hledger, matrix, github-issues) are bidirectional.
  Read-only or write-only drivers are allowed when the external system supports only one direction.
- How a 561 peer-driven workflow may *use* an external-system driver.
  A federated 561 peer may run its own `driver:github-issues` against the same repository; substrate $\odot$-merge across peers handles cross-peer convergence on the GitHub-projected cells.
  This is composition of the two disciplines, not mixing.
- Whether a future personal-data platform (Mastodon's ActivityPub, Matrix S2S federation) is "external" or "peer."
  ActivityPub and Matrix S2S are *federation protocols* the OS implements at the network layer (per [specs/network/activitypub.md](../specs/network/activitypub.md), [specs/network/matrix-s2s.md](../specs/network/matrix-s2s.md)); they are wire-protocol bindings, not driver bridges.
  The 561 confederacy's *internal* federation is separate from these.
- Whether a future industrial-control device (MQTT broker, Modbus PLC) is "external" or "peer."
  Devices are external systems, bridged by drivers per `specs/drivers/mqtt-driver.md`, `specs/drivers/modbus-driver.md`.
  They are not 561 peers.
