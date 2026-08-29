import {
  beginLogin,
  CALLBACK_PATH,
  completeLogin,
  identify as identifyGoogle,
  LOGIN_PATH,
  LOGOUT_PATH,
  logout as logoutGoogle,
} from "./google-auth.mjs";
import {
  beginDiscordLogin,
  completeDiscordLogin,
  DISCORD_CALLBACK_PATH,
  DISCORD_LOGIN_PATH,
  identifyDiscord,
  logoutDiscord,
  purgeExpiredDiscordSessions,
} from "./discord-auth.mjs";
import {
  acceptDiscordInteraction,
  acceptDiscordGatewayCommand,
  createDiscordCommandChallenge,
  DISCORD_COMMAND_CHALLENGE_PATH,
  DISCORD_GATEWAY_COMMAND_PATH,
  DISCORD_INTERACTION_PATH,
  identifyDiscordCommandSession,
  pollDiscordCommandChallenge,
} from "./discord-command-login.mjs";

const JSON_HEADERS = { "content-type": "application/json; charset=utf-8" };
export const LSPACE_AUTHOR_EMAIL = "morgan.sennhauser@gmail.com";

/**
 * The anonymous surface is an allowlist of exact shell paths, never a prefix.
 *
 * A prefix rule is how a public front door turns into a disclosure: `/vault/`
 * holds every authenticated room, so no anonymous route may be able to name a
 * path inside it. Public rooms live in their own `/vault/public/` tree, and the
 * only anonymous route into that tree builds the path itself from a validated
 * content address.
 */
const PUBLIC_SHELL_ASSETS = new Set([
  "/", "/index.html", "/styles.css", "/app.js", "/favicon.ico", "/robots.txt",
]);
const PUBLIC_MODULE_PATH = /^\/js\/[a-z0-9-]+\.mjs$/u;
const CONTENT_ADDRESS = /^[a-f0-9]{64}$/u;

function responseJson(value, status = 200, extraHeaders = {}) {
  return new Response(JSON.stringify(value), {
    status,
    headers: { ...JSON_HEADERS, ...extraHeaders },
  });
}

/** Turn an auth module result into a Response, carrying every cookie it set. */
function authResponse(result) {
  if (result.status === 302) {
    const headers = new Headers({ location: result.redirect });
    for (const cookie of result.cookies ?? []) headers.append("set-cookie", cookie);
    return new Response(null, { status: 302, headers });
  }
  const headers = new Headers(JSON_HEADERS);
  if (Number.isFinite(result.retryAfter)) headers.set("retry-after", String(result.retryAfter));
  for (const cookie of result.cookies ?? []) headers.append("set-cookie", cookie);
  // Cookies are credentials.  They travel only in Set-Cookie, never in a JSON
  // response body where page JavaScript could read an HttpOnly bearer.
  const { status, cookies: _cookies, ...body } = result;
  return new Response(JSON.stringify(body), { status, headers });
}

/**
 * Resolve an anonymous request to an asset path, or null to refuse it.
 * Returns a path only for the shell; never for corpus content.
 *
 * The path is passed through unchanged rather than rewritten. The static asset
 * server canonicalises `/index.html` to `/` itself, so rewriting `/` to
 * `/index.html` here makes the two redirect to each other forever.
 */
function publicShellAsset(pathname) {
  if (pathname.includes("/vault/") || pathname.startsWith("/vault")) return null;
  if (PUBLIC_SHELL_ASSETS.has(pathname)) return pathname;
  if (PUBLIC_MODULE_PATH.test(pathname)) return pathname;
  return null;
}

function assetRequest(request, pathname) {
  const url = new URL(request.url);
  url.pathname = pathname;
  url.search = "";
  return new Request(url, request);
}

async function serveAsset(request, env, pathname) {
  const result = await env.ASSETS.fetch(assetRequest(request, pathname));
  if (result.status === 404) return responseJson({ error: "not-found" }, 404);
  return result;
}

async function readReviews(env, subject) {
  const result = await env.LEARNER_STATE.prepare(
    "SELECT card_id, reviewed_at, rating, stability, difficulty FROM vaultmaze_reviews WHERE subject_hash = ? ORDER BY card_id",
  ).bind(subject).all();
  return result.results.map((row) => ({
    cardId: row.card_id,
    reviewedAt: row.reviewed_at,
    rating: row.rating,
    stability: row.stability,
    difficulty: row.difficulty,
  }));
}

