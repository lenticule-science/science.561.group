R = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c][lam];
-- lam is now the polynomial-ring generator over the coefficient ring

Q0 = matrix {{a11_R, a12_R}, {a12_R, a22_R}};
Q1 = matrix {{b11_R, b12_R, b13_R}, {b12_R, b22_R, b23_R}, {b13_R, b23_R, b33_R}};
Q2 = matrix {{c_R}};

d1 = matrix {{1_R, 0_R, 0_R}, {0_R, 1_R, 0_R}};
d2 = matrix {{0_R}, {0_R}, {1_R}};

-- Generalized pencils
P_sig = transpose(d1) * Q0 * d1 - lam * Q1;
sigPoly = det P_sig;

P_tau = transpose(d2) * Q1 * d2 - lam * Q2;
tauPoly = det P_tau;

-- sigPoly should factor as lam * (quadratic)
sigPolyDivLam = sigPoly // lam;

-- Extract coefficients of lam^0, lam^1, lam^2
c1 = coefficient(1_R * lam^0, sigPolyDivLam);
c2 = coefficient(1_R * lam^1, sigPolyDivLam);
c3 = coefficient(1_R * lam^2, sigPolyDivLam);

print "c1 (constant):"; print c1;
print "c2 (lam):"; print c2;
print "c3 (lam^2):"; print c3;

print "";
print "tauPoly = (b33 - lam*c):";
print tauPoly;

-- For tau:  b33 - lam * c, root tau^2 = b33/c
tau_eq_lam = b33_R - lam * c_R;

-- DISCRIMINANT condition (sigma_1^2 = sigma_2^2): c2^2 - 4*c1*c3 = 0
disc = c2^2 - 4*c1*c3;
print "";
print "Discriminant c2^2 - 4 c1 c3 (defines Pi_A: sigma_1 = sigma_2):";
print disc;

exit
