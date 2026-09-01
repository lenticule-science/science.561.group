---
type: concept
class: human-actor
depends-on: [identity-by-relations, identity-key]
see-also: [account, agent]
---

# User

A *human actor* on the platform — distinct from an [agent](../../agential-orchestration-platform/concepts/agent.md) (which is the substrate's first-class actor representation including AI models and automated processes). A user is a person whose interactions with the platform are mediated by an [account](account.md), an authentication method, and one or more devices/clients.

The substrate represents users as entities with [identity-by-relations](../../teaching/explanations/identity-by-relations.md): a user *is* the predications it accumulates (the account it owns, the documents it has edited, the notifications it has received, the sessions it has opened). Per [self-representation](../../teaching/explanations/self-representation.md), user-related substrate content is queryable and replayable like any other content.

The user vs. agent distinction:

- **Agent** (per AgOrchPlat) — the substrate's actor representation. Agents include human users acting through the platform, AI models invoked through skills, automated processes triggered by heartbeat. The agent is the *operational unit* the substrate dispatches to.
- **User** (this subtheory) — the *human-experience unit* behind a human agent. A user has accounts, devices, preferences, notification settings, document-authorship history. The user is the *application-layer view* of the human; the agent is the *substrate-layer view*.

A single human is typically represented as both: a `user-record` carrying their account and preferences, and an `agent-record` carrying their authorization and operational role. The two are linked by predication (typically the user-record's `acts-through-agent` referencing the agent-record). Non-human agents (AI models, automated processes) have agent-records but no user-record.
