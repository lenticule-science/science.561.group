/**
 * The twist-product program over an explicitly supplied coordinate algebra.
 *
 * Source: Obsmetrologia/Calculus/Logic/TwistProductResiduation.lean,
 * namespace Order.TwistProduct. Coordinates are arbitrary carrier values;
 * Mark-valued and finite named-coordinate algebras run the same operations.
 * The supplier must establish the integral commutative residuated-lattice
 * laws. Constructing this program does not prove those laws for the supplier.
 */
export interface ResiduatedCoordinateAlgebra<Coordinate> {
  readonly bottom: Coordinate;
  readonly top: Coordinate;
  readonly one: Coordinate;
  readonly leq: (left: Coordinate, right: Coordinate) => boolean;
  readonly meet: (left: Coordinate, right: Coordinate) => Coordinate;
  readonly join: (left: Coordinate, right: Coordinate) => Coordinate;
  readonly fuse: (left: Coordinate, right: Coordinate) => Coordinate;
  readonly imply: (left: Coordinate, right: Coordinate) => Coordinate;
}

export type TwistValue<Coordinate> = readonly [positive: Coordinate, negative: Coordinate];
export interface TwistPair<Coordinate> {
  readonly left: TwistValue<Coordinate>;
  readonly right: TwistValue<Coordinate>;
}

/** Derive both orders and the linear operations without inspecting coordinates. */
export function twistProduct<Coordinate>(algebra: ResiduatedCoordinateAlgebra<Coordinate>) {
  const { bottom, top, one, leq, meet, join, fuse, imply } = algebra;
  const value = (positive: Coordinate, negative: Coordinate): TwistValue<Coordinate> =>
    Object.freeze([positive, negative] as const);
  const lift = (
    positive: typeof meet,
    negative: typeof meet,
  ) => ({ left: a, right: b }: TwistPair<Coordinate>): TwistValue<Coordinate> =>
    value(positive(a[0], b[0]), negative(a[1], b[1]));
  return Object.freeze({
    value,
    knowledgeBottom: value(bottom, bottom),
    knowledgeTop: value(top, top),
    truthBottom: value(bottom, top),
    truthTop: value(top, bottom),
    one: value(one, one),
    meetKnowledge: lift(meet, meet),
    joinKnowledge: lift(join, join),
    meetTruth: lift(meet, join),
    joinTruth: lift(join, meet),
    leqKnowledge: ({ left: a, right: b }: TwistPair<Coordinate>): boolean =>
      leq(a[0], b[0]) && leq(a[1], b[1]),
    leqTruth: ({ left: a, right: b }: TwistPair<Coordinate>): boolean =>
      leq(a[0], b[0]) && leq(b[1], a[1]),
    negate: (a: TwistValue<Coordinate>): TwistValue<Coordinate> => value(a[1], a[0]),
    fuse: ({ left: a, right: b }: TwistPair<Coordinate>): TwistValue<Coordinate> =>
      value(fuse(a[0], b[0]), meet(imply(a[0], b[1]), imply(b[0], a[1]))),
    imply: ({ left: a, right: b }: TwistPair<Coordinate>): TwistValue<Coordinate> =>
      value(meet(imply(a[0], b[0]), imply(b[1], a[1])), fuse(a[0], b[1])),
  });
}
