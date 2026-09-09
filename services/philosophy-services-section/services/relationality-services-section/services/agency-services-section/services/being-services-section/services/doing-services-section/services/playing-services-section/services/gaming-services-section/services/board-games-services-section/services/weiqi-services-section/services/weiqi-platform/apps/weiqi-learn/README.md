# weiqi-learn

`@lenticule-science/weiqi-learn` — the Weiqi Platform's admitted Learn face: an interactive,
entirely client-side curriculum (board, tutorial, tsumego player, glossary hover-cards) built
on the exact-pinned pure [`weiqi-kernel`](../../../../apps/weiqi-kernel) and this section's own corpus. No
accounts, no server state, no network operator at all — see the
[Weiqi Learn Constitution](../../../../content/text/documents/articles/notes/weiqi-learn-constitution.md)
for the full purpose/authority/refusal-conditions record.

Plain browser-ready ESM (`.mjs`) throughout the app's own code — no TypeScript or framework,
and no build step for app code. The only build step invokes the kernel's shared browser
projection into browser-loadable `.mjs` (below); JSDoc types are welcome, nothing is transpiled.

## Build

```
npm run build
```

Runs the exact-pinned Weiqi kernel's shared browser-projection operation, which strips every
kernel source module to `public/lib/kernel/<name>.mjs` using Node's native
`node:module` type stripping (Node 24), rewrites intra-kernel `"./x.mts"` import specifiers
to `"./x.mjs"`, and verifies the result by importing the built kernel and playing three moves
of a 9x9 game. Copies nothing else; data JSON under `public/data/` is authored directly, not
generated.

## Serve

```
npm run serve            # PORT=8617 by default
npm run serve -- --once  # print the URL, then stay up (for scripted checks)
PORT=3000 npm run serve
```

Zero-dependency `node:http` static file server over `public/`, correct MIME types for `.mjs`,
`.json`, `.svg`, `.css`, `.html`.

## Test

```
npm test
```

Pure logic only. UI modules keep DOM access out of module top-level so Node can import them.

## Check

```
npm run check
```

Runs `node --check` over every `.mjs` file under `public/js`, `scripts`, and `test`.

## Layout

- `public/lib/kernel/` — **built output only**, never hand-edited (see Build, above).
- `public/js/lib/` — kernel bridge, bots, tutorial flow, glossary index, tsumego checking.
- `public/js/ui/` — board, hover-card, lesson player, tsumego player, tutorial UI.
- `public/data/` — glossary, lessons, tsumego JSON, authored directly.
