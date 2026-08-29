import { readFileSync } from 'node:fs';
import Ajv2020 from 'ajv/dist/2020.js';
import addFormats from 'ajv-formats';

const schema = JSON.parse(
  readFileSync(new URL('../sending-parameters-to-a-script.schema.json', import.meta.url), 'utf8'),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats(ajv);
const validateInput = ajv.compile(schema.properties.input);
const validateOutput = ajv.compile({ ...schema.properties.output, $defs: schema.$defs });

export default async function sendParametersToAScript({ scriptPath, parameters }) {
  const input = { scriptPath, parameters: parameters || {} };
  if (!validateInput(input)) {
    throw new TypeError(
      'sending-parameters-to-a-script: input violates schema: ' +
        ajv.errorsText(validateInput.errors),
    );
  }
  const params = input.parameters;
  const { default: scriptFn } = await import(`file://${input.scriptPath}`);
  if (typeof scriptFn !== 'function') {
    throw new TypeError(`script at ${input.scriptPath} does not default-export a function`);
  }
  const returnValue = await scriptFn(params);
  const output = {
    scriptPath: input.scriptPath,
    parameters: params,
    'return-value': returnValue,
    'sent-at': new Date().toISOString(),
  };
  if (!validateOutput(output)) {
    throw new Error(
      'sending-parameters-to-a-script: output violates schema: ' +
        ajv.errorsText(validateOutput.errors),
    );
  }
  return output;
}
