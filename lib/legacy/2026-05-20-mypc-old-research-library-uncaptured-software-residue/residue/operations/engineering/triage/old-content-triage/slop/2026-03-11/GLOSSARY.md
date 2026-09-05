---
description: Glossary of special terms relevant to 561 Group knowledge system development, as understood by an AI agent on 2026-03-11.
date-created: 2026-03-11
type: slop
---

# Glossary

Terms and phrases with special meaning in the 561 Group context. Definitions are written directly here for fast agent onboarding — do not expect these to be authoritative; treat them as a working understanding subject to correction.

---

## 561 Group

A confederacy of endeavors pursuing Black Liberation and Indigenous Sovereignty. Operates a shared knowledge repository (this one). The Group's technical work aims to build a software system to "run" the library — making knowledge operational, not merely stored.

---

## Relationality

A philosophy developed by emsenn, rooted in Lakota epistemology, that treats reality as fundamentally constituted through ongoing relational activity rather than through pre-existing substances. The core question it asks is not "what is this thing?" but "what has to be happening for this to keep going?"

Key claim: things do not exist first and then relate — things exist *through* relating. Relation is not a property of objects; objects are effects of relating.

Uses Heyting (intuitionistic) logic rather than Boolean logic because genuine indeterminacy is treated as real — `a ≠ ¬¬a` is possible, meaning something not-yet-determined is not the same as something determined-to-be-true.

---

## Heyting Algebra / Intuitionistic Logic

The logic underlying the formal math in this system. Unlike Boolean (classical) logic, in Heyting logic `¬¬a ≠ a` — the double negation does not collapse. The gap between `a` and `¬¬a` represents genuine indeterminacy: something not yet resolved by relational activity. This is philosophically motivated: forcing resolution where none exists would misrepresent reality.

---

## Agential Semiotics / Agential Semioverse

A mathematical object formalizing how systems of meaning (semiotic universes) operate when populated with agents, tools, and skills. Agents have profiles (role, goals, policy, memory, available skills/tools). Skills are parametric procedures composed from tools via a skill calculus. All operations are mediated by skills; there are no raw side effects.

The agential semioverse is the primary mathematical framework for organizing the 561 Group's efforts and records. It provides the specification for how the engine and library interact.

Key property: LLMs have no special semantic standing. An LLM executing a skill is equivalent to a rule engine executing it — agenthood is defined by the operator schema, not the model.

---

## Quasicrystalline Hypertensor Topos (QCHTTopos)

A mathematical universe occupying the "structure × mathematical correspondence" position in the five-system architecture. It formalizes structural determination and validates against topos theory, Grothendieck topologies, and modal Heyting algebras.

Built from: a category of finite traces, fiberwise Heyting-modal algebras, functorial reindexing, a Grothendieck topology, a hypertensor product, a generative closure operator, and modal stability operators (σ, Δ).

Its defining property is **generative closure**: the entire content of the topos is the least fixed point of an internal closure operator. Every object and morphism arises from iteratively applying that closure to primitive data.

This is the **current preferred math base** for the engine. Earlier work that references GFRTU (Generative Fibered Recognition Trace Universe) is pointing at a predecessor that has been abandoned in favor of QCHTTopos.

---

## Generative Closure

The iterative process by which a complete universe of acts/objects is derived from a minimal seed by repeatedly applying a closure operator until fixed point. Nothing is added from outside; the system generates all its own content.

In QCHTTopos: `G(A_∞) = A_∞` — the closure of the fixed point is itself. The fixed point is minimal (no proper subset is closed under G) and self-grounding (it contains the operations used to compute it).

Operationally realized in the Cellular Closure Engine as a constructor worklist expanded breadth-first until fixed point or fuel exhaustion.

---

## Five Mathematical Systems

Relationality is formalized through five systems arranged on a 2×2 grid plus relationality itself:

| | Mathematical Correspondence | Empirical Correspondence |
|---|---|---|
| **Process** | Semiotic Universe | Dynamical Universe |
| **Structure** | QCHTTopos | Spectral Universe |

Plus: Relationality (philosophical-mathematical foundation for all four).

The axes are: (1) process vs. structure (whether determination happens over time or holds in place), and (2) mathematical vs. empirical validation target.

---

## Generative Fibered Recognition Trace Universe (GFRTU)

A predecessor math object to QCHTTopos. Some existing code (notably the Cellular Closure Engine) references it as its mathematical base. GFRTU has been **abandoned** in favor of QCHTTopos. Code referencing GFRTU should be understood as pointing at the wrong math base and would need to be re-grounded in QCHTTopos to be fully current.

