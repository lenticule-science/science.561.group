---
name: category membership
description: The relation between an object and a category — the predication cell asserting that an object is in the category's object set. A general structure; specific instances (e.g. a resource file's membership in some directory-indexed category) are different structures whose subject and object positions are fixed.
derives-from:
  - member-of.md
title: category membership
---

A category-membership cell is a predication `(x, member-of, C)` where `C` is a category and `x` is the subject claimed to be in `Ob(C)`. The cell's value in the fiber `A_{member-of}` carries whether the membership holds: `t` (x is in C), `f` (x is not in C), `⊥` (no information), `⊤` (asserted both).

Category membership is the most general structure of the membership relation under categorical interpretation. Categories that admit membership cells include the predication category itself, sub-categories defined by sublocale or by closure-rule scope, fiber categories indexed by a base, sheaves on a site, and presheaves on a small index. The structure is general: which category `C` is in the object position determines what counts as "being a member."

Specific membership structures are *different* structures. Examples: the membership of a resource-file in a category indexed by its containing directory; the membership of a predication cell in a closure-stable sub-fiber; the membership of an agent in an office's authorization fiber. Each fixes the subject's role-class and the category's principle of definition. Each is the codomain of a specific morphism that produces such cells from sources of the appropriate type. The general `category-membership` cell is what those specific structures are instances of, not what their consumers operate on directly.

The morphism that *produces* a category-membership cell from a candidate subject and a category is the membership-test morphism (or, equivalently, the application of `member-of` as a predicate). The morphism that *uses* a category-membership cell as input — e.g. to drive a closure-rule application that fires only on members — is the consumer side.
