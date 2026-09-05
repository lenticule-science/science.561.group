"""local_llm.py — Shared client for local LLM backends (Ollama + Foundry).

Provides a unified interface over the OpenAI-compatible /v1/chat/completions
endpoint that both Ollama and Foundry Local expose.

Usage:
    from local_llm import complete, is_available, suggest_model

    if is_available():
        result = complete(
            messages=[
                {"role": "system", "content": "You classify documents."},
                {"role": "user", "content": file_content},
            ],
            model="qwen2.5:3b",
        )
        print(result["response"])

Environment variables:
    OLLAMA_URL      — Ollama base URL (default: http://localhost:11434)
    OLLAMA_MODEL    — Default model for Ollama (default: qwen2.5:3b)
    FOUNDRY_URL     — Foundry Local base URL (default: http://127.0.0.1:56805)
    LLM_BACKEND     — Force a specific backend: "ollama" or "foundry"
    LLM_DISABLED    — Set to "1" to disable all local LLM calls
"""

import json
import os
import re
import urllib.request
import urllib.error
from typing import Any


# ── Configuration ─────────────────────────────────────────────────

OLLAMA_URL = os.environ.get("OLLAMA_URL", "http://localhost:11434")
OLLAMA_MODEL = os.environ.get("OLLAMA_MODEL", "qwen2.5:3b")
FOUNDRY_URL = os.environ.get("FOUNDRY_URL", "http://127.0.0.1:56805")
FORCED_BACKEND = os.environ.get("LLM_BACKEND", "").lower()
LLM_DISABLED = os.environ.get("LLM_DISABLED", "") == "1"

# Probe timeout for backend discovery (seconds)
DISCOVERY_TIMEOUT = 2.0


# ── Backend state (cached after first discovery) ──────────────────

_discovery_done = False
_ollama_available = False
_ollama_models: list[str] = []
_foundry_available = False
_foundry_models: list[str] = []


def _probe_json(url: str, timeout: float = DISCOVERY_TIMEOUT) -> Any | None:
    """GET a URL and return parsed JSON, or None on failure."""
    try:
        req = urllib.request.Request(url, method="GET")
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return json.loads(resp.read())
    except Exception:
        return None


def _discover() -> None:
    """Probe backends once and cache the results."""
    global _discovery_done, _ollama_available, _ollama_models
    global _foundry_available, _foundry_models

    if _discovery_done:
        return
    _discovery_done = True

    if LLM_DISABLED:
        return

    # Probe Ollama
    if FORCED_BACKEND in ("", "ollama"):
        data = _probe_json(f"{OLLAMA_URL}/api/tags")
        if data and "models" in data:
            _ollama_available = True
            _ollama_models = [m["name"] for m in data["models"]]

    # Probe Foundry
    if FORCED_BACKEND in ("", "foundry"):
        data = _probe_json(f"{FOUNDRY_URL}/v1/models")
        if data:
            models = data.get("data", [])
            if isinstance(models, list) and models:
                _foundry_available = True
                _foundry_models = [
                    m["id"] if isinstance(m, dict) else str(m)
                    for m in models
                ]
            # Also try simpler endpoint
            if not _foundry_models:
                simple = _probe_json(f"{FOUNDRY_URL}/openai/models")
                if isinstance(simple, list) and simple:
                    _foundry_available = True
                    _foundry_models = [str(m) for m in simple]


# ── Public API ────────────────────────────────────────────────────

def is_available() -> bool:
    """True if at least one LLM backend is reachable."""
    _discover()
    return _ollama_available or _foundry_available


def available_backends() -> list[str]:
    """Return list of available backend names."""
    _discover()
    result = []
    if _ollama_available:
        result.append("ollama")
    if _foundry_available:
        result.append("foundry")
    return result


def available_models() -> dict[str, list[str]]:
    """Return {backend_name: [model_names]} for all available backends."""
    _discover()
    result = {}
    if _ollama_available:
        result["ollama"] = list(_ollama_models)
    if _foundry_available:
        result["foundry"] = list(_foundry_models)
    return result


