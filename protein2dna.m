function dnaseq = protein2dna(proteinseq)
if isstring(proteinseq)
    proteinseq = char(proteinseq);
end
temp = '';
codons = readtable('codons.csv');
i = 1;

while i < length(proteinseq)
nucs = string(proteinseq(i:i+2));
temptable = codons(codons.AmAcid == nucs, :);
sz = size(temptable); 

temp = strcat(temp,temptable{randi(sz(1)),2});
i = i + 3;
end
dnaseq = char(temp);
% protein sequence.
end
