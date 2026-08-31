import { test } from "node:test";
import assert from "node:assert/strict";
import {
  parseSgfCollection,
  serializeSgfCollection,
  pointToSgfCoord,
  sgfCoordToPoint,
  gameRecordToSgf,
  sgfToGameRecord,
  type SgfGameTree,
} from "../src/sgf.mts";
import { BLACK, WHITE } from "../src/board.mts";

test("SGF coordinate encoding is 0-indexed and does NOT skip 'i' (unlike Go notation)", () => {
  assert.equal(pointToSgfCoord(19, 0), "aa");
  assert.equal(sgfCoordToPoint(19, "aa"), 0);
  // 9th column (index 8) is 'i' in SGF -- no skip.
  assert.equal(pointToSgfCoord(19, 8), "ia");
  assert.equal(sgfCoordToPoint(19, "ia"), 8);
});

test("parse a minimal real-world SGF file", () => {
  const text = "(;GM[1]FF[4]SZ[9]KM[7.5];B[cc];W[cd])";
  const trees = parseSgfCollection(text);
  assert.equal(trees.length, 1);
  assert.equal(trees[0].nodes.length, 3);
  assert.deepEqual(trees[0].nodes[0].properties.SZ, ["9"]);
  assert.deepEqual(trees[0].nodes[1].properties.B, ["cc"]);
});

test("parser handles variations (branching game trees)", () => {
  const text = "(;GM[1];B[aa](;W[bb];B[cc])(;W[dd]))";
  const trees = parseSgfCollection(text);
  assert.equal(trees[0].children.length, 2);
  assert.deepEqual(trees[0].children[0].nodes[0].properties.W, ["bb"]);
  assert.deepEqual(trees[0].children[1].nodes[0].properties.W, ["dd"]);
});

test("parser handles backslash-escaped ']' and '\\\\' inside property values", () => {
  const text = "(;C[a \\] bracket and a \\\\ backslash])";
  const trees = parseSgfCollection(text);
  assert.deepEqual(trees[0].nodes[0].properties.C, ["a ] bracket and a \\ backslash"]);
});

test("property: parse(serialize(tree)) round-trips for a variety of generated trees", () => {
  const samples: SgfGameTree[] = [
    { nodes: [{ properties: { GM: ["1"], SZ: ["19"] } }], children: [] },
    {
      nodes: [
        { properties: { GM: ["1"], FF: ["4"], SZ: ["13"], KM: ["6.5"] } },
        { properties: { B: ["cc"] } },
        { properties: { W: [""] } }, // pass
      ],
      children: [],
    },
    {
      nodes: [{ properties: { GM: ["1"] } }],
      children: [
        { nodes: [{ properties: { B: ["aa"] } }], children: [] },
        {
          nodes: [{ properties: { B: ["bb"] } }],
          children: [{ nodes: [{ properties: { W: ["cc"] } }], children: [] }],
        },
      ],
    },
    { nodes: [{ properties: { C: ["escape\\test] here"] } }], children: [] },
  ];
  for (const tree of samples) {
    const text = serializeSgfCollection([tree]);
    const [parsed] = parseSgfCollection(text);
    assert.deepEqual(parsed, tree, `round-trip mismatch for: ${text}`);
  }
});

test("gameRecordToSgf / sgfToGameRecord round-trip a linear game record", () => {
  const record = {
    size: 9 as const,
    ruleset: "chinese",
    komi: 7.5,
    handicap: ["C3", "G7"],
    moves: [
      { color: BLACK, point: 20 },
      { color: WHITE, point: 30 as number | "pass" },
      { color: BLACK, point: "pass" as const },
      { color: WHITE, point: 41 as number | "pass" },
    ],
  };
  const text = gameRecordToSgf(record);
  const back = sgfToGameRecord(text);
  assert.equal(back.size, record.size);
  assert.equal(back.ruleset, record.ruleset);
  assert.equal(back.komi, record.komi);
  assert.deepEqual(back.handicap, record.handicap);
  assert.deepEqual(back.moves, record.moves);
});

test("gameRecordToSgf omits HA/AB when there is no handicap", () => {
  const text = gameRecordToSgf({ size: 19, moves: [] });
  assert.doesNotMatch(text, /HA\[/);
  assert.doesNotMatch(text, /AB\[/);
});

test("sgfToGameRecord defaults size to 19 when SZ is absent", () => {
  const back = sgfToGameRecord("(;GM[1];B[aa])");
  assert.equal(back.size, 19);
});

test("sgfToGameRecord rejects a non-square SZ[width:height] with a clear error instead of silently returning NaN", () => {
  // SZ[width:height] is spec-legal for a non-square board, but this
  // convenience layer only reads/writes square game records (sgf.mts:9-13
  // / board.mts:1-10); Number("7:5") is NaN, which must not silently
  // propagate into size/move points.
  assert.throws(() => sgfToGameRecord("(;GM[1]FF[4]SZ[7:5];B[cc])"), /Unsupported SGF board size/);
});

test("sgfToGameRecord reads the legacy 'tt' pass token, per the SGF spec, on boards <=19x19", () => {
  // Real-world SGF files (older software, some FF3-compatible exporters)
  // encode pass as "[tt]" rather than an empty value -- "applications
  // should be able to deal with both representations" (SGF spec, Go
  // game-info page). "t" falls outside SGF_LETTERS for any size <=19, so
  // "tt" is never a real coordinate there and is unambiguous as pass.
  const nineteen = sgfToGameRecord("(;GM[1]FF[4]SZ[19]KM[6.5];B[pd];W[tt];B[dp])");
  assert.deepEqual(nineteen.moves[1], { color: WHITE, point: "pass" });

  const nine = sgfToGameRecord("(;GM[1]FF[4]SZ[9];B[cc];W[tt])");
  assert.deepEqual(nine.moves[1], { color: WHITE, point: "pass" });

  // The empty-value form this kernel itself writes still round-trips too.
  const empty = sgfToGameRecord("(;GM[1]FF[4]SZ[9];B[cc];W[])");
  assert.deepEqual(empty.moves[1], { color: WHITE, point: "pass" });
});
