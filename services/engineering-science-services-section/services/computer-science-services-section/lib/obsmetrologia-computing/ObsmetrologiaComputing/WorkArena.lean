import Obsmetrologia.Language.Positing.Four
import ObsmetrologiaComputing.Calm

/-!
# WorkArena — the law of one thread of the work arena, as a replicated game

The work arena is how the house's micro-enterprises speak to one another about work: a
board of threads, each opened by an aim, request, proposal, report, question or declaration
and answered by response moves. This module states the law of one thread, which is what
the arena's coordination claim is about. Moves on different threads do not interact; a
supersession, which one opening says about an earlier one, is modelled as the opener's act
on the earlier thread.

The law splits the responses as the arena's ninth edition does. A **telling** (observe on
an aim, a witness on a request's delivery, an argument on a proposal, a corroboration on a
report, an answer to a question) only adds to a grow-only record. It is never refused for
what was or was not played before, and it stays admissible after the thread closes. Every
other move is **coordinated**: its rule reads the thread's state and the tellings strictly
before it, and may refuse.

A thread is a `Calm.Game` (`game`). Its state is a `Skeleton`: who holds, promises or
adopts it, the contract's refinements and counter-offers, the deliveries, the wagers, and
whether it is withdrawn, superseded or resolved. Tellings never enter the skeleton.
Whatever follows from them is read when needed and never stored: the readings of a
delivery's claims in FOUR, its verdict, a wager's reading, the standing.

## Main definitions

* `Kind`, `Act`, `answers` (which acts answer which kind of opening), `told` (the tellings).
* `Opening`, `Move` — a thread's fixed opening, and one timestamped response.
* `claimReading`, `deliveryReading`, `verdict` — each claim of a delivery reads in FOUR by
  which sides its witnesses told (held, denied, contested, unknown). The delivery reads the
  truth-meet of its claims. It is rejected when denied or contested, and accepted when held
  with its assayer's acceptance.
* `wagerReading`, `wagerStanding`, `forfeited` — a wager reads the latest observations in
  its period; a holder whose last two ended wagers missed is forfeited.
* `standing`, `closed` — the thread's standing, read from the skeleton and the tellings.
* `rule` — the coordinated law, act by act.
* `game`, `board`, `Outcome` — the thread as a replicated game, and its board read off a
  history at a time.

## Correspondence

The organizing package's `enterprise/work-arena.mjs` is the implementation this law judges
(`extendThread`, `standingOf`, `judgedDelivery`, `wagersOf`, `forfeitedOf`). The law departs
from it in one place, deliberately. A witness on a delivery is a telling, so it is never
refused for a delivery not yet on the thread. It is kept, and it bears on whichever delivery
of its subject precedes it once that delivery stands. The implementation refuses such a
witness. Content that the arena validates without reference to the history (statement
bounds, requirement form, benchmarks, evidence presence) is outside this law.
-/

namespace ObsmetrologiaComputing.WorkArena

open Obsmetrologia

/-- A player: an office or micro-enterprise, by number. -/
abbrev Player := Nat
/-- A time, by number; the opening is at `0`. -/
abbrev Time := Nat

/-- The kinds of opening. -/
inductive Kind where
  | aim | request | propose | report | ask | declare
  deriving DecidableEq, Repr, Inhabited

/-- The response acts, and `supersede`, which an opening says of an earlier thread. -/
inductive Act where
  | hold | wager | observe | attach | leave | withdraw
  | promise | decline | refine | counter | agree | release | deliver | accept | reject
  | adopt | argue | corroborate | resolve | answer
  | supersede
  deriving DecidableEq, Repr, Inhabited

namespace Kind
/-- Every kind. -/
def all : List Kind := [aim, request, propose, report, ask, declare]
end Kind

namespace Act
/-- Every act. -/
def all : List Act :=
  [hold, wager, observe, attach, leave, withdraw, promise, decline, refine, counter, agree,
   release, deliver, accept, reject, adopt, argue, corroborate, resolve, answer, supersede]
