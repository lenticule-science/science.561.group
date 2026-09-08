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
export declare function twistProduct<Coordinate>(algebra: ResiduatedCoordinateAlgebra<Coordinate>): Readonly<{
    value: (positive: Coordinate, negative: Coordinate) => TwistValue<Coordinate>;
    knowledgeBottom: TwistValue<Coordinate>;
    knowledgeTop: TwistValue<Coordinate>;
    truthBottom: TwistValue<Coordinate>;
    truthTop: TwistValue<Coordinate>;
    one: TwistValue<Coordinate>;
    meetKnowledge: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
    joinKnowledge: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
    meetTruth: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
    joinTruth: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
    leqKnowledge: ({ left: a, right: b }: TwistPair<Coordinate>) => boolean;
    leqTruth: ({ left: a, right: b }: TwistPair<Coordinate>) => boolean;
    negate: (a: TwistValue<Coordinate>) => TwistValue<Coordinate>;
    fuse: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
    imply: ({ left: a, right: b }: TwistPair<Coordinate>) => TwistValue<Coordinate>;
}>;
//# sourceMappingURL=twist-product.d.mts.map