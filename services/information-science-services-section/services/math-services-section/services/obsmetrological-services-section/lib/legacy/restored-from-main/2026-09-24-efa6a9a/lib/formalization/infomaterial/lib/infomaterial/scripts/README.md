# Infomaterial scripts

`scripts/` contains local tooling owned by the root Infomaterial Lake project.
It is not a separate Lake package, and active library modules under
`Infomaterial/` should not import tooling modules from here.

The stable project-level interface is the root `Makefile`:

```sh
make doctor
make build
make check
make clean
```

`make check` runs the active local gate:

```sh
lake exe checknames
```

Other files in this directory are project-maintenance helpers. Treat them as
local implementation tools unless they are wired into the Makefile or
`package.json`.
