---
title: README
description: URL library for Rust, based on the URL Standard.
---
rust-url
========

[![Build status](https://github.com/servo/rust-url/workflows/CI/badge.svg)](https://github.com/servo/rust-url/actions?query=workflow%3ACI)
[![Coverage](https://codecov.io/gh/servo/rust-url/branch/master/graph/badge.svg)](https://codecov.io/gh/servo/rust-url)
[![Chat](https://img.shields.io/badge/chat-%23rust--url:mozilla.org-%2346BC99?logo=Matrix)](https://matrix.to/#/#rust-url:mozilla.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/rust/references/crates/url/LICENSE-MIT)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/rust/references/crates/url/LICENSE-APACHE)

URL library for Rust, based on the [URL Standard](https://url.spec.whatwg.org/).

[Documentation](https://docs.rs/url)

Please see [UPGRADING.md](https://github.com/servo/rust-url/blob/main/UPGRADING.md) if you are upgrading from a previous version.

## Alternative Unicode back ends

`url` depends on the `idna` crate. By default, `idna` uses [ICU4X](https://github.com/unicode-org/icu4x/) as its Unicode back end. If you wish to opt for different tradeoffs between correctness, run-time performance, binary size, compile time, and MSRV, please see the [README of the latest version of the `idna_adapter` crate](https://docs.rs/crate/idna_adapter/latest) for how to opt into a different Unicode back end.
