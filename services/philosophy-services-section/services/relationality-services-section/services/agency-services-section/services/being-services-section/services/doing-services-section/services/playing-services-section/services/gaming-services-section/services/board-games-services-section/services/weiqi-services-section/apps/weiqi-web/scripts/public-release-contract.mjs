import { createHash } from "node:crypto";

import {
  createPublicRelease,
  createWebReleaseManifest,
} from "@red-cup-engineering/web-release-candidate-service";

export const WEIQI_ORIGIN = "https://weiqi.561.group/";

export const WEIQI_PUBLIC_PROBES = Object.freeze([
  Object.freeze({ id: "browser-engine", method: "GET", path: "/js/kernel/index.mjs", expectedStatus: 200, artifactPath: "js/kernel/index.mjs" }),
  Object.freeze({ id: "home", method: "GET", path: "/", expectedStatus: 200, artifactPath: "index.html" }),
  Object.freeze({ id: "play", method: "GET", path: "/play.html", expectedStatus: 200, artifactPath: "play.html" }),
  Object.freeze({ id: "study-client", method: "GET", path: "/js/review-app.mjs", expectedStatus: 200, artifactPath: "js/review-app.mjs" }),
  Object.freeze({ id: "study-replay", method: "GET", path: "/review.html", expectedStatus: 200, artifactPath: "review.html" }),
]);

export function releaseDigest(value) {
  return `ni:///sha-256;${createHash("sha256").update(value).digest("base64url")}`;
}

/**
 * Bind the exact static artifact set to the Cloudflare receiver contract.
 * Provider I/O is deliberately outside this pure release construction.
 */
export function createWeiqiPublicRelease({ artifacts, repository, revision, wrangler, baselineVersion }) {
  const manifest = createWebReleaseManifest({
    artifacts,
    baseUrl: WEIQI_ORIGIN,
    profile: "production",
    metadata: { application: "weiqi-web", delivery: "cloudflare-workers-static-assets" },
  });
  const configuration = JSON.stringify(wrangler);
  const binding = JSON.stringify({ assets: wrangler.assets, routes: wrangler.routes });
  const routes = JSON.stringify(wrangler.routes);
  return createPublicRelease({
    source: { repository, revision, build: { command: ["npm", "run", "build"], outputRoot: "public" } },
    artifact: { manifest },
    channel: { canonicalOrigin: WEIQI_ORIGIN, stateClass: "edge-static", probes: WEIQI_PUBLIC_PROBES },
    target: {
      provider: "cloudflare-workers",
      receiver: `worker:${wrangler.name}`,
      configDigest: releaseDigest(configuration),
      bindingDigest: releaseDigest(binding),
    },
    snapshot: { providerVersion: baselineVersion, routeDigest: releaseDigest(routes) },
  });
}
