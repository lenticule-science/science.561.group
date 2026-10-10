import { createRemoteJWKSet, jwtVerify } from "jose";

const JSON_HEADERS = { "content-type": "application/json; charset=utf-8" };
const ACCESS_KEY_SETS = new Map();

function responseJson(value, status = 200) {
  return new Response(JSON.stringify(value), { status, headers: JSON_HEADERS });
}

function accessKeySet(env) {
  const url = env.ACCESS_CERTS_URL
    ?? `${env.ACCESS_TEAM_DOMAIN.replace(/\/$/, "")}/cdn-cgi/access/certs`;
  if (!ACCESS_KEY_SETS.has(url)) ACCESS_KEY_SETS.set(url, createRemoteJWKSet(new URL(url)));
  return ACCESS_KEY_SETS.get(url);
}

async function identityFrom(request, env, context) {
  if (context.access) return context.access.getIdentity();
  const token = request.headers.get("cf-access-jwt-assertion");
  if (!token || !env.ACCESS_TEAM_DOMAIN || !env.ACCESS_AUD) return null;
  try {
    const { payload } = await jwtVerify(token, accessKeySet(env), {
      algorithms: ["RS256"],
      issuer: env.ACCESS_TEAM_DOMAIN.replace(/\/$/, ""),
      audience: env.ACCESS_AUD,
    });
    return payload;
  } catch (error) {
    console.warn("Cloudflare Access JWT verification failed", error?.code ?? error?.message ?? "unknown-error");
    return null;
  }
}

async function subjectHash(identity) {
  const subject = identity.user_uuid ?? identity.id ?? identity.email;
  const bytes = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(subject));
  return [...new Uint8Array(bytes)].map((value) => value.toString(16).padStart(2, "0")).join("");
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

export default {
  async fetch(request, env, context) {
    const url = new URL(request.url);
    if (url.pathname === "/healthz") return responseJson({ status: "ok" });
    const identity = await identityFrom(request, env, context);
    if (!identity?.email) return responseJson({ error: "access-required" }, 401);
    if (url.pathname === "/api/v1/me" && request.method === "GET") {
      return responseJson({ email: identity.email, groups: identity.groups ?? [] });
    }
    if (url.pathname === "/api/v1/vault/manifest" && request.method === "GET") {
      return serveAsset(request, env, "/vault/manifest.json");
    }
    if (url.pathname === "/api/v1/vault/index" && request.method === "GET") {
      return serveAsset(request, env, "/vault/index.json");
    }
    if (url.pathname === "/api/v1/vault/garden" && request.method === "GET") {
      return serveAsset(request, env, "/vault/views/garden.json");
    }
    const room = url.pathname.match(/^\/api\/v1\/vault\/rooms\/([a-f0-9]{64})$/);
    if (room && request.method === "GET") {
      return serveAsset(request, env, `/vault/rooms/${room[1]}.json`);
    }
    const subject = await subjectHash(identity);
    if (url.pathname === "/api/v1/reviews" && request.method === "GET") {
      return responseJson({ reviews: await readReviews(env, subject) });
    }
    if (url.pathname === "/api/v1/reviews" && request.method === "PUT") {
      return writeReview(request, env, subject);
    }
    if (url.pathname.startsWith("/api/")) return responseJson({ error: "not-found" }, 404);
    return env.ASSETS.fetch(request);
  },
};
