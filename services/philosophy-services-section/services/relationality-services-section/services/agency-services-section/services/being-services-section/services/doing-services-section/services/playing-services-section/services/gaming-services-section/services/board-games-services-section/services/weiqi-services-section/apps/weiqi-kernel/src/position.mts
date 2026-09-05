// Immutable position: a board arrangement plus whose turn it is and the
// running prisoner counts, with its two Zobrist hashes precomputed.
//
// A Position never mutates in place. Every function here that "changes" a
// position returns a brand-new one; the old one remains valid and usable
// (this is what lets Game keep a full, cheap-to-compare history for
// superko).

import {
  BLACK,
  EMPTY,
  WHITE,
  createEmptyBoard,
  findGroup,
  neighbors,
  opponent,
  type Color,
  type Group,
} from "./board.mts";
import { boardHash, situationalHash } from "./zobrist.mts";
import type { SuicideRule } from "./rulesets.mts";

export interface Position {
  readonly width: number;
  readonly height: number;
  readonly board: Uint8Array;
  readonly toMove: Color;
  /** Black stones removed from the board over the game so far (White's prisoner credit). */
  readonly capturedBlackStones: number;
  /** White stones removed from the board over the game so far (Black's prisoner credit). */
  readonly capturedWhiteStones: number;
  readonly boardHash: bigint;
  readonly situationalHash: bigint;
}

function finalize(
  width: number,
  height: number,
  board: Uint8Array,
  toMove: Color,
  capturedBlackStones: number,
  capturedWhiteStones: number,
): Position {
  return {
    width,
    height,
    board,
    toMove,
    capturedBlackStones,
    capturedWhiteStones,
    boardHash: boardHash(board),
    situationalHash: situationalHash(board, toMove),
  };
}

export function createEmptyPosition(width: number, height: number = width, toMove: Color = BLACK): Position {
  return finalize(width, height, createEmptyBoard(width, height), toMove, 0, 0);
}

/**
 * Build a position directly from a full cell array — used to load the
 * regression corpus's hand-drawn diagrams (which are already-resolved
 * board states, not move sequences) and for scoring/territory tests.
 */
export function createPositionFromCells(
  width: number,
  height: number,
  cells: ArrayLike<number>,
  toMove: Color = BLACK,
  capturedBlackStones = 0,
  capturedWhiteStones = 0,
): Position {
  if (cells.length !== width * height) {
    throw new Error(`Expected ${width * height} cells, got ${cells.length}`);
  }
  const board = Uint8Array.from(cells);
  return finalize(width, height, board, toMove, capturedBlackStones, capturedWhiteStones);
}

export type PlacementResult =
  | { ok: true; position: Position; captured: Group[]; selfCaptured: Group | null }
  | { ok: false; reason: "off-board" | "occupied" | "suicide" };

/**
 * Apply a single stone placement, resolving captures and suicide, but
 * WITHOUT any ko/superko check — that requires game history and is the
 * caller's (Game's) job. This function is the pure "physics" of one move:
 * place the stone, remove any opponent groups left with zero liberties,
 * then check the mover's own group.
 */
export function applyStonePlacement(position: Position, point: number, ruleset: { suicide: SuicideRule }): PlacementResult {
  if (!Number.isInteger(point) || point < 0 || point >= position.board.length) {
    return { ok: false, reason: "off-board" };
  }
  if (position.board[point] !== EMPTY) {
    return { ok: false, reason: "occupied" };
  }

  const { width, height } = position;
  const color = position.toMove;
  const opp = opponent(color);
  const board = position.board.slice();
  board[point] = color;

  // Resolve opponent captures first — this is what makes a capturing move
  // never suicide even when the placed stone looks surrounded before the
  // capture is applied (see suicide.md and regression position R8).
  const captured: Group[] = [];
  const consideredOpp = new Set<number>();
  for (const n of neighbors(width, height, point)) {
    if (board[n] === opp && !consideredOpp.has(n)) {
      const g = findGroup(board, width, height, n);
      for (const s of g.stones) consideredOpp.add(s);
      if (g.liberties.size === 0) captured.push(g);
    }
  }
  for (const g of captured) {
    for (const s of g.stones) board[s] = EMPTY;
  }

  // Now check the mover's own group.
  const ownGroup = findGroup(board, width, height, point);
  let selfCaptured: Group | null = null;
  if (ownGroup.liberties.size === 0) {
    if (ruleset.suicide === "legal") {
      selfCaptured = ownGroup;
      for (const s of ownGroup.stones) board[s] = EMPTY;
    } else {
      return { ok: false, reason: "suicide" };
    }
  }

  let capturedBlackStones = position.capturedBlackStones;
  let capturedWhiteStones = position.capturedWhiteStones;
  for (const g of captured) {
    if (g.color === BLACK) capturedBlackStones += g.stones.length;
    else capturedWhiteStones += g.stones.length;
  }
  if (selfCaptured) {
    if (selfCaptured.color === BLACK) capturedBlackStones += selfCaptured.stones.length;
    else capturedWhiteStones += selfCaptured.stones.length;
  }

  const nextToMove = opponent(color);
  return {
    ok: true,
    position: finalize(width, height, board, nextToMove, capturedBlackStones, capturedWhiteStones),
    captured,
    selfCaptured,
  };
}

/** A pass changes whose turn it is and nothing else. Always legal — see pass.md. */
export function applyPass(position: Position): Position {
  return finalize(
    position.width,
    position.height,
    position.board,
    opponent(position.toMove),
    position.capturedBlackStones,
    position.capturedWhiteStones,
  );
}
