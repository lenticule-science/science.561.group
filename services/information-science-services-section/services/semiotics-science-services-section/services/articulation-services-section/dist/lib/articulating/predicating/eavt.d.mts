import { type EavtRow } from "@red-cup-engineering/eavt";
import { type ChargeCarrier } from "./positing/bilattice-charge.mjs";
/** The raw operational terms projected from an admitted EAVT row. */
export interface Cell {
    readonly subject: EavtRow["e"];
    readonly predicate: EavtRow["a"];
    readonly object: EavtRow["v"];
}
/** Operational cell terms with their scientific evidence carrier. */
export interface ChargedCell {
    readonly cell: Cell;
    readonly charge: ChargeCarrier;
}
/**
 * Project one admitted positive EAVT assertion into its cell and witnessed charge.
 * @param row The canonical operational row.
 * @returns Cell terms and the unchanged transaction as positive evidence.
 * @throws {TypeError} When the row is not admitted by the EAVT owner.
 */
export declare function eavtToCell(row: EavtRow): ChargedCell;
/**
 * Project positive witnesses into canonical operational rows.
 * @param charged Operational terms and scientific charge.
 * @returns One row per positive witness, retaining its complete transaction.
 * @throws {TypeError} When negative evidence is present or a row is inadmissible.
 */
export declare function cellToEavt(charged: ChargedCell): EavtRow[];
//# sourceMappingURL=eavt.d.mts.map