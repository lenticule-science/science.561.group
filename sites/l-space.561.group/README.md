# L-Space

The Lenticule Science knowledge garden, at `https://l-space.561.group`.

- **L-Space** means **Lenticule Space**.
- **SPACE** means **Semantic Position Arranging Conceptual Elements**.
- **TUFTE** means **Tiling User Form Topology Engine**.

This package is both the site and its deployment carrier.
It compiles the active science-service forest into an immutable release and serves that release as one authenticated wing with a small anonymous front door.
It excludes legacy custody, triage, private material, development artifacts, tests, fixtures, and build output by segment name; the vault compiler additionally excludes `node_modules` and `.git` unconditionally.

L-Space is not itself a fourth knowledge application. It is the situated site
and admission boundary for three composed applications:

- CAIRN admits, reads, queries, and revision-safely changes content archives.
- VaultMaze is the default navigational-learning experience.
- GEODE is the graphical entity/ontology workbench selected for the currently
  admitted curator authority.

VICTOR owns website formation and serving. TUFTE owns the user forms and
topology used by the graphical applications. The authenticated
`/api/v1/application` response and `application` field on `/api/v1/me`
make the selection explicit; rendering does not grant authority.

TUFTE uses a deterministic 96-column tiling grid.
The inherited force-directed layout remains available to smaller parameterizations, but is not an honest default for L-Space's active rooms.

## The public surface

L-Space compiles the whole live science forest, so the safe default is that a room is authenticated.
A room joins the anonymous surface only by declaring `visibility: public` in its own frontmatter.
Every other value — a miscapitalisation, a non-string, an absent field — resolves to `authenticated`, and [`test/config.test.mjs`](test/config.test.mjs) pins that behaviour against each of those spellings.

The separation is structural rather than conditional.
Public rooms are written to their own `/vault/public/` asset tree, and the anonymous routes construct paths only inside it.
A routing mistake therefore cannot serve an authenticated room to an anonymous reader, because no anonymous route is able to name one.
[`test/cloud-worker.test.mjs`](test/cloud-worker.test.mjs) asserts that twelve spellings of "reach the vault without an identity" all return 401, and [`test/release-surface.test.mjs`](test/release-surface.test.mjs) re-checks the built release rather than the intention behind it.

## VaultMaze

VaultMaze is the participatory passage layer over L-Space.
Readers follow hard knowledge prerequisites and clear unreviewed or due cards at a 0.9 retention target before entering a more complex room.
The shared vault remains read-only; review state belongs to each reader.

The passage layer still declares its exceptions as claim names —
`l-space:direct-read`, `l-space:curator`, and `l-space:accessibility-bypass`,
the last so the game mechanic cannot become an accessibility barrier.

A reader may instead request `familiar-retrieval`.
The familiar returns a copy of the information without recording the blocked review as learned.
Its cost is identified by `lenticule-science/familiar-cost/v1`; defining that economy is a separate deployment policy, not something this package quietly improvises.

The underlying package retains its historical `lantern` name and local-storage prefix so existing player saves remain usable.
VaultMaze is the public name.

## The browser engine

`@red-cup-engineering/lantern-561-group` publishes TypeScript `.mts`.
A browser cannot load that and neither can a Cloudflare Worker, so scheduling has to reach the reader some other way.
[`scripts/build-browser-engine.mjs`](scripts/build-browser-engine.mjs) strips the types at build time with Node's own stripper and writes plain ESM into `public/js/`, following the same house pattern `@lenticule-science/weiqi-web` uses for its kernel.

Upstream stays the single source of truth.
Nothing here is a hand-transliterated port that can drift from the package it claims to mirror, and [`test/browser-engine.test.mjs`](test/browser-engine.test.mjs) checks the projected scheduler and light cone against the upstream modules directly rather than against a fixture.

## Cloud topology

The deployed system separates four authorities which are too often placed in one excitingly flammable database:

1. GitHub is the, versioned corpus and current authoring surface.
2. `npm run build:cloud` deterministically compiles that checkout into an immutable, sharded L-Space release. A compact index discovers rooms; each room is a content-address-shaped static asset.
3. The same Worker fetch module runs in Cloudflare and through the Node 22 adapter in `lib/vps`. Public TLS for `l-space.561.group` terminates at the rootless Caddy service on `cold-red-gate`, which currently routes to that local adapter because a legacy zone-level Cloudflare Access application also intercepts the account's `workers.dev` hostnames.
4. The active VPS runtime stores per-reader VaultMaze state and opaque Discord sessions in persistent SQLite through the same narrow D1 interface used in Cloudflare. Review rows use a SHA-256 pseudonym of the provider-qualified subject. Discord access and refresh tokens are encrypted with `SESSION_SECRET`; the database stores only a hash of the browser session bearer. Google addresses and Discord user IDs never enter review rows.

Release bytes are produced through the compiler's `canonicalStringify`, so an unchanged corpus compiles to an unchanged release hash.
The compiled world is checked against the compiler's own `validateWorld` before anything is written: a world that fails its schema is not a release.

