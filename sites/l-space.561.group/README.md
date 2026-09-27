# L-Space

The Lenticule Science knowledge garden, at `https://l-space.561.group`.

- **L-Space** means **Lenticule Space**.
- **SPACE** means **Semantic Position Arranging Conceptual Elements**.
- **TUFTE** means **Tiling User Form Topology Engine**.

L-Space is a VICTOR site. `static-site-publisher.config.mjs`, pointed at the Lenticule Science
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
- **The web admission service** decides who may read what, and keeps signed sessions and the
  gate over the artifact trees. Readers are admitted through:
  - Google sign-in, for addresses on the `LSPACE_ALLOWED_EMAILS` allowlist;
  - Discord, for current Turntide islanders, through user OAuth or the `/l-space-login` command;
  - a username and password, or a Hive Keychain signature, for the people in the state
    directory's `principals.json`.

  Only the author may write through GEODE or `/mcp`: the verified Google principal named by
  `LSPACE_AUTHOR_EMAIL`, or a local subject named in `LSPACE_AUTHOR_SUBJECTS` (by default the
  founder's `password:emsenn` and `hive:emsenn0`).

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

## Assistants

`/mcp` is the garden as an MCP server. To connect ChatGPT, Claude or any MCP client, give it the
URL `https://l-space.561.group/mcp`. The client finds the garden's authorization server and
registers itself. The reader signs in the same way as on the site (Google for allowlisted
addresses, Discord for islanders) and then approves the client on a consent page. Every admitted
reader can use `search` and `fetch`, the pair ChatGPT expects of a knowledge source, and the
`vault_*` tools that read what the notes say. Only the author also sees the write tools.

## Deployment

`deploy/l-space.service` runs `static-site-publisher serve --release` on `127.0.0.1:18848` on
the machine that holds the repository (`bare-cedar-fog`). A build of the forest needs about six
gigabytes, more than the public host has. The public host's Caddy reaches the site over the
tailnet (`deploy/Caddyfile`). It runs from a release checkout of the repository
(`~/.local/share/561-group/releases/info/checkout`), so work in progress in the live tree never
stops the site. The garden therefore publishes the science section as of that release. GEODE
authors the live tree, and its edits appear once a new commit is checked out there and installed.

The runtime environment file, mode `0600`, names the public origin and holds the provider
credentials; nothing secret is committed. Per-reader state (review rows and Discord sessions)
lives in one SQLite database at `LSPACE_DATABASE_PATH`. It is opened through the Cloudflare D1
contract, so the same tables would serve a D1 deployment unchanged. The authorization server's
grants live beside it in `oauth/` (or at `LSPACE_OAUTH_STATE`).

| Variable | Meaning |
| --- | --- |
| `PUBLIC_BASE_URL` | The public origin identity providers redirect back to; also the issuer and the resource's origin. |
| `SESSION_SECRET` | Signs sessions and seals confidential cookies; rotating it signs everyone out. |
| `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET` | The Google OAuth client. |
| `LSPACE_ALLOWED_EMAILS` | Comma-separated addresses admitted through Google. Empty admits nobody. |
| `LSPACE_AUTHOR_EMAIL` | The one address that may author; defaults to the founder's. |
| `DISCORD_CLIENT_ID`, `DISCORD_CLIENT_SECRET` | The Discord application, for user OAuth. |
| `DISCORD_GUILD_ID`, `TURNTIDE_ISLANDER_ROLE_ID` | The exact guild and role snowflakes; names are never authorization keys. |
| `DISCORD_BOT_TOKEN`, `DISCORD_PUBLIC_KEY` | Re-observe membership for command sessions; verify Discord interactions. |
| `LSPACE_DATABASE_PATH` | The SQLite database for per-reader state. |
| `LSPACE_STATE_DIR` | `principals.json`, Hive login nonces, and the authorization server's grants (default: beside the database). |
| `LSPACE_AUTHOR_SUBJECTS` | Comma-separated local subjects who may author. |
| `LSPACE_OAUTH_STATE` | Where the authorization server keeps clients and grants, when not in the state directory. |
| `GEODE_AUTHORING_ROOT`, `GEODE_AUTHORING_REGION` | The live checkout GEODE admits Markdown from; `/mcp` reads the same archive. |

Clients reach these tools through the machine's one MetroPlat node, never through a copy of the archive started per client.
