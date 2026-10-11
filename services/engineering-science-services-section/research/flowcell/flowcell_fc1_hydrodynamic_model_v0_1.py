"""FlowCell FC-1 screening hydrodynamic model v0.1.

This is a pre-CFD / pre-flume engineering model, not a certification model.
Replace Cp, Ct, operating limits, and site distributions with measured data as
soon as tests exist.
"""
import math
import numpy as np

D = 0.60
RHO_FW = 1000.0
RHO_SW = 1025.0
CP = 0.36
ETA = 0.88
CT = 0.80
TSR = 4.0
P_RATED = 1200.0
V_CUT_IN = 1.0


def _strict_number(name, value):
    if isinstance(value, (bool, np.bool_)) or not isinstance(value, (int, float, np.integer, np.floating)):
        raise ValueError(f"{name} must be numeric without coercion")
    value = float(value)
    if not math.isfinite(value):
        raise ValueError(f"{name} must be finite")
    return value


def _nonnegative(name, value):
    value = _strict_number(name, value)
    if not math.isfinite(value) or value < 0:
        raise ValueError(f"{name} must be finite and nonnegative")
    return value


def _positive(name, value):
    value = _strict_number(name, value)
    if not math.isfinite(value) or value <= 0:
        raise ValueError(f"{name} must be finite and positive")
    return value


def _efficiency(name, value):
    value = _positive(name, value)
    if value > 1:
        raise ValueError(f"{name} must be <= 1")
    return value


def _fraction(name, value):
    value = _nonnegative(name, value)
    if value > 1:
        raise ValueError(f"{name} must be <= 1")
    return value


def area(d=D):
    d = _positive("diameter", d)
    return math.pi * d**2 / 4


def available_hydraulic_power(v, rho=RHO_FW, d=D):
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    return 0.5 * rho * area(d) * v**3


def captured_mechanical_power(v, rho=RHO_FW, d=D, cp=CP):
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    d = _positive("diameter", d)
    cp = _fraction("Cp", cp)
    if v < V_CUT_IN:
        return 0.0
    return available_hydraulic_power(v, rho, d) * cp


def uncapped_electrical_power(v, rho=RHO_FW, d=D, cp=CP, eta=ETA):
    eta = _efficiency("eta", eta)
    return captured_mechanical_power(v, rho, d, cp) * eta


def electrical_power(v, rho=RHO_FW):
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    if v < V_CUT_IN:
        return 0.0
    return min(uncapped_electrical_power(v, rho), P_RATED)


def rotor_thrust(v, rho=RHO_FW, d=D, ct=CT):
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    ct = _nonnegative("Ct", ct)
    return 0.5 * rho * area(d) * ct * v**2


def rotor_rpm(v, d=D, tsr=TSR):
    v = _nonnegative("speed", v)
    tsr = _nonnegative("TSR", tsr)
    return 60 * tsr * v / (math.pi * _positive("diameter", d))


def rotor_shaft_torque(v, rho=RHO_FW):
    """Aerodynamic-equivalent shaft torque if Cp and TSR stay at screening values."""
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    n = rotor_rpm(v)
    omega = 2 * math.pi * n / 60
    return 0.0 if omega == 0 else captured_mechanical_power(v, rho) / omega


def export_equivalent_torque(v, rho=RHO_FW):
    """Exported electrical power divided by modeled shaft speed; not shaft torque above rated."""
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    n = rotor_rpm(v)
    omega = 2 * math.pi * n / 60
    return 0.0 if omega == 0 else electrical_power(v, rho) / omega


def operating_cp_under_export_cap(v, rho=RHO_FW, eta=ETA):
    """Screening Cp setpoint under a rated-export limiter.

    Below rated this remains the baseline Cp; above rated it is the pure-aerodynamic
    deload Cp that would make captured shaft power just support the export cap.
    """
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    eta = _efficiency("eta", eta)
    if v < V_CUT_IN:
        return 0.0
    water = available_hydraulic_power(v, rho)
    return min(CP, P_RATED / (water * eta))


