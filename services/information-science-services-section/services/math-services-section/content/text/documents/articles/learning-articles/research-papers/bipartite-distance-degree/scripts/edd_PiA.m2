-- Compute EDD of V(Pi_A) = {discriminant of sigma-polynomial = 0}
-- on the (2,1) chain complex.

R = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c, lam];
varsCoord = {a11, a12, a22, b11, b12, b13, b22, b23, b33, c};
n = #varsCoord;

Q0 = matrix {{a11, a12}, {a12, a22}};
Q1 = matrix {{b11, b12, b13}, {b12, b22, b23}, {b13, b23, b33}};
Q2 = matrix {{c}};

d1 = matrix {{1_R, 0_R, 0_R}, {0_R, 1_R, 0_R}};

P_sig = transpose(d1) * Q0 * d1 - lam * Q1;
sigPoly = det P_sig;

-- Extract coefficients of lam^0, lam^1, lam^2 in sigPoly/lam (after dividing out the 0-eigenvalue factor)
-- sigPoly / lam = c1 + c2*lam + c3*lam^2

-- Use coefficients function to extract
S = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c];
sigPolyDivLam = sub(sigPoly // lam, S[lam]);

(monos, coefs) = coefficients(sigPolyDivLam);
print "monomials (powers of lam):";
print monos;
print "coefficients:";
print coefs;

c3 = sub(coefs_(0,0), S);
c2 = sub(coefs_(1,0), S);
c1 = sub(coefs_(2,0), S);

print "Discriminant:";
disc = c2^2 - 4*c1*c3;
print "degree of disc:";
print first degree disc;

-- Now compute EDD
-- V(Pi_A) = V(disc) in S = QQ[a11,...,c], 10 variables
-- Generic point u, EDD = degree of saturated critical-point ideal
-- For hypersurface f=0: EDD = deg of {f=0, (x-u) parallel to grad f}

-- Set up: x - u = mu * grad f, plus f = 0
T = QQ[a11, a12, a22, b11, b12, b13, b22, b23, b33, c, mu];
discT = sub(disc, T);
varsT = {a11_T, a12_T, a22_T, b11_T, b12_T, b13_T, b22_T, b23_T, b33_T, c_T};
-- Generic u: pick distinct primes
uVec = {2_T, 3_T, 5_T, 7_T, 11_T, 13_T, 17_T, 19_T, 23_T, 29_T};
gradDisc = for v in varsT list diff(v, discT);

print "";
print "deg gradDisc components:";
print apply(gradDisc, p -> first degree p);

-- ED ideal: (x_i - u_i - mu * grad_i) for each i, plus f
muVar = mu_T;
edEqs = {discT} | for i from 0 to (n-1) list (varsT_i - uVec_i - muVar * gradDisc_i);

print "Number of equations:"; print #edEqs;
print "Number of variables:"; print numgens T;

I = ideal edEqs;
print "Computing dim of I (this may take a while)...";
elapsedTime d = dim I;
print "dim I = "; print d;
elapsedTime ddeg = degree I;
print "degree I = "; print ddeg;
exit
