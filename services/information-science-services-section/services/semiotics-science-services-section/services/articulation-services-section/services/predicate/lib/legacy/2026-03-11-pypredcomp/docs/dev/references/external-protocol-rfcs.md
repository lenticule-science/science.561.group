---
title: "External protocol RFCs"
description: "Canonical URLs for every public protocol the OS speaks. Sprint network/<protocol>.md specs link to these."
kind: reference
---


The OS speaks public network protocols at byte-level fidelity per [decisions/network-protocols-are-real-bindings.md](../decisions/network-protocols-are-real-bindings.md).
Each `network/<protocol>.md` spec cites its RFC; this reference doc is the canonical index of those URLs.

## HTTP / Web

- **HTTP/1.1** — RFC 9110 (https://datatracker.ietf.org/doc/html/rfc9110), RFC 9112 (https://datatracker.ietf.org/doc/html/rfc9112).
- **HTTP/2** — RFC 9113 (https://datatracker.ietf.org/doc/html/rfc9113).
- **HTTP/3** — RFC 9114 (https://datatracker.ietf.org/doc/html/rfc9114).
- **WebSocket** — RFC 6455 (https://datatracker.ietf.org/doc/html/rfc6455).
- **HTTP signatures** — draft-cavage-http-signatures-12 (https://datatracker.ietf.org/doc/html/draft-cavage-http-signatures-12).

## Email

- **SMTP** — RFC 5321 (https://datatracker.ietf.org/doc/html/rfc5321).
- **Internet message format (RFC 822 successor)** — RFC 5322 (https://datatracker.ietf.org/doc/html/rfc5322).
- **SMTP submission** — RFC 6409 (https://datatracker.ietf.org/doc/html/rfc6409).
- **STARTTLS for SMTP** — RFC 3207 (https://datatracker.ietf.org/doc/html/rfc3207).
- **SMTP AUTH** — RFC 4954 (https://datatracker.ietf.org/doc/html/rfc4954).
- **IMAP4rev2** — RFC 9051 (https://datatracker.ietf.org/doc/html/rfc9051).
- **IMAP IDLE** — RFC 2177 (https://datatracker.ietf.org/doc/html/rfc2177).
- **POP3** — RFC 1939 (https://datatracker.ietf.org/doc/html/rfc1939).
- **DKIM** — RFC 6376 (https://datatracker.ietf.org/doc/html/rfc6376).
- **DMARC** — RFC 7489 (https://datatracker.ietf.org/doc/html/rfc7489).
- **SPF** — RFC 7208 (https://datatracker.ietf.org/doc/html/rfc7208).
- **MIME** — RFC 2045–2049 (https://datatracker.ietf.org/doc/html/rfc2045 etc.).

## Calendar / Contacts

- **CalDAV** — RFC 4791 (https://datatracker.ietf.org/doc/html/rfc4791).
- **CalDAV scheduling** — RFC 6638 (https://datatracker.ietf.org/doc/html/rfc6638).
- **iCalendar** — RFC 5545 (https://datatracker.ietf.org/doc/html/rfc5545).
- **iTIP (iCalendar Transport-Independent Interoperability Protocol)** — RFC 5546 (https://datatracker.ietf.org/doc/html/rfc5546).
- **iMIP (iCalendar over email)** — RFC 6047 (https://datatracker.ietf.org/doc/html/rfc6047).
- **Timezones / VTIMEZONE conventions** — RFC 6557 (https://datatracker.ietf.org/doc/html/rfc6557); IANA tzdata (https://www.iana.org/time-zones).
- **CardDAV** — RFC 6352 (https://datatracker.ietf.org/doc/html/rfc6352).
- **vCard** — RFC 6350 (https://datatracker.ietf.org/doc/html/rfc6350).

## Chat / Messaging

- **Matrix client-server API** — https://spec.matrix.org/latest/client-server-api/
- **Matrix server-server (federation) API** — https://spec.matrix.org/latest/server-server-api/
- **XMPP core** — RFC 6120 (https://datatracker.ietf.org/doc/html/rfc6120).
- **XMPP IM and presence** — RFC 6121 (https://datatracker.ietf.org/doc/html/rfc6121).
- **XMPP address format** — RFC 7622 (https://datatracker.ietf.org/doc/html/rfc7622).
- **IRC client protocol** — RFC 1459 (https://datatracker.ietf.org/doc/html/rfc1459), updated by RFC 2812 (https://datatracker.ietf.org/doc/html/rfc2812).
- **IRC server protocol** — RFC 2813 (https://datatracker.ietf.org/doc/html/rfc2813).
- **IRC architecture** — RFC 2811 (https://datatracker.ietf.org/doc/html/rfc2811).

## Federated social

- **ActivityPub** — W3C Recommendation (https://www.w3.org/TR/activitypub/).
- **ActivityStreams 2.0** — W3C Recommendation (https://www.w3.org/TR/activitystreams-core/).
- **WebFinger (used by Mastodon for actor discovery)** — RFC 7033 (https://datatracker.ietf.org/doc/html/rfc7033).
- **JSON-LD** — W3C Recommendation (https://www.w3.org/TR/json-ld11/).

## Feeds

- **RSS 2.0** — https://www.rssboard.org/rss-specification
- **Atom** — RFC 4287 (https://datatracker.ietf.org/doc/html/rfc4287).
- **JSON Feed 1.1** — https://jsonfeed.org/version/1.1
- **PubSubHubbub / WebSub** — W3C Recommendation (https://www.w3.org/TR/websub/).

## IoT / Industrial

- **MQTT 5.0** — OASIS Standard (https://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html).
- **MQTT 3.1.1** — OASIS Standard (https://docs.oasis-open.org/mqtt/mqtt/v3.1.1/mqtt-v3.1.1.html).
- **Modbus TCP** — Modbus Organization (https://modbus.org/specs.php).
- **Modbus Application Protocol** — Modbus Organization, same site.
- **CoAP** — RFC 7252 (https://datatracker.ietf.org/doc/html/rfc7252) — if needed for sensors.
- **OPC UA** — IEC 62541 series; spec at https://opcfoundation.org/about/opc-technologies/opc-ua/ — if needed for industrial controllers.

## Cryptography / Auth

- **TLS 1.3** — RFC 8446 (https://datatracker.ietf.org/doc/html/rfc8446).
- **Ed25519** — RFC 8032 (https://datatracker.ietf.org/doc/html/rfc8032).
- **OAuth 2.0** — RFC 6749 (https://datatracker.ietf.org/doc/html/rfc6749).
- **OpenID Connect** — https://openid.net/specs/openid-connect-core-1_0.html
- **JWT** — RFC 7519 (https://datatracker.ietf.org/doc/html/rfc7519).
- **JWS** — RFC 7515 (https://datatracker.ietf.org/doc/html/rfc7515).
- **HMAC** — RFC 2104 (https://datatracker.ietf.org/doc/html/rfc2104).

## Small-web / Alt protocols

- **Gemini** — gemini.circumlunar.space spec (https://gemini.circumlunar.space/docs/specification.html).
- **Gopher** — RFC 1436 (https://datatracker.ietf.org/doc/html/rfc1436).
- **Finger** — RFC 1288 (https://datatracker.ietf.org/doc/html/rfc1288).

## File / Sync

- **9P (Plan 9 file protocol)** — http://9p.cat-v.org/documentation/9p2000
- **rsync algorithm** — https://rsync.samba.org/tech_report/
- **WebDAV** — RFC 4918 (https://datatracker.ietf.org/doc/html/rfc4918).

## Discovery / DNS

- **DNS** — RFC 1034/1035; current at RFC 9499 (https://datatracker.ietf.org/doc/html/rfc9499).
- **DNS-SD** — RFC 6763 (https://datatracker.ietf.org/doc/html/rfc6763).
- **mDNS** — RFC 6762 (https://datatracker.ietf.org/doc/html/rfc6762).
- **DID (Decentralized Identifier)** — W3C Recommendation (https://www.w3.org/TR/did-core/).

## Format / Media

- **JSON** — RFC 8259 (https://datatracker.ietf.org/doc/html/rfc8259).
- **JSONL** — https://jsonlines.org (community spec).
- **YAML** — https://yaml.org/spec/1.2.2/.
- **CommonMark (Markdown)** — https://spec.commonmark.org/0.31.2/.
- **CSV** — RFC 4180 (https://datatracker.ietf.org/doc/html/rfc4180).

## ANSI / Terminal

- **ANSI escape codes** — overview at https://en.wikipedia.org/wiki/ANSI_escape_code; canonical at ECMA-48 (https://www.ecma-international.org/publications-and-standards/standards/ecma-48/).
- **xterm control sequences** — https://invisible-island.net/xterm/ctlseqs/ctlseqs.html

## Plain-text accounting

- **hledger journal format** — https://hledger.org/journal.html

## External-system platform APIs

- **GitHub REST API** — https://docs.github.com/en/rest
- **GitHub Issues endpoint** — https://docs.github.com/en/rest/issues
- **GitHub Issue Comments endpoint** — https://docs.github.com/en/rest/issues/comments
- **GitHub Webhooks** — https://docs.github.com/en/webhooks
- **GitHub Webhook events and payloads** — https://docs.github.com/en/webhooks/webhook-events-and-payloads
- **GitHub Webhook signature validation** — https://docs.github.com/en/webhooks/using-webhooks/validating-webhook-deliveries
- **GitHub REST rate limits** — https://docs.github.com/en/rest/overview/rate-limits-for-the-rest-api
- **GitHub PAT authentication** — https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api
- **GitHub App authentication** — https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app

## When to add to this list

A protocol joins this list when:

1. The OS speaks it (per a `network/<protocol>.md` spec).
2. There's a public canonical specification.
3. The sprint cites it in a binding spec.

If the OS speaks something proprietary (e.g., a vendor's REST API), don't add it here — that goes in the relevant driver spec with the vendor's API documentation URL.
