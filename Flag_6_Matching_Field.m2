--The last line of code are not expected to terminate in a reasonable amount of time

--This code will output the list of Degenerated Schubert Ideals for Flag 6 to a file called: "output file"
--The output file may be read in the usual way.

---------Code----------
loadPackage "Binomials";

n = 6;
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

R = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(6), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(1, 6), p_(2, 3), p_(2, 4), p_(2, 5), p_(2, 6), p_(3, 4), p_(3, 5), p_(3, 6), p_(4, 5), p_(4, 6), p_(5, 6), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 2, 6), p_(1, 3, 4), p_(1, 3, 5), p_(1, 3, 6), p_(1, 4, 5), p_(1, 4, 6), p_(1, 5, 6), p_(2, 3, 4), p_(2, 3, 5), p_(2, 3, 6), p_(2, 4, 5), p_(2, 4, 6), p_(2, 5, 6), p_(3, 4, 5), p_(3, 4, 6), p_(3, 5, 6), p_(4, 5, 6), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 3, 6), p_(1, 2, 4, 5), p_(1, 2, 4, 6), p_(1, 2, 5, 6), p_(1, 3, 4, 5), p_(1, 3, 4, 6), p_(1, 3, 5, 6), p_(1, 4, 5, 6), p_(2, 3, 4, 5), p_(2, 3, 4, 6), p_(2, 3, 5, 6), p_(2, 4, 5, 6), p_(3, 4, 5, 6), p_(1, 2, 3, 4, 5), p_(1, 2, 3, 4, 6), p_(1, 2, 3, 5, 6), p_(1, 2, 4, 5, 6), p_(1, 3, 4, 5, 6), p_(2, 3, 4, 5, 6)];
S = QQ[x_(1,1) .. x_(n-1, n)];
X = matrix for r from 1 to n-1 list for c from 1 to n list x_(r,c);

getVars = perm -> for a in getSeqs perm list p_a;
varIdealGenList = for s in Perms list getVars s;
varIdealList = for G in varIdealGenList list ideal(G);

