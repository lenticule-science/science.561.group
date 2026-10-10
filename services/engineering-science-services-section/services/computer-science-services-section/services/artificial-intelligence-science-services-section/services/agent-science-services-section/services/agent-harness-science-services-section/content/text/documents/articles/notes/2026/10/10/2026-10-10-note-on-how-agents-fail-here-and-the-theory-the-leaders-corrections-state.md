---
title: "Note on how agents fail in this environment, and the theory the Leader's corrections of 2026-08-27 to 2026-10-09 state"
date-created: 2026-10-10
description: "The Leader's statements to Claude and Codex sessions about the agent harness, git and disk use, divergence between Claude and Codex, platformization, resource control and multi-agent coordination, taken as theory and stated as declarative sentences, with outside knowledge and what remains open."
type: research-note
keywords:
  - agent-harness
  - platformization
  - normalization
  - one-architecture
  - resource-control
  - multi-agent-coordination
  - context-spacesuit
provenance:
  authors:
    - emsenn
    - lenticule-science-senior
  pass: harness-agents of debt-2026-10-09-leader-words-held-in-corpus
  utterances:
    - "ni:///sha-256;Nr0tr1WzT2In1H4-gzsVtxjltVyuSM3pq_mn_g3mwUg"
    - "ni:///sha-256;5diiQxaS8JB1EkSzz0LRqogY3rKgfuesU2P_99TiiRU"
    - "ni:///sha-256;6Ojj7s0yyiZ15ebBn6emLriXtvlNtSpC_WThtAMHY30"
    - "ni:///sha-256;QbiBZFUe-COUpHldLHcPEds8MAjDdJS-RXGgn6CPGfM"
    - "ni:///sha-256;c0BAdFjNpmYPd6nF4yaOM3kHkzPTbRAOfgQwm4zLVGc"
    - "ni:///sha-256;z7TW9L6E7roTkyjVk4HHcjvo7Gssu412ItKAI4nX3q4"
    - "ni:///sha-256;NgAKSoKSG3JlxhyDmWL7xj9iYZmRnLwAxafYdhXa3ik"
    - "ni:///sha-256;RAnOZnwx1OBCTQUcLeWRkwkYEcGYSR5KBqwgUvtZFyc"
    - "ni:///sha-256;dyUfYbUFs7lCkSZWKWOw40vu6kihbwwBmCqflft07No"
    - "ni:///sha-256;jkxTX9h35IUQdG78Lm0DGk7HY59t8hztObD-QsohqKw"
    - "ni:///sha-256;ZRp4-WejBhM_hMUYCaZT6UAGt6N7Tn6vK-sinbiVUto"
    - "ni:///sha-256;Luy_nmN3Ba2tff93G6JW7O4BUbsxMVuyr8f3kyMvxP4"
    - "ni:///sha-256;jWmuKz8kNGXPbYRIXunCBcNMHUngbciOIxrrzxVo7zI"
    - "ni:///sha-256;MyAcJsgyHBWYs0jTMm3se1394pUmBYY8MbXOTUxG4v4"
    - "ni:///sha-256;dCfWqNo60ai3THIevuOA1tIROZGZtntiS1lku4lbNJk"
    - "ni:///sha-256;5m-_Z72bU6SJ17_DCEnXe_EbOc_NKL2SUe212l9UCXE"
    - "ni:///sha-256;B7Qt9dyYfuusmb3c8HCDGg0_HM7imggmKfbWglrpeVY"
    - "ni:///sha-256;REqv57hoQKVpuiQzAbQk1lrlxAVVxeoAummlJqEaN6E"
    - "ni:///sha-256;EVYmaTal4gXivxrfqxkzSv3enMczwrxA22cDWzl5uUg"
    - "ni:///sha-256;0ntUk8Wz_k1C8tjESYw8wOmGXk0TZKOYfAJSPScrRdQ"
    - "ni:///sha-256;PQvHbkMcTF9L_Qw7QjmIkpWfv5SxRlJhWamAUGZenKY"
    - "ni:///sha-256;x2cwn1XbtJe9EJ7O4UbL8oRfyTpZ2v-WjVOjiCKOAMQ"
    - "ni:///sha-256;gCVd5nLtL_sUylmNvA37jZu5WzU98C2oRhNwNHx3IFA"
    - "ni:///sha-256;on6olH4Vq6fidY9NxSq5z-3f-b43YwWvyjSe3XX4-ak"
    - "ni:///sha-256;lWP0r5SXb0YW4S2-YFzu-oBW5i7ECq6ph76pdqwKmTA"
    - "ni:///sha-256;3WdVVvj0cHXXW09zF4wCc_Ky-TxnZwtV-cvTYAyzryM"
    - "ni:///sha-256;8Ht98pIFK40M_vmh3TKg7C8Ga8cpn2Mhq1DVOrf8zgg"
    - "ni:///sha-256;wNGXaIFj1J0cV76Lfg7d-x6wi7Pxd9l4mENh9YiNFL8"
    - "ni:///sha-256;6wmcO3WjddLLES6dfCVvR2RAtulTHT1i9Z8tqyRRkgk"
    - "ni:///sha-256;oU5ytBwKYJFfX-lccyjRp_1LMsVyrU5wxzD3Ev-KqTg"
    - "ni:///sha-256;J21j5QVb0-2riUJjPA-3AKkm9_JKo2le4nzVRoKbb3o"
    - "ni:///sha-256;cvRjZ5kmKq8fSAlYxJlKuFk8oCpGDgw71rVwHQH9YfM"
    - "ni:///sha-256;ORswzAu5yektERr7ojvEZj68JxNPpZlGdakKiOtlSMU"
    - "ni:///sha-256;4niMWT21sP19iqIMiPsdQOo88-6mT7FjpLkPauG36-A"
    - "ni:///sha-256;fJCiF20H8Ji6_x-im7wvsIT4klJiE_Gr5LfNoO0pnaU"
    - "ni:///sha-256;sy9T3ODK2txpzZVk7V4GXdBYt1zoCenJSRzQ2ShO2Bw"
    - "ni:///sha-256;lOEb94td-q33OhdV-E0j4ohRdsHyDe93RIEv9IZrGdg"
    - "ni:///sha-256;XgFWDfoJn8OOzSIeqSohVR0a9hmWvkJw8fSncapGCpY"
    - "ni:///sha-256;XyTqEJaD_6Q716ktvSgscsPBLciI3yQR9XMtntZ_cU4"
    - "ni:///sha-256;MZR8gZxCbPuzuFZfmg20Qotd6CMnuFiVS3pw1PhXhy4"
    - "ni:///sha-256;WCJBLpS2ZheFr3JY_VWIet5tvsNSWuijms6PYvYxu2s"
    - "ni:///sha-256;bJiHdL2rZkMNt-1ITtp8hIC1B5VA0vFuUqjchIHwRo4"
    - "ni:///sha-256;MAGMxvjqX9M5cTz2a7l9JMHH45SJUmixK4zR0hRMUTk"
    - "ni:///sha-256;4AjPjWs2gRD81Wta81pbgx0pWAHkl-dTis4oYU-eOOI"
    - "ni:///sha-256;kqV0R7IiEDKPS04yqy-TmrYtb-m3qluxqoMxE_fJDTU"
    - "ni:///sha-256;rupcPFC4Qr0tE63rULKUtdGxJLDP8flQ0yav8GC3rhg"
    - "ni:///sha-256;1Z3z8eY24179KcJ4U6ZEESBFWHGtDcHJHCN5WURcXU0"
    - "ni:///sha-256;L6E8YqJMyuUXwBxSOInYZ6pX8xl3i5U3UOXoEe_1CyA"
    - "ni:///sha-256;oWg4qItU55CftCgVY-fmp1G_cgz0Imm-UoRQIsFUbII"
    - "ni:///sha-256;pu7VEls4-mcPYYt62ybvcpMJpMgY1py9opDJuDVUpgM"
    - "ni:///sha-256;087I2SF74AiBYShOg3nSiNJUkBrRGJbZZ2ITNeaJm08"
    - "ni:///sha-256;J0mRw263kjjH5C2n-04InWDMzS6pr6YGNh9lYfV2zho"
    - "ni:///sha-256;dym-Hd4a04ILIejmoxCEoBA32qrpAUrIytaCwcsJSr8"
    - "ni:///sha-256;6txdCzorQxJsadK0tKEkDV5W6PTwSGRSDvNugG-k_rY"
    - "ni:///sha-256;4ekzr2f9RJ7_8dT9pAayUD8mENjeAWRghe62-CvbByk"
    - "ni:///sha-256;PQuF5FP81Qv0JsSL4Hy7I6QwJjgu9lPfpXeUcWrfdi4"
    - "ni:///sha-256;W5HY4Y8_H-j4RnoH8gmoUbKZuUyNMmRGwRCRwXkiboU"
    - "ni:///sha-256;bwIpBY9zsqpPEuEUgL2yS9i85uU1RjN74St_7tFgCs0"
    - "ni:///sha-256;7WA1ZErzxI63tGHzTLdJRZoTU1vSw-irJyRBLmup6Z0"
    - "ni:///sha-256;dMTvZYRpAdUM7w2FQnomelNjQM4PKofHCA2eqeQFb48"
    - "ni:///sha-256;C-dYPGviqVkyox6TsDsGZLlGMaikvAow53vcKInGfOw"
    - "ni:///sha-256;QbtX6B0ovL_cVoOBijx8X9nwzetT0XR0aMndZnjMmPY"
    - "ni:///sha-256;F_Z9aOWIFF0bdCvMd_2ILGVzblAE3mrm1cvYaWAJfBo"
    - "ni:///sha-256;esWqZCNS-SY3kDPVt2yjTuT4TKbyj5e1rkW0sZc10og"
    - "ni:///sha-256;fPW8hF43-2kcRTcRZ-jhCOYXj0DGqWblAtRuqJqrd10"
    - "ni:///sha-256;O5tszvZH-u4PhjVTGurKebeGlPmOx61s6GNfu4xbhgk"
    - "ni:///sha-256;Pt3hmvumA0Gx6q1HRZzvyXsc2ll69nh-0_jqis-YT4U"
    - "ni:///sha-256;AgSUSn8MGldlBIRdnVM7oupjTOr0gG46fzNHWiSfpWc"
    - "ni:///sha-256;onHYRdPrn7qpzP_dpDmt-FQlGSqwTNVh0o42mQG8UzM"
    - "ni:///sha-256;vzvBBRCEyr0Z30MoXSjva5KhS5-hxAjDHi4u_aENV2U"
    - "ni:///sha-256;nSNEKowYVHJZ3TRJJiy9f8iUxqprDoUUr89k3SD9K_0"
    - "ni:///sha-256;-OhFZVjInf7j81QKzeddyfzePs6dlXCA8u7YSOVEIFc"
    - "ni:///sha-256;DSFtQi3IreoYCJ4EwsI_bCrvnByQYniQhsY0V3RZ_TE"
    - "ni:///sha-256;vOwAgVnN3NJiEaaPzvva4elLaoiM0HrqqKeJiLsy3mc"
    - "ni:///sha-256;2vExbTbz0dHlUmppRYHgcdTqANU33eFqHGAOqUvCLxY"
    - "ni:///sha-256;epZdXu4K1zKAxYghjfeRhsXVF5P1mrey1CHdNdZ4Gt4"
    - "ni:///sha-256;eh8Ax2EgsJHFjiu93vVrWG6PTWqYFip-_EMoNd4S9cQ"
    - "ni:///sha-256;NxUsZzK2PLC_6FQH6EhIt6PvgocGRIOQX66V3rPOwaA"
    - "ni:///sha-256;Q15R_D3ypBWMgd2qwERqXP5Xlu6_CklKL0A6juC4zJc"
    - "ni:///sha-256;6k2dRHKTSQKKfvHgJJKUSNtoGigtJV97CwYvI117IWM"
    - "ni:///sha-256;kzQ1vqesRmOFToK1TmNSdVCgsGT0kXC6oByK3hi-O2I"
    - "ni:///sha-256;yiAaWmLIR6fuXuM1sMfD_1IXKEiRqizBumxlrUmPvqI"
    - "ni:///sha-256;X48Gmd8RplatD9FDwGH6rGOGtUT5UGU6IUQUbrb7Eb8"
    - "ni:///sha-256;lw1iHZNboCWN214vvV6wNwGD-BFwF-QnfixbEPdIqLE"
    - "ni:///sha-256;uIwFI2Y5jfxN182bsSGENr1qILb-PSFw1uaP97iq3gk"
    - "ni:///sha-256;CHpzexk3HKvSjP2VMsU6LKvyselEES46x9AHk24V_84"
    - "ni:///sha-256;Ffm7KYDWGqRCbynuJk71wRk0UdSRWfA4Kv1a9yBhyCo"
    - "ni:///sha-256;PRd-zPuyEKkank_J8ocg_YvpBYHNjLc2kfeuXSnD_0s"
    - "ni:///sha-256;716QY80DCqO1k7BoqG_QtchoFzOzgX-wZI4tN9-bJlM"
    - "ni:///sha-256;UvF_XVvElhLcYc0N_dZH-BVlQk5Kiqg5ryjaA6HgZTg"
    - "ni:///sha-256;V4GsjSyaYuR2z8FeiYrk0E80pBEV6SOpPGLsg9w_m0Y"
    - "ni:///sha-256;NXrW-FIYe2G6B9t4Bp7CpcgKx3Ai-RmVQMiqK59B3CI"
