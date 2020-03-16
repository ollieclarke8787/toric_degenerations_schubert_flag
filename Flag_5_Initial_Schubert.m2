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


flagMap = map(S, R, {x_(1,1), x_(1,2), x_(1,3), x_(1,4), x_(1,5),
(gens minors(2,X_{0,1}^{0,1}))_(0,0),
(gens minors(2,X_{0,2}^{0,1}))_(0,0),
(gens minors(2,X_{0,3}^{0,1}))_(0,0),
(gens minors(2,X_{0,4}^{0,1}))_(0,0),
(gens minors(2,X_{1,2}^{0,1}))_(0,0),
(gens minors(2,X_{1,3}^{0,1}))_(0,0),
(gens minors(2,X_{1,4}^{0,1}))_(0,0),
(gens minors(2,X_{2,3}^{0,1}))_(0,0),
(gens minors(2,X_{2,4}^{0,1}))_(0,0),
(gens minors(2,X_{3,4}^{0,1}))_(0,0),
(gens minors(3,X_{0,1,2}^{0,1,2}))_(0,0),
(gens minors(3,X_{0,1,3}^{0,1,2}))_(0,0),
(gens minors(3,X_{0,1,4}^{0,1,2}))_(0,0),
(gens minors(3,X_{0,2,3}^{0,1,2}))_(0,0),
(gens minors(3,X_{0,2,4}^{0,1,2}))_(0,0),
(gens minors(3,X_{0,3,4}^{0,1,2}))_(0,0),
(gens minors(3,X_{1,2,3}^{0,1,2}))_(0,0),
(gens minors(3,X_{1,2,4}^{0,1,2}))_(0,0),
(gens minors(3,X_{1,3,4}^{0,1,2}))_(0,0),
(gens minors(3,X_{2,3,4}^{0,1,2}))_(0,0),
(gens minors(4,X_{0,1,2,3}^{0,1,2,3}))_(0,0),
(gens minors(4,X_{0,1,2,4}^{0,1,2,3}))_(0,0),
(gens minors(4,X_{0,1,3,4}^{0,1,2,3}))_(0,0),
(gens minors(4,X_{0,2,3,4}^{0,1,2,3}))_(0,0),
(gens minors(4,X_{1,2,3,4}^{0,1,2,3}))_(0,0)});


flagIdeal = kernel flagMap;

--weight vectors:
w0 = {20,20,20,20,20,16,17,18,19,17,18,19,18,19,19,10,12,14,13,15,16,13,15,16,16,4,7,9,10,10};
w1 = {20,20,20,20,20,19,19,19,19,16,17,18,17,18,18,13,15,17,15,17,17,12,14,15,15,7,10,12,12,9};
w2 = {20,20,20,20,20,19,18,18,18,19,19,19,16,17,17,13,15,17,14,16,16,15,17,17,14,7,10,12,11,12};
w3 = {20,20,20,20,20,18,19,17,17,19,18,18,19,19,16,12,14,16,15,17,15,15,17,16,17,6,9,11,12,12};
w4 = {20,20,20,20,20,17,18,19,16,18,19,17,19,18,19,11,13,15,14,16,17,14,16,17,17,5,8,10,11,11};


--alternative weight vectors:
--w0 = {10, 10, 10, 10, 10, 7, 8, 9, 10, 8, 9, 10, 9, 10, 10, 3, 5, 7, 6, 8, 9, 6, 8, 9, 9, 0, 3, 5, 6, 6};
--w1 = {7, 7, 7, 7, 7, 7, 7, 7, 7, 4, 5, 6, 5, 6, 6, 3, 5, 7, 5, 7, 7, 2, 4, 5, 5, 0, 3, 5, 5, 2};
--w2 = {7, 7, 7, 7, 7, 7, 6, 6, 6, 7, 7, 7, 4, 5, 5, 3, 5, 7, 4, 6, 6, 5, 7, 7, 4, 0, 3, 5, 4, 5};
--w3 = {8, 8, 8, 8, 8, 7, 8, 6, 6, 8, 7, 7, 8, 8, 5, 3, 5, 7, 6, 8, 6, 6, 8, 7, 8, 0, 3, 5, 6, 6};
--w4 = {9, 9, 9, 9, 9, 7, 8, 9, 6, 8, 9, 7, 9, 8, 9, 3, 5, 7, 6, 8, 9, 6, 8, 9, 9, 0, 3, 5, 6, 6};



