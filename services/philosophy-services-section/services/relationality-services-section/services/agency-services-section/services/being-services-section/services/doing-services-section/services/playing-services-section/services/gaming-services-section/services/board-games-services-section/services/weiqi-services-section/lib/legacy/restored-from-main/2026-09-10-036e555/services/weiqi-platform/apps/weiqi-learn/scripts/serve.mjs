#!/usr/bin/env node
// Zero-dependency static file server over public/, for local dev and for
// scripted checks (--once). No framework, no dependency — node:http and
// node:fs only, per this app's own no-dependency rule.

import { createServer } from "node:http";
import { createReadStream } from "node:fs";
import { stat } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import path from "node:path";

const here = path.dirname(fileURLToPath(import.meta.url));
const publicDir = path.resolve(here, "../public");
const port = Number(process.env.PORT) || 8617;
const once = process.argv.includes("--once");

const MIME_TYPES = {
  ".html": "text/html; charset=utf-8",
  ".mjs": "text/javascript; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".svg": "image/svg+xml",
  ".css": "text/css; charset=utf-8",
};

function mimeFor(filePath) {
  return MIME_TYPES[path.extname(filePath)] ?? "application/octet-stream";
}

// Resolves a request path to a file under publicDir, refusing any path that
// escapes it (no directory traversal via "..") and defaulting a directory
// request to its own index.html.
function resolveRequestedPath(requestUrl) {
  const decoded = decodeURIComponent(requestUrl.split("?")[0]);
  const relative = decoded === "/" ? "index.html" : decoded.replace(/^\/+/, "");
  const resolved = path.resolve(publicDir, relative);
  if (resolved !== publicDir && !resolved.startsWith(publicDir + path.sep)) {
    return null; // traversal attempt
  }
  return resolved;
}

async function handleRequest(req, res) {
  const resolved = resolveRequestedPath(req.url ?? "/");
  if (resolved === null) {
    res.writeHead(403, { "content-type": "text/plain; charset=utf-8" });
    res.end("Forbidden");
    return;
  }

  let filePath = resolved;
  try {
    const info = await stat(filePath);
    if (info.isDirectory()) {
      filePath = path.join(filePath, "index.html");
      await stat(filePath);
    }
  } catch {
    res.writeHead(404, { "content-type": "text/plain; charset=utf-8" });
    res.end("Not found");
    return;
  }

  res.writeHead(200, { "content-type": mimeFor(filePath) });
  createReadStream(filePath).pipe(res);
}

const server = createServer((req, res) => {
  handleRequest(req, res).catch((err) => {
    res.writeHead(500, { "content-type": "text/plain; charset=utf-8" });
    res.end(String(err));
  });
});

server.listen(port, () => {
  const url = `http://localhost:${port}/`;
  console.log(`weiqi-learn serving ${publicDir} at ${url}`);
  if (once) {
    console.log(url);
  }
});