end Act

/-- The acts that answer each kind of opening (the arena's `RESPONSE_MOVES`). `supersede`
answers none: an opening says it. -/
def responses : Kind → List Act
  | .aim => [.hold, .wager, .observe, .attach, .leave, .withdraw]
  | .request => [.promise, .attach, .decline, .refine, .counter, .agree, .release, .deliver,
      .accept, .reject, .withdraw]
  | .propose => [.adopt, .argue, .attach, .withdraw]
  | .report => [.corroborate, .adopt, .attach, .resolve, .withdraw]
  | .ask => [.answer, .accept, .withdraw]
  | .declare => [.withdraw]

/-- The tellings of each kind (the arena's `TOLD_MOVES`). An acceptance on a question chooses an
answer, so it is not a telling there. -/
def tellings : Kind → List Act
  | .aim => [.observe]
  | .request => [.accept, .reject]
  | .propose => [.argue]
  | .report => [.corroborate]
  | .ask => [.answer]
  | .declare => []

/-- Whether an act answers a kind of opening. -/
def answers (k : Kind) (a : Act) : Bool := (responses k).contains a

/-- Whether an act is a telling on a kind of opening. -/
def told (k : Kind) (a : Act) : Bool := (tellings k).contains a

/-- The acts only a thread's taking side plays (the arena's `TAKER_MOVES`). -/
def takerActs : List Act := [.promise, .decline, .hold, .wager, .adopt, .attach, .deliver, .release, .leave]

/-- Whether only the taking side plays an act. -/
def takerAct (a : Act) : Bool := takerActs.contains a

/-- A thread's opening: its kind, its opener, the assayer of its deliveries or answers (the
opener unless one is named), its addressee, a request's conditions of satisfaction (ids from
`1`; the need is claim `0`), and an aim's measures (each with a unit, read "more is better"). -/
structure Opening where
  kind : Kind
  opener : Player
  assayer : Player
  addressee : Option Player := none
  conditions : List Nat := []
  measures : List Nat := []
  deriving DecidableEq, Repr

/-- One response. `about` names whose delivery or answer is accepted or rejected, or whose
counter-offer is agreed. `measure`, `value`, `ends` and `observed` carry a wager's measure,
target and period end, or an observation's measure, value and when the value held. `unmet`
names the claims a rejection finds unmet. `terms` are a refinement's or counter-offer's
conditions, and `completes` marks a refinement that completes the order after a miss. -/
structure Move where
  act : Act
  player : Player
  time : Time
  about : Player := 0
  measure : Nat := 0
  value : Nat := 0
  ends : Time := 0
  observed : Time := 0
  unmet : List Nat := []
  terms : List Nat := []
  completes : Bool := false
  deriving DecidableEq, Repr

/-- A delivery: its deliverer, its time, and the revision of the order it answers. -/
structure Delivery where
  player : Player
  time : Time
  revision : Nat
  deriving DecidableEq, Repr

/-- A wager: its holder, measure, target, time and period end. -/
structure Wager where
  player : Player
  measure : Nat
  target : Nat
  time : Time
  ends : Time
  deriving DecidableEq, Repr

/-- What the coordinated moves have made of a thread. Tellings never enter it. -/
structure Skeleton where
  holders : List Player := []
  promisers : List Player := []
  adopters : List Player := []
  attached : List Player := []
  declines : List Player := []
  refinements : List (List Nat) := []
  counters : List (Player × List Nat) := []
  awarded : Option Player := none
  deliveries : List Delivery := []
  wagers : List Wager := []
  withdrawn : Bool := false
  superseded : Bool := false
  resolved : Option Time := none
  chosen : Option Player := none
  deriving DecidableEq, Repr

/-- The tellings a rule may read: "is any telling `p`?". -/
abbrev Told := (Move → Bool) → Bool

/-! ## A delivery's claims, its readings and its verdict -/

