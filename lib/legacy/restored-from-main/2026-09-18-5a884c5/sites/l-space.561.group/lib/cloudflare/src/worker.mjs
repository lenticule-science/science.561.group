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
import { handleGeodeVocabularyRequest, ownsGeodeVocabularyRequest } from "@red-cup-engineering/geode/vocabulary";

const JSON_HEADERS = { "content-type": "application/json; charset=utf-8" };
export const LSPACE_AUTHOR_EMAIL = "morgan.sennhauser@gmail.com";

/**
 * The anonymous surface is an allowlist of exact shell paths, never a prefix
 * (a prefix would let `/vault/`'s authenticated rooms leak); public rooms
 * instead live under their own validated-content-address `/vault/public/`
 * tree. `/ns/` is the one deliberate exception: dereferenceable term and
 * predicate IRIs are public by doctrine (D5), served read-only over GEODE.
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

export async function applicationSurfaceForSession(session) {
  return Object.freeze({
    schemaVersion: "l-space-application-surface/v1",
    application: (await mayAuthor(session)) ? "geode" : "vaultmaze",
  });
}

function authoringBinding(env) {
  const offered = env?.GEODE_APPLICATION ?? env?.VAULTMAZE_AUTHORING;
  return offered && typeof offered.read === "function" && typeof offered.search === "function"
    && typeof offered.replace === "function" ? offered : null;
}

const DREW_READ_TOOLS = new Set(["drew_catalog", "drew_relations", "drew_entity", "drew_project", "drew_explain", "drew_diagnostics"]);

function graphBinding(env) {
  const offered = authoringBinding(env);
  return offered && typeof offered.concept === "function" && typeof offered.callGraphTool === "function" && typeof offered.sparql === "function"
    ? offered : null;
}

function feltosBinding(env) {
  const offered = graphBinding(env);
  return offered && typeof offered.feltosSummary === "function" && typeof offered.feltosRelations === "function"
    && typeof offered.feltosEntity === "function" && typeof offered.feltosDiagnostics === "function" ? offered : null;
}

function sparqlTerm(value) {
  return typeof value === "string" && /^\?[A-Za-z][A-Za-z0-9_]*$/u.test(value)
    ? Object.freeze({ kind: "knowing.sparql.variable", name: value.slice(1) })
    : value;
}

function sparqlPatterns(values) {
  if (!Array.isArray(values) || values.length < 1 || values.length > 4) throw new TypeError("where and construct must contain from one through four triple patterns");
  return Object.freeze(values.map((pattern) => {
    if (!pattern || typeof pattern !== "object" || Array.isArray(pattern) || !("s" in pattern) || !("p" in pattern) || !("o" in pattern)) {
      throw new TypeError("each triple pattern requires s, p, and o");
    }
    return Object.freeze({ s: sparqlTerm(pattern.s), p: sparqlTerm(pattern.p), o: sparqlTerm(pattern.o) });
  }));
}

async function jsonObject(request) {
  let value;
  try { value = await request.json(); } catch { throw new TypeError("request body must be JSON"); }
  if (!value || typeof value !== "object" || Array.isArray(value)) throw new TypeError("request body must be a JSON object");
  return value;
}

export async function graphResponse(request, env, url) {
  const graphPath = url.pathname.startsWith("/api/v1/graph/") && url.pathname !== "/api/v1/graph/fae";
  const feltosPath = url.pathname === "/api/feltos";
  if (!graphPath && !feltosPath) return null;
  try {
    if (feltosPath) {
      if (request.method !== "POST") return responseJson({ error: "method-not-allowed" }, 405);
      const feltos = feltosBinding(env);
      if (feltos === null) return responseJson({ error: "feltos-unavailable" }, 503);
      const offered = await jsonObject(request);
      if (offered.operation === "summary") return responseJson(await feltos.feltosSummary());
      if (offered.operation === "relations") {
        return responseJson(await feltos.feltosRelations(offered.pattern ?? {}, { limit: offered.limit ?? 100 }));
      }
      if (offered.operation === "entity") {
        if (typeof offered.term !== "string" || offered.term === "") return responseJson({ error: "feltos-term-required" }, 400);
        return responseJson(await feltos.feltosEntity(offered.term, { predicate: offered.predicate, direction: offered.direction ?? "both", limit: offered.limit ?? 100 }));
      }
      if (offered.operation === "diagnostics") return responseJson(await feltos.feltosDiagnostics({ limit: offered.limit ?? 100 }));
      return responseJson({ error: "unknown-feltos-operation" }, 400);
    }
    const graph = graphBinding(env);
    if (graph === null) return responseJson({ error: "graph-unavailable" }, 503);
    if (url.pathname === "/api/v1/graph/concept" && request.method === "GET") {
      const name = url.searchParams.get("name");
      if (!name) return responseJson({ error: "concept-name-required" }, 400);
      return responseJson(await graph.concept(name));
    }
    if (url.pathname === "/api/v1/graph/query" && request.method === "POST") {
      const offered = await jsonObject(request);
      if (!DREW_READ_TOOLS.has(offered.tool)) return responseJson({ error: "unknown-graph-tool" }, 400);
      const reading = await graph.callGraphTool(offered.tool, offered.arguments ?? {});
      return responseJson(reading.structuredContent);
    }
    if (url.pathname === "/api/v1/graph/sparql" && request.method === "POST") {
      const offered = await jsonObject(request);
      if (!["select", "ask", "construct"].includes(offered.type)) return responseJson({ error: "invalid-sparql-query" }, 400);
      const query = Object.freeze({
        kind: "knowing.sparql.query",
        type: offered.type,
        ...(offered.select === undefined ? {} : { select: Object.freeze([...offered.select]) }),
        where: sparqlPatterns(offered.where),
        ...(offered.construct === undefined ? {} : { construct: sparqlPatterns(offered.construct) }),
      });
      return responseJson(await graph.sparql(query, { limit: offered.limit ?? 100 }));
    }
    return responseJson({ error: "not-found" }, 404);
  } catch (error) {
    if (error instanceof TypeError || error instanceof RangeError) return responseJson({ error: "invalid-graph-request", message: error.message }, 400);
    throw error;
  }
}

export async function authoringResponse(request, env, url, session) {
  const geodePath = url.pathname.startsWith("/api/v1/geode/")
    ? url.pathname
    : url.pathname.replace(/^\/api\/v1\/vaultmaze\/editor\//u, "/api/v1/geode/");
  if (!geodePath.startsWith("/api/v1/geode/")) return null;
  if (!(await mayAuthor(session))) return responseJson({ error: "authoring-authority-required" }, 403);
  const authoring = authoringBinding(env);
  if (authoring === null) return responseJson({ error: "authoring-unavailable" }, 503);
  try {
    if (geodePath === "/api/v1/geode/search" && request.method === "GET") {
      const query = url.searchParams.get("q") ?? "";
      return responseJson({ documents: await authoring.search(query, { limit: 100 }) });
    }
    if (geodePath === "/api/v1/geode/note" && request.method === "GET") {
      const path = url.searchParams.get("path");
      if (typeof path !== "string" || path === "") return responseJson({ error: "invalid-note-path" }, 400);
      const document = await authoring.read(path);
      const editorDocument = typeof authoring.editorDocument === "function"
        ? await authoring.editorDocument(path)
        : null;
      return responseJson({ document, ...(editorDocument === null ? {} : { editorDocument }) });
    }
    if (geodePath === "/api/v1/geode/action" && request.method === "POST") {
      if (request.headers.get("origin") !== url.origin) return responseJson({ error: "authoring-origin-required" }, 403);
      let offered;
      try { offered = await request.json(); } catch { return responseJson({ error: "invalid-json" }, 400); }
      if (!["geode:replace-document/v1", "vaultmaze:replace-document/v1"].includes(offered?.action) || typeof offered.path !== "string"
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
 * `/ns/term/<identity>` and `/ns/predicate/<name>`: the public dereferenceable vocabulary
 * (doctrine D5). Read-only over the same GEODE binding `authoringResponse` writes through; a
 * missing binding (no live checkout, e.g. Cloudflare with no VPS-side GEODE_APPLICATION) answers
 * 503 rather than requiring a session for a route that must stay anonymous.
 */
export async function vocabularyResponse(request, env, url) {
  if (!ownsGeodeVocabularyRequest(request)) return null;
  return handleGeodeVocabularyRequest(request, { workspace: authoringBinding(env), baseUrl: url.origin });
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

  const vocabulary = await vocabularyResponse(request, env, url);
  if (vocabulary) return vocabulary;

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
      const surface = await applicationSurfaceForSession(session);
      return responseJson({
        provider: session.provider,
        label: session.label,
        ...(session.email === undefined ? {} : { email: session.email }),
        ...((await mayAuthor(session)) ? { canAuthor: true } : {}),
        application: surface.application,
      });
    }
    if (url.pathname === "/api/v1/application" && request.method === "GET") {
      return responseJson(await applicationSurfaceForSession(session));
    }
    const authoring = await authoringResponse(request, env, url, session);
    if (authoring) return authoring;
    const graph = await graphResponse(request, env, url);
    if (graph) return graph;
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
