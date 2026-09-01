---
type: example
class: system
description: A daily reminder cron job that sends a message each morning.
status: draft
depends-on: [cron-job, heartbeat, agent-turn]
---

# Daily Reminder Example

This example shows how to set up a cron job that sends a daily reminder message at 9:00 AM each day.

## Configuration

```yaml
# In openclaw.json or via cron job definition
{
  "name": "morning-reminder",
  "schedule": {
    "kind": "cron",
    "expr": "0 9 * * *",  // 9:00 AM every day
    "tz": "America/New_York"
  },
  "payload": {
    "kind": "systemEvent",
    "text": "Good morning! Don't forget to drink water and take breaks today."
  },
  "sessionTarget": "main",
  "delivery": {
    "mode": "announce"
  },
  "enabled": true
}
```

## How It Works

1. **Schedule Evaluation**
   - The heartbeat runs every 10 seconds (default interval)
   - At each heartbeat, it checks if the current time matches the cron expression `0 9 * * *` in the `America/New_York` timezone
   - When the time reaches 9:00:00 AM local time, the schedule evaluates to true

2. **Job Triggering**
   - Per the theorem "Heartbeat Triggers Due Cron Jobs", the gateway recognizes the schedule is due
   - Since `sessionTarget` is `"main"` and payload is `"systemEvent"`, it prepares to inject a system event into the main session

3. **Execution**
   - The gateway injects the text `"Good morning!
     Don't forget to drink water and take breaks today."
     ` as a system event into the main session
   - This appears as a message from the agent in the user's chat interface
   - The announcement delivery mode sends a notification to the chat channel

4. **Repetition**
   - The job remains enabled and will trigger again the next day at 9:00 AM
   - To disable: set `"enabled": false` or remove the job
   - To run once: add `"deleteAfterRun": true`

## Variations

### Using Agent Turn Instead
```yaml
{
  "name": "daily-summary",
  "schedule": {
    "kind": "cron",
    "expr": "0 18 * * *",  // 6:00 PM daily
  },
  "payload": {
    "kind": "agentTurn",
    "message": "Summarize what I've accomplished today and suggest priorities for tomorrow.",
    "timeoutSeconds": 30
  },
  "sessionTarget": "isolated",  // Runs in background
  "delivery": {
    "mode": "announce"
  }
}
```

### With Context
```yaml
{
  "name": "context-aware-reminder",
  "schedule": {
    "kind": "every",
    "everyMs": 3600000  // Every hour
  },
  "payload": {
    "kind": "agentTurn",
    "message": "Based on our recent conversation, what's the next logical step?"
  },
  "sessionTarget": "current",
  "contextMessages": 5,  // Include last 5 messages as context
  "delivery": {
    "mode": "announce"
  }
}
```
