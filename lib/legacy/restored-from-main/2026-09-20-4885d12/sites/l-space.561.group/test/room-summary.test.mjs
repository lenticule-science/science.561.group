import assert from "node:assert/strict";
import test from "node:test";
import { summaryOf } from "../src/room-summary.mjs";

test("release summaries use visible link labels and omit canonical fenced examples", () => {
  assert.equal(summaryOf({frontmatter: {}, body: "# Title\n~~~~mjs\n[hidden](private.md)\n~~~~\nSee [visible](note.md \"Title\") and [[Target|label]]."}), "Title See visible and label.");
});

test("release summaries preserve authored summary preference and bounded size", () => {
  assert.equal(summaryOf({frontmatter: {description: "Chosen **description**"}, body: "Other body"}), "Chosen description");
  assert.equal(summaryOf({frontmatter: {}, body: "x".repeat(300)}).length, 220);
});
