S = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33];
R1 = S[lam];
P_sig = matrix {{a11 - lam*b11, a12 - lam*b12, -lam*b13},
                {a12 - lam*b12, a22 - lam*b22, -lam*b23},
                {-lam*b13, -lam*b23, -lam*b33}};
sigPoly = det P_sig;
(monos, coefs) = coefficients(sigPoly);

c1 = sub(coefs_(2,0), S);
c2 = sub(coefs_(1,0), S);
c3 = sub(coefs_(0,0), S);
disc = c2^2 - 4*c1*c3;

T = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, mu];
varsT = {a11_T, a12_T, a22_T, b11_T, b12_T, b13_T, b22_T, b23_T, b33_T};
discT = sub(disc, T);
gradDisc = for v in varsT list diff(v, discT);
uVec = {2_T, 3_T, 5_T, 7_T, 11_T, 13_T, 17_T, 19_T, 23_T};
muT = mu_T;
edEqs = {discT} | for i from 0 to 8 list (varsT#i - uVec#i - muT * gradDisc#i);
nEqs = length edEqs;
nVars = numgens T;
<< "num equations: " << nEqs << endl;
<< "num vars: " << nVars << endl;
I = ideal edEqs;
<< "computing dim..." << endl;
elapsedTime dimI = dim I;
<< "dim I = " << dimI << endl;
<< "computing degree..." << endl;
elapsedTime degI = degree I;
<< "degree I = " << degI << endl;
exit
