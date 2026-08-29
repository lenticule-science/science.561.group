-- V(Pi_T) = {sigma_1^2 = sigma_2^2 = tau_1^2}
-- Defined by: disc = 0  AND  c*c2 + 2*c3*b33 = 0
-- (the second equation says the sigma double-root equals tau^2 = b33/c)

S = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c];
R1 = S[lam];
P_sig = matrix {{a11 - lam*b11, a12 - lam*b12, -lam*b13},
                {a12 - lam*b12, a22 - lam*b22, -lam*b23},
                {-lam*b13, -lam*b23, -lam*b33}};
sigPoly = det P_sig;
(monos, coefs) = coefficients(sigPoly);
c1Poly = sub(coefs_(2,0), S);
c2Poly = sub(coefs_(1,0), S);
c3Poly = sub(coefs_(0,0), S);

f1 = c2Poly^2 - 4*c1Poly*c3Poly;       -- disc = 0 (sigma double root)
f2 = c*c2Poly + 2*c3Poly*b33;          -- sigma double root = tau^2

<< "deg f1 = " << first degree f1 << endl;
<< "deg f2 = " << first degree f2 << endl;

-- ED system: f1=0, f2=0, x - u = mu1 * grad f1 + mu2 * grad f2
T = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c, mu1, mu2];
varsT = {a11_T, a12_T, a22_T, b11_T, b12_T, b13_T, b22_T, b23_T, b33_T, c_T};
f1T = sub(f1, T);
f2T = sub(f2, T);
gradF1 = for v in varsT list diff(v, f1T);
gradF2 = for v in varsT list diff(v, f2T);
uVec = {2_T, 3_T, 5_T, 7_T, 11_T, 13_T, 17_T, 19_T, 23_T, 29_T};
mu1T = mu1_T;
mu2T = mu2_T;
edEqs = {f1T, f2T} | for i from 0 to 9 list (varsT#i - uVec#i - mu1T*gradF1#i - mu2T*gradF2#i);
nEqs = length edEqs;
nVars = numgens T;
<< "num eqs = " << nEqs << ", num vars = " << nVars << endl;
I = ideal edEqs;
<< "computing dim..." << endl;
elapsedTime dimI = dim I;
<< "dim I = " << dimI << endl;
elapsedTime degI = degree I;
<< "degree I = " << degI << endl;
exit
