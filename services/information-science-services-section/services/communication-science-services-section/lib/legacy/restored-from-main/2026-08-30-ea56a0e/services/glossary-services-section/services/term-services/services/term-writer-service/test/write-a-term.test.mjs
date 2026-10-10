import assert from "node:assert/strict";
import { mkdtemp, readFile, rm } from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";

import { renderTermMarkdown, slugifyTermName, writeTermFile } from "../scripts/write-a-term.mjs";

test("slugifies a human term name into one safe filename component", () => {
  assert.equal(slugifyTermName("Glass Sponge & Shrimp"), "glass-sponge-and-shrimp");
  assert.throws(() => slugifyTermName("---"), /non-empty filename slug/);
});

test("renders canonical term frontmatter and preserves multiline description text", () => {
  const markdown = renderTermMarkdown({
    name: "FOAM",
    description: "FOAM is the Field of Articulating Models.\nFOAM accompanies MUD.",
    author: "Codex@example",
    slug: "foam",
    dateCreated: "2026-08-12"
  });

  assert.match(markdown, /^---\nauthors:\n  - Codex@example\ndate-created: 2026-08-12\ndefines:\n  - foam\n/);
  assert.match(markdown, /slug: foam\ntitle: FOAM\ntype: term\n---\nFOAM is the Field of Articulating Models\.\nFOAM accompanies MUD\.\n$/);
});

test("writes without overwriting and replaces only when force is explicit", async () => {
  const directory = await mkdtemp(join(tmpdir(), "write-a-term-"));
  const common = {
    outputDirectory: directory,
    name: "SEA",
    description: "SEA is the Semantics Energy Arena.",
    author: "Codex@example",
    dateCreated: "2026-08-12"
  };

  try {
    const outputPath = await writeTermFile(common);
    assert.equal(outputPath, join(directory, "sea.md"));
    await assert.rejects(writeTermFile(common), /already exists/);
    await writeTermFile({ ...common, description: "SEA is revised.", force: true });
    assert.match(await readFile(outputPath, "utf8"), /SEA is revised\./);
  } finally {
    await rm(directory, { recursive: true, force: true });
  }
});
