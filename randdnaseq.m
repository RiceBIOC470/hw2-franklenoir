function randomSeq = randdnaseq(N)
nuc = {'A','T','G','C'};
rand_numseq = randi([1 4],[1,N]);
rand_seq = "";
for i = 1:N
    rand_seq = rand_seq + string(nuc(rand_numseq(i)));
end

randomSeq = rand_seq;
end
% returns a random dna sequence of length N
