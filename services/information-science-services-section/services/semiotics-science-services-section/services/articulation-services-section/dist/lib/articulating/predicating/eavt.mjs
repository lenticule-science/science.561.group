import { assertRow } from "@red-cup-engineering/eavt";
import { mark } from "../utterance.mjs";
import { witnessedPotential } from "./positing/bilattice-charge.mjs";
/**
 * Project one admitted positive EAVT assertion into its cell and witnessed charge.
 * @param row The canonical operational row.
 * @returns Cell terms and the unchanged transaction as positive evidence.
 * @throws {TypeError} When the row is not admitted by the EAVT owner.
 */
export function eavtToCell(row) {
    assertRow(row);
    return { cell: { subject: row.e, predicate: row.a, object: row.v }, charge: witnessedPotential(mark(row.t)) };
}
/**
 * Project positive witnesses into canonical operational rows.
 * @param charged Operational terms and scientific charge.
 * @returns One row per positive witness, retaining its complete transaction.
 * @throws {TypeError} When negative evidence is present or a row is inadmissible.
 */
export function cellToEavt(charged) {
    if (charged.charge.value[1] || charged.charge.evidence[1].length > 0) {
        throw new TypeError("cellToEavt: negative evidence requires independentEvidenceRow");
    }
    const { subject: e, predicate: a, object: v } = charged.cell;
    return charged.charge.evidence[0].map((witness) => assertRow({ e, a, v, t: witness.value }));
}
//# sourceMappingURL=eavt.mjs.map