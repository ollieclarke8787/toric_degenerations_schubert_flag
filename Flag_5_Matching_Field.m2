loadPackage "Binomials";

n = 5;
subOne = L -> return for i from 0 to (#L - 1) list (L#i - 1);
addOne = L -> for l in L list l+1;

Perms = for p in (permutations n) list addOne(p);
Subsets = flatten for k from 1 to n-1 list subsets(1 .. n, k);

IsSetNotMore = (A, B) -> (result := true,
for i from 0 to (#A - 1) do if A#i > B#i then result = false,
if result then return {} else return {A});

getSubsets = perm -> flatten for S in Subsets list IsSetNotMore(S, sort(for i from 0 to #S - 1 list perm#i));
setToSeq = S -> if #S == 1 then return S#0 else return toSequence(S);
getSeqs = perm -> (result := {}, 
a := p_1,
for s in getSubsets perm do (a = setToSeq s, result = append(result, a)),
return result);

allSubsetsSeq = for s in Subsets list setToSeq s;
allVars = for a in allSubsetsSeq list p_a;

R = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5)];
S = QQ[x_(1,1) .. x_(n-1, n)];
X = matrix for r from 1 to n-1 list for c from 1 to n list x_(r,c);

getVars = perm -> for a in getSeqs perm list p_a;
varIdealGenList = for s in Perms list getVars s;
varIdealList = for G in varIdealGenList list ideal(G);

monomialMapList = {
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), x_(1,1)*x_(2,4), x_(1,1)*x_(2,5), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), x_(1,2)*x_(2,5), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,4)*x_(2,5), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), -x_(1,2)*x_(2,1), -x_(1,3)*x_(2,1), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), x_(1,2)*x_(2,5), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,4)*x_(2,5), -x_(1,2)*x_(2,1)*x_(3,3), -x_(1,2)*x_(2,1)*x_(3,4), -x_(1,2)*x_(2,1)*x_(3,5), -x_(1,3)*x_(2,1)*x_(3,4), -x_(1,3)*x_(2,1)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,5), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,4), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,5), -x_(1,2)*x_(2,1)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,1)*x_(2,2), -x_(1,3)*x_(2,1), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), -x_(1,3)*x_(2,2), -x_(1,4)*x_(2,2), -x_(1,5)*x_(2,2), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,4)*x_(2,5), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), -x_(1,3)*x_(2,1)*x_(3,4), -x_(1,3)*x_(2,1)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,5), -x_(1,3)*x_(2,2)*x_(3,4), -x_(1,3)*x_(2,2)*x_(3,5), -x_(1,4)*x_(2,2)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,2)*x_(3,4)*x_(4,5)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), x_(1,2)*x_(2,3), -x_(1,4)*x_(2,2), -x_(1,5)*x_(2,2), -x_(1,4)*x_(2,3), -x_(1,5)*x_(2,3), x_(1,4)*x_(2,5), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), -x_(1,4)*x_(2,2)*x_(3,5), -x_(1,4)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), x_(1,1)*x_(2,4), -x_(1,5)*x_(2,1), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), -x_(1,5)*x_(2,2), x_(1,3)*x_(2,4), -x_(1,5)*x_(2,3), -x_(1,5)*x_(2,4), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)})
};

JIdealList = for M in monomialMapList list kernel M;
zeroIdeal = R*ideal()
SumIdealList = flatten for j from 0 to (#JIdealList - 1) list for i from 0 to (#Perms - 1) list (j, Perms#i, eliminate(JIdealList#j + varIdealList#i, varIdealGenList#i));


SumIdealNonZeroList = {};
SumIdealZeroList = {};

for L in SumIdealList do (if not L#2 == zeroIdeal then SumIdealNonZeroList = append(SumIdealNonZeroList, L) else SumIdealZeroList = append(SumIdealZeroList, L));

SumIdealPrimeList = {};
SumIdealNonPrimeList = {};

for L in SumIdealNonZeroList do (if binomialIsPrime(L#2) then SumIdealPrimeList = append(SumIdealPrimeList, L) else SumIdealNonPrimeList = append(SumIdealNonPrimeList, L));


f = "Matching Field Ideals Flag 5 Sorted Output.txt";
f << "----Toric Ideals----" << endl;

for L in SumIdealPrimeList do (f << (L#0, L#1, toString mingens L#2) << endl << endl);

f << "----Non-Toric Ideals----" << endl;

for L in SumIdealNonPrimeList do (f << (L#0, L#1, toString mingens L#2) << endl << endl);

f << "----Zero Ideals----" << endl;
for L in SumIdealZeroList do (f << (L#0, L#1, toString mingens L#2) << endl << endl);

f << close;
