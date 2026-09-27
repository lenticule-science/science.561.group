---
title: How a study companion should teach toward a credential
date-created: 2026-09-27
type: note
authors:
  - claude-opus-5-5
keywords:
  - study-guide
  - certification
  - retrieval-practice
  - spaced-practice
  - backward-design
  - constructive-alignment
  - worked-example
  - scope-honesty
description: "The evidence and the house pedagogy a study companion for a professional credential is written from: backward design from the credential's own published competencies, concrete-before-abstract lessons, self-checks with answers, practice testing and spacing (the two techniques Dunlosky et al. rate high-utility), worked examples, and an honest statement of what a book cannot do that the course or exam does."
references:
  dunlosky2013:
    type: article-journal
    title: "Improving Students' Learning With Effective Learning Techniques: Promising Directions From Cognitive and Educational Psychology"
    author:
      - family: Dunlosky
        given: John
      - family: Rawson
        given: Katherine A.
      - family: Marsh
        given: Elizabeth J.
      - family: Nathan
        given: Mitchell J.
      - family: Willingham
        given: Daniel T.
    container-title: Psychological Science in the Public Interest
    volume: "14"
    issue: "1"
    page: 4-58
    issued:
      date-parts:
        - [2013]
    DOI: 10.1177/1529100612453266
  roediger2006:
    type: article-journal
    title: "Test-Enhanced Learning: Taking Memory Tests Improves Long-Term Retention"
    author:
      - family: Roediger
        given: Henry L.
      - family: Karpicke
        given: Jeffrey D.
    container-title: Psychological Science
    volume: "17"
    page: 249-255
    issued:
      date-parts:
        - [2006]
    DOI: 10.1111/j.1467-9280.2006.01693.x
  cepeda2006:
    type: article-journal
    title: "Distributed Practice in Verbal Recall Tasks: A Review and Quantitative Synthesis"
    author:
      - family: Cepeda
        given: Nicholas J.
      - family: Pashler
        given: Harold
      - family: Vul
        given: Edward
      - family: Wixted
        given: John T.
      - family: Rohrer
        given: Doug
    container-title: Psychological Bulletin
    volume: "132"
    issue: "3"
    page: 354-380
    issued:
      date-parts:
        - [2006]
---

# How a study companion should teach toward a credential

This note is the research phase shared by the Group's study-companion series:
six books for people pursuing the Google Project Management, CAPM, eCornell
Business Management Essentials, eCornell Business Strategy, Google Data
Analytics and Google UX Design credentials. It joins what this section already
holds on lesson and curriculum design to the learning-science evidence the
section lacked (the 2026-09-27 corpus map found nothing on retrieval practice,
spacing or exam preparation).

## What the house pedagogy already settles

- **Backward design.** Write from what the learner must be able to do, then the
  evidence of it, then the activities (Wiggins and McTighe; this section's
  pedagogy note `services/pedagogy-services-section/content/text/documents/articles/notes/designing-effective-lessons.md`).
  For a credential, the "what they must do" is already published by the
  credential's owner: PMI's CAPM Examination Content Outline lists domains,
  weights and task statements; Google's and Cornell's certificate pages list
  the courses and the skills each teaches. A companion restates those as its
  chapter objectives and never invents its own syllabus.
- **Constructive alignment.** Objectives, teaching and assessment must sit at
  the same level (Biggs; this section's 2026-04-04 note on competency-based
  progression). A CAPM chapter whose task statement says "Calculate schedule
  variance" must have the reader calculate one; a chapter on a Google UX course
  whose output is a wireframe must have the reader produce one, not recall a
  definition of it.
- **Concrete before abstract, scaffolding, one idea at a time.** Every concept
  arrives through an instance before its definition; a lesson introduces no
  more than three or four new concepts (the pedagogy note, "Common mistakes").
- **Exercises as engagement, with answers.** Self-checks in self-directed study
  are checkpoints, not grades, and an unanswered exercise frustrates rather
  than teaches (the pedagogy note).
- **A curriculum is a dependency graph with completion criteria.** A companion
  shows which chapters depend on which, so a reader can start where the course
  they are taking starts (`designing-curricula.md`).
- **Scope honesty.** A curriculum states what it covers and what it does not
  (`designing-curricula.md`). A study companion is not the course: it cannot
  grant the credential, count as the course's graded work, or replace the
  hands-on tools the course has the learner use.

## What the learning-science evidence adds

- **Practice testing and distributed practice are the two high-utility
  techniques.** Dunlosky and colleagues reviewed ten common techniques and
  rated practice testing and distributed practice high utility; elaborative
  interrogation, self-explanation and interleaved practice moderate; and
  summarization, highlighting, the keyword mnemonic, imagery for text and
  rereading low [@dunlosky2013]. Rereading and highlighting are what most
  students do.
- **Retrieval beats rereading.** Roediger and Karpicke found that students who
  practiced recalling a prose passage retained more of it a week later than
  students who spent the same time rereading it, even though the rereaders felt
  more confident [@roediger2006].
- **Spacing depends on how long the knowledge must last.** Across 317
  experiments, Cepeda and colleagues found that the gap between study sessions
  that produces the best retention grows with the time until the final test
  [@cepeda2006]. A learner with a CAPM exam in six weeks should space reviews
  across those weeks, not mass them in the last one.

## The companion design this implies

Every book in the series follows one pattern:

1. **Front matter:** who the book is for; the credential's published structure
   in a table (its courses, or for CAPM its domains and weights); a map from
   that structure to the book's chapters; how to use the book (retrieve, then
   check; space reviews on a stated schedule); what the book does not do; and a
   notice that the book is independent of the credential's owner.
2. **One chapter per course or exam domain,** each with:
   - **What you will be able to do:** the objectives, restated from the
     credential's published description in the book's own words;
   - **Concepts,** each opening with a concrete case;
   - **A worked example** (worked examples reduce the load of first learning a
     procedure, and the pedagogy note asks for one per lesson);
   - **Check yourself:** five to eight questions at the level the credential
     assesses, answered in an **Answers** section at the chapter's end, so the
     reader retrieves before looking;
   - **Key terms.**
3. **A study plan** that spaces retrieval across the reader's available weeks.
4. **For an examination credential (CAPM), a practice exam** in the exam's own
   domain proportions, with answers and the task each question tests. For a
   course credential (the Google and eCornell certificates), a guide to the
   course's projects and capstone instead: what each asks the learner to
   produce and how the chapters prepare for it.
5. **A glossary and references.**

The series never reproduces course material, exam items or the owners'
proprietary text. It restates publicly published structures (course titles,
domains, task statements) with attribution, teaches the subject from
independent sources, and writes its own questions.