SchubertIdealList = for i from 0 to (#Perms - 1) list eliminate(flagIdeal + varIdealList#i, varIdealGenList#i);


R0 = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5),
MonomialOrder=>{Weights => w0},Global=>false];

R1 = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5),
MonomialOrder=>{Weights => w1},Global=>false];

R2 = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5),
MonomialOrder=>{Weights => w2},Global=>false];

R3 = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5),
MonomialOrder=>{Weights => w3},Global=>false];

R4 = QQ[p_(1), p_(2), p_(3), p_(4), p_(5), p_(1, 2), p_(1, 3), p_(1, 4), p_(1, 5), p_(2, 3), p_(2, 4), p_(2, 5), p_(3, 4), p_(3, 5), p_(4, 5), p_(1, 2, 3), p_(1, 2, 4), p_(1, 2, 5), p_(1, 3, 4), p_(1, 3, 5), p_(1, 4, 5), p_(2, 3, 4), p_(2, 3, 5), p_(2, 4, 5), p_(3, 4, 5), p_(1, 2, 3, 4), p_(1, 2, 3, 5), p_(1, 2, 4, 5), p_(1, 3, 4, 5), p_(2, 3, 4, 5),
MonomialOrder=>{Weights => w4},Global=>false];


SchubertIdeals0 = for i from 0 to (#SchubertIdealList - 1) list sub(SchubertIdealList#i, R0);
SchubertInitial0 = for i from 0 to (#SchubertIdeals0 - 1) list (0, Perms#i, ideal(leadTerm(1, SchubertIdeals0#i)));

SchubertIdeals1 = for i from 0 to (#SchubertIdealList - 1) list sub(SchubertIdealList#i, R1);
SchubertInitial1 = for i from 0 to (#SchubertIdeals1 - 1) list (1, Perms#i, ideal leadTerm(1, SchubertIdeals1#i));

SchubertIdeals2 = for i from 0 to (#SchubertIdealList - 1) list sub(SchubertIdealList#i, R2);
SchubertInitial2 = for i from 0 to (#SchubertIdeals2 - 1) list (2, Perms#i, ideal leadTerm(1, SchubertIdeals2#i));

SchubertIdeals3 = for i from 0 to (#SchubertIdealList - 1) list sub(SchubertIdealList#i, R3);
SchubertInitial3 = for i from 0 to (#SchubertIdeals3 - 1) list (3, Perms#i, ideal leadTerm(1, SchubertIdeals3#i));

SchubertIdeals4 = for i from 0 to (#SchubertIdealList - 1) list sub(SchubertIdealList#i, R4);
SchubertInitial4 = for i from 0 to (#SchubertIdeals4 - 1) list (4, Perms#i, ideal leadTerm(1, SchubertIdeals4#i));

SchubertInitials = flatten {SchubertInitial0, SchubertInitial1, SchubertInitial2, SchubertInitial3, SchubertInitial4}


f = "Initials of Schubert Ideals.txt";
f << "(corresponding ideals are equal?, elim matching field is subset of schubert initial?, matching field, Schubert permutation, Initial Ideal of Schubert Ideal)" << endl << endl;

for i from 0 to (#SchubertInitials - 1) do (f << (sub((SchubertInitials#i)#2, R) == (SumIdealList#i)#2, isSubset((SumIdealList#i)#2, sub((SchubertInitials#i)#2, R)), (SchubertInitials#i)#0, (SchubertInitials#i)#1, toString (SchubertInitials#i)#2) << endl << endl);

f << close;


f = "Matching Field Ideals.txt";
f << "(matching field, Schubert Permuation, Matching field ideal with eliminated variables)" << endl << endl;

for L in SumIdealList do (f << (L#0, L#1, toString L#2) << endl << endl);

f << close;