async function writeReview(request, env, subject) {
  let offered;
  try { offered = await request.json(); } catch { return responseJson({ error: "invalid-json" }, 400); }
  const valid = typeof offered.cardId === "string" && offered.cardId.length > 0
    && Number.isSafeInteger(offered.reviewedAt) && offered.reviewedAt > 0
    && Number.isInteger(offered.rating) && offered.rating >= 1 && offered.rating <= 4
    && Number.isFinite(offered.stability) && offered.stability >= 0
    && Number.isFinite(offered.difficulty) && offered.difficulty >= 0;
  if (!valid) return responseJson({ error: "invalid-review" }, 400);
  await env.LEARNER_STATE.prepare(`
    INSERT INTO vaultmaze_reviews (subject_hash, card_id, reviewed_at, rating, stability, difficulty)
    VALUES (?, ?, ?, ?, ?, ?)
    ON CONFLICT (subject_hash, card_id) DO UPDATE SET
      reviewed_at = excluded.reviewed_at,
      rating = excluded.rating,
      stability = excluded.stability,
      difficulty = excluded.difficulty
  `).bind(subject, offered.cardId, offered.reviewedAt, offered.rating, offered.stability, offered.difficulty).run();
  return responseJson({ stored: true }, 201);
}

async function mayAuthor(session) {
  return session?.provider === "google"
    && typeof session.email === "string"
    && session.email.trim().toLowerCase() === LSPACE_AUTHOR_EMAIL;
}

function authoringBinding(env) {
  const offered = env?.VAULTMAZE_AUTHORING;
  return offered && typeof offered.read === "function" && typeof offered.search === "function"
    && typeof offered.replace === "function" ? offered : null;
}

export async function authoringResponse(request, env, url, session) {
  if (!url.pathname.startsWith("/api/v1/vaultmaze/editor/")) return null;
  if (!(await mayAuthor(session))) return responseJson({ error: "authoring-authority-required" }, 403);
  const authoring = authoringBinding(env);
  if (authoring === null) return responseJson({ error: "authoring-unavailable" }, 503);
  try {
    if (url.pathname === "/api/v1/vaultmaze/editor/search" && request.method === "GET") {
      const query = url.searchParams.get("q") ?? "";
      return responseJson({ documents: await authoring.search(query, { limit: 100 }) });
    }
    if (url.pathname === "/api/v1/vaultmaze/editor/note" && request.method === "GET") {
      const path = url.searchParams.get("path");
      if (typeof path !== "string" || path === "") return responseJson({ error: "invalid-note-path" }, 400);
      const document = await authoring.read(path);
      const editorDocument = typeof authoring.editorDocument === "function"
        ? await authoring.editorDocument(path)
        : null;
      return responseJson({ document, ...(editorDocument === null ? {} : { editorDocument }) });
    }
    if (url.pathname === "/api/v1/vaultmaze/editor/action" && request.method === "POST") {
      if (request.headers.get("origin") !== url.origin) return responseJson({ error: "authoring-origin-required" }, 403);
      let offered;
      try { offered = await request.json(); } catch { return responseJson({ error: "invalid-json" }, 400); }
      if (offered?.action !== "vaultmaze:replace-document/v1" || typeof offered.path !== "string"
        || typeof offered.markdown !== "string" || typeof offered.revision !== "string") {
        return responseJson({ error: "invalid-authoring-action" }, 400);
      }
      const receipt = await authoring.replace({
        path: offered.path,
        markdown: offered.markdown,
        expectedRevision: offered.revision,
      });
      return responseJson({ receipt }, 200);
    }
    return responseJson({ error: "not-found" }, 404);
  } catch (error) {
    if (error?.name === "MarkdownFileRevisionConflict") {
      return responseJson({ error: "revision-conflict", currentRevision: error.currentRevision }, 409);
    }
    if (error instanceof RangeError) return responseJson({ error: "note-not-admitted" }, 404);
    if (error instanceof TypeError) return responseJson({ error: "invalid-authoring-request" }, 400);
    throw error;
  }
}

/**
 * Routes served without an identity. Each one either returns fixed metadata,
 * carries a login, or addresses the `/vault/public/` tree, which the release
 * builder fills only with rooms whose own frontmatter opted in.
 */
