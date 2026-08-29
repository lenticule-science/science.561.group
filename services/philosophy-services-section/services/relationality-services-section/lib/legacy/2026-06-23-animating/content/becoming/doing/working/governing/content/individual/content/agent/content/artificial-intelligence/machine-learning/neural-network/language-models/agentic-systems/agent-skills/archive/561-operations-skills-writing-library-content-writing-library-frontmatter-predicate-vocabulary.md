---
title: "Common Frontmatter Keys"
date-created: 2026-03-29
type: specification
defines: predicate-vocabulary
description: "A listing of common frontmatter keys in the 561 Library, and what they mean."
predicates:
  extends:
    means: "A is B with more added on"
    inverse: null
  restricts:
    means: "A is B with less allowed"
    inverse: null
  instance-of:
    means: "A is one of those"
    inverse: null
  component-of:
    means: "A is a part inside B"
    inverse: contains
  contains:
    means: "A has B inside it"
    inverse: component-of
  composes:
    means: "A is made of these"
    inverse: null
  dual-of:
    means: "A and B are the same shape seen from opposite sides"
    symmetric: true
  inverse-of:
    means: "A and B add up to the whole"
    symmetric: true
  contrasts-with:
    means: "A and B are opposed but not mirror images"
    symmetric: true
  analogous-to:
    means: "A is like B but in a different domain"
    symmetric: true
  measures:
    means: "A is a number about B"
    inverse: measured-by
  measured-by:
    means: "A is described by the number B"
    inverse: measures
  normalizes:
    means: "A is a rate with B as the denominator"
    inverse: null
  determines:
    means: "knowing A lets you compute B"
    inverse: determined-by
  determined-by:
    means: "A is computed from B"
    inverse: determines
  produces:
    means: "doing A creates B"
    inverse: produced-by
  produced-by:
    means: "A is created by doing B"
    inverse: produces
  requires:
    means: "A cannot work without B"
    inverse: null
  enables:
    means: "A makes B possible"
    inverse: null
  governs:
    means: "A is a rule over B"
    inverse: governed-by
  governed-by:
    means: "A follows rules set by B"
    inverse: governs
  optimizes:
    means: "A makes B work better"
    inverse: optimized-by
  optimized-by:
    means: "A is made better by B"
    inverse: optimizes
  acts-on:
    means: "A does something to B"
    inverse: null
  verifies:
    means: "A checks that B is correct"
    inverse: verified-by
  verified-by:
    means: "A is checked by B"
    inverse: verifies
  addresses:
    means: "A is a response to B"
    inverse: null
  factors-through:
    means: "A must go through B on the way"
    inverse: null
  aggregated-by:
    means: "instances of A are collected into B"
    inverse: null
  delivered-via:
    means: "A travels through B"
    inverse: null
---

Values are kebab-case IDs matching filenames. Use the ID even if the page doesn't exist yet, but use simple terms, not compound phrases.
