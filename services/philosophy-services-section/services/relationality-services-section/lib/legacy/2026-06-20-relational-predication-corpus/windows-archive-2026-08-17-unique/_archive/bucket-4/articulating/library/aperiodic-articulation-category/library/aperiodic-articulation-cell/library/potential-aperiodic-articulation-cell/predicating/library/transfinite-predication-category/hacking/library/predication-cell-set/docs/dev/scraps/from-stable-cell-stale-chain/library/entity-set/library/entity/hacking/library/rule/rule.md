---

description: "A standing instruction that applies automatically whenever its conditions are met — unlike a command, which must be explicitly invoked."
aliases: [rules]
made-of: [condition, instruction]
distinguished-from: [command, hook, skill]
instances: [primary-rule, secondary-rule, production-rule]
governed-by: [norm, convention]
introduced-by: hart-1961
date-created: 2026-04-01
---

A rule is a standing instruction that applies automatically whenever its conditions are met. No one invokes a rule. It is always in effect. When the situation matches, the rule governs what happens.

The concept spans every domain that has governance. In law, a rule is a norm that binds conduct: "No vehicle shall exceed 65 miles per hour on this highway." The rule applies to every vehicle at all times — no one needs to invoke it. H.L.A. Hart, in *The Concept of Law* (1961), distinguished primary rules (which govern conduct directly) from secondary rules (which govern how primary rules are created, changed, and adjudicated). The rule of recognition — the secondary rule that identifies which primary rules are valid — is the foundation of a legal system.

In computing, a rule is a condition-action pair. Production systems like OPS5 (Charles Lanny Forgy, 1981) and expert systems like MYCIN (Edward Hance Shortliffe, 1976) organize all knowledge as rules: "IF the patient has fever AND the culture shows gram-positive cocci THEN prescribe penicillin." The inference engine matches conditions against the current state and fires applicable rules. The system's behavior emerges from the interaction of its rules, not from a sequential program.

In agentic systems, a rule is a file that loads into the agent's context every session and governs its behavior throughout. In Claude Code, rules live in `.claude/rules/` and are injected into every conversation. They differ from [commands](./command.md) (which a user explicitly invokes), from [hooks](./hook.md) (which fire on specific system events like tool calls), and from [skills](./skill.md) (which are loaded on demand for specific tasks). A rule is ambient — it shapes all behavior without being called.

The power of rules is that they compose without coordination. Each rule is independent. Adding a rule does not require modifying existing rules. The system's behavior is the product of all active rules applied to the current situation. This is why rule-based systems scale differently from procedural ones: you add knowledge by adding rules, not by rewriting control flow.
