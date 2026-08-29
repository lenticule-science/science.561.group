# Infomaterial Projectization

This directory now stands as its own private project root.

## CI Shape

The Lean package lives at the repository root, with the Lean library sources in
`Infomaterial/`.

- `.github/workflows/lean-ci.yml` is the frequent gate: Lake build, `make check`,
  and the packaging audit.
- `.github/workflows/lean-audit.yml` is the infrequent gate: manual or weekly
  scheduled independent Lean checking plus the slower project audits.
- Documentation publication is intentionally absent. The private repository can
  still audit source and upload generated coverage artifacts without trying to
  publish Verso or Blueprint output.

The normal local contract runs from the repository root:

```sh
make check
pnpm run lean:audit
```

## Packaging Direction

Treat the Lean library and the Node package as two surfaces over the same
version:

- `lakefile.toml` names the Lean package and library.
- `lean-toolchain` pins the Lean release.
- `package.json` names the Node-facing package, carries the npm
  version, and exposes project operations.

Before publishing anywhere, make the version policy explicit:

- Use SemVer for `package.json`.
- Tag releases from the repository root, for example `v0.1.0`.
- Keep `lean-toolchain` changes as version-significant changes, because they
  alter the elaboration environment.
- Keep the npm package private until the runtime surface is intentionally
  separated from research-only scripts and generated documentation.

The likely next packaging step is to add a `files` allowlist and an
`exports` map to `package.json`, then move reusable Node-facing code out of
`scripts/` into a small package-owned source directory. Until then, the npm
package should be treated as an operations wrapper rather than a reusable
library.
