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

-- Factor the disc
<< "Factoring disc..." << endl;
elapsedTime fac = factor disc;
<< "factors of disc:" << endl;
<< fac << endl;
<< "" << endl;

-- Try to compute EDD of each irreducible component
exit
