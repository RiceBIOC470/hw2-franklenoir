function proteinseq = dna2protein(dnaseq,frame)
if isstring(dnaseq)
    dnaseq = char(dnaseq);
end
if frame < 1 || frame > 3
    disp("frame is not 1,2,or 3")
    proteinseq = '';
else
    temp = '';
    codons = readtable('codons.csv');
    codons.Properties.RowNames = codons.Codon;
    dnaseq = dnaseq(frame:end);
    if rem(length(dnaseq),3) ~= 0
        cutoff = rem(length(dnaseq),3);
        dnaseq = dnaseq(1:end-cutoff);
    end
    i = 1;
    while i < length(dnaseq)
        nucs = dnaseq(i:i+2);
        T2 = codons({nucs},:);
        temp = strcat(temp,T2{1,1});
        i = i + 3;
    end
    proteinseq = char(temp);
% protein sequence.
end

end