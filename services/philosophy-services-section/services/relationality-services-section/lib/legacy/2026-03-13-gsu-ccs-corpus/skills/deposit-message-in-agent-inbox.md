---
description: "Writes a structured Message to another department's INBOX.md and records that the message was sent in the sender's MEMORY.md. Use whenever a finding in one department requires action or awareness in another department."
skill-closure-kind: procedure
---

# deposit-message-in-agent-inbox

domain:
- `from_department` — sending department directory name (`math`, `proof`, `spec`, `src`, or `root`)
- `to_department` — target department directory name
- `message_type` — one of: `FixNeeded`, `GapFound`, `Discovery`
- `subject` — one sentence naming what this is about
- `body` — full context: what was found, where, and why it matters to the target department; must be sufficient for the receiving agent to act without asking
- `urgency` — one of: `Blocking`, `Normal`, `Low`

1. Locate the target INBOX file:
   - `math` → `math/INBOX.md`
   - `proof` → `proof/INBOX.md`
   - `spec` → `spec/INBOX.md`
   - `src` → `src/INBOX.md`
   - `root` → `INBOX.md`

2. Read the target INBOX file. If it does not exist: create it with a proper
   INBOX header (see spec/message.md for format) and an empty body.

3. Append the following Message entry after any existing messages:

   ```
   ### Message
   - from: {from_department}
   - date: {YYYY-MM-DD}
   - type: {message_type}
   - urgency: {urgency}
   - subject: {subject}
   - status: unread

   {body}
   ```

4. Write the updated INBOX file.

5. In the sending department's MEMORY.md, append a MemoryEntry recording
   that this message was sent:

   ```
   ## {YYYY-MM-DD} — message sent to {to_department}

   Sent {message_type} to {to_department}: {subject}. Awaiting triage.
   ```

   This prevents the same message from being sent again in a future session.

codomain: confirmation that the Message was written to the target INBOX and recorded in the sender's MEMORY
