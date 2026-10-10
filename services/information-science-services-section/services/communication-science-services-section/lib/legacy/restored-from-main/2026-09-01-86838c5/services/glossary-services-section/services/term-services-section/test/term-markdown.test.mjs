import assert from "node:assert/strict";
import test from "node:test";

import { deriveTermFilename, normalizeTermDescription, normalizeTermName, recognizeTermMarkdown, renderTermMarkdown, slugifyTermName } from "../src/term-markdown.mjs";
import { invokeTermMarkdownOperation } from "../scripts/term-markdown.mjs";

test("keeps the human primary handle distinct from its derived filename", () => {
  assert.equal(normalizeTermName("  Computer   File "), "Computer File");
  assert.equal(slugifyTermName("Computer File"), "computer-file");
  assert.equal(deriveTermFilename("Computer File"), "computer-file.md");
});

test("admits one definition sentence and one portable context sentence", () => {
  assert.equal(normalizeTermDescription("A computer file is a named sequence of data. The term is used in digital information environments."), "A computer file is a named sequence of data. The term is used in digital information environments.");
  assert.throws(() => normalizeTermDescription("Only one sentence."), /exactly two complete sentences/);
  assert.throws(() => normalizeTermDescription("One. Two. Three."), /exactly two complete sentences/);
});

test("renders and recognizes a defined term with aliases", () => {
  const text = renderTermMarkdown({
    name: "computer file",
    aliases: ["file", "digital file"],
    description: "A computer file is a named sequence of data. The term is used in filesystems and other digital information environments."
  });
  const result = recognizeTermMarkdown({ text, filename: "computer-file.md" });
  assert.equal(result.type, "DefinedTerm");
  assert.deepEqual(result.aliases, ["file", "digital file"]);
});

test("keeps an undefined term existent and reports a bad description without inventing a title", () => {
  const result = recognizeTermMarkdown({ text: '---\nname: "physical file"\ndescription: "A single sentence."\n---\n', filename: "physical-file.md" });
  assert.equal(result.type, "Term");
  assert.equal(result.defined, false);
  assert.deepEqual(result.findings.map(({ rule }) => rule), ["description"]);
});

test("exposes the same grammar through named JSON operations", () => {
  assert.equal(invokeTermMarkdownOperation("derive-term-filename", { name: "computer file" }), "computer-file.md");
  assert.equal(invokeTermMarkdownOperation("recognize-term-markdown", { text: '---\nname: "term"\n---\n', filename: "term.md" }).type, "Term");
});