monomialMapList = {
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), x_(1,1)*x_(2,4), x_(1,1)*x_(2,5), x_(1,1)*x_(2,6), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), x_(1,2)*x_(2,5), x_(1,2)*x_(2,6), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,3)*x_(2,6), x_(1,4)*x_(2,5), x_(1,4)*x_(2,6), x_(1,5)*x_(2,6), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,6), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,6), x_(1,1)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,4)*x_(3,6), x_(1,1)*x_(2,5)*x_(3,6), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,6), x_(1,2)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,6), x_(1,2)*x_(2,5)*x_(3,6), x_(1,3)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,6), x_(1,3)*x_(2,5)*x_(3,6), x_(1,4)*x_(2,5)*x_(3,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,3)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), -x_(1,2)*x_(2,1), -x_(1,3)*x_(2,1), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), -x_(1,6)*x_(2,1), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), x_(1,2)*x_(2,5), x_(1,2)*x_(2,6), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,3)*x_(2,6), x_(1,4)*x_(2,5), x_(1,4)*x_(2,6), x_(1,5)*x_(2,6), -x_(1,2)*x_(2,1)*x_(3,3), -x_(1,2)*x_(2,1)*x_(3,4), -x_(1,2)*x_(2,1)*x_(3,5), -x_(1,2)*x_(2,1)*x_(3,6), -x_(1,3)*x_(2,1)*x_(3,4), -x_(1,3)*x_(2,1)*x_(3,5), -x_(1,3)*x_(2,1)*x_(3,6), -x_(1,4)*x_(2,1)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,6), -x_(1,5)*x_(2,1)*x_(3,6), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,6), x_(1,2)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,6), x_(1,2)*x_(2,5)*x_(3,6), x_(1,3)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,6), x_(1,3)*x_(2,5)*x_(3,6), x_(1,4)*x_(2,5)*x_(3,6), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,4), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,5), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,6), -x_(1,2)*x_(2,1)*x_(3,4)*x_(4,5), -x_(1,2)*x_(2,1)*x_(3,4)*x_(4,6), -x_(1,2)*x_(2,1)*x_(3,5)*x_(4,6), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,6), -x_(1,3)*x_(2,1)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,1)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,3)*x_(2,4)*x_(3,5)*x_(4,6), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,4)*x_(5,5), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,4)*x_(5,6), -x_(1,2)*x_(2,1)*x_(3,3)*x_(4,5)*x_(5,6), -x_(1,2)*x_(2,1)*x_(3,4)*x_(4,5)*x_(5,6), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), x_(1,1)*x_(2,2), -x_(1,3)*x_(2,1), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), -x_(1,6)*x_(2,1), -x_(1,3)*x_(2,2), -x_(1,4)*x_(2,2), -x_(1,5)*x_(2,2), -x_(1,6)*x_(2,2), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), x_(1,3)*x_(2,6), x_(1,4)*x_(2,5), x_(1,4)*x_(2,6), x_(1,5)*x_(2,6), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,6), -x_(1,3)*x_(2,1)*x_(3,4), -x_(1,3)*x_(2,1)*x_(3,5), -x_(1,3)*x_(2,1)*x_(3,6), -x_(1,4)*x_(2,1)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,6), -x_(1,5)*x_(2,1)*x_(3,6), -x_(1,3)*x_(2,2)*x_(3,4), -x_(1,3)*x_(2,2)*x_(3,5), -x_(1,3)*x_(2,2)*x_(3,6), -x_(1,4)*x_(2,2)*x_(3,5), -x_(1,4)*x_(2,2)*x_(3,6), -x_(1,5)*x_(2,2)*x_(3,6), x_(1,3)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,6), x_(1,3)*x_(2,5)*x_(3,6), x_(1,4)*x_(2,5)*x_(3,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,5)*x_(4,6), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,6), -x_(1,3)*x_(2,1)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,1)*x_(3,5)*x_(4,6), -x_(1,3)*x_(2,2)*x_(3,4)*x_(4,5), -x_(1,3)*x_(2,2)*x_(3,4)*x_(4,6), -x_(1,3)*x_(2,2)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,2)*x_(3,5)*x_(4,6), x_(1,3)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6), -x_(1,3)*x_(2,1)*x_(3,4)*x_(4,5)*x_(5,6), -x_(1,3)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), -x_(1,4)*x_(2,1), -x_(1,5)*x_(2,1), -x_(1,6)*x_(2,1), x_(1,2)*x_(2,3), -x_(1,4)*x_(2,2), -x_(1,5)*x_(2,2), -x_(1,6)*x_(2,2), -x_(1,4)*x_(2,3), -x_(1,5)*x_(2,3), -x_(1,6)*x_(2,3), x_(1,4)*x_(2,5), x_(1,4)*x_(2,6), x_(1,5)*x_(2,6), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,6), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,6), -x_(1,4)*x_(2,1)*x_(3,5), -x_(1,4)*x_(2,1)*x_(3,6), -x_(1,5)*x_(2,1)*x_(3,6), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,6), -x_(1,4)*x_(2,2)*x_(3,5), -x_(1,4)*x_(2,2)*x_(3,6), -x_(1,5)*x_(2,2)*x_(3,6), -x_(1,4)*x_(2,3)*x_(3,5), -x_(1,4)*x_(2,3)*x_(3,6), -x_(1,5)*x_(2,3)*x_(3,6), x_(1,4)*x_(2,5)*x_(3,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,1)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,2)*x_(3,5)*x_(4,6), -x_(1,4)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), x_(1,1)*x_(2,4), -x_(1,5)*x_(2,1), -x_(1,6)*x_(2,1), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), -x_(1,5)*x_(2,2), -x_(1,6)*x_(2,2), x_(1,3)*x_(2,4), -x_(1,5)*x_(2,3), -x_(1,6)*x_(2,3), -x_(1,5)*x_(2,4), -x_(1,6)*x_(2,4), x_(1,5)*x_(2,6), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,6), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,6), x_(1,1)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,4)*x_(3,6), -x_(1,5)*x_(2,1)*x_(3,6), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,6), x_(1,2)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,6), -x_(1,5)*x_(2,2)*x_(3,6), x_(1,3)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,6), -x_(1,5)*x_(2,3)*x_(3,6), -x_(1,5)*x_(2,4)*x_(3,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,3)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6)}),
map(S,R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5), x_(1,6), x_(1,1)*x_(2,2), x_(1,1)*x_(2,3), x_(1,1)*x_(2,4), x_(1,1)*x_(2,5), -x_(1,6)*x_(2,1), x_(1,2)*x_(2,3), x_(1,2)*x_(2,4), x_(1,2)*x_(2,5), -x_(1,6)*x_(2,2), x_(1,3)*x_(2,4), x_(1,3)*x_(2,5), -x_(1,6)*x_(2,3), x_(1,4)*x_(2,5), -x_(1,6)*x_(2,4), -x_(1,6)*x_(2,5), x_(1,1)*x_(2,2)*x_(3,3), x_(1,1)*x_(2,2)*x_(3,4), x_(1,1)*x_(2,2)*x_(3,5), x_(1,1)*x_(2,2)*x_(3,6), x_(1,1)*x_(2,3)*x_(3,4), x_(1,1)*x_(2,3)*x_(3,5), x_(1,1)*x_(2,3)*x_(3,6), x_(1,1)*x_(2,4)*x_(3,5), x_(1,1)*x_(2,4)*x_(3,6), x_(1,1)*x_(2,5)*x_(3,6), x_(1,2)*x_(2,3)*x_(3,4), x_(1,2)*x_(2,3)*x_(3,5), x_(1,2)*x_(2,3)*x_(3,6), x_(1,2)*x_(2,4)*x_(3,5), x_(1,2)*x_(2,4)*x_(3,6), x_(1,2)*x_(2,5)*x_(3,6), x_(1,3)*x_(2,4)*x_(3,5), x_(1,3)*x_(2,4)*x_(3,6), x_(1,3)*x_(2,5)*x_(3,6), x_(1,4)*x_(2,5)*x_(3,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,1)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,6), x_(1,2)*x_(2,3)*x_(3,5)*x_(4,6), x_(1,2)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,3)*x_(2,4)*x_(3,5)*x_(4,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,5), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,4)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,3)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,2)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,1)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6), x_(1,2)*x_(2,3)*x_(3,4)*x_(4,5)*x_(5,6)})
};

JIdealList = for M in monomialMapList list kernel M;
zeroIdeal = R*ideal()
SumIdealList = flatten for j from 0 to (#JIdealList - 1) list for i from 0 to (#Perms - 1) list (j, Perms#i, eliminate(JIdealList#j + varIdealList#i, varIdealGenList#i));

SumIdealListNonZero = {};
for L in SumIdealList do (if not L#2 == zeroIdeal then SumIdealListNonZero = append(SumIdealListNonZero, L));

SumIdealListNonZeroText = {};
for L in SumIdealListNonZero do (SumIdealListNonZeroText = append(SumIdealListNonZeroText, (L#0, L#1, toString mingens L#2)));

f = "Matching Field Ideals Flag 6 (OUTPUT).txt";
for L in SumIdealListNonZeroText do (f << L << endl << endl);
f << close;


---------------------------------
SumIdealPrimesList = {};
for L in SumIdealListNonZero do (if binomialIsPrime(L#2) then (SumIdealPrimesList = append(SumIdealPrimesList, L), print (L#0, L#1, toString mingens L#2)));



