/**
 * speaking/signifying — semiotic carriers for spoken communication.
 *
 * A sign relation is triadic: vehicle, object, interpretant. Semiosis advances
 * by taking an interpretant as a further sign-vehicle for the same object in a
 * semiosphere. The semiosphere boundary is a translation mechanism, not a codec.
 */
export { signRelationCarrier, semiosisStepCarrier, semiosphereCarrier, semiosphereBoundaryTranslationCarrier, } from "./carriers.mjs";
export type { SignRelationCarrier, SemiosisStepCarrier, SemiosphereCarrier, SemiosphereBoundaryTranslation, } from "./carriers.mjs";
import type { SignRelationCarrier, SemiosisStepCarrier, SemiosphereCarrier, SemiosphereBoundaryTranslation } from "./carriers.mjs";
/** Construct a semiosphere carrier. */
export declare const semiosphere: (name: string) => SemiosphereCarrier;
/** Construct a sign relation from vehicle, object, and interpretant. */
export declare const signRelation: <Vehicle, Object, Interpretant>(vehicle: Vehicle, object: Object, interpretant: Interpretant) => SignRelationCarrier<Vehicle, Object, Interpretant>;
/** Advance semiosis by making the prior interpretant the next vehicle. */
export declare function advanceSemiosis<Vehicle, Object, Interpretant, NextInterpretant>(prior: SignRelationCarrier<Vehicle, Object, Interpretant>, interpretant: NextInterpretant): SemiosisStepCarrier<SignRelationCarrier<Vehicle, Object, Interpretant>, SignRelationCarrier<Interpretant, Object, NextInterpretant>>;
/** Apply a boundary translation into a semiosphere and carry both sides. */
export declare function translateAcrossSemiosphereBoundary<External, Vehicle, Object, Interpretant>(sphere: SemiosphereCarrier, external: External, translate: (external: External) => SignRelationCarrier<Vehicle, Object, Interpretant>): SemiosphereBoundaryTranslation<External, SignRelationCarrier<Vehicle, Object, Interpretant>>;
//# sourceMappingURL=index.d.mts.map