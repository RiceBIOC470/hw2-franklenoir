function [ORFlength, start_pos, stop_pos] = findORF(dnaseq)
    dnaseq = dnaseq.upper();
    starts = strfind(dnaseq,"ATG");
    stop1 = strfind(dnaseq,"TAG");
    stop2 = strfind(dnaseq,"TGA");
    stop3 = strfind(dnaseq,"TAA");

    stops = horzcat(stop1,stop2,stop3);
    MaxORF = 0;
    startspot = 0;
    stopspot = 0;
    
    for i = 1:length(starts)
        substops = stops(starts(i) < stops);
        readingframe = rem(minus(substops,starts(i)),3);
        ORF = min(substops(readingframe == 0));
        ORF = ORF - starts(i);
        if ORF > MaxORF
            MaxORF = ORF;
            startspot = starts(i);
            stopspot = min(substops(readingframe == 0));
        end
    end
    if MaxORF == 0 
       ORFlength = MaxORF;
       start_pos = -1;
       stop_pos = -1;
    else 
       ORFlength = MaxORF;
       start_pos = startspot;
       stop_pos = stopspot;
    end
end

%Function to find the length of the longest open reading frame of a
%sequences called dnaseq
