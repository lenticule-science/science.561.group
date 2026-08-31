// Pure content checks over public/data/glossary.json and lessons.json — no
// DOM, no build step. Board/coordinate legality is checked with the
// kernel's own coordToPoint (imported straight from its .mts source, per
// the house rule that node tests may reach the kernel directly), so "in
// range" here means exactly what the kernel would accept, not a
// reimplementation of its rules.

import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

import { coordToPoint } from "../../../../../apps/weiqi-kernel/src/board.mts";
import { TERM_PATH } from "../../../../../apps/weiqi-kernel/src/events.mts";

const here = path.dirname(fileURLToPath(import.meta.url));
const appRoot = path.resolve(here, "..");
const kernelSrcDir = path.resolve(appRoot, "../../../../apps/weiqi-kernel/src");
// TERM_PATH's "../../content/text/..." strings are two levels of "../"
// short of resolving from events.mts's own directory (src/) — they only
// land on the real glossary.terms files when resolved from the *package*
// root (apps/weiqi-kernel/), one level up from src/. That is the anchor a
// termRef is documented against, so it's the anchor used here too.
const kernelPackageRoot = path.resolve(kernelSrcDir, "..");

const glossary = JSON.parse(readFileSync(path.resolve(appRoot, "public/data/glossary.json"), "utf8"));
const lessons = JSON.parse(readFileSync(path.resolve(appRoot, "public/data/lessons.json"), "utf8"));

test("glossary.json parses to a non-empty array of terms", () => {
  assert.ok(Array.isArray(glossary));
  assert.ok(glossary.length > 0);
  for (const term of glossary) {
    assert.equal(typeof term.name, "string");
    assert.equal(typeof term.title, "string");
    assert.equal(typeof term.definition, "string");
    assert.ok(term.definition.length > 0);
    assert.ok(Array.isArray(term.related));
    assert.equal(typeof term.path, "string");
  }
});

test("glossary term names are unique", () => {
  const names = glossary.map((t) => t.name);
  assert.equal(new Set(names).size, names.length);
});

test("every glossary related name refers to a term that exists", () => {
  const names = new Set(glossary.map((t) => t.name));
  for (const term of glossary) {
    for (const rel of term.related) {
      assert.ok(names.has(rel), `"${term.name}" relates to unknown term "${rel}"`);
    }
  }
});

test("every glossary term's path resolves to a real file on disk", () => {
  for (const term of glossary) {
    // `path` is documented as section-relative in the same shape as a
    // kernel SemanticEvent's termRef — i.e. relative from a source file
    // one level under the section root's apps/*/src, same as
    // apps/weiqi-kernel/src/events.mts itself sits.
    const resolved = path.resolve(kernelPackageRoot, term.path);
    assert.ok(existsSync(resolved), `"${term.name}" path "${term.path}" does not resolve to a file`);
  }
});

test("glossary path matches the kernel's own TERM_PATH for every term the kernel annotates events with", () => {
  const byName = new Map(glossary.map((t) => [t.name, t]));
  for (const [slug, termPath] of Object.entries(TERM_PATH)) {
    const term = byName.get(slug);
    assert.ok(term, `TERM_PATH has "${slug}" but glossary.json has no such term`);
    assert.equal(term.path, termPath, `glossary path for "${slug}" does not match TERM_PATH exactly`);
  }
});

test("lessons.json parses to a non-empty array of lessons", () => {
  assert.ok(Array.isArray(lessons));
  assert.ok(lessons.length > 0);
  for (const lesson of lessons) {
    assert.equal(typeof lesson.slug, "string");
    assert.equal(typeof lesson.title, "string");
    assert.equal(typeof lesson.audience, "string");
    assert.equal(typeof lesson.goal, "string");
    assert.ok(Array.isArray(lesson.steps));
    assert.ok(lesson.steps.length > 0);
    assert.equal(typeof lesson.next, "string");
  }
});

