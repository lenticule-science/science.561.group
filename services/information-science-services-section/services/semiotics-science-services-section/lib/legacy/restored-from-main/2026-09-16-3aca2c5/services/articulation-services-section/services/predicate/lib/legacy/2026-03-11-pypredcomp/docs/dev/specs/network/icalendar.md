---
title: "iCalendar"
description: "Calendar event format per RFC 5545. iTIP scheduling per RFC 5546. iMIP email transport per RFC 6047."
kind: spec
status: normative
version: "0.3"
---


Per RFC 5545 (https://datatracker.ietf.org/doc/html/rfc5545), RFC 5546 (https://datatracker.ietf.org/doc/html/rfc5546), RFC 6047 (https://datatracker.ietf.org/doc/html/rfc6047).

## 1. Format

`text/calendar`.
Components: VCALENDAR, VEVENT, VTODO, VJOURNAL, VFREEBUSY, VTIMEZONE, VALARM.
Properties per RFC 5545 §3.

## 2. Substrate translation

VEVENT → calendar-event substrate cells (see [caldav.md](caldav.md) §1).
RRULE expanded to materialized event-instance cells.

## 3. Implementation

Python: `icalendar` library.
Rust: `icalendar` crate.

## 4. Conformance

Parse + serialize round-trips byte-equivalent for all RFC 5545 component types.
