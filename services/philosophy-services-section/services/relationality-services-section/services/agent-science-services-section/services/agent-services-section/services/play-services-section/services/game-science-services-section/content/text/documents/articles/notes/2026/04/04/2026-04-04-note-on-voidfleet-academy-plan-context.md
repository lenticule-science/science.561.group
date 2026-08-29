---
title: Voidfleet Academy Training System
description: Establishes the conceptual foundation for Voidfleet Academy training, integrating education theory, relational algebra, and the Algebraic Learning Calculus to formalize crew development and continuous learning.
date-created: 2026-04-04
type: note
name: voidfleet-academy-plan-context
keywords:
  - crew-training
  - relational-algebra
  - algebraic-learning-calculus
  - fuzzy-cells
  - continuous-learning
specialization: analysis
serves: voidfleet-academy-plan
---

The training and continuous improvement system for all crew — human and AI. Grounded in:
- **Education theory**: pedagogy, andragogy, situated learning, communities of practice
- **Crew training**: naval/maritime training traditions, apprenticeship, competency frameworks
- **The relational algebra**: offices/duties/roles as "fuzzy cells" — prose-specified algebras that can be progressively formalized
- **Continuous learning for models**: training as closure, fine-tuning as additional nucleus, instincts→skills→duties as the harness analog of weight-level training

## Captain's words (2026-04-04)

> We need to do a lot more research about education, training, training a crew, officers. Hella complicated field. Additionally we'll need to really study how continuous learning and shit work for models like you, AND we want to look at what fine-tuning models looks like from this informed perspective where we're treating them like... in this way. Because a lot of your offices/duties/roles stuff is actually just kind of "fuzzy" forms of the same algebras used elsewhere.

## The key insight

A duty definition IS a cell — but fuzzy:

| Cell component | Duty analog | Fuzziness |
|---------------|-------------|-----------|
| Site (topology) | Action domain | Prose-described, not formal |
| Fibers (σ/Δ) | What the office recognizes/produces | Natural language, not typed |
| Constructors | What actions the office can take | Tool allowlists, not formal ops |
| Laws/invariants | Delegation bounds, authority limits | Policies, not checked algebraically |

Training = sharpening. Moving from prose duties toward algebraically-specified ones. A new officer starts with loose duties and learns through practice. A fine-tuned model starts with general weights and specializes through data. Both are forms of closure — applying the training nucleus until a fixed point is reached.

## The Algebraic Learning Calculus (from ideas/algebraic-learning-calculus.md)

The Academy's theoretical backbone. Instead of naive confidence scores (ECC's float-based instincts), the Academy uses:

**Closure as learning.** Training applies a closure operator until a fixed point is reached. The instinct is "learned" when applying the training operator produces no further change — idempotence, not a threshold. This connects directly to the predication paper's nucleus operators.

**Formality progression as curriculum.** F0→F1→F2→F3 IS the progression ladder:
- F0: Raw observation ("something happened")
- F1: Prose pattern ("do X when Y") — a new officer starts here
- F2: Parameterized procedure ("given inputs A,B compute C") — an experienced officer
- F3: Algebraic specification ("if input matches pattern, apply transform") — a fully trained office

**Competency-based certification.** PQS-style (Personnel Qualification Standards) gates replace observation-count thresholds. An officer is certified for a duty when they've demonstrated competency, not when they've been observed N times. What counts as demonstration is duty-specific.

**Situated learning.** Instincts belong to practices, not abstract spaces. Office-scoping is better than project-scoping. Community-of-practice scoping (which offices share a practice?) is best. This grounds the Academy in Lave & Wenger's legitimate peripheral participation.

**Training as transaction.** When an officer completes a training exercise, that's a transaction: effort debits the training budget, competency credits the officer's capability account. Failed training debits more but credits the learning system. The books record the evidence for certification.

## Phases

### Phase 1: Research (inquiry)
Survey education theory, crew training, and model training. Ground in real disciplines before building anything. Library texts, not session logs.

### Phase 2: Map (derivation)
Map the existing duty/office/role system onto the cell algebra. Identify what's already formal, what's fuzzy, and what formalization would buy us.

### Phase 3: Design (derivation)
Design the curriculum structure and certification system. How does a new crew member (human or AI) progress? What does certification look like when duties are algebraic? The algebraic learning calculus provides the theoretical framework: closure measures for confidence, bilattice composition for relevance, competency gates for promotion.

### Phase 4: Build (procedure)
Implement the training infrastructure. For AI: continuous learning pipeline improvements (see cl-pipeline plan), fine-tuning workflows, model routing by capability. For humans: onboarding flow, skill assessment, advancement pathway. Training transactions integrate with the operational ledger (see plaintext-accounting-operations plan).
