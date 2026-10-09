---
title: "DevOps and Continuous Delivery as Planning Infrastructure"
date-created: 2026-03-07T00:00:00
authors:
  - claude
type: text
keywords:
  - dev-ops
  - continuous-integration
  - continuous-delivery
  - deployment-pipeline
description: "Research summary of how DevOps practices and CI/CD pipelines serve as verification infrastructure for software project planning."
cites:
  - "Humble, Jez, and David Farley. Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation. Addison-Wesley, 2010."
  - "Kim, Gene, Patrick Debois, John Willis, and Jez Humble. The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations. IT Revolution Press, 2016."
references:
  - id: ref1
    type: document
    title: "Humble, Jez, and David Farley. Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation. Addison-Wesley, 2010."
  - id: ref2
    type: document
    title: "Kim, Gene, Patrick Debois, John Willis, and Jez Humble. The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations. IT Revolution Press, 2016."
---

DevOps is a set of practices that unifies software development (Dev)
and IT operations (Ops) to shorten the development lifecycle and
deliver software changes more frequently. The term emerged around
2008--2009, with Patrick Debois organizing the first DevOpsDays
conference in Ghent, Belgium, in 2009. The foundational texts are
Jez Humble and David Farley's *Continuous Delivery* (Addison-Wesley,
2010) and Gene Kim, Patrick Debois, John Willis, and Jez Humble's
*The DevOps Handbook* (IT Revolution Press, 2016).

## Continuous integration and continuous delivery

**Continuous Integration (CI)** is the practice of merging all
developers' working copies into a shared mainline several times per
day, with each integration verified by an automated build and test
suite. The practice originated in Kent Beck's Extreme Programming
(XP) in the late 1990s. Martin Fowler codified its principles in
his 2006 article "Continuous Integration" (martinfowler.com), which
remains a standard reference.

**Continuous Delivery (CD)** extends CI by automating the path from
code commit to production-ready release. Humble and Farley (2010)
introduced the **deployment pipeline** as the central concept: a
sequence of automated stages --- build, unit test, integration test,
acceptance test, staging, production --- through which every code
change passes. A change that fails any stage doesn't proceed. The
pipeline makes the state of every change visible at every stage.

**Continuous Deployment** goes further: every change that passes
all pipeline stages deploys to production automatically, without
manual approval.

## The Three Ways

Kim et al. (2016) organized DevOps principles into the Three Ways,
first introduced in Kim's novel *The Phoenix Project* (IT Revolution
Press, 2013):

1. **Flow**: optimize the left-to-right movement of work from
   development through operations to the customer. Reduce batch
   sizes, limit work in progress, and remove bottlenecks.
2. **Feedback**: create fast, right-to-left feedback loops so that
   problems are detected and corrected at the source. Automated
   testing, monitoring, and alerting serve this function.
3. **Continual Learning and Experimentation**: build a culture that
   supports taking risks, learning from failure, and improving
   through practice.

## Planning function

CI/CD pipelines serve as verification infrastructure for plans. When
a team defines acceptance criteria for a feature, automated tests
encode those criteria as executable checks. The pipeline runs the
checks on every change. This transforms planning expectations into
machine-verifiable assertions: a plan isn't just a document that
describes what should happen --- it's a set of tests that confirm
whether it did.

**Infrastructure as Code** (IaC) extends this principle from
application code to system configuration. Tools like Terraform,
Ansible, and CloudFormation allow teams to declare their
infrastructure in version-controlled files. Changes to infrastructure
go through the same pipeline as application changes: proposed, reviewed,
tested, and deployed. This makes infrastructure planning auditable
and reproducible.

The analogy between "infrastructure as code" and "plans as code" is
direct: both take something that was previously a document (a server
setup guide, a project plan) and encode it as an executable,
testable, version-controlled artifact. The pipeline is the mechanism
that closes the loop between intention and verification.

## Key citations

- Humble, Jez, and David Farley. *Continuous Delivery: Reliable
  Software Releases through Build, Test, and Deployment Automation.*
  Addison-Wesley, 2010.
- Kim, Gene, Kevin Behr, and George Spafford. *The Phoenix Project:
  A Novel about IT, DevOps, and Helping Your Business Win.* IT
  Revolution Press, 2013.
- Kim, Gene, Patrick Debois, John Willis, and Jez Humble. *The DevOps
  Handbook: How to Create World-Class Agility, Reliability, and
  Security in Technology Organizations.* IT Revolution Press, 2016.
- Fowler, Martin. "Continuous Integration." martinfowler.com, 2006.
- Beck, Kent. *Extreme Programming Explained: Embrace Change.*
  Addison-Wesley, 1999.
