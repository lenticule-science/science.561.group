-- Supplementary invariants of V(Pi_A) on (2,1) chain complex.
-- Goal: understand what EDD=40 encodes geometrically.

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

<< "===== V(Pi_A) basic invariants =====" << endl;
<< "Polynomial defining V(Pi_A) is the discriminant." << endl;
<< "Degree of disc as polynomial: " << first degree disc << endl;

I = ideal disc;
<< "Krull dim of V(Pi_A): " << dim I << endl;
<< "Codim in S=QQ[9 vars]: " << codim I << endl;

-- Singular locus: gradient of disc vanishes
gradDisc = jacobian I;
<< "Computing singular locus..." << endl;
elapsedTime singLoc = I + minors(1, gradDisc);
elapsedTime dimSing = dim singLoc;
<< "dim of singular locus: " << dimSing << endl;
<< "(dim of V is " << dim I << ", so singular locus has codim " << (dim I - dimSing) << " in V)" << endl;

-- Factor of singular locus
<< "" << endl;
<< "Computing primary decomposition of singular locus..." << endl;
elapsedTime singDecomp = primaryDecomposition singLoc;
<< "number of primary components of sing loc: " << #singDecomp << endl;
for j from 0 to #singDecomp - 1 do (
    P = singDecomp_j;
    << "  component " << j << ": dim " << dim P << ", codim " << codim P << ", deg " << degree P << endl;
);

exit
