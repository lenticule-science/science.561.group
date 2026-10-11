import csv, importlib.util, pathlib, pytest
ROOT=pathlib.Path(__file__).parent
spec=importlib.util.spec_from_file_location("fc", ROOT/"flowcell_fc1_hydrodynamic_model_v0_1.py"); fc=importlib.util.module_from_spec(spec); spec.loader.exec_module(fc)

def test_negative_speed_refused_across_load_functions():
    for f in (fc.available_hydraulic_power,fc.electrical_power,fc.rotor_thrust,fc.rotor_rpm,fc.rotor_shaft_torque):
        with pytest.raises(ValueError): f(-1)

def test_invalid_eta_refused_not_mapped_to_zero_load():
    with pytest.raises(ValueError): fc.operating_cp_under_export_cap(4.5,eta=0)
    with pytest.raises(ValueError): fc.deloaded_shaft_torque_for_export_cap(4.5,eta=0)

def test_current_power_curve_matches_model_to_declared_rounding():
    rows=list(csv.DictReader(open(ROOT/"flowcell_fc1_power_curve_v0_1.csv")))
    assert len(rows)==17
    for row in rows:
        v=float(row["water_speed_m_s"])
        assert float(row["freshwater_electrical_power_W"])==pytest.approx(fc.electrical_power(v),abs=.11)
        assert float(row["freshwater_rotor_thrust_N"])==pytest.approx(fc.rotor_thrust(v),abs=.11)
        assert float(row["freshwater_rotor_shaft_torque_Nm"])==pytest.approx(fc.rotor_shaft_torque(v),abs=.011)
        assert float(row["freshwater_export_equivalent_torque_Nm"])==pytest.approx(fc.export_equivalent_torque(v),abs=.011)
        assert float(row["freshwater_operating_cp_under_export_cap"])==pytest.approx(fc.operating_cp_under_export_cap(v),abs=.00011)
        assert float(row["seawater_electrical_power_W"])==pytest.approx(fc.electrical_power(v,fc.RHO_SW),abs=.11)
        assert float(row["seawater_rotor_thrust_N"])==pytest.approx(fc.rotor_thrust(v,fc.RHO_SW),abs=.11)
        assert float(row["target_rpm_at_TSR4"])==pytest.approx(fc.rotor_rpm(v),abs=.11)
        assert float(row["freshwater_fixed_cp_excess_mechanical_W"])==pytest.approx(fc.excess_captured_mechanical_power(v),abs=.11)
        assert float(row["freshwater_deloaded_shaft_torque_for_export_cap_Nm"])==pytest.approx(fc.deloaded_shaft_torque_for_export_cap(v),abs=.011)


def test_efficiency_above_one_is_refused():
    for f in (fc.uncapped_electrical_power, fc.operating_cp_under_export_cap, fc.excess_captured_mechanical_power, fc.deloaded_shaft_torque_for_export_cap):
        with pytest.raises(ValueError, match="<= 1"):
            f(3.0,eta=1.01)

def test_export_cap_cp_is_baseline_below_rated_and_deloaded_above_rated():
    assert fc.operating_cp_under_export_cap(2.5)==pytest.approx(fc.CP)
    assert fc.operating_cp_under_export_cap(4.5) < fc.CP
    assert fc.cp_required_for_export_cap(4.5)==pytest.approx(fc.operating_cp_under_export_cap(4.5))

def test_cp_above_one_is_refused_as_physically_invalid_fraction():
    with pytest.raises(ValueError,match="<= 1"):
        fc.captured_mechanical_power(2.0,cp=1.01)


def test_operating_cp_under_export_cap_stays_in_declared_physical_interval():
    for v in (0,0.5,1.0,2.5,3.0,4.5,8.0):
        cp=fc.operating_cp_under_export_cap(v)
        assert 0 <= cp <= fc.CP <= 1


def test_tidal_average_is_zero_when_peak_never_reaches_cut_in():
    assert fc.idealized_tidal_average_power(0.99,samples=1000)==pytest.approx(0.0)


def test_tidal_average_sample_count_fails_closed():
    for bad in (True,3,3.5,"100"):
        with pytest.raises(ValueError,match="integer >= 4"):
            fc.idealized_tidal_average_power(2.0,samples=bad)


def test_fixed_cp_power_accounting_closes_across_current_curve():
    rows=list(csv.DictReader(open(ROOT/"flowcell_fc1_power_curve_v0_1.csv")))
    for row in rows:
        v=float(row["water_speed_m_s"])
        captured=fc.captured_mechanical_power(v)
        export_shaft=fc.electrical_power(v)/fc.ETA
        excess=fc.excess_captured_mechanical_power(v)
        assert captured==pytest.approx(export_shaft+excess, rel=1e-12, abs=1e-12)


def test_deloaded_torque_reconstructs_required_export_shaft_power():
    for v in (1.0, 2.5, 3.0, 4.5, 8.0):
        rpm=fc.rotor_rpm(v)
        omega=2*3.141592653589793*rpm/60
        tau=fc.deloaded_shaft_torque_for_export_cap(v)
        assert tau*omega==pytest.approx(fc.electrical_power(v)/fc.ETA, rel=1e-12, abs=1e-12)


def test_physical_inputs_reject_boolean_and_numeric_string_coercion():
    for bad in (True,"2.0"):
        with pytest.raises(ValueError, match="without coercion"):
            fc.available_hydraulic_power(bad)
        with pytest.raises(ValueError, match="without coercion"):
            fc.rotor_thrust(2.0,rho=bad)
        with pytest.raises(ValueError, match="without coercion"):
            fc.captured_mechanical_power(2.0,cp=bad)


