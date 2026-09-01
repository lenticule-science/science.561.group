const registry = new Map();
function typeMatches(type, value) {
    if (type === "object")
        return value !== null && typeof value === "object" && !Array.isArray(value);
    if (type === "array")
        return Array.isArray(value);
    if (type === "integer")
        return typeof value === "number" && Number.isInteger(value);
    if (type === "number")
        return typeof value === "number" && Number.isFinite(value);
    if (type === "null")
        return value === null;
    return typeof value === type;
}
function validate(schema, value, path, errors, root) {
    const at = path || "/";
    const ref = schema.$ref;
    if (typeof ref === "string") {
        if (ref.startsWith("#/$defs/")) {
            const member = root.$defs?.[ref.slice(8)];
            return member === undefined || validate(member, value, path, errors, root);
        }
        return registry.get(ref)?.validate(value) ?? true;
    }
    if (Object.hasOwn(schema, "const")) {
        if (value === schema.const)
            return true;
        errors.push(`${at} must equal ${JSON.stringify(schema.const)}`);
        return false;
    }
    if (Array.isArray(schema.enum)) {
        if (schema.enum.includes(value))
            return true;
        errors.push(`${at} must be an admitted enum member`);
        return false;
    }
    const alternatives = (schema.anyOf ?? schema.oneOf);
    if (alternatives !== undefined) {
        if (alternatives.some((member) => validate(member, value, path, [], root)))
            return true;
        errors.push(`${at} matches no alternative`);
        return false;
    }
    const types = schema.type === undefined ? [] : Array.isArray(schema.type) ? schema.type : [schema.type];
    if (types.length > 0 && !types.some((type) => typeMatches(type, value))) {
        errors.push(`${at} must be ${types.join(" | ")}`);
        return false;
    }
    if (typeof value === "string" && typeof schema.minLength === "number" && value.length < schema.minLength) {
        errors.push(`${at} is too short`);
        return false;
    }
    if (typeof value === "number" && typeof schema.minimum === "number" && value < schema.minimum) {
        errors.push(`${at} is below its minimum`);
        return false;
    }
    if (Array.isArray(value) && schema.items !== undefined) {
        return value.every((member, index) => validate(schema.items, member, `${path}/${index}`, errors, root));
    }
    if (value !== null && typeof value === "object" && !Array.isArray(value)) {
        const record = value;
        const properties = (schema.properties ?? {});
        let okay = true;
        for (const key of (schema.required ?? []))
            if (!Object.hasOwn(record, key)) {
                errors.push(`${at}/${key} is required`);
                okay = false;
            }
        for (const [key, member] of Object.entries(properties))
            if (Object.hasOwn(record, key) && !validate(member, record[key], `${path}/${key}`, errors, root))
                okay = false;
        if (schema.additionalProperties === false)
            for (const key of Object.keys(record))
                if (!Object.hasOwn(properties, key)) {
                    errors.push(`${at}/${key} is not allowed`);
                    okay = false;
                }
        return okay;
    }
    return true;
}
export function carrierFrom(schema) {
    const root = schema;
    const carrier = Object.freeze({
        kind: "relating.carrier",
        id: schema.$id,
        schema: schema,
        validate: (value) => validate(root, value, "", [], root),
        assert: (value, context = schema.$id) => {
            const errors = [];
            if (validate(root, value, "", errors, root))
                return value;
            throw new TypeError(`${context}: ${errors.join("; ")}`);
        },
        errors: (value) => { const errors = []; validate(root, value, "", errors, root); return Object.freeze(errors); },
    });
    registry.set(carrier.id, carrier);
    return carrier;
}
//# sourceMappingURL=carrier.mjs.map