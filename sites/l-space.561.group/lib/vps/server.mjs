import { createServer } from "node:http";
import { mkdir, readFile } from "node:fs/promises";
import { dirname, resolve } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";
import { Readable } from "node:stream";
import { applyMigrations, createAssetFetcher, createD1Adapter, createDatabase } from "./adapter.mjs";

const here = dirname(fileURLToPath(import.meta.url));

export async function loadEnvironment(file, environment = process.env) {
  const parsed = {};
  for (const raw of (await readFile(file, "utf8")).split(/\r?\n/u)) {
    const line = raw.trim();
    if (!line || line.startsWith("#")) continue;
    const match = line.match(/^(?:export\s+)?([A-Za-z_][A-Za-z0-9_]*)\s*=\s*(.*)$/u);
    if (!match) throw new Error(`Invalid environment assignment in ${file}`);
    let value = match[2].trim();
    if ((value.startsWith('"') && value.endsWith('"')) || (value.startsWith("'") && value.endsWith("'"))) value = value.slice(1, -1);
    parsed[match[1]] = value;
  }
  return { ...parsed, ...environment };
}

function requestFromNode(request) {
  const headers = new Headers();
  for (let index = 0; index < request.rawHeaders.length; index += 2) headers.append(request.rawHeaders[index], request.rawHeaders[index + 1]);
  const forwardedProtocol = headers.get("x-forwarded-proto");
  const protocol = forwardedProtocol === "https" ? "https" : "http";
  const host = headers.get("host") ?? "127.0.0.1";
  const init = { method: request.method, headers };
  if (request.method !== "GET" && request.method !== "HEAD") {
    init.body = Readable.toWeb(request);
    init.duplex = "half";
  }
  return new Request(`${protocol}://${host}${request.url}`, init);
}

async function responseToNode(response, result) {
  result.statusCode = response.status;
  const cookies = response.headers.getSetCookie?.() ?? [];
  for (const [name, value] of response.headers) if (name.toLowerCase() !== "set-cookie") result.setHeader(name, value);
  if (cookies.length > 0) result.setHeader("set-cookie", cookies);
  if (response.body === null) return result.end();
  Readable.fromWeb(response.body).pipe(result);
}

export async function startServer({ env = process.env, port = Number(env.PORT ?? 8787), host = env.HOST ?? "127.0.0.1" } = {}) {
  const databasePath = resolve(env.LSPACE_DATABASE_PATH ?? resolve(here, "data", "l-space.sqlite"));
  const distDirectory = resolve(env.LSPACE_DIST_DIRECTORY ?? resolve(here, "..", "..", "dist"));
  await mkdir(dirname(databasePath), { recursive: true });
  const database = createDatabase(databasePath);
  await applyMigrations(database, resolve(here, "..", "cloudflare", "migrations"));
  const workerModule = env.LSPACE_WORKER_MODULE
    ? pathToFileURL(resolve(env.LSPACE_WORKER_MODULE)).href
    : new URL("../cloudflare/src/worker.mjs", import.meta.url).href;
  const { default: worker } = await import(workerModule);
  if (typeof worker?.fetch !== "function") throw new Error(`L-Space Worker module has no fetch handler: ${workerModule}`);
  const bindings = {
    ...env,
    LEARNER_STATE: createD1Adapter(database),
    ASSETS: createAssetFetcher(distDirectory),
  };
  // The immutable reading surface should recover immediately after a restart;
  // scanning the large source checkout is an editor concern. Until it finishes,
  // the Worker fails the authoring routes closed with 503 while reading stays up.
  if (typeof env.VAULTMAZE_AUTHORING_ROOT === "string" && env.VAULTMAZE_AUTHORING_ROOT.trim() !== "") {
    const authoringModule = env.LSPACE_AUTHORING_MODULE
      ? pathToFileURL(resolve(env.LSPACE_AUTHORING_MODULE)).href
      : new URL("../../dist/vps-authoring.mjs", import.meta.url).href;
    const victorRelease = readFile(resolve(distDirectory, "vault", "manifest.json"), "utf8")
      .then((source) => JSON.parse(source)?.victor ?? null)
      .catch(() => null);
    import(authoringModule)
      .then(async ({ createGeodeAuthoring }) => createGeodeAuthoring({
        root: resolve(env.VAULTMAZE_AUTHORING_ROOT),
        region: env.VAULTMAZE_AUTHORING_REGION ?? "",
        excludes: String(env.VAULTMAZE_AUTHORING_EXCLUDES ?? "legacy,triage,private,dev,test,fixtures,dist")
          .split(",").map((value) => value.trim()).filter(Boolean),
        victorRelease: await victorRelease,
      }))
      .then((authoring) => {
        bindings.GEODE_APPLICATION = authoring;
        console.info(`GEODE admitted ${authoring.snapshot.documents.length} CAIRN Markdown resources`);
      })
      .catch((error) => console.error("GEODE stayed unavailable", error instanceof Error ? error.message : "unknown error"));
  }
  const server = createServer(async (request, result) => {
    try { await responseToNode(await worker.fetch(requestFromNode(request), bindings), result); }
    catch (error) {
      console.error("L-Space request failed", error instanceof Error ? error.message : "unknown error");
      if (!result.headersSent) result.writeHead(500, { "content-type": "application/json; charset=utf-8" });
      result.end('{"error":"internal-server-error"}');
    }
  });
  await new Promise((accept, reject) => { server.once("error", reject); server.listen(port, host, accept); });
  return {
    server, database,
    async close() { await new Promise((accept) => server.close(accept)); database.close(); },
  };
}

async function main() {
  const option = process.argv.indexOf("--env-file");
  const envFile = option === -1 ? process.env.LSPACE_ENV_FILE : process.argv[option + 1];
  if (!envFile) throw new Error("Specify an environment file with --env-file or LSPACE_ENV_FILE");
  const app = await startServer({ env: await loadEnvironment(envFile) });
  const stop = async () => { await app.close(); process.exitCode = 0; };
  process.once("SIGINT", stop);
  process.once("SIGTERM", stop);
}

if (process.argv[1] === fileURLToPath(import.meta.url)) main().catch((error) => {
  console.error("L-Space could not start", error instanceof Error ? error.message : "unknown error");
  process.exitCode = 1;
});
