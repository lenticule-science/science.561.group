// Scoring: area and territory, dead-stone marking, and seki-aware
// territory counting.
//
// Seki-awareness is not a special case bolted onto the territory walk: the
// standard flood-fill algorithm (an empty region counts for a color only
// if EVERY stone bordering it is that one color) already treats a seki's
// shared liberties correctly, because by definition those liberties border
// both colors — see seki.md and regression position R6. The same is true
// of ordinary neutral points (dame) between two living groups, and of the
// empty board before any territory exists.

import { BLACK, WHITE, neighbors, type Color } from "./board.mts";
import { boardHash, situationalHash } from "./zobrist.mts";
import type { Position } from "./position.mts";
import type { Ruleset } from "./rulesets.mts";

export interface TerritoryResult {
  blackTerritory: number;
  whiteTerritory: number;
}

export function computeTerritory(position: Position): TerritoryResult {
  const { width, height, board } = position;
  const visited = new Uint8Array(board.length);
  let blackTerritory = 0;
  let whiteTerritory = 0;

  for (let i = 0; i < board.length; i++) {
    if (board[i] !== 0 || visited[i]) continue;
    const region: number[] = [i];
    visited[i] = 1;
    const stack = [i];
    const borders = new Set<Color>();
    while (stack.length) {
      const p = stack.pop()!;
      for (const n of neighbors(width, height, p)) {
        const c = board[n];
        if (c === 0) {
          if (!visited[n]) {
            visited[n] = 1;
            stack.push(n);
            region.push(n);
          }
        } else {
          borders.add(c as Color);
        }
      }
    }
    if (borders.size === 1) {
      if (borders.has(BLACK)) blackTerritory += region.length;
      else whiteTerritory += region.length;
    }
    // borders.size === 0 (no stones at all) or 2 (neutral/dame/seki): counts for neither.
  }

  return { blackTerritory, whiteTerritory };
}

/**
 * Dead-stone settlement: remove the marked points from the board, crediting
 * their color's opponent with a prisoner, exactly as though they had been
 * captured in play (dead-stones.md). Returns a new Position; does not
 * mutate the input.
 */
export function removeDeadStones(position: Position, deadPoints: Iterable<number>): Position {
  const board = position.board.slice();
  let capturedBlackStones = position.capturedBlackStones;
  let capturedWhiteStones = position.capturedWhiteStones;
  for (const p of deadPoints) {
    const c = board[p];
    if (c === BLACK) {
      capturedBlackStones += 1;
      board[p] = 0;
    } else if (c === WHITE) {
      capturedWhiteStones += 1;
      board[p] = 0;
    }
  }
  return {
    width: position.width,
    height: position.height,
    board,
    toMove: position.toMove,
    capturedBlackStones,
    capturedWhiteStones,
    boardHash: boardHash(board),
    situationalHash: situationalHash(board, position.toMove),
  };
}

export interface ScoreResult {
  blackStones: number;
  whiteStones: number;
  blackTerritory: number;
  whiteTerritory: number;
  blackPrisoners: number;
  whitePrisoners: number;
  blackScore: number;
  whiteScore: number;
  margin: string;
}

function countStones(position: Position): { blackStones: number; whiteStones: number } {
  let blackStones = 0;
  let whiteStones = 0;
  for (const c of position.board) {
    if (c === BLACK) blackStones += 1;
    else if (c === WHITE) whiteStones += 1;
  }
  return { blackStones, whiteStones };
}

function marginString(blackScore: number, whiteScore: number): string {
  if (blackScore === whiteScore) return "Draw";
  return blackScore > whiteScore ? `Black by ${blackScore - whiteScore}` : `White by ${whiteScore - blackScore}`;
}

/**
 * Area scoring: stones on the board plus territory, komi added to White.
 * `position` should already have dead stones removed (see
 * removeDeadStones) — area scoring does not otherwise consult prisoners.
 */
export function scoreArea(position: Position, ruleset: Pick<Ruleset, "komi">): ScoreResult {
  const { blackStones, whiteStones } = countStones(position);
  const { blackTerritory, whiteTerritory } = computeTerritory(position);
  const blackScore = blackStones + blackTerritory;
  const whiteScore = whiteStones + whiteTerritory + ruleset.komi;
  return {
    blackStones,
    whiteStones,
    blackTerritory,
    whiteTerritory,
    blackPrisoners: position.capturedWhiteStones,
    whitePrisoners: position.capturedBlackStones,
    blackScore,
    whiteScore,
    margin: marginString(blackScore, whiteScore),
  };
}

/**
 * Territory scoring: territory plus prisoners only, komi added to White.
 * `position` should already have dead stones removed.
 *
 * Uses `ruleset.komi_territory` when the ruleset declares one (AGA's
 * `area_or_territory` scoring keeps a separate territory-count komi,
 * reconciled against the area count via the pass-stone convention — see
 * rulesets.md's "Notes per parameter/Scoring" and pass.md) and falls back
 * to `.komi` for every other ruleset, which has no such split.
 */
export function scoreTerritory(position: Position, ruleset: Pick<Ruleset, "komi" | "komi_territory">): ScoreResult {
  const { blackStones, whiteStones } = countStones(position);
  const { blackTerritory, whiteTerritory } = computeTerritory(position);
  const blackPrisoners = position.capturedWhiteStones;
  const whitePrisoners = position.capturedBlackStones;
  const blackScore = blackTerritory + blackPrisoners;
  const whiteScore = whiteTerritory + whitePrisoners + (ruleset.komi_territory ?? ruleset.komi);
  return {
    blackStones,
    whiteStones,
    blackTerritory,
    whiteTerritory,
    blackPrisoners,
    whitePrisoners,
    blackScore,
    whiteScore,
    margin: marginString(blackScore, whiteScore),
  };
}