## Rendering topology

The release compiler, rather than each reader's browser, projects Markdown through `@red-cup-engineering/render-markdown-block-html-service`.
That service escapes prose, admits link targets, and preserves house features such as wikilinks, transclusions, citations, inline fields, and callouts.
The browser progressively connects those admitted targets to content-addressed L-Space rooms.
It does not carry a second Markdown dialect implementation.

The garden entrance is a normalized `tufte.projection` produced by `@red-cup-engineering/web-tufte-gui-services-section`.
Its authored tile order is the semantic reading and tab order; CSS placement may densify the visual surface without rewriting that order.
The Canvas atlas is explicitly a macro view of the deterministic catalogue tiling.
It does not pretend catalogue adjacency is semantic distance.

**Halls** are the compiler's Formal Concept Analysis clusters: every set of rooms sharing a closed set of attributes.
They were computed on every build and projected nowhere, which left the corpus with a whole navigable dimension its readers could not see.
`/api/v1/vault/halls` now serves them, and a hall marked rigid has an internal door graph that is connected, load-bearing, and pebble-game independent — a real structural claim from the compiler's `stability` module, not a decoration.

## Dependency resolution

`.npmrc` sets `install-links=true`, which installs local `file:` dependencies as real directories rather than symlinks.
This is not a preference.
Node resolves a symlinked package's own imports from its real path in the source tree, where there is no `node_modules`, so a symlinked install breaks any dependency that has dependencies of its own — here, the Markdown block renderer's use of its inline sibling.
`@red-cup-engineering/render-markdown-inline-html-service` is additionally declared as a direct dependency for the same reason the vault compiler is: relying on transitive hoisting would make resolution depend on installation topology.

## Authentication and admission

Allowlisted operators may sign in with Google. The Worker runs the whole OpenID Connect
authorization-code flow itself: `/oauth/login` mints a `state`, a `nonce`, and a
PKCE verifier, keeps them in a short-lived signed cookie, and relays to Google's
consent screen; `/oauth/callback` checks the state, exchanges the code with the
verifier, verifies the returned `id_token` against Google's JWKS for signature,
issuer, audience, expiry, and nonce, and only then issues a session.

The session cookie is HMAC-SHA256 signed, `HttpOnly; Secure; SameSite=Lax`,
scoped to `/`, and good for fourteen days.
It follows the shape already proven in the EVE Assist Worker rather than
inventing a second one.
It carries a subject, a subject pseudonym, and an email address; it carries no
secret, because a session names who someone is rather than granting anything the
allowlist would not grant again on the next request.

Turntide Island members have a second, independent entrance at
`/oauth/discord/login`. It uses Discord's authorization-code flow with state and
S256 PKCE and requests only `identify` and `guilds.members.read`. It does not
request `guilds`, so L-Space never receives a list of the reader's other Discord
servers, and it does not carry the Turntide steward's bot token.

Discord returns the current reader's membership record for the one configured
`DISCORD_GUILD_ID`. Admission compares its `roles` array to the exact
`TURNTIDE_ISLANDER_ROLE_ID` snowflake. The display name `islander` is never an
authorization key: names are mutable; Discord IDs are the stable protocol
identity.

When a production deployment intentionally has no Discord client secret,
`/api/v1/discord/command-challenge` provides a short browser code. The reader
submits it with the registered Discord application command `/l-space-login
code:<code>`. The incumbent Zelo Discord Gateway owns the application command;
it sends L-Space only the challenge and Discord's guild, user, pending, and role
projection, signed over the exact request bytes with a timestamped HMAC. L-Space
accepts that projection only for the exact configured guild and islander-role
snowflakes before approving the single-use challenge. The application-level
Interactions Endpoint URL remains unset so this route does not take ownership
of Zelo's other commands. `/api/v1/discord/interactions` remains as an
Ed25519-verifying compatibility ingress but is not the production command path.
The database retains the code hash, a separate browser-verifier hash, and a
provider-qualified subject hash only. The Discord user ID is encrypted at rest
with `SESSION_SECRET`, solely so each protected request can re-observe current
membership through `DISCORD_BOT_TOKEN`; it is never stored as plaintext or
placed in a review row. A missing member, a pending member, or loss of the role
deletes the command session. Discord 429/5xx failures deny the request with a
retryable 503 rather than trusting a cached role snapshot. Browser
challenge creation is rate limited by an expiring keyed hash of the edge source
address. This command path is deliberately separate from OAuth and does not
need `DISCORD_CLIENT_SECRET`.

Discord access and refresh tokens remain server-side in D1, encrypted with
`SESSION_SECRET`. The browser receives a random opaque bearer and D1 stores only
its SHA-256 hash. Before every protected response the Worker asks Discord for
the reader's current guild-member record. Leaving Turntide Island, losing the
role, remaining pending in Membership Screening, revoking the grant, or an
unavailable/malformed Discord response therefore fails closed rather than
falling back to a cached role snapshot. Logout deletes the local session and
asks Discord to revoke the grant.