/-- The `r`-th element of a list, if any (structural, so it costs no axiom). -/
def nth? {α : Type} : List α → Nat → Option α
  | [], _ => none
  | x :: _, 0 => some x
  | _ :: xs, r + 1 => nth? xs r

/-- The order's conditions at revision `r`: the latest of the first `r` refinements, else the
opening's. -/
def conditionsAt (o : Opening) (sk : Skeleton) : Nat → List Nat
  | 0 => o.conditions
  | r + 1 => (nth? sk.refinements r).getD o.conditions

/-- A delivery's claims: the conditions of the order it answers, then the need (`0`). -/
def claimsOf (o : Opening) (sk : Skeleton) (d : Delivery) : List Nat :=
  conditionsAt o sk d.revision ++ [0]

/-- The latest delivery by `p` before `n`. -/
def latestDelivery (sk : Skeleton) (p : Player) (n : Time) : Option Delivery :=
  (sk.deliveries.filter (fun d => d.player == p && decide (d.time < n))).getLast?

/-- A witness on delivery `d`: an acceptance or rejection of `d`'s deliverer whose latest
delivery before the witness is `d`. -/
def witnessOn (sk : Skeleton) (d : Delivery) (w : Move) : Bool :=
  (w.act == .accept || w.act == .reject) && decide (latestDelivery sk w.about w.time = some d)

/-- The claims a rejection names unmet: a claim of the delivery as itself, anything else as the need. -/
def unmetOf (claims : List Nat) (w : Move) : List Nat :=
  w.unmet.map (fun c => if claims.contains c then c else 0)

/-- A claim reads in FOUR by which sides were told: met by any acceptance of the delivery,
unmet by any rejection naming it. -/
def claimReading (A : Told) (o : Opening) (sk : Skeleton) (d : Delivery) (c : Nat) : Reading :=
  Reading.ofSlots
    (A fun w => witnessOn sk d w && w.act == .accept)
    (A fun w => witnessOn sk d w && w.act == .reject && (unmetOf (claimsOf o sk d) w).contains c)

/-- A delivery reads the truth-meet of its claims. -/
def deliveryReading (A : Told) (o : Opening) (sk : Skeleton) (d : Delivery) : Reading :=
  (claimsOf o sk d).foldl (fun r c => Reading.meetT r (claimReading A o sk d c)) Reading.tTop

/-- Whether anyone has witnessed a delivery. -/
def witnessed (A : Told) (sk : Skeleton) (d : Delivery) : Bool := A (witnessOn sk d)

/-- Whether the assayer has accepted a delivery. -/
def validated (A : Told) (o : Opening) (sk : Skeleton) (d : Delivery) : Bool :=
  A fun w => witnessOn sk d w && w.act == .accept && w.player == o.assayer

/-- A delivery's verdict. -/
inductive Verdict where
  | accepted | rejected
  deriving DecidableEq, Repr

/-- The verdict: rejected when the delivery reads denied or contested, accepted when it reads
held and its assayer accepted it, else none yet. -/
def verdict (A : Told) (o : Opening) (sk : Skeleton) (d : Delivery) : Option Verdict :=
  if !witnessed A sk d then none
  else if (deliveryReading A o sk d).neg then some .rejected
  else if decide (deliveryReading A o sk d = Reading.tTop) && validated A o sk d then some .accepted
  else none

/-! ## Wagers -/

/-- An observation within a wager's period, read at time `T`. -/
def within (w : Wager) (T : Time) (x : Move) : Bool :=
  x.act == .observe && x.measure == w.measure && decide (w.time ≤ x.observed) &&
    decide (x.observed ≤ min w.ends T)

/-- An observation read for a wager: within its period and observed no earlier than any other. -/
def readOf (A : Told) (w : Wager) (T : Time) (x : Move) : Bool :=
  within w T x && !(A fun y => within w T y && decide (x.observed < y.observed))

/-- A wager reads in FOUR by whether its read observations meet its target. -/
def wagerReading (A : Told) (w : Wager) (T : Time) : Reading :=
  Reading.ofSlots
    (A fun x => readOf A w T x && decide (w.target ≤ x.value))
    (A fun x => readOf A w T x && decide (x.value < w.target))

