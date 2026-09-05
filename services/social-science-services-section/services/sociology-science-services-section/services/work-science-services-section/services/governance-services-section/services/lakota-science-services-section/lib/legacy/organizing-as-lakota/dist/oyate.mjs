/**
 * oyate — the polity scales of lakotaean becoming.
 *
 * Three nested scales of Lakota political life, each presented as a reading on the
 * @emsenn/organizing substrate (corpus: lakota/.../lakotaean-politics/concepts/
 * tiyospaye, oyate, oceti-sakowin):
 *
 *   - thiyóšpaye (tiyóšpaye) — the extended-family band, the BASIC political-and-
 *     economic unit, small enough that members know one another by name and relation.
 *     Ella Deloria's claim is load-bearing: KINSHIP IS THE POLITICAL ORGANIZATION. The
 *     naca's authority is the authority of a senior relative; the akicita's enforcement
 *     is enforcement of obligations that hold BECAUSE people are related; remove kinship
 *     and no politics is left behind. This is organizing's COMMUNITY — the shared
 *     transindividual field.
 *   - oyáte — a people / nation, intermediate between the tiyóšpaye and the Očhéthi
 *     Šakówiŋ; it has its own council (omníčiye), naca, akicita, and ceremonial life.
 *     Multiple tiyóšpaye constitute one oyáte. This is organizing's INSTITUTION — the
 *     settled order.
 *   - Očhéthi Šakówiŋ (Seven Council Fires) — the confederacy of the seven oyáte. The
 *     relation is GENUINE FEDERATION: each tiyóšpaye/oyáte retains its internal life and
 *     the RIGHT TO WITHDRAW from collective action it does not agree with
 *     (consensus-by-withdrawal). This is organizing's FEDERATION — parallel composition,
 *     where withdrawal is simply not joining the ‖.
 *
 * pte oyáte (the buffalo nation) and the four-leggeds, wingeds, and standing-ones are
 * also oyáte (mitakuye oyasin): the political category and the cosmological category are
 * CONTINUOUS, not separable. This is not metaphor — the same word names a band of people
 * and a nation of buffalo because they are the same kind of relational whole.
 *
 * This module does not posit any of these scales — it DERIVES each from the organizing
 * substrate it fibers, mounting a Lakota seed at the social boundary and reading back the
 * substrate's own community/institution/federation verdict. The mapping of scale to
 * organizing carrier is the only free choice, and it is the captain's.
 */
import { community, institute, federate, } from "@emsenn/organizing";
/** Read a kin seed as a thiyóšpaye — the basic band, derived as an organizing community. */
export function tiyospaye(seed) {
    const boundary = { socializing: seed };
    return Object.freeze({
        kind: "organizing-as-lakota.tiyospaye",
        scale: "band",
        community: community(boundary),
        kinshipIsPolitics: true,
    });
}
/** Read a seed as an oyáte — a people, derived as an organizing institution. */
export function oyate(seed) {
    const boundary = { socializing: seed };
    const institution = institute(boundary);
    return Object.freeze({
        kind: "organizing-as-lakota.oyate",
        scale: "people",
        institution,
        glued: institution.glued,
    });
}
/**
 * Read several band seeds as the Očhéthi Šakówiŋ — the confederacy, derived as the
 * organizing federation (parallel composition) of the bands. Each band becomes a cover
 * at the social boundary; federate combines them, and the consensus-by-withdrawal
 * doctrine is the reading that membership in the ‖ is voluntary.
 */
export function ocetiSakowin(bands) {
    const covers = bands.map((band) => ({ socializing: band }));
    const federation = federate(covers);
    return Object.freeze({
        kind: "organizing-as-lakota.oceti-sakowin",
        scale: "confederacy",
        federation,
        consensusByWithdrawal: true,
        glued: federation.glued,
    });
}
//# sourceMappingURL=oyate.mjs.map