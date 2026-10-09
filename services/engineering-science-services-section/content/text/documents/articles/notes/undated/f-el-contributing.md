---
title: Contributing
description: First of all, thank you for being interested in contributing!
---

First of all, thank you for being interested in contributing! You rock!

In this document, you will find some guidelines for contributing to `f.el`. These are more guidelines than rules, so don’t try too hard to follow them.

# Table of Contents <span class="tag" tag-name="TOC_5_gh"><span class="smallcaps">TOC_5_gh</span></span> {#table-of-contents}

- [How Can I Contribute?](#how-can-i-contribute)
  - [Submitting Bugs and Errors](#submitting-bugs-and-errors)
  - [Submitting New Code](#submitting-new-code)
    - [Git Commit Messages](#git-commit-messages)
    - [Create Git Branches](#create-git-branches)
    - [Describing the Pull Request](#describing-the-pull-request)
    - [Updating the README](#updating-the-readme)
    - [Run your tests](#run-your-tests)
  - [Finding Something To Do](#finding-something-to-do)
- [Issue Labels](#issue-labels)

# How Can I Contribute?

## Submitting Bugs and Errors

The easiest way to contribute is to the project is if you encounter a bug or an error. If you encounter one, check whether there is an issue already opened. If not, you can open one! Try to provide as much information as possible:

- Are you running the latest version of the package?
- Which version of Emacs are you running? On what system?
- What is your configuration for this package?
- What is the error message? Do you have a debug trace for the error?
- Can you reproduce it consistently? If so, how?
- What would the expected behavior be?

As you are collecting these pieces of information, try to come up with a short and clear issue title –it should describe quickly your issue without being too vague (e.g. avoid stuff like “error when using f.el” or “doesn’t work”).

To make bug reports easier, a template is available for you to use. If it doesn’t fit the issue you want to raise, feel free to use a blank template instead.

## Submitting New Code

If you are submitting new code through a pull request, make sure of the following:

- Your code doesn’t do something already implemented in the package
- Your code follows the Emacs Lisp style guide presented [here](https://github.com/bbatsov/emacs-lisp-style-guide) as best as you can
- All new functions and variables declared through `defvar`, `defcustom`, and `defconst` have docstrings
- If you introduced new dependencies in your code, you also added them to the list of dependencies in the file’s headers
- And obviously, your code works (I include that because I myself sometimes push commits that don’t work)

### Git Commit Messages

Your commits should follow the adapted [Tim Pope’s guidelines](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html), especially:

- Lines no longer than 72 characters
- Explain what you did
- Use the imperative in your summary
- Use present tense and imperative for what your commit changes

### Create Git Branches

If you work on a fix or on a new feature, create a new branch prefixed with `fix/` or `feature/` respectively and give a descriptive name to your branch. This simplifies the process of merging PRs for Magit and Forge users (or for anyone that merge PRs without using Github’s web interface really).

### Describing the Pull Request

When opening a new pull request, check that its title is short and clear as to what you mean it to do. Its description should:

- Provide the current behavior of the package, and how it will modify it
- If it is linked to an issue, mention it
- If you are submitting an enhancement pull request, describe why this code suggestion would be useful

### Updating the README

In this repository, the [README](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/src/f-el/README.org) is a file automatically generated from its template, [README.org.tpl](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/emacs/src/f-el/README.org.tpl) If you wish to edit it, edit this file rather than the README itself. You don’t need to regenerate it yourself either.

### Run your tests

In order to be able to run your tests, make sure [Cask](https://github.com/rejeep/cask.el) is available on your `$PATH`. You can run the tests with

``` {.bash org-language="sh"}
$ make test
```

If you push your changes on a branch of the official repo or on your own Github repo, an automatic CI should check your code is valid not only for your current version of Emacs but for all versions since Emacs 25.1. But it doesn’t hurt to check your code works on at least your version before pushing, you’ll spend less time debugging.

## Finding Something To Do

Not sure where to begin? Take a look at the list of open issues, especially the ones with one of the following labels:

[good first issue](https://github.com/rejeep/f.el/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc+label%3A%22good+first+issue%22)  
These issues indicate easy to fix issues and easy to implement enhancements. If you are a beginner or if you want to familiarize yourself with the package, look for these issues.

[help wanted](https://github.com/rejeep/f.el/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22+sort%3Aupdated-desc)  
These issues might require some more work than *good first issue* issues and might be a bit more interesting.

If you want to work on an open issue, leave a comment saying so. However, you can directly submit a pull request if you are simply adding support for a non-standard Linux distribution.

# Issue Labels

| Label            | Description                                                         |
|------------------|---------------------------------------------------------------------|
| enhancement      | Feature request                                                     |
| good first issue | easy to fix issue                                                   |
| bug              | Confirmed bug or something very likely to be a bug                  |
| help wanted      | This bug might not be my priority, so feel to give it a try!        |
| documentation    | There is something wrong with the documentation                     |
| duplicate        | The issue has already been reported                                 |
| invalid          | Issue isn’t valid (not the package’s fault)                         |
| wontfix          | It’s either working as intended, or I decided not to fix it for now |