def cp_required_for_export_cap(v, rho=RHO_FW, eta=ETA):
    """Legacy alias for operating_cp_under_export_cap."""
    return operating_cp_under_export_cap(v, rho, eta)


def excess_captured_mechanical_power(v, rho=RHO_FW, eta=ETA):
    """Mechanical power captured beyond the capped-export shaft-power requirement."""
    v = _nonnegative("speed", v)
    eta = _efficiency("eta", eta)
    required_shaft_power = electrical_power(v, rho) / eta
    return max(0.0, captured_mechanical_power(v, rho) - required_shaft_power)


def deloaded_shaft_torque_for_export_cap(v, rho=RHO_FW, eta=ETA):
    """Shaft torque if pure deload makes captured power exactly support export."""
    v = _nonnegative("speed", v)
    rho = _positive("density", rho)
    eta = _efficiency("eta", eta)
    n = rotor_rpm(v)
    omega = 2 * math.pi * n / 60
    return 0.0 if omega == 0 else (electrical_power(v, rho) / eta) / omega


def torque(v, rho=RHO_FW):
    """Legacy alias for export_equivalent_torque; do not use for shaft sizing."""
    return export_equivalent_torque(v, rho)


def idealized_tidal_average_power_closed_form(v_peak, rho=RHO_SW):
    """Exact cycle-average screening power for the model's ideal sinusoidal tide.

    This is an internal numerical reference oracle for the same v^3/cut-in/rated-cap
    law used by ``electrical_power``.  It is not a site-energy-yield model: real
    current distributions, turbulence, directionality, downtime and control losses
    remain outside this idealization.
    """
    v_peak = _nonnegative("peak speed", v_peak)
    rho = _positive("density", rho)
    if v_peak <= V_CUT_IN:
        return 0.0

    coefficient = 0.5 * rho * area() * CP * ETA * v_peak**3
    theta0 = math.asin(V_CUT_IN / v_peak)

    def sin3_integral(a, b):
        # Integral sin(theta)^3 dtheta = -cos(theta) + cos(theta)^3 / 3.
        def primitive(theta):
            c = math.cos(theta)
            return -c + c**3 / 3
        return primitive(b) - primitive(a)

    uncapped_peak = coefficient
    if uncapped_peak <= P_RATED:
        quadrant = coefficient * sin3_integral(theta0, math.pi / 2)
    else:
        cap_ratio = (P_RATED / coefficient) ** (1 / 3)
        if cap_ratio <= V_CUT_IN / v_peak:
            quadrant = P_RATED * (math.pi / 2 - theta0)
        else:
            theta_cap = math.asin(min(1.0, cap_ratio))
            quadrant = (
                coefficient * sin3_integral(theta0, theta_cap)
                + P_RATED * (math.pi / 2 - theta_cap)
            )
    return (2 / math.pi) * quadrant


def idealized_tidal_average_power(v_peak, rho=RHO_SW, samples=100000):
    v_peak = _nonnegative("peak speed", v_peak)
    rho = _positive("density", rho)
    if not isinstance(samples, int) or isinstance(samples, bool) or samples < 4:
        raise ValueError("samples must be an integer >= 4")
    theta = np.linspace(0, 2*math.pi, samples, endpoint=False)
    speeds = np.abs(v_peak * np.sin(theta))
    raw = 0.5 * rho * area() * CP * ETA * speeds**3
    power = np.where(speeds >= V_CUT_IN, np.minimum(raw, P_RATED), 0.0)
    approximate = float(power.mean())
    exact = idealized_tidal_average_power_closed_form(v_peak, rho)
    tolerance = max(0.01, 1e-3 * max(1.0, exact))
    if abs(approximate - exact) > tolerance:
        raise ValueError("sampling resolution insufficient for declared tidal-average tolerance")
    return approximate