import json
import numpy as np


def fit_ols(X, y):
    X1 = np.column_stack([np.ones(len(X)), X])
    beta, *_ = np.linalg.lstsq(X1, y, rcond=None)
    return beta


def pred(beta, X):
    X1 = np.column_stack([np.ones(len(X)), X])
    return X1 @ beta


def mse(y, yh):
    return float(np.mean((y - yh) ** 2))


def run_one(n=4000, endpoint_noise=1.0, direct_history=0.0, seed=0):
    rng = np.random.default_rng(seed)
    history = rng.choice([-1.0, 1.0], size=n)  # -1=BA, +1=AB
    baseline = rng.normal(size=n)

    # Ordinary hidden-state memory: order shapes a latent final microstate.
    latent_endpoint = (
        0.8 * baseline
        + 0.9 * history
        + rng.normal(scale=0.35, size=n)
    )
    measured_endpoint = (
        latent_endpoint + rng.normal(scale=endpoint_noise, size=n)
    )

    # direct_history is zero under endpoint sufficiency. A nonzero value
    # represents residual history information not captured by measured state.
    response = (
        1.4 * latent_endpoint
        + direct_history * history
        + rng.normal(scale=0.7, size=n)
    )

    idx = rng.permutation(n)
    train, test = idx[: n // 2], idx[n // 2 :]

    endpoint_model = fit_ols(measured_endpoint[train, None], response[train])
    history_model = fit_ols(
        np.column_stack([measured_endpoint[train], history[train]]),
        response[train],
    )

    e0 = mse(response[test], pred(endpoint_model, measured_endpoint[test, None]))
    e1 = mse(
        response[test],
        pred(
            history_model,
            np.column_stack([measured_endpoint[test], history[test]]),
        ),
    )
    return {
        "mse_endpoint": e0,
        "mse_plus_history": e1,
        "relative_gain": (e0 - e1) / e0,
        "history_coef": float(history_model[-1]),
    }


def summarize(endpoint_noise, direct_history, reps=120):
    vals = [
        run_one(
            endpoint_noise=endpoint_noise,
            direct_history=direct_history,
            seed=10000 + i,
        )
        for i in range(reps)
    ]

    def stats(key):
        x = np.array([v[key] for v in vals])
        return {
            "mean": float(x.mean()),
            "q05": float(np.quantile(x, 0.05)),
            "q95": float(np.quantile(x, 0.95)),
        }

    return {
        "endpoint_noise": endpoint_noise,
        "direct_history": direct_history,
        "relative_gain": stats("relative_gain"),
        "history_coef": stats("history_coef"),
    }


if __name__ == "__main__":
    rows = []
    for direct_history in [0.0, 0.35]:
        for endpoint_noise in [2.0, 1.0, 0.5, 0.2, 0.05, 0.0]:
            rows.append(summarize(endpoint_noise, direct_history))

    print(
        json.dumps(
            {
                "assay": "ordered-history vs endpoint-sufficiency synthetic falsifier",
                "interpretation_rule": (
                    "A history advantage that collapses as endpoint measurement improves "
                    "supports ordinary hidden-state memory. A material advantage persisting "
                    "with exact endpoint measurement falsifies endpoint sufficiency for the "
                    "stated state description and motivates missing-state search or an "
                    "explicit history variable; it does not establish metaphysical claims."
                ),
                "results": rows,
            },
            indent=2,
        )
    )
