// Derive the liberty Chu space of a weiqi position: points are the empty
// intersections, states are the groups, r(point, group) = t when the point is
// a liberty of the group and f otherwise. A column is a group's liberty set;
// a row with two or more t entries is a shared liberty.
// Theory status: this section's 2026-09-03 note on weiqi as arena and Chu space.
// Run with: node scripts/derive-liberty-chu-space.mts --sgf <file> [--move <n>]
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { parseArgs } from "node:util";
import { chuSpace, extension, FOUR, row } from "@lenticule-science/metrologic/chu";
import {
  BLACK,
  EMPTY,
  Game,
  coordToPoint,
  createPositionFromCells,
  findGroup,
  pointToCoord,
  sgfToGameRecord,
  type Color,
  type Group,
  type Position,
} from "../apps/weiqi-kernel/src/index.mts";

export interface BoardGroup extends Group {
  /** Stable id: colour letter + the Go coordinate of the group's lowest stone index. */
  id: string;
}

export interface LibertyChuSpace {
  size: number;
  /** Empty intersections, as Go coordinates, in board order. */
  points: string[];
  /** Group ids, in board order of each group's lowest stone. */
  states: string[];
  groups: BoardGroup[];
  space: ReturnType<typeof chuSpace>;
}

/** Enumerate the connected groups of a position, each once, in board order. */
export function boardGroups(position: Position): BoardGroup[] {
  const { board, width, height } = position;
  const seen = new Set<number>();
  const groups: BoardGroup[] = [];
  for (let p = 0; p < board.length; p += 1) {
    if (board[p] === EMPTY || seen.has(p)) continue;
    const group = findGroup(board, width, height, p);
    for (const s of group.stones) seen.add(s);
    const letter = group.color === BLACK ? "B" : "W";
    groups.push({ ...group, id: `${letter}@${pointToCoord(width, Math.min(...group.stones))}` });
  }
  return groups;
}

/** The liberty Chu space of a position: empty points x groups -> FOUR. */
export function libertyChuSpace(position: Position): LibertyChuSpace {
  const { board, width } = position;
  const groups = boardGroups(position);
  const points: string[] = [];
  const pointIndex = new Map<string, number>();
  for (let p = 0; p < board.length; p += 1) {
    if (board[p] !== EMPTY) continue;
    const coord = pointToCoord(width, p);
    points.push(coord);
    pointIndex.set(coord, p);
  }
  const byId = new Map(groups.map((g) => [g.id, g]));
  const states = groups.map((g) => g.id);
  const space = chuSpace(points, states, (point, state) => {
    const p = pointIndex.get(point);
    const g = byId.get(state);
    if (p === undefined || g === undefined) return null;
    return g.liberties.has(p) ? FOUR.T : FOUR.F;
  });
  return { size: width, points, states, groups, space };
}

/** Replay an SGF game record through the kernel and return the position after `moveIndex` moves (default: all). */
export function positionFromSgf(text: string, moveIndex?: number): { position: Position; moveIndex: number } {
  const record = sgfToGameRecord(text);
  const size = record.size;
  let initial: Position | undefined;
  if (record.handicap && record.handicap.length > 0) {
    const cells = new Array<number>(size * size).fill(EMPTY);
    for (const coord of record.handicap) cells[coordToPoint(size, size, coord)] = BLACK;
    initial = createPositionFromCells(size, size, cells, 2 as Color);
  }
  const game = new Game(size, record.ruleset ?? "chinese", initial);
  const limit = moveIndex === undefined ? record.moves.length : Math.min(moveIndex, record.moves.length);
  for (let i = 0; i < limit; i += 1) {
    const mv = record.moves[i];
    const move = mv.point === "pass" ? "pass" : pointToCoord(size, mv.point);
    const outcome = game.play(move);
    if (!outcome.ok) throw new Error(`SGF move ${i + 1} (${move}) is illegal under ${game.ruleset.name}: ${outcome.reason}`);
  }
  return { position: game.current, moveIndex: limit };
}

function isEntrypoint(metaUrl: string): boolean {
  if (!process.argv[1]) return false;
  try {
    return realpathSync(process.argv[1]) === realpathSync(fileURLToPath(metaUrl));
  } catch {
    return false;
  }
}

if (isEntrypoint(import.meta.url)) {
  const { values } = parseArgs({ options: { sgf: { type: "string" }, move: { type: "string" } } });
  if (!values.sgf) {
    console.error("usage: node scripts/derive-liberty-chu-space.mts --sgf <file> [--move <n>]");
    process.exitCode = 2;
  } else {
    const { position, moveIndex } = positionFromSgf(readFileSync(values.sgf, "utf8"), values.move === undefined ? undefined : Number(values.move));
    const derived = libertyChuSpace(position);
    const out = {
      type: "weiqi.liberty-chu-space",
      size: derived.size,
      moveIndex,
      points: derived.points.length,
      states: derived.states,
      liberties: Object.fromEntries(derived.states.map((s) => [s, extension(derived.space, s)])),
      sharedLiberties: derived.points
        .map((p) => ({ point: p, groups: row(derived.space, p).filter((c) => c.value === FOUR.T).map((c) => c.state) }))
        .filter((r) => r.groups.length >= 2),
    };
    process.stdout.write(`${JSON.stringify(out, null, 2)}\n`);
  }
}
