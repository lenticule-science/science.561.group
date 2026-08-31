// Game: the stateful orchestrator that owns move history (needed for
// ko/superko, which Position alone cannot check) and drives the semantic
// event annotator.

import { coordToPoint, isBoardSize } from "./board.mjs";
import { applyPass, applyStonePlacement, createEmptyPosition,               } from "./position.mjs";
import { getRuleset,                             } from "./rulesets.mjs";
import { annotateMove, annotatePass,                    } from "./events.mjs";

                           
                
               
              
             
               
                        
                          

                         
                                                             
                                         

/**
 * Check a candidate resulting position against game history under the
 * given ko regime. `history` holds every position that has occurred so
 * far (index 0 = empty board before any moves), NOT including `candidate`.
 *
 * - simple_ko forbids only recreating the single position that existed
 *   immediately before the opponent's last move — i.e. history[length-2].
 * - positional_superko forbids recreating ANY prior board arrangement
 *   (stones only, turn ignored).
 * - situational_superko forbids recreating any prior (arrangement, player
 *   to move) pair.
 *
 * Positional/situational superko subsume the simple-ko case (it is just
 * the most recent entry in the same history), so no special-casing is
 * needed once the regime is superko.
 */
function checkKoViolation(history                     , candidate          , regime          )                       {
  if (regime === "simple_ko") {
    if (history.length >= 2) {
      const beforeOpponentsLastMove = history[history.length - 2];
      if (candidate.boardHash === beforeOpponentsLastMove.boardHash) return "simple-ko";
    }
    return null;
  }
  if (regime === "positional_superko") {
    for (const h of history) {
      if (h.boardHash === candidate.boardHash) return "positional-superko";
    }
    return null;
  }
  // situational_superko
  for (const h of history) {
    if (h.situationalHash === candidate.situationalHash) return "situational-superko";
  }
  return null;
}

export class Game {
  /** Square board side length (see isBoardSize in board.mts for the accepted range). */
           size        ;
           ruleset         ;
           history            ;
           moveEvents                    = [];
  activeKoPoint                = null;
  passStreak = 0;
  mainPhaseEnded = false;

  constructor(size        , rulesetName        , initial           ) {
    if (!isBoardSize(size)) throw new Error(`Unsupported board size: ${size}`);
    this.size = size;
    this.ruleset = getRuleset(rulesetName);
    this.history = [initial ?? createEmptyPosition(size)];
  }

  get current()           {
    return this.history[this.history.length - 1];
  }

  /** Play a move. `move` is either the literal string "pass" or a Go-notation coordinate like "C3". */
  play(move                 )              {
    const prev = this.current;

    if (move === "pass") {
      const next = applyPass(prev);
      this.history.push(next);
      this.passStreak += 1;
      // "endsMainPhase" is the transition, not the level: only the pass
      // that takes the streak to exactly 2 fires game-ended, mirroring
      // mainPhaseEnded's own one-way flip below (see pass.md/R12).
      const endsMainPhase = this.passStreak === 2;
      if (this.passStreak >= 2) this.mainPhaseEnded = true;
      const events = annotatePass(prev.toMove, endsMainPhase);
      this.moveEvents.push(events);
      return { ok: true, events, passStreak: this.passStreak };
    }

    // Resuming play after a settlement disagreement (see pass.md/R12) is
    // modeled as simply continuing to call play(); mainPhaseEnded does not
    // block further moves, it only records that two passes have happened
    // in a row at some point.
    let point        ;
    try {
      point = coordToPoint(this.size, this.size, move);
    } catch {
      return { ok: false, reason: "off-board" };
    }

    const placement = applyStonePlacement(prev, point, this.ruleset);
    if (!placement.ok) {
      return { ok: false, reason: placement.reason };
    }

    const koViolation = checkKoViolation(this.history, placement.position, this.ruleset.ko_regime);
    if (koViolation) {
      return { ok: false, reason: koViolation };
    }

    const { events, nextActiveKoPoint } = annotateMove({
      width: this.size,
      height: this.size,
      prevPosition: prev,
      nextPosition: placement.position,
      point,
      color: prev.toMove,
      captured: placement.captured,
      selfCaptured: placement.selfCaptured,
      activeKoPoint: this.activeKoPoint,
    });

    this.activeKoPoint = nextActiveKoPoint;
    this.history.push(placement.position);
    this.moveEvents.push(events);
    this.passStreak = 0;

    return { ok: true, events, passStreak: 0 };
  }

  /** Whether `move` would currently be legal, without mutating game state. */
  isLegal(move                 )          {
    if (move === "pass") return true;
    let point        ;
    try {
      point = coordToPoint(this.size, this.size, move);
    } catch {
      return false;
    }
    const placement = applyStonePlacement(this.current, point, this.ruleset);
    if (!placement.ok) return false;
    return checkKoViolation(this.history, placement.position, this.ruleset.ko_regime) === null;
  }
}

export { checkKoViolation as _checkKoViolationForTests };
