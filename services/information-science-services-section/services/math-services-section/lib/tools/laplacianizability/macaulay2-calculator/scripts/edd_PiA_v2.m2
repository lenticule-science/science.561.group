-- Compute EDD of V(Pi_A) = {disc = 0} on (2,1) chain complex
-- The discriminant doesn't involve c, so we work in 9-dim space and add c trivially

S = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33];

Q0 = matrix {{a11, a12}, {a12, a22}};
Q1 = matrix {{b11, b12, b13}, {b12, b22, b23}, {b13, b23, b33}};

R1 = S[lam];
P_sig = matrix {{a11 - lam*b11, a12 - lam*b12, -lam*b13},
                {a12 - lam*b12, a22 - lam*b22, -lam*b23},
                {-lam*b13, -lam*b23, -lam*b33}};
sigPoly = det P_sig;

(monos, coefs) = coefficients(sigPoly);

-- monos shows ordering: (lam^3, lam^2, lam, 1) 
-- We want sigPoly = lam * (c3 lam^2 + c2 lam + c1 + 0 lam^3 ... )
-- wait no, sigPoly already factors as lam * (c1 + c2 lam + c3 lam^2)
-- So coefficient of lam^0 in sigPoly is 0
-- coefficient of lam^1 is c1, of lam^2 is c2, of lam^3 is c3

n = #(flatten entries monos);
print n;

-- Print monomials and degrees
for i from 0 to n-1 do (
    print(monos_(0,i), " --- coeff: ", coefs_(i,0));
);

-- After dividing by lam: 
-- coefficient of lam^0 (after div) = coefficient of lam^1 in sigPoly = c1
-- coefficient of lam^1 (after div) = coefficient of lam^2 in sigPoly = c2
-- coefficient of lam^2 (after div) = coefficient of lam^3 in sigPoly = c3

c1 = sub(coefs_(2,0), S);  -- coef of lam^1 in sigPoly
c2 = sub(coefs_(1,0), S);  -- coef of lam^2
c3 = sub(coefs_(0,0), S);  -- coef of lam^3

disc = c2^2 - 4*c1*c3;
print "deg disc: ";
print first degree disc;

-- Setup ED system
T = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, mu];
varsT = {a11_T, a12_T, a22_T, b11_T, b12_T, b13_T, b22_T, b23_T, b33_T};
discT = sub(disc, T);
gradDisc = for v in varsT list diff(v, discT);
-- Generic u
uVec = {2_T, 3_T, 5_T, 7_T, 11_T, 13_T, 17_T, 19_T, 23_T};
muT = mu_T;
edEqs = {discT} | for i from 0 to 8 list (varsT#i - uVec#i - muT * gradDisc#i);
print "num equations: ";
print #edEqs;
print "num vars: ";
print numgens T;
I = ideal edEqs;
print "dim I:";
elapsedTime print dim I;
print "deg I:";
elapsedTime print degree I;
exit