def test_power_curve_sampling_axis_is_unique_strictly_increasing_and_indexed():
    rows=list(csv.DictReader(open(ROOT/"flowcell_fc1_power_curve_v0_1.csv")))
    speeds=[float(r["water_speed_m_s"]) for r in rows]
    indices=[int(r["index"]) for r in rows]
    assert indices==list(range(len(rows)))
    assert len(set(speeds))==len(speeds)
    assert all(a < b for a,b in zip(speeds,speeds[1:]))


def test_power_curve_numeric_outputs_are_finite_nonnegative_and_respect_declared_caps():
    import math
    rows=list(csv.DictReader(open(ROOT/"flowcell_fc1_power_curve_v0_1.csv")))
    numeric=[h for h in rows[0] if h != "index"]
    for row in rows:
        parsed={h:float(row[h]) for h in numeric}
        assert all(math.isfinite(v) and v >= 0 for v in parsed.values())
        assert parsed["freshwater_electrical_power_W"] <= fc.P_RATED + 1e-9
        assert parsed["seawater_electrical_power_W"] <= fc.P_RATED + 1e-9
        assert 0 <= parsed["freshwater_operating_cp_under_export_cap"] <= fc.CP + 1e-9


def test_tsr4_serialized_column_is_bound_to_model_tsr_constant():
    assert fc.TSR==pytest.approx(4.0), "CSV header target_rpm_at_TSR4 requires regenerating the dataset if TSR changes"


def test_invalid_physical_parameters_are_refused_even_below_cut_in():
    with pytest.raises(ValueError, match="density"):
        fc.captured_mechanical_power(0.0, rho=-1.0)
    with pytest.raises(ValueError, match="diameter"):
        fc.captured_mechanical_power(0.0, d=0.0)
    with pytest.raises(ValueError, match="density"):
        fc.electrical_power(0.0, rho=0.0)
    with pytest.raises(ValueError, match="density"):
        fc.operating_cp_under_export_cap(0.0, rho=float("nan"))


def test_fmea_preserves_turbulence_site_extrapolation_boundary():
    text=(ROOT/"flowcell_fc1_requirements_fmea_v0_1.md").read_text()
    assert "HYD-011" in text
    assert "turbulence intensity" in text
    assert "Steady-flow Cp/control results shall not be generalized" in text
    assert "10.1103/mg6l-ch54" in text
    assert "10.1016/j.oceaneng.2025.123272" in text


def test_tidal_average_closed_form_is_a_reference_oracle_for_the_screening_law():
    assert fc.idealized_tidal_average_power_closed_form(0.99)==pytest.approx(0.0)
    assert fc.idealized_tidal_average_power_closed_form(1.01)==pytest.approx(4.198851124061887, rel=1e-12)
    assert fc.idealized_tidal_average_power_closed_form(3.0)==pytest.approx(521.0649922531888, rel=1e-12)
    assert fc.idealized_tidal_average_power_closed_form(8.0)==pytest.approx(983.1159578806992, rel=1e-12)


def test_underresolved_tidal_quadrature_is_refused_instead_of_publishing_grid_artifact():
    for peak,samples in ((1.01,4),(4.5,8),(8.0,16)):
        with pytest.raises(ValueError, match="sampling resolution insufficient"):
            fc.idealized_tidal_average_power(peak,samples=samples)


def test_default_tidal_quadrature_agrees_with_closed_form_oracle():
    for peak in (1.01,1.5,3.0,4.5,8.0):
        sampled=fc.idealized_tidal_average_power(peak)
        exact=fc.idealized_tidal_average_power_closed_form(peak)
        assert sampled==pytest.approx(exact, rel=1e-3, abs=.01)


def test_fmea_preserves_blockage_and_reynolds_scale_transfer_boundary():
    text=(ROOT/"flowcell_fc1_requirements_fmea_v0_1.md").read_text()
    assert "HYD-012" in text
    assert "blockage ratio" in text
    assert "Reynolds-number range" in text
    assert "shall not be promoted to full-scale values" in text
    assert "10.36688/imej.8.101-108" in text
    assert "10.3390/jmse14100893" in text


def test_torque_interfaces_validate_density_even_at_zero_speed():
    for fn in (fc.rotor_shaft_torque, fc.export_equivalent_torque, fc.deloaded_shaft_torque_for_export_cap):
        for bad in (0.0, -1.0, float("nan"), True, "1025"):
            with pytest.raises(ValueError, match="density"):
                fn(0.0, rho=bad)


def test_fmea_preserves_wave_current_submergence_fatigue_transfer_boundary():
    text=(ROOT/"flowcell_fc1_requirements_fmea_v0_1.md").read_text()
    assert "HYD-013" in text
    assert "combined wave-current" in text
    assert "submergence" in text
    assert "steady-current evidence alone" in text
    assert "10.1007/s40722-026-00511-3" in text
    assert "10.1016/j.energy.2026.141232" in text


def test_fmea_preserves_bidirectional_misalignment_and_foundation_shadow_boundary():
    text=(ROOT/"flowcell_fc1_requirements_fmea_v0_1.md").read_text()
    assert "HYD-014" in text
    assert "flood/ebb flow-direction misalignment" in text
    assert "support/foundation shadowing" in text
    assert "Aligned free-stream Cp/Ct shall not be generalized" in text
    assert "10.1016/j.oceaneng.2026.125873" in text