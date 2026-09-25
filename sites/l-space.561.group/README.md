# L-Space

The Lenticule Science knowledge garden, at `https://l-space.561.group`.

- **L-Space** means **Lenticule Space**.
- **SPACE** means **Semantic Position Arranging Conceptual Elements**.
- **TUFTE** means **Tiling User Form Topology Engine**.

L-Space is a VICTOR site. `victor.config.mjs`, pointed at the Lenticule Science
section, is the whole application; this package carries no code that belongs to
L-Space. What it composes is owned elsewhere:

- **VICTOR** builds and serves the site. Its `vault` catalog dialect, owned by the
  vault compiler, admits every note of the science forest as a room: the title
  falls back to the file name, the date is optional, the type is open, and the
  compiler's doors become typed relations. Each room is also a static page.
- **VaultMaze** projects the reading experience: the browser application at the
  root, the browser engine projected from the education platform, CAIRN, and
  TUFTE, and the content-addressed room release under `/vault/`, with its
  anonymous tree under `/vault/public/` holding only rooms whose own frontmatter
  says `visibility: public`. It also keeps each reader's review state.
- **GEODE** is the workbench the author is admitted to, mounted as its own
  application over a live checkout when `GEODE_AUTHORING_ROOT` names one.
- **The web admission service** decides who may read what: Google sign-in with
  the `LSPACE_ALLOWED_EMAILS` allowlist, Discord admission for current Turntide
  islanders through user OAuth or the `/l-space-login` command, signed sessions,
  and the gate over the artifact trees. Only the verified Google principal named
  by `LSPACE_AUTHOR_EMAIL` may write through GEODE.

## Commands

```sh
npm install
npm run check      # two builds of the forest are the same release
npm run build      # victor build <science-section> dist
npm run serve      # the authoring loop: drafts visible, rebuilt on change
npm run start      # the release, as the deployment unit runs it
npm test
```

The forest is 22,000 rooms. A build takes about two minutes inside six
gigabytes; `NODE_OPTIONS=--max-old-space-size=6144` is set in the unit.

## Deployment

`deploy/l-space.service` runs `victor serve --release` on `127.0.0.1:18848` for
the rootless Caddy service on `cold-red-gate` (`deploy/Caddyfile`). Its runtime
environment file, mode `0600`, names the public origin and holds the provider
credentials; nothing secret is committed. Per-reader state, review rows and
Discord sessions, lives in one SQLite database at `LSPACE_DATABASE_PATH`,
opened through the Cloudflare D1 contract so the same tables serve a D1
deployment unchanged.

| Variable | Meaning |
| --- | --- |
| `PUBLIC_BASE_URL` | The public origin identity providers redirect back to. |
| `SESSION_SECRET` | Signs sessions and seals confidential cookies; rotating it signs everyone out. |
| `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET` | The Google OAuth client. |
| `LSPACE_ALLOWED_EMAILS` | Comma-separated addresses admitted through Google. Empty admits nobody. |
| `LSPACE_AUTHOR_EMAIL` | The one address that may author; defaults to the founder's. |
| `DISCORD_CLIENT_ID`, `DISCORD_CLIENT_SECRET` | The Discord application, for user OAuth. |
| `DISCORD_GUILD_ID`, `TURNTIDE_ISLANDER_ROLE_ID` | The exact guild and role snowflakes; names are never authorization keys. |
| `DISCORD_BOT_TOKEN`, `DISCORD_PUBLIC_KEY` | Re-observe membership for command sessions; verify Discord interactions. |
| `LSPACE_DATABASE_PATH` | The SQLite database for per-reader state. |
| `GEODE_AUTHORING_ROOT`, `GEODE_AUTHORING_REGION` | The live checkout GEODE admits Markdown from. |

Local source-corpus retrieval is a separate capability: the repository's
`l-space` MCP entry runs the standalone Python/SQLite server documented in
`dev/docs/science-knowledge.md`. It does not initialize or duplicate this site.