/-- A wager's standing at a time. -/
inductive WagerStanding where
  | running | met | missed | contested | unread
  deriving DecidableEq, Repr

/-- Running until its period ends; then met, missed, contested or unread by its reading. -/
def wagerStanding (A : Told) (w : Wager) (T : Time) : WagerStanding :=
  if T < w.ends then .running
  else match wagerReading A w T with
    | .potential => .met
    | .active => .missed
    | .stable => .contested
    | .absurd => .unread

/-- The order wagers end in: by period end, then measure. -/
def wagerBefore (a b : Wager) : Bool := decide (a.ends < b.ends) || (a.ends == b.ends && decide (a.measure ≤ b.measure))

/-- Insert a wager in ending order. -/
def insertWager (w : Wager) : List Wager → List Wager
  | [] => [w]
  | x :: xs => if wagerBefore w x then w :: x :: xs else x :: insertWager w xs

/-- Wagers in ending order. -/
def sortWagers : List Wager → List Wager
  | [] => []
  | x :: xs => insertWager x (sortWagers xs)

/-- A holder whose last two ended and read wagers both missed (the arena's `forfeitedOf`). -/
def forfeited (A : Told) (sk : Skeleton) (T : Time) (p : Player) : Bool :=
  let ended := sortWagers (sk.wagers.filter fun w => w.player == p &&
    (match wagerStanding A w T with
      | .running => false | .unread => false | .met => true | .missed => true | .contested => true))
  let two := ended.drop (ended.length - 2)
  sk.holders.contains p && two.length == 2 && two.all (fun w => decide (wagerStanding A w T = .missed))

/-! ## Standing -/

/-- A thread's standing (the arena's `THREAD_STANDINGS`). -/
inductive Standing where
  | «open» | held | declined | promised | delivered | accepted | adopted | resolved | answered
  | withdrawn | superseded | «in-force»
  deriving DecidableEq, Repr

/-- Who a request or question is addressed to: the player whose counter-offer was agreed, else
the opening's addressee. -/
def addressee (o : Opening) (sk : Skeleton) : Option Player :=
  match sk.awarded with
  | some p => some p
  | none => o.addressee

/-- A thread's standing, read from its skeleton and its tellings. -/
def standing (A : Told) (o : Opening) (sk : Skeleton) : Standing :=
  if sk.superseded then .superseded
  else if sk.withdrawn then .withdrawn
  else match o.kind with
    | .aim => if sk.holders.isEmpty then .open else .held
    | .request =>
      if sk.deliveries.any (fun d => decide (verdict A o sk d = some .accepted)) then .accepted
      else if sk.deliveries.any (fun d => decide (verdict A o sk d = none)) then .delivered
      else if !sk.promisers.isEmpty then .promised
      else if !sk.declines.isEmpty && (addressee o sk).isSome then .declined
      else .open
    | .propose => if sk.adopters.isEmpty then .open else .adopted
    | .report =>
      match sk.resolved with
      | some r =>
        if A (fun w => w.act == .corroborate && decide (r < w.time)) then
          (if sk.adopters.isEmpty then .open else .adopted)
        else .resolved
      | none => if sk.adopters.isEmpty then .open else .adopted
    | .ask =>
      if sk.chosen.isSome then .accepted
      else if A (fun w => w.act == .answer) then .answered
      else .open
    | .declare => .«in-force»

