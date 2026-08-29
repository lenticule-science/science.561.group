import { readFileSync } from 'node:fs';
import Ajv2020 from 'ajv/dist/2020.js';
import addFormats from 'ajv-formats';

const sendSchema = JSON.parse(
  readFileSync(
    new URL(
      '../../../parameters/sending-parameters-to-a-script/sending-parameters-to-a-script.schema.json',
      import.meta.url,
    ),
    'utf8',
  ),
);
const schema = JSON.parse(
  readFileSync(new URL('../receiving-a-message-from-a-script.schema.json', import.meta.url), 'utf8'),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats(ajv);
ajv.addSchema(sendSchema, sendSchema.$id);
const validateInput = ajv.compile(schema.properties.input);
const validateOutput = ajv.compile(schema.properties.output);

export default async function receiveAMessageFromAScript({ sendResult }) {
  const input = { sendResult };
  if (!validateInput(input)) {
    throw new TypeError(
      'receiving-a-message-from-a-script: input violates schema: ' +
        ajv.errorsText(validateInput.errors),
    );
  }
  const { scriptPath, parameters, 'return-value': returnValue, 'sent-at': sentAt } = sendResult;

  const output = {
    scriptPath,
    parameters: parameters || {},
    'return-value': returnValue,
    'sent-at': sentAt || null,
    'received-at': new Date().toISOString(),
  };
  if (!validateOutput(output)) {
    throw new Error(
      'receiving-a-message-from-a-script: output violates schema: ' +
        ajv.errorsText(validateOutput.errors),
    );
  }
  return output;
}
