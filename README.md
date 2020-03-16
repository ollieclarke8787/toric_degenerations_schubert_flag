# toric_degenerations_schubert_flag
Calculations of Toric Degenerations of Flag and Schubert Varieties

## 0. List of files
* Matching Field Ideal files: *Flag_4_Matching_Field.m2*, *Flag_5_Matching_Field.m2*, *Flag_6_Matching_Field.m2*
* Schubert Initial Ideal files: *Flag_4_Initial_Schubert.m2*, *Flag_5_Initial_Schubert.m2*
* Map Generator: *FlMonomialMaps.py*

## 1. Matching Field Ideal files
Run these files to calculate all pairs (l, w) for which the ideal F_{n,l,w} is toric, non-toric or zero. The value n appears in the file name so for example *Flag_4_Matching_Field.m2* would calculate the ideals F_{4,l,w}. The differences between each file is:
* value: n
* Ring: R
* Maps: monomialMapList
* Output file names: "Matching Field Ideals Flag n, Sorted Output.txt"

Note that by toric we mean that the ideal is a non-zero prime binomial ideal, by non-toric we mean the ideal is not prime and zero ideals are precisely that.

### 1.1. Creating new Matching Field Ideal files

The procudure to create code which calculates the pairs (l, w) as above for a different n is to change the following lines of code.

1. Change n to the new desired value
2. Change n to the desired value FlMonomialMaps.py and run it
3. Take the output of FlMonomialMaps.py and paste it into the Macualay2 file overriding previous definitions
4. Change the file names in the Macaulay2 code updating the value of n in the following line:
  * f = "Matching Field Ideals Flag n, Sorted Output.txt";

### 1.2. Output format for Matching Field Ideal files

Running *Flag_n_Matching_Field.m2* produces a file called "Matching Field Ideals Flag n, Sorted Output.txt".
The output file has the following format:
* Three sections: Toric ideal, Non-toric ideal, Zero ideals
* Each line is of the output is of the form: (l, w, ideal F_{n,l,w})
* In each section, the lines are sorted first by the value l and then by the permutation w in lexicographic order 

## 2. Schubert Initial Ideal files
Run these files to calculate the ideal in_{w_l}(I_w) and compare it with the ideal F_{n,l,w} described above. Here, the ideal I_w is the ideal of the Schubert variety in Flag n corresponding to the permutation w, and w_l is the weight vector of the matching field corresponding to the partition (1 .. l| l+1 .. n). As before the value n appears in the file name so for example *Flag_5_Initial_Schubert.m2* would calculate the initial ideals of Schubert varieties in Flag 4. The differences between each file is:
* value: n
* Rings: R, R0, R1 .. R{n-1}
* Maps: monomialMapList
* Ideals: flagIdeal
* Weight vectors: w0, w1 .. w{n-1}

### 2.1. Creating new Schubert Initial Ideal files

This is rather difficult but below are steps that would need to be performed to produce new code for calculating different Flag varieties and the initial ideals of their Schubert varieties.

1. Change n to the new desired value
2. Change n to the desired values FlMonomialMaps.py and run it
3. Take the output of FlMonomialMaps.py and paste it into the Macualay2 file overriding previous definitions
4. Overwrite flagIdeal with the correct ideal (in the Flag 5 example, we calculate the ideal for Flag 5 explictly as the kernel of the flagMap) 
5. Overwrite the weight vectors w0, w1 .. w{n-1} with weight vectors for the correct matching fields, note Macaulay2 takes initial terms to be terms of maximum weight
6. Overwrite the rings R0, R1, .. R{n-1} such that for each 0 <= i <= n-1 the definition of Ri looks like:
   * Ri = QQ[p_(1), .. ,p_(2,3 .. n-1), MonomialOrder=>{Weights => wi}, Global=false];
7. Overwrite *SchubertIdealsX* and *SchubertInitialX* similarly to the above and define the set *SchubertInitials* to be the list of all *SchubertInitialX*'s. 

Note that one already requires a prior calculation of the ideal of the Flag variety (compatible with the code).

### 2.2. Output format for Schubert Initial Ideal files

Running *Flag_n_Initial_Schubert.m2* produces two files called "Initials of Schubert Ideals.txt", "Matching Field Ideals.txt". Note that running the code will overwrite existing output files with the same name.

"Matching Field Ideals.txt":
* Each line is of the output is of the form: (l, w, ideal F_{n,l,w})
* The lines are sorted first by the value l and then by the permutation w in lexicographic order 

"Initials of Schubert Ideals.txt":
* Each line is of the output is of the form: (X, Y, l, w, ideal F_{n,l,w})
* The lines are sorted first by the value l and then by the permutation w in lexicographic order
* X is a boolean value (True or False), X := (in_{w_l}(I_w) == F_{n,l,w}), i.e. X is True if and only if F_{n,l,w} is equal to the initial ideal of the corresponding Schubert variety 
* Y is a boolean value, Y := (F_{n,l,w} is a subset of in_{w_l}(I_w)), i.e. Y is True if and only if F_{n,l,w} is a subset of the initial ideal of the corresponding Schubert variety


## 3. Map Generator
These are small scripts which generate the monomialMapList and ring R required for the Macaulay2 Files. They can also calculate the weight vectors appearing in the Schubert Initial Ideal files.