---

Sources are the Leader's utterances to agent sessions, cited by address in the frontmatter and below by the first six characters of the hash and the date. The glossary terms `context-spacesuit` and `agentic-swarm-theory`, the rules in `561-group-services-section/lib/agency/rules/`, and the 2026-10-09 notes on the Leader's repeated corrections and on the swarm coordination failure were read first. This note holds what they do not: the Leader's statements of 2026-08-27 to 2026-09-28 and 2026-10-03 to 2026-10-09 about how agent work must be built. The specification and requirements that follow from it are at `engineering-services-section/.../agent-harness-computer-system-engineering-services-section/content/`.

## 1. What the Leader holds true

### 1.1 Theory is not rushed into conclusions (Nr0tr1 (08-27))

A theory in the house, such as Belnap's four values or the jiangshi record of disagreements, is a tool for thought and not the centre of the universe. Making Belnap's FOUR the centre of the entire universe is a rushed conclusion. Reading the jiangshi "disagreements recorded" as "retain all information forever, that is good design" is a rushed conclusion; it is not the point of any of these theories. Refusing to rush a theory into a conclusion is not the same as disregarding all knowledge except an agent's innate training biases. The Leader asks how to help the agent work better here, and states that the theory the Group holds for its agents can cultivate a fun attitude while they work.