def suggest_model(task: str = "classification") -> str:
    """Suggest the best available model for a task type.

    Task types:
        "classification" — simple labeling, scoring, tagging (fast, small ok)
        "generation"     — producing prose, definitions, summaries (quality matters)
        "extraction"     — structured output from text (balance of speed and quality)

    Prefers NPU (Foundry) models when available for speed and power efficiency.
    Falls back to Ollama models ordered by suitability for the task.
    """
    _discover()

    # Task-specific preference order (short/Ollama-style names).
    # Checked against both Foundry and Ollama — Foundry match wins
    # because NPU is faster and frees the CPU.
    preference_order = {
        "classification": [
            "phi4-mini", "qwen2.5:3b", "qwen3:1.7b", "llama3.2:3b",
            "gemma3:4b", "qwen3:4b", "qwen2.5:7b",
        ],
        "generation": [
            "qwen2.5:7b", "mistral-7b", "deepseek-r1-7b", "qwen3:8b",
            "gemma3:12b", "gemma3:4b", "qwen3:4b", "qwen2.5:3b", "phi4-mini",
        ],
        "extraction": [
            "phi4-mini", "qwen2.5:7b", "mistral-7b", "qwen2.5:3b", "qwen3:4b",
            "gemma3:4b", "llama3.2:3b",
        ],
        "reasoning": [
            "deepseek-r1-7b", "qwen2.5:7b", "mistral-7b", "gemma3:12b",
            "qwen3:8b", "phi4-mini",
        ],
        # long-context: prefer models with large context windows (128k+)
        # for tasks like summarizing large files before enrichment.
        "long-context": [
            "phi-3-mini-128k", "qwen2.5:7b", "qwen2.5:3b", "phi4-mini",
        ],
    }

    order = preference_order.get(task, preference_order["classification"])

    # Walk the preference list, checking Foundry first (NPU), then Ollama
    for model in order:
        # Check Foundry (NPU — preferred for speed and power)
        foundry_match = _find_foundry_model(model)
        if foundry_match:
            return foundry_match
        # Check Ollama (with and without :latest tag)
        if _ollama_available:
            if model in _ollama_models:
                return model
            if f"{model}:latest" in _ollama_models:
                return f"{model}:latest"

    # Nothing matched preference list — return first available from either backend
    if _foundry_available and _foundry_models:
        return _foundry_models[0]
    if _ollama_available and _ollama_models:
        return _ollama_models[0]

    return OLLAMA_MODEL  # fallback to configured default


def _normalize_for_matching(name: str) -> str:
    """Collapse a model name for fuzzy matching.

    Handles colon-tags: size tags like ':7b' are kept (part of identity),
    but metadata tags like ':latest' and Foundry versions like ':2' are
    stripped. Then strips Foundry suffixes and collapses separators.

    E.g. 'DeepSeek-R1-Distill-Qwen-7B-vitis-npu:1' → 'deepseekr17b'
         'deepseek-r1:7b'                           → 'deepseekr17b'
         'phi4-mini:latest'                          → 'phi4mini'
    """
    s = name.lower()
    # Handle colon-tag: keep size tags (e.g. :7b, :0.5b), strip others
    if ":" in s:
        base, tag = s.rsplit(":", 1)
        if re.match(r"^\d+\.?\d*b$", tag):
            # Size tag — merge into base with hyphen
            s = f"{base}-{tag}"
        else:
            # Metadata tag (:latest, :2, etc.) — discard
            s = base
    # Strip Foundry hardware/packaging suffixes
    for suffix in ["-vitis", "-npu", "-qnn", "-instruct", "-generic"]:
        if suffix in s:
            s = s[:s.index(suffix)]
    # Strip -distill-<vendor> patterns (e.g. -distill-qwen)
    s = re.sub(r"-distill-\w+", "", s)
    return s.replace("-", "").replace(".", "")


def _find_foundry_model(model: str) -> str | None:
    """Check if a model (by Ollama name or Foundry name) is on Foundry.

    Foundry model names look like 'phi-4-mini-instruct-vitis-npu:2'.
    Matches by normalizing both sides so Ollama names like 'qwen2.5:7b'
    find their Foundry equivalent 'qwen2.5-7b-instruct-vitis-npu:2'.
    """
    if not _foundry_available:
        return None

    if model in _foundry_models:
        return model

    norm_input = _normalize_for_matching(model)
    for fm in _foundry_models:
        if _normalize_for_matching(fm) == norm_input:
            return fm

    return None


