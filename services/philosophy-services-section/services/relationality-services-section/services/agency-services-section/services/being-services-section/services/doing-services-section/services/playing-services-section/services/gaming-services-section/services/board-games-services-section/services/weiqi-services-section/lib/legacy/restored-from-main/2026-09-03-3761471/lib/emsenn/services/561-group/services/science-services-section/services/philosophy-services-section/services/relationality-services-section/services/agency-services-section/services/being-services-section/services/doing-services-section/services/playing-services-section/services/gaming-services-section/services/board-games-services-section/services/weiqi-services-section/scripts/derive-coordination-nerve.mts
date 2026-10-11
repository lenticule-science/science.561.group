// Derive the coordination nerve of a weiqi position and read its cohomology:
// vertices are groups, one cell per pair of groups sharing an empty point,
// H^0/H^1 read combinatorially by metrologic (rank H^1 = cells - groups + components).
// Instrument for surviving candidate 1 in obsmetrologia-and-go-strategy.md;
// the number is a conjectured measure, not a result.
// Run with: node scripts/derive-coordination-nerve.mts --sgf <file> [--move <n>]
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { parseArgs } from "node:util";
import { cohomologyOfRelation } from "@lenticule-science/metrologic/obstruction/cochain";
import { FOUR, row } from "@lenticule-science/metrologic/chu";
import { libertyChuSpace, positionFromSgf, type LibertyChuSpace } from "./derive-liberty-chu-space.mts";
import type { Position } from "../apps/weiqi-kernel/src/index.mts";

export interface NerveCell {
  subject: string;
  predicate: string;
  object: string;
}

export interface CoordinationNerve {
  size: number;
  groups: number;
  groupsInNerve: number;
  sharedLiberties: string[];
  cells: NerveCell[];
  sameColorCells: number;
  oppositeColorCells: number;
  components: number;
  h1: number;
}

/** The nerve's 1-skeleton: one cell per pair of groups sharing an empty point. */
export function nerveCells(derived: LibertyChuSpace): { cells: NerveCell[]; sharedLiberties: string[] } {
  const cells: NerveCell[] = [];
  const sharedLiberties: string[] = [];
  for (const point of derived.points) {
    const served = row(derived.space, point).filter((c) => c.value === FOUR.T).map((c) => c.state);
    if (served.length < 2) continue;
    sharedLiberties.push(point);
    for (let i = 0; i < served.length; i += 1) {
      for (let j = i + 1; j < served.length; j += 1) {
        cells.push({ subject: served[i], predicate: `shares-liberty:${point}`, object: served[j] });
      }
    }
  }
  return { cells, sharedLiberties };
}

/** The coordination nerve of a position with its cohomology read off the graph. */
export function coordinationNerve(position: Position): CoordinationNerve {
  const derived = libertyChuSpace(position);
  const { cells, sharedLiberties } = nerveCells(derived);
  const colour = new Map(derived.groups.map((g) => [g.id, g.color]));
  const sameColorCells = cells.filter((c) => colour.get(c.subject) === colour.get(c.object)).length;
  const cohomology = cohomologyOfRelation(cells);
  return {
    size: derived.size,
    groups: derived.groups.length,
    groupsInNerve: cohomology.entities.length,
    sharedLiberties,
    cells,
    sameColorCells,
    oppositeColorCells: cells.length - sameColorCells,
    components: cohomology.H0.rank,
    h1: cohomology.H1.rank,
  };
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
    console.error("usage: node scripts/derive-coordination-nerve.mts --sgf <file> [--move <n>]");
    process.exitCode = 2;
  } else {
    const { position, moveIndex } = positionFromSgf(readFileSync(values.sgf, "utf8"), values.move === undefined ? undefined : Number(values.move));
    const nerve = coordinationNerve(position);
    process.stdout.write(`${JSON.stringify({ type: "weiqi.coordination-nerve", moveIndex, ...nerve }, null, 2)}\n`);
  }
}
