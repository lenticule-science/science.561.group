---
aliases:
  - 1 Introduction
tags: 
created: 2019-04-29T11:17:15
modified: 2025-07-13T11:19:01
title: Keeping a larder inventory with org mode and ledger
description: "In this piece I'll explain how I'm maintaining an inventory of what's in my larder (kitchen: fridge and pantry) by keeping a personal log using Org-modeTK with ledger-cliTK."
---

## 1 Introduction

In this piece I'll explain how I'm maintaining an inventory of what's in my *larder* (kitchen: fridge and pantry) by keeping a personal log using Org-modeTK with ledger-cliTK.

### 1.1 Editorial and License Information

This document was written by [emsenn](https://emsenn.net/) and is released as software under the terms included in the ["License"](https://emsenn.neocities.org/keep-a-larder-inventory-org-mode-ledger#license) supplement. Please direct comments to their [public inbox](https://lists.sr.ht/~emsenn/public-inbox/) or, if necessary, [email](mailto:emsenn@emsenn.net).

## 2 Steps

### 2.1 `[0/3]` Set up your tech stack.

- `[ ]` Install Emacs.
- `[ ]` Install Org-mode.
- `[ ]` Configure Org-babel.

### 2.2 Create a log.

#### 2.2.1 Create a header

#+TITLE: Larder Log
#+OPTIONS: c:t d:t

#### 2.2.2 Lay out the datetree

- 2019
** 2019-01 January
*** 2019-01-01 Tuesday

### 2.3 Buy groceries

**** Shopping
#+BEGIN_SRC ledger :noweb yes :tangle larder-demo.ledger
2019/01/01 * Grocery Store
  Inventory:Larder:eggs                    4         @@ $0.99
  Inventory:Larder:sausage                 2    lbs  @@ $1.99
  Inventory:Larder:coffee                 90    tbsp @@ $3.99
  Supplier:Harris Teeter
#+END_SRC

### 2.4 Make coffee

**** Cooking
#+BEGIN_SRC ledger :noweb yes :tangle larder-demo.ledger
2019/01/01 * Coffee
  Inventory:Larder:coffee                 -3    tbsp
  Life:Eating

### 2.5 Make dinner

2019/01/01 * Dinner
  Inventory:Larder:eggs                   -4
  Inventory:Larder:sausage                -2    lbs
  Life:Eating
#+END_SRC
