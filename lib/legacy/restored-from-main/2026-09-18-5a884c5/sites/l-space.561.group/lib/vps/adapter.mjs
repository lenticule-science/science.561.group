import { readFile, stat } from "node:fs/promises";
import { basename, extname, relative, resolve, sep } from "node:path";
import { DatabaseSync } from "node:sqlite";

const MIME_TYPES = new Map([
  [".css", "text/css; charset=utf-8"],
  [".html", "text/html; charset=utf-8"],
  [".ico", "image/x-icon"],
  [".js", "text/javascript; charset=utf-8"],
  [".json", "application/json; charset=utf-8"],
  [".mjs", "text/javascript; charset=utf-8"],
  [".svg", "image/svg+xml"],
  [".txt", "text/plain; charset=utf-8"],
  [".xml", "application/xml; charset=utf-8"],
]);

/** The subset of the D1 API used by the L-Space Worker, backed by node:sqlite. */
export function createD1Adapter(database) {
  const ordinaryRow = (row) => row === undefined ? null : { ...row };
  return Object.freeze({
    prepare(sql) {
      let values = [];
      return {
        bind(...bound) { values = bound; return this; },
        async first() {
          return ordinaryRow(database.prepare(sql).get(...values));
        },
        async all() {
          return { success: true, results: database.prepare(sql).all(...values).map(ordinaryRow), meta: {} };
        },
        async run() {
          const result = database.prepare(sql).run(...values);
          return {
            success: true,
            meta: { changes: Number(result.changes ?? 0), last_row_id: Number(result.lastInsertRowid ?? 0) },
          };
        },
      };
    },
    async batch(statements) {
      database.exec("BEGIN IMMEDIATE");
      try {
        const results = [];
        for (const statement of statements) results.push(await statement.run());
        database.exec("COMMIT");
        return results;
      } catch (error) {
        database.exec("ROLLBACK");
        throw error;
      }
    },
  });
}

export async function applyMigrations(database, migrationsDirectory) {
  database.exec(`
    CREATE TABLE IF NOT EXISTS l_space_vps_migrations (
      name TEXT PRIMARY KEY,
      applied_at INTEGER NOT NULL
    )
  `);
  const { readdir } = await import("node:fs/promises");
  const migrations = (await readdir(migrationsDirectory))
    .filter((name) => /^\d+_.+\.sql$/u.test(name))
    .sort();
  for (const name of migrations) {
    const alreadyApplied = database.prepare("SELECT 1 FROM l_space_vps_migrations WHERE name = ?").get(name);
    if (alreadyApplied) continue;
    const sql = await readFile(resolve(migrationsDirectory, name), "utf8");
    database.exec("BEGIN IMMEDIATE");
    try {
      database.exec(sql);
      database.prepare("INSERT INTO l_space_vps_migrations (name, applied_at) VALUES (?, ?)")
        .run(name, Math.floor(Date.now() / 1000));
      database.exec("COMMIT");
    } catch (error) {
      database.exec("ROLLBACK");
      throw new Error(`Could not apply L-Space migration ${name}`, { cause: error });
    }
  }
}

function pathForAsset(root, pathname) {
  let decoded;
  try { decoded = decodeURIComponent(pathname); } catch { return null; }
  if (decoded.includes("\0")) return null;
  const candidate = resolve(root, `.${decoded === "/" ? "/index.html" : decoded}`);
  const containment = relative(root, candidate);
  return containment === "" || (!containment.startsWith(`..${sep}`) && containment !== "..") ? candidate : null;
}

async function readableAsset(path, request) {
  try {
    const info = await stat(path);
    if (!info.isFile()) return null;
    const headers = new Headers({
      "content-type": MIME_TYPES.get(extname(path).toLowerCase()) ?? "application/octet-stream",
      "content-length": String(info.size),
    });
    return new Response(request.method === "HEAD" ? null : await readFile(path), { headers });
  } catch (error) {
    if (error?.code === "ENOENT") return null;
    throw error;
  }
}

/** Create the Workers Assets binding from the release's immutable dist directory. */
export function createAssetFetcher(distDirectory) {
  const root = resolve(distDirectory);
  return Object.freeze({
    async fetch(request) {
      const url = new URL(request.url);
      if (request.method !== "GET" && request.method !== "HEAD") return new Response(null, { status: 405 });
      const assetPath = pathForAsset(root, url.pathname);
      const direct = assetPath === null ? null : await readableAsset(assetPath, request);
      if (direct !== null) return direct;
      // This is Cloudflare Assets' SPA not-found behavior. The Worker has
      // already decided whether this request is public or authenticated.
      const fallback = await readableAsset(resolve(root, "index.html"), request);
      return fallback ?? new Response("Not found", { status: 404 });
    },
  });
}

export function createDatabase(databasePath) {
  const database = new DatabaseSync(databasePath);
  database.exec("PRAGMA journal_mode = WAL; PRAGMA foreign_keys = ON;");
  return database;
}
