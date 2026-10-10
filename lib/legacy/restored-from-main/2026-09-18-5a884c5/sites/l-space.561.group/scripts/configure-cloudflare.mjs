import { readFile, writeFile } from "node:fs/promises";
import { resolve } from "node:path";

const databaseId = process.env.LENTICULE_SCIENCE_D1_DATABASE_ID;
if (!databaseId) throw new Error("LENTICULE_SCIENCE_D1_DATABASE_ID is required");
const root = resolve(import.meta.dirname, "..", "lib", "cloudflare");
const template = await readFile(resolve(root, "wrangler.template.jsonc"), "utf8");
await writeFile(
  resolve(root, "wrangler.generated.jsonc"),
  template.replace("__LENTICULE_SCIENCE_D1_DATABASE_ID__", databaseId),
  { mode: 0o600 },
);
