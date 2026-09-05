import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";
import test from "node:test";
import { deriveSetOfNwsTemperatureForecasts } from "../scripts/derive-set-of-nws-temperature-forecasts.mjs";

const examples = [
  {
    "type": "JavascriptNodeOperationExample",
    "name": "empty brackets returns no derivations",
    "input": {
      "cityStations": [
        {
          "city": "nyc",
          "gridId": "OKX",
          "gridX": 33,
          "gridY": 42
        }
      ],
      "brackets": [],
      "asOf": "2026-09-04T12:00:00.000Z"
    },
    "output": []
  },
  {
    "type": "JavascriptNodeOperationExample",
    "name": "empty brackets and empty cityStations still returns no derivations",
    "input": {
      "cityStations": [],
      "brackets": [],
      "asOf": "2026-09-04T12:00:00.000Z"
    },
    "output": []
  }
];

for (const example of examples) {
  test(example.name, async () => {
    const importedOutput = await deriveSetOfNwsTemperatureForecasts(example.input);
    assert.deepEqual(importedOutput, example.output);
    const command = spawnSync(process.execPath, [fileURLToPath(new URL("../scripts/derive-set-of-nws-temperature-forecasts.mjs", import.meta.url))], {
      input: JSON.stringify(example.input) + "\n",
      encoding: "utf8",
    });
    assert.equal(command.status, 0, command.stderr);
    const commandOutput = JSON.parse(command.stdout.trim());
    assert.deepEqual(commandOutput, example.output);
    assert.deepEqual(commandOutput, importedOutput);
  });
}