test("lesson slugs are unique and every lesson's next points at a real lesson", () => {
  const slugs = new Set(lessons.map((l) => l.slug));
  assert.equal(slugs.size, lessons.length);
  for (const lesson of lessons) {
    assert.ok(slugs.has(lesson.next), `"${lesson.slug}".next ("${lesson.next}") is not a known lesson slug`);
  }
});

test("every step has a recognized kind with the fields that kind requires", () => {
  for (const lesson of lessons) {
    for (const [i, step] of lesson.steps.entries()) {
      const where = `${lesson.slug}[${i}]`;
      assert.ok(["read", "board", "exercise"].includes(step.kind), `${where} has unknown kind "${step.kind}"`);
      assert.equal(typeof step.text, "string", `${where} is missing step.text`);
      if (step.kind === "board") {
        assert.ok(step.board && typeof step.board === "object", `${where} (board) is missing step.board`);
      }
      if (step.kind === "exercise") {
        assert.ok(step.exercise && typeof step.exercise === "object", `${where} (exercise) is missing step.exercise`);
        assert.equal(typeof step.exercise.prompt, "string", `${where} exercise is missing prompt`);
        assert.equal(typeof step.exercise.answerText, "string", `${where} exercise is missing answerText`);
      }
    }
  }
});

/** Every {size, stones, markers?, sequence?} board object found in lessons.json, tagged with where it came from. */
function collectBoards() {
  const boards = [];
  for (const lesson of lessons) {
    for (const [i, step] of lesson.steps.entries()) {
      const where = `${lesson.slug}[${i}]`;
      if (step.kind === "board") boards.push({ where, board: step.board });
      if (step.kind === "exercise" && step.exercise.board) boards.push({ where: `${where}.exercise`, board: step.exercise.board });
    }
  }
  return boards;
}

test("every board position's stones are in range and don't overlap", () => {
  const boards = collectBoards();
  assert.ok(boards.length > 0, "expected at least one board position across the lessons");
  for (const { where, board } of boards) {
    assert.equal(typeof board.size, "number", `${where} board is missing size`);
    const stones = board.stones ?? [];
    const seen = new Set();
    for (const stone of stones) {
      assert.ok(["black", "white"].includes(stone.color), `${where} stone at ${stone.pt} has invalid color "${stone.color}"`);
      assert.doesNotThrow(
        () => coordToPoint(board.size, board.size, stone.pt),
        `${where} stone "${stone.pt}" is out of range for a ${board.size}x${board.size} board`,
      );
      assert.ok(!seen.has(stone.pt), `${where} has two stones on ${stone.pt}`);
      seen.add(stone.pt);
    }
  }
});

test("every board marker's point is in range", () => {
  for (const { where, board } of collectBoards()) {
    for (const marker of board.markers ?? []) {
      assert.doesNotThrow(
        () => coordToPoint(board.size, board.size, marker.pt),
        `${where} marker "${marker.pt}" is out of range for a ${board.size}x${board.size} board`,
      );
    }
  }
});

test("every board sequence move is in range (or the literal \"pass\")", () => {
  for (const { where, board } of collectBoards()) {
    for (const entry of board.sequence ?? []) {
      if (entry.move === "pass") continue;
      assert.doesNotThrow(
        () => coordToPoint(board.size, board.size, entry.move),
        `${where} sequence move "${entry.move}" is out of range for a ${board.size}x${board.size} board`,
      );
    }
  }
});

test("every exercise accept move is in range", () => {
  for (const lesson of lessons) {
    for (const [i, step] of lesson.steps.entries()) {
      if (step.kind !== "exercise") continue;
      const ex = step.exercise;
      if (!Array.isArray(ex.accept)) continue;
      const size = ex.board?.size;
      assert.equal(typeof size, "number", `${lesson.slug}[${i}] exercise has accept moves but no board.size`);
      for (const move of ex.accept) {
        assert.doesNotThrow(
          () => coordToPoint(size, size, move),
          `${lesson.slug}[${i}] accept move "${move}" is out of range for a ${size}x${size} board`,
        );
      }
    }
  }
});