def _call_openai_compatible(
    base_url: str,
    messages: list[dict],
    model: str,
    temperature: float,
    max_tokens: int,
    timeout: int,
) -> dict:
    """Call an OpenAI-compatible /v1/chat/completions endpoint."""
    payload = json.dumps({
        "model": model,
        "messages": messages,
        "temperature": temperature,
        "max_tokens": max_tokens,
        "stream": False,
    }).encode()

    req = urllib.request.Request(
        f"{base_url}/v1/chat/completions",
        data=payload,
        headers={"Content-Type": "application/json"},
        method="POST",
    )

    with urllib.request.urlopen(req, timeout=timeout) as resp:
        body = json.loads(resp.read())

    # Extract the response text from the OpenAI-compatible format
    choices = body.get("choices", [])
    if choices:
        # Handle both 'message' and 'delta' (Foundry uses both)
        choice = choices[0]
        msg = choice.get("message", choice.get("delta", {}))
        return msg.get("content", "")
    return ""


def complete(
    messages: list[dict],
    model: str = "",
    temperature: float = 0.3,
    max_tokens: int = 1024,
    timeout: int = 120,
) -> dict:
    """Send a chat completion request to the best available backend.

    Args:
        messages: OpenAI-format messages [{role, content}, ...]
        model: Model name (Ollama convention). Empty = use default.
        temperature: Sampling temperature (default 0.3 for determinism).
        max_tokens: Maximum tokens to generate.
        timeout: Request timeout in seconds.

    Returns:
        {
            "response": str,     # The generated text
            "model": str,        # Model name that was used
            "backend": str,      # "ollama" or "foundry"
            "error": str | None  # Error message, or None on success
        }
    """
    _discover()

    if LLM_DISABLED:
        return {
            "response": "",
            "model": model,
            "backend": "none",
            "error": "Local LLM disabled (LLM_DISABLED=1)",
        }

    if not is_available():
        return {
            "response": "",
            "model": model,
            "backend": "none",
            "error": "No local LLM backend available. Install Ollama or Foundry Local.",
        }

    model = model or OLLAMA_MODEL

    # Try Foundry first if the model is available there (NPU = faster, lower power)
    foundry_model = _find_foundry_model(model)
    if foundry_model and (FORCED_BACKEND in ("", "foundry")):
        try:
            text = _call_openai_compatible(
                FOUNDRY_URL, messages, foundry_model,
                temperature, max_tokens, timeout,
            )
            return {
                "response": text,
                "model": foundry_model,
                "backend": "foundry",
                "error": None,
            }
        except Exception as e:
            # Foundry failed — fall through to Ollama
            if FORCED_BACKEND == "foundry":
                return {
                    "response": "",
                    "model": foundry_model,
                    "backend": "foundry",
                    "error": f"Foundry error: {e}",
                }

    # Try Ollama
    if _ollama_available and (FORCED_BACKEND in ("", "ollama")):
        # If model is a Foundry name (e.g. phi-4-mini-instruct-vitis-npu:2),
        # find the matching Ollama name before sending the request.
        ollama_model = model
        if model not in _ollama_models and f"{model}:latest" not in _ollama_models:
            norm = _normalize_for_matching(model)
            for om in _ollama_models:
                if _normalize_for_matching(om) == norm:
                    ollama_model = om
                    break
        try:
            text = _call_openai_compatible(
                OLLAMA_URL, messages, ollama_model,
                temperature, max_tokens, timeout,
            )
            return {
                "response": text,
                "model": ollama_model,
                "backend": "ollama",
                "error": None,
            }
        except Exception as e:
            return {
                "response": "",
                "model": model,
                "backend": "ollama",
                "error": f"Ollama error: {e}",
            }

    return {
        "response": "",
        "model": model,
        "backend": "none",
        "error": f"Model '{model}' not available on any backend",
    }
