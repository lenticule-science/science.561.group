// Pure geometry helpers exported from ui/board.mjs — no DOM involved, so
// these run directly under node:test. board.mjs itself keeps all DOM
// access inside createBoard(), which this file never calls.

import { test } from "node:test";
import assert from "node:assert/strict";
import {
  MIN_SIZE,
  MAX_SIZE,
  columnLetter,
  columnLetters,
  parsePoint,
  formatPoint,
  pointToCell,
  cellToPoint,
  starPoints,
} from "../public/js/ui/board.mjs";

test("columnLetter skips I, per the kernel's own alphabet", () => {
  assert.equal(columnLetter(0), "A");
  assert.equal(columnLetter(7), "H");
  assert.equal(columnLetter(8), "J"); // I is skipped
  assert.equal(columnLetter(18), "T"); // 19th letter, A..T minus I
});

test("columnLetter rejects out-of-range indices", () => {
  assert.throws(() => columnLetter(-1));
  assert.throws(() => columnLetter(19));
});

test("columnLetters returns exactly `size` letters, left to right", () => {
  assert.deepEqual(columnLetters(9), ["A", "B", "C", "D", "E", "F", "G", "H", "J"]);
  assert.equal(columnLetters(19).length, 19);
  assert.equal(columnLetters(19).at(-1), "T");
});

test("parsePoint reads the kernel's row-1-at-top numbering verbatim", () => {
  assert.deepEqual(parsePoint("C3"), { col: 2, row: 3 });
  assert.deepEqual(parsePoint("a1"), { col: 0, row: 1 }); // case-insensitive
  assert.deepEqual(parsePoint(" T19 "), { col: 18, row: 19 }); // tolerates whitespace
});

test("parsePoint rejects malformed or I-containing coordinates", () => {
  assert.throws(() => parsePoint("I3"));
  assert.throws(() => parsePoint("33"));
  assert.throws(() => parsePoint("C"));
  assert.throws(() => parsePoint("C0"));
});

test("formatPoint is the inverse of parsePoint", () => {
  assert.equal(formatPoint(2, 3), "C3");
  assert.equal(formatPoint(0, 1), "A1");
  assert.equal(formatPoint(18, 19), "T19");
});

test("pointToCell flips the vertical axis: kernel row 1 draws at the bottom", () => {
  // 9x9: kernel row 1 (top, per the kernel) must draw at rowFromTop = 8
  // (the bottom row of the SVG), and kernel row 9 (bottom, per the
  // kernel) must draw at rowFromTop = 0 (the top row of the SVG) — this is
  // exactly the row-1-at-top -> row-1-at-bottom display conversion the
  // contract calls for.
  assert.deepEqual(pointToCell("A1", 9), { col: 0, rowFromTop: 8 });
  assert.deepEqual(pointToCell("A9", 9), { col: 0, rowFromTop: 0 });
  // A middle row is its own mirror only at the true center.
  assert.deepEqual(pointToCell("E5", 9), { col: 4, rowFromTop: 4 });
});

test("pointToCell rejects points outside the given board size", () => {
  assert.throws(() => pointToCell("K1", 9)); // column K is the 10th column; a 9-wide board has none
  assert.throws(() => pointToCell("A10", 9)); // row out of range
});

test("cellToPoint is the exact inverse of pointToCell", () => {
  for (const size of [5, 9, 13, 19]) {
    for (let col = 0; col < size; col++) {
      for (let rowFromTop = 0; rowFromTop < size; rowFromTop++) {
        const pt = cellToPoint(col, rowFromTop, size);
        assert.deepEqual(pointToCell(pt, size), { col, rowFromTop });
      }
    }
  }
});

test("cellToPoint rejects out-of-range cells", () => {
  assert.throws(() => cellToPoint(-1, 0, 9));
  assert.throws(() => cellToPoint(9, 0, 9));
  assert.throws(() => cellToPoint(0, -1, 9));
  assert.throws(() => cellToPoint(0, 9, 9));
});

test("starPoints(9) is the doctrine's four 3-3 points plus tengen (regression-positions.md#R13)", () => {
  const pts = starPoints(9);
  assert.deepEqual(new Set(pts), new Set(["C3", "G3", "C7", "G7", "E5"]));
  assert.equal(pts.length, 5);
});

test("starPoints(13) is the standard four corner points plus tengen", () => {
  const pts = starPoints(13);
  assert.deepEqual(new Set(pts), new Set(["D4", "K4", "D10", "K10", "G7"]));
  assert.equal(pts.length, 5);
});

test("starPoints(19) is the standard nine hoshi (glossary/terms/hoshi.md)", () => {
  const pts = starPoints(19);
  assert.deepEqual(
    new Set(pts),
    new Set(["D4", "K4", "Q4", "D10", "K10", "Q10", "D16", "K16", "Q16"]),
  );
  assert.equal(pts.length, 9);
  assert.ok(pts.includes("K10"), "tengen sits at K10 on a 19x19 board");
});

test("starPoints is empty for sizes the hoshi doctrine doesn't cover", () => {
  for (const size of [5, 6, 7, 8, 10, 11, 12, 14, 15, 16, 17, 18]) {
    assert.deepEqual(starPoints(size), []);
  }
});

test("board size is bounded to the documented 5..19 range", () => {
  assert.equal(MIN_SIZE, 5);
  assert.equal(MAX_SIZE, 19);
  assert.throws(() => starPoints(4));
  assert.throws(() => starPoints(20));
  assert.throws(() => pointToCell("A1", 4));
});
