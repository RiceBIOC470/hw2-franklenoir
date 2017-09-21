function prob = plotprobabilityORF(N,N_ORF)
    count = 0;
    probnum = 1;
    probs = [];
    xaxis = 1:3:N;
    %Making an xaxis to plot
    for x = 1:3:N %Looks at the probability from 1 to N but going through 
        %3 amino acids at a time since going through 1 at a time wouldn't
        %have much effect on coding.
        for i = 1:100
           tempseq = randdnaseq(x);
           [tempORFlength, start_pos, stop_pos] = findORF(tempseq);
           if tempORFlength >= N_ORF
           count = count + 1;
           end
        end
        prob = count/100;
        probs(probnum) = prob;
        probnum = probnum + 1;
        count = 0;
    end
    plot(xaxis,probs);

end