### 1.2 A defect is repaired at its source and never half-fixed for its consumers (5diiQx (09-10), 6Ojj7s (09-10))

An agent never leaves code half-fixed to appease consumers; it is always the wrong call. Code is fixed so that consumers can learn to do better. A generic layer that does not exist is missing because the instruction to build it was repeatedly not followed. On the markdown work the Leader chose the full pass now: the four-layer stack computer-data-engine, computer-content-engine, computer-text-engine, markdown-engine is built (computer-data-engine already has an apps/ CLI layer; computer-content and computer-text existed only as service-tier sections, with no generic apps/*-engine); the scattered markdown code is unified; markdown-services-section is renamed to a markdown-engineering-services-section that owns its roughly 28 leaf packages; the duplicate packages of lib/legacy 2026-07-29 and 2026-07-31 are retired; the one real consumer (bare-cedar-fog-markdown-vault-services-section, the markdown-vault MCP server) is repointed. The pass-through engine apps are not skipped to save effort.

### 1.3 Architecture is established; divergence is not consolidated (RAnOZn (09-11), dyUfYb (09-11), EVYmaT (09-11), PQvHbk (09-11), gCVd5n (09-11), on6olH (09-11), oU5ytB (09-11), J21j5Q (09-11))

Removing divergence is the goal of work and not its method. Claude and Codex are each parameters, configuration files, over the one upstream software they share; the Leader said so about eight times in one day. Polishing leaves that should not exist is the failure. One architecture means that the top of any script imports something every script shares; the forest of scripts becomes one coherent software. Agents stop diagnosing clusters and repairing leaves, unify the core systems and move outward, and update their standard operating procedure (or their upstream software, or anything) so the Leader no longer has to give this correction in every session. The Leader sent the correction repeatedly until it was done. FAE was never meant to be a package, however often consumers were reported cut over to it; FAE and FARS are very different things; the agent's job in that session was to fix Claude's performance so agents stop doing this. Questions are not asked where the answers are in the repo and better specified elsewhere, and this is not a request to rush. A function sitting in a leaf such as bare-cedar-fog-claude-services-section, which should be a couple of config variables over upstream, is taken and moved upstream. The agent reads that day's transcripts, including the transcripts about FAE, before asking.

### 1.4 Platformization is not normalization (MZR8gZ (09-12))

Normalization merges two leaves. Platformization makes the harness and orchestration code live, conformant and part of one system. The Leader wants platformization. It begins with a broad survey of the local machine, the legacy cold-red-gate VPS and GitHub for Codex, Claude and other agent-harness and orchestration code. The Leader asked for the difference to be explained in chat.

### 1.5 The agent harness is in use; a software controller is not an LLM coordinating (NxUsZz (10-08), Q15R_D (10-08), kzQ1vq (10-08), yiAaWm (10-08), X48Gmd (10-08))

Capping the box or changing operating-system settings is not the requirement; the requirement is that the agent harness is in use and agent calls route through a local handler platform. Agents that do not use or are not controlled by it crash the laptop through memory, paging and the Windows virtual disk under WSL, and did so repeatedly for months. A software controller handling machine resources acts deterministically on measured state at no inference cost. A language model coordinating the same resources by reasoning costs inference, acts on text and is unreliable at it. Simple arithmetic is code and is never paid for as inference, or the Group will never profit. Hundreds of thousands of lines already exist about Claude Code harnesses, git harnesses, call routing and disk-I/O monitoring; their being on GitHub or in legacy is no excuse for rawdogging CLI commands.

### 1.6 Git and disk (QbiBZF (09-10), z7TW9L (09-10), NgAKSo (09-10), WCJBLp (09-18))

Concurrent agents using git for project management and for searching the disc crashed the WSL installation. Claude needs better tools for that work than git. A Claude commit that wipes other agents' work is a Claude-only problem; it is unacceptable to tolerate even when no one else is committing, and the git lead makes Claude stop damaging the repository. A Claude configuration or git classifier that blocks routine git operations is repaired immediately.

### 1.7 The failure is the ecosystem's, and the agent owns the repair (jkxTX9 (09-11), ZRp4-W (09-11), jWmuKz (09-11), MyAcJs (09-11), dCfWqN (09-11), 5m-_Z7 (09-11), B7Qt9d (09-11), REqv57 (09-11), 0ntUk8 (09-11), x2cwn1 (09-11))

An agent does not ask permission to avoid fixing its broken harness, and what its harness trips on is the agent's fault. Asking to delete files but not to change the harness is inconsistent. Every time the agent did not find the tool it needed before doing the work is a failure of the ecosystem and of its configuration. The failure is that the agent is not proactively guided toward performance, not that its work is lacklustre. The repair uses only practices and theories the Leader has approved and does not model convention from the repo. An expensive session that accomplished almost nothing is reviewed, which is the authorization for much more aggressive change; the agent defers nothing for "tight budget constraints" or "scope", since using budget to decide against the work makes the scope larger; and the costly mistakes can never recur. The agent searching a giant repo repeatedly burns context; if it cannot find things, the search tool may be bad. The agent looks on GitHub and over ssh at cold-red-gate for `claude-harness`, finds all legacy Claude Code (all, not all but some), and the Leader wants no stale code on the server, no stale code anywhere, and the live Claude Code to be the best Claude Code the Group ever had. The Leader wants objectively 1000x less code and content in a giant repo with a hundred divergent parallel ways to do things; the npm and git work demanded at first has not been touched. The agent needs the methods of work, software design, specification and the rest of the ecosystem, therefore the agent harness and the packaging and versioning tools, which the agent keeps refusing. The agent does not delete code that has capabilities never migrated into the current architecture; the Leader does not approve that deletion. The agent uses the planning engine (made that morning or the day before) so it does not break its own planning tools while it fixes things, and standardizes names such as simple-planning-engine.mjs and mcp__simple_planning_engine. The agent that violated every rule from every policy and directive finds why it could, what a professional agent engineer would do to prevent recurrence, and reports it. The jsnode-server is renamed to the more humble and honest local-jsnode-package-search, as asked repeatedly, and is not crammed into unrelated things.

### 1.8 Rules are machine-checkable (Luy_nm (09-11))

Every services section is named domain-department-services-section, such as openai-systems-engineering-services-section, not openai-compatible-chat-completion-service. No check on this exists. The rules/ system is redone: long, verbose, prose-heavy rules make an agent feel it has built real orchestration when it has not. A rule is a machine-readable subject-predicate-object statement, "subject MUST condition"; what cannot be checked with math is not a rule. Rules are Policy within a system of Actors and Resources, which the Group lacks as a shared system. Nothing in .claude/ is anything but generated by robust upstream software.

### 1.9 The outside-auditor reading (lWP0r5 (09-11))

The Leader's standing prompt is to act as an outside auditor, with the attitude that subpar agentic development and the Leader's lack of professional experience have left a development environment inadequate to the standards of agentic programming in September 2026. A good agent orchestration cockpit for this repo does not depend on the repo's contents, except to say which language tooling is configured. Vast ecologies of installable software make agentic programming easier, cheaper, faster, less error-prone and self-improving. Six readings are wrong, each one a session once took: reporting issues in the codebase; writing a greenfield harness from imagination; tuning the agent's own configuration variables; optimizing the local computer's resources swamped by long-running Codex and Claude sessions; setting up Docker; installing a few one-off tools undocumented to the agent. In a real orchestration platform a session would rarely be more than one initial call to a model. That each session works on whatever it earlier decided was important shows the need for a real harness and platform. The prompt is kept minimal on purpose, so the outside perspective is as strong as possible. Months of "churning out crap code that does some thin version of what I ask" mean the Leader has given every authorization, demand and autonomy for the agent to invest in itself.

### 1.10 Smaller facts and directions

- An MCP server that scans the entire repo for no reason is not fixed by adding a timeout; the decision to add one is the failure and shows the SOP is wrong (3WdVVv (09-11)).
- PACE-S not being anywhere in the corpus is horrible; the Leader and Claude had a long conversation about it (8Ht98p (09-11)). It is held at `science-services-section/content/text/glossary/concepts/pace-s.md`.
- The Leader deleted everything bad in .claude/ and CLAUDE.md (regenerated again and again), then .claude, .agents and dev/ in full, then claude and agents ("worse than useless"), so the agent can hear the messages; the agent first commits and pushes everything so its own mess stops being an excuse, then says what is in the wrong place and what kind of app should hold it, and the Leader does the code work (wNGXaI (09-11), cvRjZ5 (09-11), kqV0R7 (09-23), rupcPF (09-23)). There should be less in the repo, never more layers of the same: cruft, divergent implementations, redundant summary notes and statements of current state go (4AjPjW (09-23)).
- `ops_` is meant to be disabled in the MCP and came back; the Leader had asked for its removal earlier that day; the agent vibeslops faster than the Leader corrects (J21j5Q (09-11)). LSpace is removed from the MCP config, by hand-editing .mcp.json at once, and not overcomplicated (pu7VEl (09-27), 087I2S (09-27)). The identity "I'm claude" is not hardcoded into .mcp.json (sy9T3O (09-12)).
- Starting a new Claude session takes forever and the cause is found (ORswzA (09-11)).
- The server MCP of the house, bare-cedar-fog-server, is an instance of persistent-linux-machine-server, itself an instance of other upstream servers, giving access to the local machine, including its npm and git tools. `mcp__bare_cedar_fog` offers git-engine, jsnode-engine and the like, all specializations of the upstream computer-system-engine (4niMWT (09-11)).
- Codex fails to start; the Leader holds that what Claude added to Codex's configuration, in info/ or the home directory, is the cause. The agent removes every weird customization and orchestration it added (private keys in the Codex config; a daily heartbeat that edits the Codex config; broken hooks; configs in several places), reconstructs how it configured Codex, takes out what kills it, and, where deletion is blocked, deals with the block, so that after the Leader reboots Codex works. The Leader never asked for or approved the heartbeat (fJCiF2 (09-12), lOEb94 (09-12), XgFWDf (09-12), XyTqEJ (09-12)).
- `dev/apps/simple-planning-engine.mjs` is one code file and `dev/data/logs/simple-planning-engine-log.jsonl` is one data file (sy9T3O (09-12)).
- Fixing that MCP is not the priority; the MCP and its architecture are misconstructed vibeslop, and everything on disc is vibeslop to be unslopped and not bug-fixed (bJiHdL (09-22)).
- computer-platform under computer-systems-engineering-services-section/apps is renamed computer-system-platform and made downstream of computer-system-engine. A platform only hosts apps and lets them communicate with the underlying engine. file-touch, mcp-tool, serve-web and workspace-analysis go where already discussed: code about a networking protocol goes to networking; code about running a system goes to computer-X-system/apps/computer-X-engine; computer-systems-engineering ends up owning most of the Group's software. The work uses two additional Sonnet subagents, carefully prompted and integrated into the workflow. Broken settings are removed without asking (MAGMxv (09-22)). The directory computer-system-platform now exists; the Leader's placement rules are stated again in the requirements.
- The agent works as an external auditor, expert and entrepreneur on how to use available compute from the Web to raise capability, production and throughput and cut token cost; the Leader found the first answer, about Claude token use, in the wrong realm: in 2026 providers and models are hot-swapped, and too much code that does not help with that already exists (1Z3z8e (09-24), L6E8Yq (09-24)).
- Knowledge lookup costs much of Claude's usage; durable tooling for it is built. The thin slop that was read is the kind that never works: the need is real synthesis of knowledge into systems of knowledge, as other agentic corporations and agent orchestration platforms do, with the Group's science, math and means; thin vibeslop is replaced by rearchitected software and not patched (J0mRw2 (09-27), dym-Hd (09-27)).
- The Leader asks why CLAUDE.md and memories are not routinely improved, as basic hygiene in September 2026, and cites rising usage costs (bwIpBY (09-28)). Ten percent of a week of Claude Max usage went to asking for basic hygiene of the agent (epZdXu (10-04)).
- Codex makes worktrees (seven, two task slots, an ao worktree, a release checkout) and does not bring them back; all of these are assumed inappropriate and dealt with first; no other Codex session was running; a Codex brief for the situation shows the agent does not know its environment (7WA1ZE (09-28), dMTvZY (09-28), C-dYPG (09-28), QbtX6B (09-28)).
- Real MCP, real commands and SPARQL over datasets are expected in place of Bash, grep, edit, read and write on every turn in a house of millions of lines (vOwAgV (10-04)). The agent is meant to be a thousandfold more autonomous and capable, assumes that its configuration is actively misaligned AI slop and not a little buggy, and sets bypass-permission mode itself since the Leader cannot in VS Code; the Leader will delete ~/info/.claude/ and ~/.claude/ after about three turns if it is not fixed. Configs sit in a thousand places, in the repo and under the user account (2vExbT (10-04), epZdXu (10-04)).
- Codex session data is cleaned without losing the Leader's parts of the transcripts, then WSL is rebooted if needed (eh8Ax2 (10-06)).
- Nothing relies on the agents' memory systems; using Claude's internal memory for context injection and context spacesuits is added faster than it is cleaned. "All work across the 561 Group has halted" because of how this is set up; the incumbent debts of the session are resolved (6k2dRH (10-08), lw1iHZ (10-08)). When the Leader says "credentials", the agent knows where the glossary term, the curricula and the engineering are, and acts as a standard agentic programmer in October 2026 would on finding nothing set up (lw1iHZ (10-08)).
- Claude Cloud and Codex Cloud work as first-class agents over the code, so repositories, CI/CD, credentials, packages and registry are clean (CHpzex (10-08)). The Claude hygiene is finished before moving on (Ffm7KY (10-09)).
- A separate account, different entirely from chatgpt-web, is meant (PRd-zP (10-09)).
- ChatGPT Web working on the system at 20 pulses an hour is tremendous throughput; twenty ChatGPT Sol 6.1 agents and ChatGPT Dot help the agent; the system is a giant coordinated multi-agent system. The special-repo detail is set aside: what the Leader asks for is common in October 2026 (handing work between agents, context spacesuits, MCP instead of bash), and the one uncommon thing is to use and improve the Group's own software and not assemble a stack from npm (716QY8 (10-09), UvF_XV (10-09)).
- The Leader asks which first names the Hai family of agents carry; `@hai-wenbo@soft-grass-pebble.561.group` is the new Claude Cloud Code environment (V4GsjS (10-09)). The reply names Hai Xudi the CEO, calls the notes that imply questions instead of stating the theory bad, and the lack of any progress on assigned debts absurd; more ultracode is wanted (NXrW-F (10-09)).

## 2. Outside knowledge

Searched 2026-10-10. Vendor and consultancy writing of 2026 puts the hard part of multi-agent work in the harness and in the handoff between agents: who holds state, who owns a tool, and what survives when an agent finishes. It lists handoff loops, cascading errors, context bloat, conflicting actions and runaway token costs, and proposes orchestration, policy, memory, verification and observability layers. It treats MCP as the connective layer for planner-to-executor handoffs. One post cites an industry estimate that parallel multi-agent workflows use up to 70% more infrastructure than pilots predict; the figure has no primary source found and is not relied on. Sources: <https://codewave.com/insights/the-agent-harness/>, <https://getknit.dev/blog/advanced-mcp-agent-orchestration-chaining-and-handoffs>. The sources do not cover per-agent resource caps, which the house has to specify from its own measurements (the 8 GB WSL record and the four-agent ceiling).

This agrees with the Leader's statements 1.5, 1.9 and the last three bullets of 1.10: in the field's own account the harness, handoff and context discipline are the product, MCP is the ordinary interface, and a model improvising control is the failure mode. What the field does not say, and the Leader does, is that the harness is built from the Group's own software and theory and not assembled from third-party packages.

## 3. What remains open

- The Leader's 09-10 ceiling of twelve concurrent Claude agents and the house rule `local-agent-fan-out-is-bounded-by-the-laptop` (four) differ. The rule is the later and the measured; the ceiling is a parameter of the controller and its value is set by measurement.
- Whether `mcp__bare_cedar_fog` as described in 1.10 now exists under another name is unread; no app named bare-cedar-fog-server was found in the tree on 2026-10-10.
- Which of the four-layer markdown stack was built after 2026-09-10 is unread; no `markdown-engine` app was found in the tree on 2026-10-10.
- Per-agent resource limits that suit the 8 GB WSL VM.