---

## Cellular Closure Engine (CCE)

An existing software specification (and partial implementation) that operationalizes generative closure for a single "cell" in a GFRTU structure. Given a Cell Data Structure (CDS) serialization and a Recognition Term Language (RTL) judgment, it decides admissibility and returns a refined, closure-complete cell or a rejection code.

Three phases: (1) structural validation, (2) judgment checking, (3) deterministic closure construction via constructor worklist.

The CCE is the closest existing work to the real engine spec needed. Its limitation is that it is grounded in GFRTU rather than QCHTTopos. It is the most relevant prior artifact for the new engine.

---

## TAB (Things with Attributes and Behaviors)

A MUD engine written by emsenn in Fennel (a LISP-style language built on Lua). Entities in the world are "things" with attributes and behaviors. This is emsenn's historical MUD engine work.

The proposition currently on the table: "What if we redid TAB with our contemporary understanding of things?" — i.e., use the TAB architecture as a starting point but re-ground it in the agential semioverse / QCHTTopos math, rethought for 2026-era agential orchestration (markdown files, YAML frontmatter, YAML runbooks, Python scripts, local models, tools, skills).

---

## MUD (Multi-User Dungeon)

A text-based, multiplayer, persistent virtual environment accessed over a network. Players interact through typed commands. Historically significant as an early computing model where the distinction between user, builder, and programmer dissolved — the world is programmed into existence by builders using the same system users interact with.

Relevant because the target engine is conceived as "a MUD, but re-thought for 2026 and agential orchestration." The MUD's world-state-as-program maps onto the library-as-semiotic-universe, and the MUD's command-execution maps onto skill invocation.

---

## Skill

A parametric procedure composed from tools via the skill calculus. Formally a tuple (id, T_in, T_out, Scopes, S) where S maps inputs to interaction operators. Must be monotone, fragment-preserving, and closure-compatible. Must return an effect report.

Skills are the only admissible operational primitives in the engine. All behavior is mediated by skills; there are no raw side effects. A single skill definition in the library becomes both an MCP tool and an HTTP action with identical input/output schemas.

---

## Skill Calculus

The compositional language for building skills from tools:
```
s ::= call(t, args)
    | let x = s1 in s2
    | seq(s1, s2)
    | if p then s1 else s2
    | lambda x. s
    | s1(s2)
```

---

## Fragment Preservation

A constraint on all operations: an operation must respect locality — it may only affect what it is explicitly authorized to affect, and must not silently alter the global state. Formally: an operation is fragment-preserving if applying it to a fragment of the state is consistent with applying it to the whole state restricted to that fragment.

---

## Effect Report

Mandatory output of every skill execution. Documents what paths were created or modified, content hashes, tool calls made, inputs and outputs. Enables deterministic replay and auditability. Silent side effects are disallowed.

---

## Agential Orchestration

The contemporary framing of what the engine does: coordinating agents (AI and human), skills, tools, and content through a principled, auditable, skill-mediated system. The conceptual successor to a MUD's command-dispatch loop — but grounded in the agential semioverse math and operating on markdown/YAML/Python artifacts rather than a game world.

---

## Library / Engine Split

The architecture separates content (semantics) from operators (syntax):
- **Library** (`./library/`): markdown files, skills, schemas, policies, agent definitions — the source of truth for all semiotic objects.
- **Engine** (`./engine/`): minimal kernel that loads skills from the library and executes them. The engine itself has no operational behavior beyond loading and executing library-defined skills.

Key principle: all admissible operators live in the library, not the engine. This preserves the mathematical constraints of the agential semioverse.

---

## Emsenn

The main human agent of the 561 Group who developed the philosophy of relationality, the associated math objects, TAB, and the current engine vision. A Lakota heyoka. The repository represents their knowledge work being formalized and made operational for the Group's use.

---

## Heyoka

A Lakota sacred clown / contrarian figure — someone who sees and acts inversely, revealing truth through inversion and paradox. Relevant here as the epistemological position from which relationality is developed: reality is apprehended through what doesn't fit, what contradicts, what reveals the limits of assumed structure.

---

## Triage / Slop

Within the repository structure, `triage/` holds incoming information that needs to be processed. `triage/slop/` specifically holds AI-generated content. Content here should be treated as a draft/starting point, not authoritative. Dated subdirectories (e.g., `2026-03-11/`) organize slop by when it was generated.
