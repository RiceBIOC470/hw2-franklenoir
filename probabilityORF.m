function prob = probabilityORF(N,N_ORF)
count = 0;
    for i = 1:100
        tempseq = randdnaseq(N);
        [tempORFlength, start_pos, stop_pos] = findORF(tempseq);
        if tempORFlength >= N_ORF
            count = count + 1;
        end
    end
    prob = count/100;

end