### Admission is not authentication

This is the part worth reading twice.
Google will authenticate anyone on earth with a Google account.
Cloudflare Access used to make the admission decision through its allow policy,
and replacing it moved that decision into this codebase, where it is made by
`LSPACE_ALLOWED_EMAILS` — a comma-separated allowlist held as a Worker secret.

An unset or empty allowlist admits **nobody**.
It never means "admit anyone", and
[`test/google-auth.test.mjs`](test/google-auth.test.mjs) pins that for the unset,
empty, and whitespace-only cases.

Admission is re-judged on every request rather than trusted from the cookie, so
removing an address from the allowlist locks that reader out immediately instead
of whenever their session happens to lapse.
A deployment missing `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, or
`SESSION_SECRET` refuses to start a login and admits no one, rather than falling
back to an open door.

The two paths are alternatives, not an identity guess. An allowlisted Google
operator may enter through Google. A current Turntide member holding the exact
islander role may enter through Discord. L-Space never links accounts by email,
display name, or similarity, and an unconfigured provider admits nobody through
that provider.

## Deployment runbook

Prerequisites are a Cloudflare account containing the `561.group` zone, Wrangler
authentication, a Google OAuth client for the operator path, and a confidential
Discord application for the Turntide islander path.

Create the Google client in the Google Cloud console as an **OAuth client ID**
of type *Web application*, with `https://l-space.561.group/oauth/callback` as an
authorized redirect URI. It needs no scopes beyond `openid`, `email`, and
`profile`, all of which are default. Note the client ID and client secret.

In the Discord Developer Portal, use the Turntide Islands application (or a
dedicated confidential web application) and register
`https://l-space.561.group/oauth/discord/callback` as an OAuth2 redirect. The
login itself requests only `identify` and `guilds.members.read`. Preserve the
exact Turntide Island guild ID and the exact historical islander role ID; do not
substitute the role name.

```sh
npm install
npx wrangler d1 create lenticule-science-vaultmaze
export LENTICULE_SCIENCE_D1_DATABASE_ID='<id printed by wrangler>'
npm run cloudflare:config

# Secrets. None of these belong in a committed file.
npx wrangler secret put GOOGLE_CLIENT_ID       --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put GOOGLE_CLIENT_SECRET   --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put LSPACE_ALLOWED_EMAILS  --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put DISCORD_CLIENT_ID      --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put DISCORD_CLIENT_SECRET  --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put DISCORD_GUILD_ID       --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put TURNTIDE_ISLANDER_ROLE_ID --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put DISCORD_PUBLIC_KEY        --config lib/cloudflare/wrangler.generated.jsonc
npx wrangler secret put DISCORD_BOT_TOKEN          --config lib/cloudflare/wrangler.generated.jsonc
# A long random value; rotating it signs every reader out.
openssl rand -base64 48 | npx wrangler secret put SESSION_SECRET --config lib/cloudflare/wrangler.generated.jsonc

npm run cloudflare:deploy
```

VaultMaze source editing is intentionally narrower than either reader entrance.
Only a verified Google session for `morgan.sennhauser@gmail.com` may receive the
editor projection or submit a revision-safe GEODE write. Discord islanders,
including a Discord account belonging to Morgan, are readers only; Discord IDs
and deployment environment variables cannot grant authoring authority.

`npm run cloudflare:config` generates `wrangler.generated.jsonc` from the
checked-in template; it is ignored by git because it carries an account resource
identifier. Run it before the `wrangler secret put` calls above.

The Worker also registers a daily bounded cleanup trigger. It revokes and
deletes expired Discord grants so encrypted refresh tokens do not remain in D1
after their local session-retention window.

The Worker script is still named `lenticule-science-knowledge-vault`.
That is deliberate: keeping the script name moves the existing Worker and its D1
binding to the new hostname, where renaming it would create a second Worker and
orphan the first along with its learner state.

The Cloudflare deployment keeps D1 state and its scheduled cleanup but disables
`workers.dev` and declares no HTTP route. The one public origin is deliberately
singular: an unproxied `l-space.561.group` A record points to `cold-red-gate`,
whose rootless Caddy service uses the checked-in `lib/vps/Caddyfile` fragment. The checked-in
`lib/vps/l-space.service` runs the bundled Worker module through the Node
adapter on `127.0.0.1:18848`. Its runtime environment file is mode `0600`, and
its SQLite state directory and the dedicated sparse source checkout are its only
writable paths. The checkout is rooted at the active science section; GEODE
admits Markdown from that boundary and never writes the compiled `dist` tree.
The server opens the immutable reading surface before scanning the authoring
checkout, so an editor can briefly return 503 after restart without taking the
site down. This boundary can move back to a Cloudflare Custom Domain after the
legacy Access application is removed; it must not expose both origins as
competing L-Space sites.
