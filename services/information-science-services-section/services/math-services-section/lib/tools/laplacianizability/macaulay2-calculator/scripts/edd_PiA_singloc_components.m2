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
I = ideal disc;
gradDisc = jacobian I;
singLoc = I + minors(1, gradDisc);

<< "=== Components of singular locus of V(Pi_A) ===" << endl;
elapsedTime decomp = primaryDecomposition singLoc;
for j from 0 to #decomp - 1 do (
    P = radical decomp_j;
    << endl;
    << "Component " << j << ": dim=" << dim P << " codim=" << codim P << " deg=" << degree P << endl;
    genList = first entries mingens P;
    << "  number of min generators: " << #genList << endl;
    sortedGens = sort apply(genList, g -> (first degree g, g));
    for k from 0 to min(2, #sortedGens-1) do (
        << "  gen " << k << " (deg " << sortedGens#k#0 << "): " << toString sortedGens#k#1 << endl;
    );
);
exit
