# Term description proposal service

This service proposes, but never seats, a glossary term's two-sentence `description` predicate. It accepts newline-delimited JSON requests and emits corresponding proposal or refusal records in the same order. It has no argument that identifies a Markdown term carrier.

```sh
export INFERENCE_OPENAI_COMPATIBLE_ENDPOINT='https://models.github.ai/inference/chat/completions'
export INFERENCE_OPENAI_COMPATIBLE_MODEL='your-enabled-model'
export INFERENCE_OPENAI_COMPATIBLE_API_KEY="$(gh auth token)"

printf '%s\n' '{"name":"computer file","aliases":["digital file"],"context":"data stored by a computer"}' \
  | node src/propose-term-descriptions.mjs --concurrency 2 --batch-size 20 --proposal-directory /tmp/term-proposals
```

`--github-models` is a convenience for the same OpenAI-compatible contract: it selects GitHub Models' endpoint, obtains `GITHUB_TOKEN` or `gh auth token`, and requires `--model` or `GITHUB_MODELS_MODEL`. Generic `--endpoint`, `--model`, and `--api-key-env` always override provider details.

NVIDIA remains compatible with the prior drafter: `API_KEY_INFERENCE_NVIDIA`, `INFERENCE_NVIDIA_ENDPOINT`, and `INFERENCE_NVIDIA_MODEL` select its existing endpoint and default model. The generic `INFERENCE_OPENAI_COMPATIBLE_*` variables take precedence.

`--batch-size` groups requests into one completion. It defaults to `20` for more than one request and `1` for a single request, so the current 2,582-term bucket takes roughly 130 inference calls rather than 2,582. A batch response must give one keyed description for every input; each is independently validated, while a malformed batch is repaired or refused as a batch. `--concurrency` bounds active requests; output order remains input order. `--max-retries` (default `2`) and `--retry-delay-ms` (default `250`) retry only network failures and HTTP 408/500/502/503/504 with exponential backoff. HTTP 429 is intentionally not retried: quota and rate refusals appear as refusals instead of being hidden.

The deterministic validator admits only a single `description` field with exactly two prose sentences. It recognizes common abbreviations, initialisms such as `U.S.`, and initials such as `J. R. R. Tolkien` while counting real sentence boundaries.