/-- The standings after which nobody but a teller plays (the arena's `CLOSED_STANDINGS`). -/
def closedStandings : List Standing := [.accepted, .withdrawn, .superseded, .resolved]

/-- Whether a standing is closed. -/
def closed (st : Standing) : Bool := closedStandings.contains st

/-! ## The coordinated law -/

/-- The players taking a thread up in its skeleton: holders, promisers or adopters. -/
def takers (o : Opening) (sk : Skeleton) : List Player :=
  match o.kind with
  | .aim => sk.holders
  | .request => sk.promisers
  | .propose | .report => sk.adopters
  | .ask | .declare => []

/-- Whether a taking still carries current work: an aim held, a request promised (not awaiting
assay), a proposal or report adopted. -/
def currentTaking (k : Kind) (st : Standing) : Bool :=
  match k with
  | .aim => st == .held
  | .request => st == .promised
  | .propose | .report => st == .adopted
  | .ask | .declare => false

/-- A list of players without `p`. -/
def without (p : Player) (l : List Player) : List Player := l.filter (· != p)

/-- The rule of one coordinated move: the next skeleton, or `none` when the law refuses it. -/
def rule (o : Opening) (sk : Skeleton) (A : Told) (m : Move) : Option Skeleton :=
  let p := m.player
  if m.act == .supersede then
    (if p == o.opener then some { sk with superseded := true } else none)
  else if !answers o.kind m.act || told o.kind m.act then none
  else if closed (standing A o sk) then none
  else if takerAct m.act && (p == o.opener || p == o.assayer) then none
  else match m.act with
    | .hold => if sk.holders.contains p then none else some { sk with holders := sk.holders ++ [p] }
    | .wager =>
      if !o.measures.contains m.measure || decide (m.ends ≤ m.time) then none
      else if sk.wagers.any (fun w => w.player == p && w.measure == m.measure && decide (m.time < w.ends)) then none
      else if forfeited A sk m.time p then none
      else some { sk with
        wagers := sk.wagers ++ [⟨p, m.measure, m.value, m.time, m.ends⟩],
        holders := if sk.holders.contains p then sk.holders else sk.holders ++ [p] }
    | .attach =>
      if !currentTaking o.kind (standing A o sk) || !(takers o sk).contains p || sk.attached.contains p then none
      else some { sk with attached := sk.attached ++ [p] }
    | .leave =>
      if !sk.holders.contains p then none
      else some { sk with holders := without p sk.holders, attached := without p sk.attached }
    | .withdraw => if p == o.opener then some { sk with withdrawn := true } else none
    | .promise =>
      if (match addressee o sk with | some q => q != p | none => false) then none
      else if sk.promisers.contains p then none
      else some { sk with promisers := sk.promisers ++ [p] }
    | .decline => if addressee o sk == some p then some { sk with declines := sk.declines ++ [p] } else none
    | .refine =>
      if m.terms.isEmpty then none
      else if m.completes then
        if !(p == o.opener || p == o.assayer) then none
        else if sk.deliveries.any (fun d => decide (verdict A o sk d = none)) then none
        else if m.terms == conditionsAt o sk sk.refinements.length then none
        else some { sk with refinements := sk.refinements ++ [m.terms], attached := [] }
      else if !sk.deliveries.isEmpty then none
      else if p == o.opener || p == o.assayer ||
          (sk.promisers.contains p && (conditionsAt o sk sk.refinements.length).isEmpty) then
        some { sk with refinements := sk.refinements ++ [m.terms] }
      else none
    | .counter =>
      if m.terms.isEmpty || !sk.deliveries.isEmpty || p == o.opener then none
      else some { sk with counters := sk.counters.filter (fun c => c.1 != p) ++ [(p, m.terms)] }
    | .agree =>
      if !(p == o.opener || p == o.assayer) || !sk.deliveries.isEmpty then none
      else match sk.counters.find? (fun c => c.1 == m.about) with
        | none => none
        | some c =>
          if (match addressee o sk with
              | some q => q != m.about && !sk.promisers.contains m.about
              | none => false) then none
          else some { sk with
            refinements := sk.refinements ++ [c.2],
            counters := sk.counters.filter (fun c' => c'.1 != m.about),
            awarded := if sk.promisers.contains m.about then sk.awarded else some m.about }
    | .release =>
      if !sk.promisers.contains p then none
      else some { sk with
        promisers := without p sk.promisers,
        attached := without p sk.attached,
        awarded := if sk.awarded == some p then none else sk.awarded }
    | .deliver =>
      if !sk.promisers.contains p then none
      else if sk.deliveries.any (fun d => d.player == p && decide (verdict A o sk d = none)) then none
      else some { sk with deliveries := sk.deliveries ++ [⟨p, m.time, sk.refinements.length⟩] }
    | .accept =>
      if p != o.assayer then none
      else if !(A fun w => w.act == .answer && w.player == m.about) then none
      else some { sk with chosen := some m.about }
    | .adopt => if sk.adopters.contains p then none else some { sk with adopters := sk.adopters ++ [p] }
    | .resolve => some { sk with resolved := some m.time }
    | .observe => none
    | .reject => none
    | .argue => none
    | .corroborate => none
    | .answer => none
    | .supersede => none

/-- What a telling needs of itself alone: an observation of a stated measure, observed no later
than told; a witness by someone other than the deliverer. -/
def intrinsic (o : Opening) (m : Move) : Bool :=
  if m.act == .observe then o.measures.contains m.measure && decide (m.observed ≤ m.time)
  else if m.act == .accept || m.act == .reject then m.about != m.player
  else true

/-- One thread as a replicated game: tellings are recorded, every other move is ruled on. -/
abbrev game (o : Opening) : Calm.Game where
  Move := Move
  State := Skeleton
  init := {}
  time := Move.time
  told m := told o.kind m.act && intrinsic o m
  rule s A m := rule o s A m

/-! ## The board -/

/-- A delivery as the board shows it: per-claim readings, reading and verdict, when witnessed. -/
structure DeliveryOutcome where
  player : Player
  time : Time
  readings : List (Nat × Reading)
  reading : Option Reading
  verdict : Option Verdict
  deriving DecidableEq, Repr

/-- A wager as the board shows it. -/
structure WagerOutcome where
  player : Player
  measure : Nat
  standing : WagerStanding
  deriving DecidableEq, Repr

/-- The board of one thread at a time: its standing, its takers (a question's are its
answerers), the times of the moves the law refused, its deliveries and its wagers. -/
structure Outcome where
  standing : Standing
  takers : List Player
  refused : List Time
  deliveries : List DeliveryOutcome
  wagers : List WagerOutcome
  deriving DecidableEq, Repr

/-- The board read from the tellings `A`, the skeleton, the refused moves and a question's
answerers (as a set). -/
def outcome (o : Opening) (A : Told) (sk : Skeleton) (refused : List Move) (answerers : List Player)
    (T : Time) : Outcome :=
  { standing := standing A o sk
    takers := match o.kind with
      | .ask => answerers
      | .aim => Calm.setOf (takers o sk)
      | .request => Calm.setOf (takers o sk)
      | .propose => Calm.setOf (takers o sk)
      | .report => Calm.setOf (takers o sk)
      | .declare => Calm.setOf (takers o sk)
    refused := Calm.setOf (refused.map (·.time))
    deliveries := sk.deliveries.map fun d =>
      if witnessed A sk d then
        { player := d.player, time := d.time
          readings := (claimsOf o sk d).map (fun c => (c, claimReading A o sk d c))
          reading := some (deliveryReading A o sk d)
          verdict := verdict A o sk d }
      else { player := d.player, time := d.time, readings := [], reading := none, verdict := none }
    wagers := sk.wagers.map fun w => ⟨w.player, w.measure, wagerStanding A w T⟩ }

/-- Read the board off a reader's holdings at time `T`. -/
def readout (o : Opening) (b : Calm.Board (game o)) (T : Time) : Outcome :=
  outcome o b.told.any b.state b.refused
    (Calm.setOf ((b.told.filter (fun m => m.act == .answer)).map (·.player))) T

/-- The board of a thread at time `T`: the moves up to `T`, replayed in time order. -/
def board (o : Opening) (moves : List Move) (T : Time) : Outcome :=
  readout o (Calm.play (game o) (Calm.sortBy Move.time (moves.filter (fun m => decide (m.time ≤ T))))) T

end ObsmetrologiaComputing.WorkArena
