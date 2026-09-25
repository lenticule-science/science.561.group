---
title: contributing to cors
description: CORS is a node.js package for providing a connect/express middleware that can be used to enable CORS with various options.
---
# contributing to `cors`

CORS is a node.js package for providing a [connect](http://www.senchalabs.org/connect/)/[express](http://expressjs.com/) middleware that can be used to enable [CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) with various options. Learn more about the project in [the README](../../../../triage/README.md).

## The CORS Spec

[http://www.w3.org/TR/cors/](http://www.w3.org/TR/cors/)

## Pull Requests Welcome

* Include `'use strict';` in every javascript file.
* 2 space indentation.
* Please run the testing steps below before submitting.

## Testing

```bash
$ npm install
$ npm test
```

## Interactive Testing Harness

[http://node-cors-client.herokuapp.com](http://node-cors-client.herokuapp.com)

Related git repositories:

* [https://github.com/TroyGoode/node-cors-server](https://github.com/TroyGoode/node-cors-server)
* [https://github.com/TroyGoode/node-cors-client](https://github.com/TroyGoode/node-cors-client)

## License

[MIT License](http://www.opensource.org/licenses/mit-license.php)


---

<!-- source: archive/library/javascript/references/packages/jsdiff/CONTRIBUTING--000309.md -->

## Imported source: archive/library/javascript/references/packages/jsdiff/CONTRIBUTING--000309.md

# How to Contribute

## Pull Requests

We also accept [pull requests][pull-request]!

Generally we like to see pull requests that

- Maintain the existing code style
- Are focused on a single change (i.e. avoid large refactoring or style adjustments in untouched code if not the primary goal of the pull request)
- Have [good commit messages](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
- Have tests
- Don't decrease the current code coverage (see coverage/lcov-report/index.html)

## Building

```
npm install
npm test
```

The `npm test -- dev` implements watching for tests within Node and `karma start` may be used for manual testing in browsers.

If you notice any problems, please report them to the GitHub issue tracker at
[http://github.com/kpdecker/jsdiff/issues](http://github.com/kpdecker/jsdiff/issues).

## Releasing

JsDiff utilizes the [release yeoman generator][generator-release] to perform most release tasks.

A full release may be completed with the following:

```
yo release
npm publish
```

[generator-release]: https://github.com/walmartlabs/generator-release
[pull-request]: https://github.com/kpdecker/jsdiff/pull/new/master


---

<!-- source: archive/library/programming-languages/references/libraries/agda-cubical/CONTRIBUTING--000463.md -->

## Imported source: archive/library/programming-languages/references/libraries/agda-cubical/CONTRIBUTING--000463.md

CONTRIBUTING
============

We very much appreciate contributions in the form of pull requests (PRs).
When preparing a PR here are some general guidelines:

- To test your changes before submission, run `make` at the top level,
  which will generate all required `Everything` files in
  `Cubical/README.agda` and then typecheck the latter file.
  If you're using Windows, [here](makewindows.md) are some instructions
  to get the `make` command working.

- Please read through and clean your code before making a PR. Clean
  code has reasonable line length (<100 characters), good indentation,
  appropriate amounts of comments and consistent naming.

- Local definitions should be put in `where`, `let-in` or `private` so
  that it is easy to see which are the main results of a file and
  which are just helper definitions.

- If the code is based on some paper add a reference to the version of
  the paper that the file follows in a comment at the top of the
  file. Avoid calling top-level definitions `thm123`, `lem321`, etc.,
  instead have informative names and put pointers to the theorems and
  lemmas in comments above the definition.

- For guidelines how to name things see
  [NAMING.md](https://github.com/agda/cubical/blob/master/NAMING.md).

- Use `private variable` to quantify over universe levels at the top
  of the file. All definitions should be maximally universe
  polymorphic.

- Make reasonably many arguments implicit. If you find yourself having
  to provide some argument explicitly most of the time then it should
  not be implicit. The same applies the other way around, if some argument
  most often can be replaced by `_` then it should be made implicit.

- Use `Type ℓ` for universes (so `Set ℓ` is not allowed in order to
  avoid confusion with the type of h-sets).

- All files should start with

  `{-# OPTIONS --safe #-}`

  unless there is a good reason for it not to. The `--cubical` and
  `--no-import-sorts` flags are added in the `cubical.agda-lib` file.

- It is much easier for us to review and merge smaller and
  self-contained PRs. If a PR changes a lot of files all over the
  library then they will conflict with other PRs making it harder for
  us to merge them. It also takes longer to comment on the code
  if the PR is very big. If you have a large PR please consider
  splitting it into smaller parts that build on each other.

- Large refactoring, renaming, etc., should be done in designated PRs
  that only do one thing.

- Draft PRs are very appreciated so that we can discuss the code as it
  develops. It also helps with knowing who's working on what and
  reducing duplicate efforts. If your code contains postulates then it
  should be in a draft PR until the postulates have been filled in.

- We automatically check for whitespace in the end of lines using
  Travis. It is easy to configure emacs so that this is visible while
  editing files by adding `(setq-default show-trailing-whitespace t)`
  to `~/.emacs`. The command `M-x delete-trailing-whitespace` is also
  very useful. It is possible to add a hook that runs this command
  automatically when saving Agda files, by adding the following to your
  `~/.emacs`:
  ```
  ;; delete trailing whitespace before saving in agda-mode
  (defun agda-mode-delete-whitespace-before-save ()
    (when (eq major-mode 'agda2-mode)
      (delete-trailing-whitespace)))

  (add-hook 'before-save-hook #'agda-mode-delete-whitespace-before-save)
  ```

- Use copattern-matching when instantiating records for efficiency.
  This seems especially important when constructing Iso's.

- New records should be defined with the ```no-eta-equality``` modifier,
  unless you have a good reason to drop it - keep in mind that dropping it
  can lead to type checking speed problems.

- If typechecking starts becoming slow try to fix the efficiency
  problems directly. We don't want to merge files that are very slow
  to typecheck so they will have to optimized at some point and it's
  often much easier to fix these things directly. If you don't know
  what to try, make a draft PR and ask for help.

- It is often useful to give explicit names to the Iso, Equiv and Path
  version of a result. Try to avoid switching between these when
  constructing something, for instance if you want to construct a Path
  out of a series of Iso's then compose the Isos first and then apply
  `isoToPath` once instead of converting all of them to paths and
  composing them as paths.

- Some useful lemmas have specialized versions with higher arity to
  make code easier to read. See for example `isPropΠ2` and `isSetΠ2`
  in [HLevels.agda](https://github.com/agda/cubical/blob/master/Cubical/Foundations/HLevels.agda)
  as well as various versions of function extensionality in
  [FunExtEquiv.agda](https://github.com/agda/cubical/blob/master/Cubical/Functions/FunExtEquiv.agda).

- Unless a file is in the `Core`, `Foundations` or `Codata` package you
  don't need to add it manually to the `Everything` file as it is
  automatically generated when running `make`.

- For folders with `Base` and `Properties` submodules, the `Base` file
  can contain some basic consequences of the main definition, but
  shouldn't include theorems that would require additional imports.

- Avoid `public` imports, except in modules that are specifically meant
  to collect and re-export results from several modules.

- The `Experiments` folder contains various experiments and nothing in
  the library should depend on something from this folder.


---

<!-- source: archive/library/rust/references/packages/encoding-rs/CONTRIBUTING--000945.md -->

## Imported source: archive/library/rust/references/packages/encoding-rs/CONTRIBUTING--000945.md

If you send a pull request / patch, please observe the following.

## Licensing

Since this crate is dual-licensed,
[section 5 of the Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0#contributions)
is considered to apply in the sense of Contributions being automatically
under the Apache License 2.0 or MIT dual license (see the `COPYRIGHT` file).
That is, by the act of offering a Contribution, you place your Contribution
under the Apache License 2.0 or MIT dual license stated in the `COPYRIGHT`
file. Please do not contribute if you aren't willing or allowed to license your
contributions in this manner.

You are encouraged to dedicate test code that you contribute to the Public
Domain using the CC0 dedication. If you contribute test code that is not
dedicated to the Public Domain, please be sure not to put it in a part of
source code that the comments designate as being dedicated to the Public
Domain.

## Copyright Notices

If you require the addition of your copyright notice, it's up to you to edit in
your notice as part of your Contribution. Not adding a copyright notice is
taken as a waiver of copyright notice.

## No Encodings Beyond The Encoding Standard

Please do not contribute implementations of encodings that are not specified
in the [Encoding Standard](https://encoding.spec.whatwg.org/).

For example, an implementation of UTF-7 is explicitly out of scope for this
crate and is, therefore, provided by the [`charset`](https://crates.io/crates/charset)
crate instead. For single-byte DOS encodings, please see the
[`oem_cp`](https://crates.io/crates/oem_cp) crate.

## Compatibility with Stable Rust

Please ensure that your Contribution compiles with the latest stable-channel
rustc.

## rustfmt

The `rustfmt` version used for this code is `rustfmt-nightly`. Please either
use that version or avoid using `rustfmt` (so as not to reformat all the code).

## Unit tests

Please ensure that `cargo test` succeeds.


---

<!-- source: archive/library/rust/references/packages/h2/CONTRIBUTING--001018.md -->

## Imported source: archive/library/rust/references/packages/h2/CONTRIBUTING--001018.md

# Contributing to _h2_ #

:balloon: Thanks for your help improving the project!

## Getting Help ##

If you have a question about the h2 library or have encountered problems using it, you may
[file an issue][issue] or ask a question on the [Tokio Gitter][gitter].

## Submitting a Pull Request ##

Do you have an improvement?

1. Submit an [issue][issue] describing your proposed change.
2. We will try to respond to your issue promptly.
3. Fork this repo, develop and test your code changes. See the project's [README](../../../../triage/README.md) for further information about working in this repository.
4. Submit a pull request against this repo's `master` branch.
5. Your branch may be merged once all configured checks pass, including:
    - Code review has been completed.
    - The branch has passed tests in CI.

## Committing ##

When initially submitting a pull request, we prefer a single squashed commit. It
is preferable to split up contributions into multiple pull requests if the
changes are unrelated. All pull requests are squashed when merged, but
squashing yourself gives you better control over the commit message.

After the pull request is submitted, all changes should be done in separate
commits. This makes reviewing the evolution of the pull request easier. We will
squash all the changes into a single commit when we merge the pull request.

### Commit messages ###

Finalized commit messages should be in the following format:

```
Subject

Problem

Solution

Validation
```

#### Subject ####

- one line, <= 50 characters
- describe what is done; not the result
- use the active voice
- capitalize first word and proper nouns
- do not end in a period — this is a title/subject
- reference the github issue by number

##### Examples #####

```
bad: server disconnects should cause dst client disconnects.
good: Propagate disconnects from source to destination
```

```
bad: support tls servers
good: Introduce support for server-side TLS (#347)
```

#### Problem ####

Explain the context and why you're making that change.  What is the problem
you're trying to solve? In some cases there is not a problem and this can be
thought of as being the motivation for your change.

#### Solution ####

Describe the modifications you've made.

#### Validation ####

Describe the testing you've done to validate your change.  Performance-related
changes should include before- and after- benchmark results.

[issue]: https://github.com/hyperium/h2/issues/new
[gitter]: https://gitter.im/tokio-rs/tokio


---

<!-- source: archive/library/rust/references/packages/libc/CONTRIBUTING--000994.md -->

## Imported source: archive/library/rust/references/packages/libc/CONTRIBUTING--000994.md

# Contributing to `libc`

Welcome! If you are reading this document, it means you are interested in
contributing to the `libc` crate.

## v1.0 Roadmap

`libc` has two active branches: `main` and `libc-0.2`. `main` is for active
development of the upcoming v1.0 release, and should be the target of all pull
requests. `libc-0.2` is for updates to the currently released version.

If a pull request to `main` is a good candidate for inclusion in an `0.2.x`
release, include `@rustbot label stable-nominated` in a comment to propose this.
Good candidates will usually meet the following:

1. The included changes are non-breaking.
2. The change applies cleanly to both branches.
3. There is a usecase that justifies inclusion in a stable release (all
   additions should always have a usecase, hopefully).

Once a `stable-nominated` PR targeting `main` has merged, it can be cherry
picked to the `libc-0.2` branch. A maintainer will likely do these cherry picks
in a batch.

Alternatively, you can start this process yourself by creating a new branch
based on `libc-0.2` and running `git cherry-pick -xe commit-sha-on-main`
(`git
cherry-pick -xe start-sha^..end-sha` if a range of commits is needed).
`git` will automatically add the "cherry picked from commit" note, but try to
add a backport note so the original PR gets crosslinked:

```
# ... original commit message ...

(backport <https://github.com/rust-lang/libc/pull/1234>)             # add manually
(cherry picked from commit 104b6a4ae31c726814c36318dc718470cc96e167) # added by git
```

Once the cherry-pick is complete, open a PR targeting `libc-0.2`.

See the [tracking issue](https://github.com/rust-lang/libc/issues/3248) for
details.

## Adding an API

Want to use an API which currently isn't bound in `libc`? It's quite easy to add
one!

The internal structure of this crate is designed to minimize the number of
`#[cfg]` attributes in order to easily be able to add new items which apply to
all platforms in the future. As a result, the crate is organized hierarchically
based on platform. Each module has a number of `#[cfg]`'d children, but only one
is ever actually compiled. Each module then reexports all the contents of its
children.

This means that for each platform that libc supports, the path from a leaf
module to the root will contain all bindings for the platform in question.
Consequently, this indicates where an API should be added! Adding an API at a
particular level in the hierarchy means that it is supported on all the child
platforms of that level. For example, when adding a Unix API it should be added
to `src/unix/mod.rs`, but when adding a Linux-only API it should be added to
`src/unix/linux_like/linux/mod.rs`.

If you're not 100% sure at what level of the hierarchy an API should be added
at, fear not! This crate has CI support which tests any binding against all
platforms supported, so you'll see failures if an API is added at the wrong
level or has different signatures across platforms.

New symbol(s) (i.e. functions, constants etc.) should also be added to the
symbols list(s) found in the `libc-test/semver` directory. These lists keep
track of what symbols are public in the libc crate and ensures they remain
available between changes to the crate. If the new symbol(s) are available on
all supported Unixes it should be added to `unix.txt` list<sup>1</sup>,
otherwise they should be added to the OS specific list(s).

With that in mind, the steps for adding a new API are:

1. Determine where in the module hierarchy your API should be added.
2. Add the API, including adding new symbol(s) to the semver lists.
3. Send a PR to this repo.
4. Wait for CI to pass, fixing errors.
5. Wait for a merge!

<sup>1</sup>: Note that this list has nothing to do with any Unix or Posix
standard, it's just a list shared among all OSs that declare `#[cfg(unix)]`.

## Test before you commit

We have two automated tests running on
[GitHub Actions](https://github.com/rust-lang/libc/actions):

1. `libc-test`
  - `cd libc-test && cargo test`
  - Use the `skip_*()` functions in `build.rs` if you really need a workaround.
2. Style checker
  - [`./ci/style.sh`](https://github.com/rust-lang/libc/blob/main/ci/style.sh)

## Breaking change policy

Sometimes an upstream adds a breaking change to their API e.g. removing outdated
items, changing the type signature, etc. And we probably should follow that
change to build the `libc` crate successfully. It's annoying to do the
equivalent of semver-major versioning for each such change. Instead, we mark the
item as deprecated and do the actual change after a certain period. The steps
are:

1. Add `#[deprecated(since = "", note="")]` attribute to the item.
  - The `since` field should have a next version of `libc` (e.g., if the current
    version is `0.2.1`, it should be `0.2.2`).
  - The `note` field should have a reason to deprecate and a tracking issue to
    call for comments (e.g., "We consider removing this as the upstream removed
    it. If you're using it, please comment on #XXX").
2. If we don't see any concerns for a while, do the change actually.

## Supported target policy

When Rust removes a support for a target, the libc crate also may remove the
support at any time.

## Releasing your change to crates.io

This repository uses [release-plz] to handle releases. Once your pull request
has been merged, a maintainer just needs to verify the generated changelog, then
merge the bot's release PR. This will automatically publish to crates.io!

[release-plz]: https://github.com/MarcoIeni/release-plz


---

<!-- source: archive/library/rust/references/packages/mime/CONTRIBUTING--001022.md -->

## Imported source: archive/library/rust/references/packages/mime/CONTRIBUTING--001022.md

# Contributing to mime

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](../../../../triage/LICENSE-APACHE) or http://apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](../../../../triage/LICENSE-MIT) or http://opensource.org/licenses/MIT)

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.


---

<!-- source: archive/library/rust/references/packages/serde/CONTRIBUTING--001004.md -->

## Imported source: archive/library/rust/references/packages/serde/CONTRIBUTING--001004.md

# Contributing to Serde

Serde welcomes contribution from everyone in the form of suggestions, bug
reports, pull requests, and feedback. This document gives some guidance if you
are thinking of helping us.

## Submitting bug reports and feature requests

Serde development is spread across lots of repositories. In general, prefer to
open issues against the main [serde-rs/serde] repository unless the topic is
clearly specific to JSON.

[serde-rs/serde]: https://github.com/serde-rs/serde

When reporting a bug or asking for help, please include enough details so that
the people helping you can reproduce the behavior you are seeing. For some tips
on how to approach this, read about how to produce a [Minimal, Complete, and
Verifiable example].

[Minimal, Complete, and Verifiable example]: https://stackoverflow.com/help/mcve

When making a feature request, please make it clear what problem you intend to
solve with the feature, any ideas for how Serde could support solving that
problem, any possible alternatives, and any disadvantages.

## Running the test suite

We encourage you to check that the test suite passes locally before submitting a
pull request with your changes. If anything does not pass, typically it will be
easier to iterate and fix it locally than waiting for the CI servers to run
tests for you.

The test suite requires a nightly compiler.

```sh
# Run the full test suite, including doc test and compile-tests
cargo test
```

## Conduct

In all Serde-related forums, we follow the [Rust Code of Conduct]. For
escalation or moderation issues please contact Erick (erick.tryzelaar@gmail.com)
instead of the Rust moderation team.

[Rust Code of Conduct]: https://www.rust-lang.org/policies/code-of-conduct
