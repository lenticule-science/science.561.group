-- Bipartite distance-degree test on (2,1) chain complex.
-- Chain complex: C_0 = R^2, C_1 = R^3, C_2 = R^1
-- d_1 = [[1,0,0],[0,1,0]] (rank 2)
-- d_2 = [[0],[0],[1]] (rank 1, image in ker d_1)

R = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c, lam];

Q0 = matrix {{a11, a12}, {a12, a22}};
Q1 = matrix {{b11, b12, b13}, {b12, b22, b23}, {b13, b23, b33}};
Q2 = matrix {{c}};

d1 = matrix {{1_R, 0, 0}, {0, 1, 0}};
d2 = matrix {{0_R}, {0}, {1}};

-- Generalized eigenvalue pencil for sigma (eigenvalues of widetilde d_1^T widetilde d_1)
-- equivalently, generalized eigenvalues of (d_1^T Q_0 d_1, Q_1)
P_sig = transpose(d1) * Q0 * d1 - lam * Q1;
sigPoly = det P_sig;

-- Same for tau
P_tau = transpose(d2) * Q1 * d2 - lam * Q2;
tauPoly = det P_tau;

print "sigPoly (should factor as lam * quadratic):";
print sigPoly;
print "";
print "tauPoly:";
print tauPoly;
print "";
-- Factor out lam from sigPoly
sigPolyDivLam = sigPoly // lam;
print "sigPoly / lam (quadratic in lam, roots are sigma_1^2, sigma_2^2):";
print sigPolyDivLam;
print "";
-- Coefficients of the quadratic
print "Coefficient of lam^2 (= c_3):";
print coefficient(lam^2, sigPolyDivLam);
print "Coefficient of lam (= c_2):";
print coefficient(lam, sigPolyDivLam);
print "Constant term (= c_1):";
print substitute(sigPolyDivLam, lam => 0);
exit
