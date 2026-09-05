---
name: appending-event
description: Appends one event-record to the events.jsonl log, advancing the event-ordinal cursor on the returned handle.
category: kernel
inputs:
  - name: arg1
    type: event-log-handle
  - name: arg2
    type: event-record
output:
  type: event-log-handle
---