async function anonymousResponse(request, env, url) {
  if (url.pathname === "/healthz") return responseJson({ status: "ok" });

  if (url.pathname === DISCORD_INTERACTION_PATH && request.method === "POST") return acceptDiscordInteraction(request, env);
  if (url.pathname === DISCORD_GATEWAY_COMMAND_PATH && request.method === "POST") return acceptDiscordGatewayCommand(request, env);
  if (url.pathname === DISCORD_COMMAND_CHALLENGE_PATH && request.method === "POST") {
    let body;
    try { body = await request.json(); } catch { return responseJson({ error: "invalid-json" }, 400); }
    if (body?.action === "create") return authResponse(await createDiscordCommandChallenge(request, env));
    if (body?.action === "poll") return authResponse(await pollDiscordCommandChallenge(request, env, body.challenge));
    return responseJson({ error: "invalid-discord-command-challenge-request" }, 400);
  }
  // Keep an accidental browser navigation explicit (and distinguish it from an
  // unknown API route) without allowing a challenge to be read or created.
  if (url.pathname === DISCORD_COMMAND_CHALLENGE_PATH) return responseJson({ error: "method-not-allowed" }, 405);

  if (url.pathname === LOGIN_PATH) return authResponse(await beginLogin(request, env, url));
  if (url.pathname === CALLBACK_PATH) return authResponse(await completeLogin(request, env, url));
  if (url.pathname === DISCORD_LOGIN_PATH) return authResponse(await beginDiscordLogin(request, env, url));
  if (url.pathname === DISCORD_CALLBACK_PATH) return authResponse(await completeDiscordLogin(request, env, url));
  if (url.pathname === LOGOUT_PATH) {
    const google = logoutGoogle();
    const discord = await logoutDiscord(request, env);
    return authResponse({ ...discord, cookies: [...google.cookies, ...discord.cookies] });
  }

  if (request.method !== "GET" && request.method !== "HEAD") return null;

  if (url.pathname === "/api/v1/surface") {
    return serveAsset(request, env, "/vault/public/surface.json");
  }
  if (url.pathname === "/api/v1/public/index") {
    return serveAsset(request, env, "/vault/public/index.json");
  }
  const publicRoom = url.pathname.match(/^\/api\/v1\/public\/rooms\/([a-f0-9]{64})$/u);
  if (publicRoom && CONTENT_ADDRESS.test(publicRoom[1])) {
    return serveAsset(request, env, `/vault/public/rooms/${publicRoom[1]}.json`);
  }
  for (const feed of ["/feed.xml", "/feed.atom", "/feed.json"]) {
    if (url.pathname === feed) return serveAsset(request, env, `/vault/public${feed}`);
  }
  const shell = publicShellAsset(url.pathname);
  if (shell) return env.ASSETS.fetch(shell === url.pathname ? request : assetRequest(request, shell));
  return null;
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    const anonymous = await anonymousResponse(request, env, url);
    if (anonymous) return anonymous;

    const googleSession = await identifyGoogle(request, env);
    const discordSession = googleSession === null
      ? (await identifyDiscordCommandSession(request, env) ?? await identifyDiscord(request, env))
      : null;
    if (discordSession?.unavailable === true) {
      return responseJson(
        { error: "authorization-temporarily-unavailable" },
        503,
        { "retry-after": String(discordSession.retryAfter) },
      );
    }
    const session = googleSession === null
      ? discordSession
      : { ...googleSession, provider: "google", label: googleSession.email };
    if (!session) {
      return responseJson(
        { error: "access-required", login: LOGIN_PATH, discordLogin: DISCORD_LOGIN_PATH },
        401,
        { "www-authenticate": `Bearer realm="l-space.561.group"` },
      );
    }

    if (url.pathname === "/api/v1/me" && request.method === "GET") {
      return responseJson({
        provider: session.provider,
        label: session.label,
        ...(session.email === undefined ? {} : { email: session.email }),
        ...((await mayAuthor(session)) ? { canAuthor: true } : {}),
      });
    }
    const authoring = await authoringResponse(request, env, url, session);
    if (authoring) return authoring;
    if (url.pathname === "/api/v1/vault/manifest" && request.method === "GET") {
      return serveAsset(request, env, "/vault/manifest.json");
    }
    if (url.pathname === "/api/v1/vault/index" && request.method === "GET") {
      return serveAsset(request, env, "/vault/index.json");
    }
    if (url.pathname === "/api/v1/vault/garden" && request.method === "GET") {
      return serveAsset(request, env, "/vault/views/garden.json");
    }
    if (url.pathname === "/api/v1/vault/halls" && request.method === "GET") {
      return serveAsset(request, env, "/vault/views/halls.json");
    }
    if (url.pathname === "/api/v1/vault/victor-release" && request.method === "GET") {
      return serveAsset(request, env, "/vault/victor-release.json");
    }
    const room = url.pathname.match(/^\/api\/v1\/vault\/rooms\/([a-f0-9]{64})$/u);
    if (room && request.method === "GET") {
      return serveAsset(request, env, `/vault/rooms/${room[1]}.json`);
    }
    if (url.pathname === "/api/v1/reviews" && request.method === "GET") {
      return responseJson({ reviews: await readReviews(env, session.subjectHash) });
    }
    if (url.pathname === "/api/v1/reviews" && request.method === "PUT") {
      return writeReview(request, env, session.subjectHash);
    }
    if (url.pathname.startsWith("/api/")) return responseJson({ error: "not-found" }, 404);
    return env.ASSETS.fetch(request);
  },

  async scheduled(_controller, env, context) {
    context.waitUntil(purgeExpiredDiscordSessions(env));
  },
};
