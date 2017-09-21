function dnaseq = protein2dnaOptimized(proteinseq)
if isstring(proteinseq)
    proteinseq = char(proteinseq);
end
temp = '';
codons = readtable('codons.csv');
i = 1;

while i < length(proteinseq)
nucs = string(proteinseq(i:i+2));
temptable = codons(codons.AmAcid == nucs, :);

maxseq = max(temptable.x_1000);
temptable = temptable(temptable.x_1000 == maxseq, :);

temp = strcat(temp,temptable{1,2});
i = i + 3;
end
dnaseq = char(temp);
% protein sequence.
end
